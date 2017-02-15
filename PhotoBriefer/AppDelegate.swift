//
//  AppDelegate.swift
//  PhotoBriefer
//
//  Created by yonglim on 2/14/17.
//  Copyright © 2017 u023. All rights reserved.
//

import UIKit
import FlickrKitFramework

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
        // Override point for customization after application launch.
        
        let scheme = url.scheme
        if ("photobriefer" == scheme) {
            NotificationCenter.default.post(name: Notification.Name(rawValue: "UserAuthCallbackNotification"), object: url)
        }
        return true
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Initialise FlickrKit with your flickr api key and shared secret
        let apiKey: String! = "d084aca8b3bb201f9db2fe6ec0329b22"
        let secret: String! = "7ea3d22026dc64e5"
        if (apiKey == nil || secret == nil) {
            print("\n----------------------------------\nYou need to enter your own 'apiKey' and 'secret' in FKAppDelegate for the demo to run. \n\nYou can get these from your Flickr account settings.\n----------------------------------\n");
            exit(0);
        } else {
            FlickrKit.shared().initialize(withAPIKey: apiKey, sharedSecret: secret);
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

