Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B664CAC597
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 08:20:24 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.10997.1757665217578734860
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Sep 2025 01:20:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ls5XBqVq;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b046f6fb230so310859066b.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Sep 2025 01:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757665216; x=1758270016; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vJjTfjcHdUst4V4EHKrWxVcYYbVHeKYn1Ree2pRa7nE=;
        b=ls5XBqVqsANyXsgApSquDScaAW6O0iSCuAKsm8SQgrcSelTVxJRrv/ZkthZVSOIuhP
         A/vHsAh74YS/Es97mAju5ajgUCUautomCc3mVLesKoGt0GhOSfx/0uc71I55L7IXvOx5
         cS4j27gLjBhExuz0eeyMKZ11S0g0DN3WpRECMadXu2DAhqV48mtVpx3h0ZzqXYGjRizq
         nB4ZBrPQTzTQDZG3xSTCRo6sK8E+aMToqholGsBOdWZe3eGgcyz+Ahpn7pdMIPWKuwGJ
         dUs8JnWb7XZf5v8gtvHKjYfcYR3KC8ujWW5Jx/EPR8EqpdFOuAsNLjdOChJxvyZkrZ8P
         F2PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757665216; x=1758270016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vJjTfjcHdUst4V4EHKrWxVcYYbVHeKYn1Ree2pRa7nE=;
        b=XFmXcO7pbPx4dCKmRhtNzArZimVSL4WqJfSjOJr7wTmxIIno+fX4J0OF1kJpbWvWmj
         7GGfchzADHshQxJu9iNcV1UwfsD3KYHw2CNeyyssOgqiHsgVonlZyzK9t45QIwWQFZde
         7DOZSUNloRkPZnegtaWC2oR8dItAvIuBWXpjjDMwc87Morb4xn7BN6X8d0ZCPJgapSYG
         TRQEM53ugggRaaSWtIr6YT8H9Ffw/9+JBmjPuImjf+5qI78JUbdo2rzTck3qHe2Et+tn
         Sbr36jnH3psk1eTrHpQAXvuBhjdvYHydTJ2U0ue1x/e43s1u7RIy64tgA1ynDIIY7Oyp
         foVg==
X-Forwarded-Encrypted: i=1; AJvYcCVOUO/oyA4xZnpFi4NmINjXVY2zlbT53hf5lVLvl1ryu3iysjKq7UDLhfM495WOdMJZIxUO3R01SqhJMpFKnca9CA8=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy3iZWpDGlN6OzqK57orZj9tquO2uEbp4r3gnCSVoAly5QJevng
	5wGCPvmEwBdBMsljTRRrINmFtJ2rR1JqRQMDGzgD0OzDw210KiPEPWF2
X-Gm-Gg: ASbGncusFa4Mg15UwxJZb07uSZl5+h5RbaErqiZVMErZL2tayTZZ0JfAXx1VYMV46N/
	sLpplHtKUHMO+Mkhu5qhf6s/JCu0HEqG4vj0aPFearqXOD2TMW1XT9vMbgrSlG28ZI9E47e6Pct
	V27EFeI5HJN+RJ8qi57H75wREV8Iy3xkxuesEPNKfFodFEiinFpo14OUAcBntpQ/Z55h/IQTRX+
	8ycjWhU7EoYiLW2RqW+sUTwZuwEqy0prSB7GhmKCvI1ORnU4+ErzqIyFowRxCYtsPZ420GO2RXa
	iSEZSBGD5U8C+46jpqtPObe56q7uaiP2oHjVjuJkzgU01+jUkMAyvs9a+GGH0xtunLQMlB2bSGH
	Q2oFwiZFEJRcE2jt/2mW4NYnbQTio/YZHm18hoYEKMA==
X-Google-Smtp-Source: AGHT+IG4GmHgf3bHKatd5fUWlAWbFnre0FxKReMv1KEvdPMO4LwKz02DRcne7nBkhLhMffPCGwapqA==
X-Received: by 2002:a17:907:3fa7:b0:b07:880b:79d3 with SMTP id a640c23a62f3a-b07c2081bbbmr281078866b.0.1757665215356;
        Fri, 12 Sep 2025 01:20:15 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b2e7a35dsm336268766b.0.2025.09.12.01.20.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 01:20:14 -0700 (PDT)
Message-ID: <7a0c21cf-e435-44b8-8f2a-3f9128c902b1@gmail.com>
Date: Fri, 12 Sep 2025 10:20:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [oe-core][RFC][PATCH] glib-2.0: revert gir-gio-unix-split
To: f_l_k@t-online.de, openembedded-devel@lists.openembedded.org
References: <20250912061728.5365-1-f_l_k@t-online.de>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250912061728.5365-1-f_l_k@t-online.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Sep 2025 08:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119375

I think you meant this for the oe-core ML

On 9/12/25 08:17, Markus Volk via lists.openembedded.org wrote:
> This commit removes backward compatibility introspection from Gio-2.0
> causing gnome-shell 48 to fail.
>
> Undo the changes until switching to gnome 49
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...-branch-gir-gio-unix-split-into-main.patch | 816 ++++++++++++++++++
>  meta/recipes-core/glib-2.0/glib.inc           |   1 +
>  2 files changed, 817 insertions(+)
>  create mode 100644 meta/recipes-core/glib-2.0/files/0001-Revert-Merge-branch-gir-gio-unix-split-into-main.patch
>
> diff --git a/meta/recipes-core/glib-2.0/files/0001-Revert-Merge-branch-gir-gio-unix-split-into-main.patch b/meta/recipes-core/glib-2.0/files/0001-Revert-Merge-branch-gir-gio-unix-split-into-main.patch
> new file mode 100644
> index 0000000000..80680651a2
> --- /dev/null
> +++ b/meta/recipes-core/glib-2.0/files/0001-Revert-Merge-branch-gir-gio-unix-split-into-main.patch
> @@ -0,0 +1,816 @@
> +From fa119f74ebce3d44546c73584541be9ec1c6c2d0 Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Thu, 11 Sep 2025 19:59:44 +0200
> +Subject: [PATCH] Revert "Merge branch 'gir-gio-unix-split' into 'main'"
> +
> +This reverts commit cb074a65c79a3b4ae4f3ae0e36775af46bcc8009, reversing
> +changes made to 0a017b39c2b085ddfede105584193b453a66909a.
> +
> +Upstream-Status: Inappropriate
> +---
> + gio/gdesktopappinfo.c                  |  95 +++++++++++------------
> + gio/gunixmounts.c                      |  45 ++++++-----
> + girepository/girepository.c            | 101 ++++---------------------
> + girepository/introspection/meson.build |  21 +++++
> + girepository/tests/callable-info.c     |  30 --------
> + girepository/tests/repository.c        |   6 +-
> + girepository/tests/test-common.h       |   5 ++
> + 7 files changed, 112 insertions(+), 191 deletions(-)
> +
> +diff --git a/gio/gdesktopappinfo.c b/gio/gdesktopappinfo.c
> +index 1e5a752ac..0c3038c17 100644
> +--- a/gio/gdesktopappinfo.c
> ++++ b/gio/gdesktopappinfo.c
> +@@ -1795,7 +1795,7 @@ g_desktop_app_info_class_init (GDesktopAppInfoClass *klass)
> +   /**
> +    * GDesktopAppInfo:filename:
> +    *
> +-   * The origin filename of this [class@GioUnix.DesktopAppInfo]
> ++   * The origin filename of this [class@Gio.DesktopAppInfo]
> +    */
> +   g_object_class_install_property (gobject_class,
> +                                    PROP_FILENAME,
> +@@ -2084,9 +2084,9 @@ g_desktop_app_info_load_file (GDesktopAppInfo *self)
> +  * g_desktop_app_info_new_from_keyfile:
> +  * @key_file: an opened [type@GLib.KeyFile]
> +  *
> +- * Creates a new [class@GioUnix.DesktopAppInfo].
> ++ * Creates a new [class@Gio.DesktopAppInfo].
> +  *
> +- * Returns: (nullable): a new [class@GioUnix.DesktopAppInfo] or `NULL` on error.
> ++ * Returns: (nullable): a new [class@Gio.DesktopAppInfo] or `NULL` on error.
> +  *
> +  * Since: 2.18
> +  **/
> +@@ -2113,9 +2113,9 @@ g_desktop_app_info_new_from_keyfile (GKeyFile *key_file)
> +  * @filename: (type filename): the path of a desktop file, in the GLib
> +  *      filename encoding
> +  *
> +- * Creates a new [class@GioUnix.DesktopAppInfo].
> ++ * Creates a new [class@Gio.DesktopAppInfo].
> +  *
> +- * Returns: (nullable): a new [class@GioUnix.DesktopAppInfo] or `NULL` on error.
> ++ * Returns: (nullable): a new [class@Gio.DesktopAppInfo] or `NULL` on error.
> +  **/
> + GDesktopAppInfo *
> + g_desktop_app_info_new_from_filename (const char *filename)
> +@@ -2135,7 +2135,7 @@ g_desktop_app_info_new_from_filename (const char *filename)
> +  * g_desktop_app_info_new:
> +  * @desktop_id: the desktop file ID
> +  *
> +- * Creates a new [class@GioUnix.DesktopAppInfo] based on a desktop file ID.
> ++ * Creates a new [class@Gio.DesktopAppInfo] based on a desktop file ID.
> +  *
> +  * A desktop file ID is the basename of the desktop file, including the
> +  * `.desktop` extension. GIO is looking for a desktop file with this name
> +@@ -2147,7 +2147,7 @@ g_desktop_app_info_new_from_filename (const char *filename)
> +  * (i.e. a desktop ID of `kde-foo.desktop` will match
> +  * `/usr/share/applications/kde/foo.desktop`).
> +  *
> +- * Returns: (nullable): a new [class@GioUnix.DesktopAppInfo], or `NULL` if no
> ++ * Returns: (nullable): a new [class@Gio.DesktopAppInfo], or `NULL` if no
> +  *    desktop file with that ID exists.
> +  */
> + GDesktopAppInfo *
> +@@ -2266,7 +2266,7 @@ g_desktop_app_info_get_display_name (GAppInfo *appinfo)
> + 
> + /**
> +  * g_desktop_app_info_get_is_hidden:
> +- * @info: a [class@GioUnix.DesktopAppInfo].
> ++ * @info: a [class@Gio.DesktopAppInfo].
> +  *
> +  * A desktop file is hidden if the
> +  * [`Hidden` key](https://specifications.freedesktop.org/desktop-entry-spec/latest/ar01s06.html#key-hidden)
> +@@ -2282,13 +2282,11 @@ g_desktop_app_info_get_is_hidden (GDesktopAppInfo *info)
> + 
> + /**
> +  * g_desktop_app_info_get_filename:
> +- * @info: a [class@GioUnix.DesktopAppInfo]
> ++ * @info: a [class@Gio.DesktopAppInfo]
> +  *
> +- * When @info was created from a known filename, return it.
> +- *
> +- * In some situations such as a [class@GioUnix.DesktopAppInfo] returned
> +- * from [ctor@GioUnix.DesktopAppInfo.new_from_keyfile], this function
> +- * will return `NULL`.
> ++ * When @info was created from a known filename, return it.  In some
> ++ * situations such as a [class@Gio.DesktopAppInfo] returned from
> ++ * [ctor@Gio.DesktopAppInfo.new_from_keyfile], this function will return `NULL`.
> +  *
> +  * Returns: (nullable) (type filename): The full path to the file for @info,
> +  *   or `NULL` if not known.
> +@@ -2334,7 +2332,7 @@ g_desktop_app_info_get_icon (GAppInfo *appinfo)
> + 
> + /**
> +  * g_desktop_app_info_get_categories:
> +- * @info: a [class@GioUnix.DesktopAppInfo]
> ++ * @info: a [class@Gio.DesktopAppInfo]
> +  *
> +  * Gets the categories from the desktop file.
> +  *
> +@@ -2351,7 +2349,7 @@ g_desktop_app_info_get_categories (GDesktopAppInfo *info)
> + 
> + /**
> +  * g_desktop_app_info_get_keywords:
> +- * @info: a [class@GioUnix.DesktopAppInfo]
> ++ * @info: a [class@Gio.DesktopAppInfo]
> +  *
> +  * Gets the keywords from the desktop file.
> +  *
> +@@ -2368,7 +2366,7 @@ g_desktop_app_info_get_keywords (GDesktopAppInfo *info)
> + 
> + /**
> +  * g_desktop_app_info_get_generic_name:
> +- * @info: a [class@GioUnix.DesktopAppInfo]
> ++ * @info: a [class@Gio.DesktopAppInfo]
> +  *
> +  * Gets the generic name from the desktop file.
> +  *
> +@@ -2383,7 +2381,7 @@ g_desktop_app_info_get_generic_name (GDesktopAppInfo *info)
> + 
> + /**
> +  * g_desktop_app_info_get_nodisplay:
> +- * @info: a [class@GioUnix.DesktopAppInfo]
> ++ * @info: a [class@Gio.DesktopAppInfo]
> +  *
> +  * Gets the value of the
> +  * [`NoDisplay` key](https://specifications.freedesktop.org/desktop-entry-spec/latest/ar01s06.html#key-nodisplay)
> +@@ -2402,7 +2400,7 @@ g_desktop_app_info_get_nodisplay (GDesktopAppInfo *info)
> + 
> + /**
> +  * g_desktop_app_info_get_show_in:
> +- * @info: a [class@GioUnix.DesktopAppInfo]
> ++ * @info: a [class@Gio.DesktopAppInfo]
> +  * @desktop_env: (nullable): a string specifying a desktop name
> +  *
> +  * Checks if the application info should be shown in menus that list available
> +@@ -3571,7 +3569,7 @@ g_desktop_app_info_launch (GAppInfo           *appinfo,
> + 
> + /**
> +  * g_desktop_app_info_launch_uris_as_manager_with_fds:
> +- * @appinfo: a [class@GioUnix.DesktopAppInfo]
> ++ * @appinfo: a [class@Gio.DesktopAppInfo]
> +  * @uris: (element-type utf8): List of URIs
> +  * @launch_context: (nullable): a [class@Gio.AppLaunchContext]
> +  * @spawn_flags: [flags@GLib.SpawnFlags], used for each process
> +@@ -3585,9 +3583,9 @@ g_desktop_app_info_launch (GAppInfo           *appinfo,
> +  * @stderr_fd: file descriptor to use for child’s stderr, or `-1`
> +  * @error: return location for a #GError, or `NULL`
> +  *
> +- * Equivalent to [method@GioUnix.DesktopAppInfo.launch_uris_as_manager] but
> +- * allows you to pass in file descriptors for the stdin, stdout and stderr
> +- * streams of the launched process.
> ++ * Equivalent to [method@Gio.DesktopAppInfo.launch_uris_as_manager] but allows
> ++ * you to pass in file descriptors for the stdin, stdout and stderr streams
> ++ * of the launched process.
> +  *
> +  * If application launching occurs via some non-spawn mechanism (e.g. D-Bus
> +  * activation) then @stdin_fd, @stdout_fd and @stderr_fd are ignored.
> +@@ -3626,7 +3624,7 @@ g_desktop_app_info_launch_uris_as_manager_with_fds (GDesktopAppInfo            *
> + 
> + /**
> +  * g_desktop_app_info_launch_uris_as_manager:
> +- * @appinfo: a [class@GioUnix.DesktopAppInfo]
> ++ * @appinfo: a [class@Gio.DesktopAppInfo]
> +  * @uris: (element-type utf8): List of URIs
> +  * @launch_context: (nullable): a [class@Gio.AppLaunchContext]
> +  * @spawn_flags: [flags@GLib.SpawnFlags], used for each process
> +@@ -3688,7 +3686,7 @@ g_desktop_app_info_launch_uris_as_manager (GDesktopAppInfo            *appinfo,
> +  * Sets the name of the desktop that the application is running in.
> +  *
> +  * This is used by [method@Gio.AppInfo.should_show] and
> +- * [method@GioUnix.DesktopAppInfo.get_show_in] to evaluate the
> ++ * [method@Gio.DesktopAppInfo.get_show_in] to evaluate the
> +  * [`OnlyShowIn`](https://specifications.freedesktop.org/desktop-entry-spec/latest/ar01s06.html#key-onlyshowin)
> +  * and [`NotShowIn`](https://specifications.freedesktop.org/desktop-entry-spec/latest/ar01s06.html#key-notshowin)
> +  * keys.
> +@@ -4701,7 +4699,7 @@ g_app_info_get_default_for_uri_scheme_impl (const char *uri_scheme)
> +  * the `Implements` line of the desktop file of the application.
> +  *
> +  * Returns: (element-type GDesktopAppInfo) (transfer full): a list of
> +- *   [class@GioUnix.DesktopAppInfo] objects.
> ++ *   [class@Gio.DesktopAppInfo] objects.
> +  *
> +  * Since: 2.42
> +  **/
> +@@ -4754,12 +4752,11 @@ g_desktop_app_info_get_implementations (const gchar *interface)
> +  * any time.
> +  *
> +  * None of the search results are subjected to the normal validation
> +- * checks performed by [ctor@GioUnix.DesktopAppInfo.new] (for example,
> +- * checking that the executable referenced by a result exists), and so it is
> +- * possible for [ctor@GioUnix.DesktopAppInfo.new] to return `NULL` when passed
> +- * an app ID returned by this function. It is expected that calling code will
> +- * do this when subsequently creating a [class@GioUnix.DesktopAppInfo] for
> +- * each result.
> ++ * checks performed by [ctor@Gio.DesktopAppInfo.new] (for example, checking that
> ++ * the executable referenced by a result exists), and so it is possible for
> ++ * [ctor@Gio.DesktopAppInfo.new] to return `NULL` when passed an app ID returned
> ++ * by this function. It is expected that calling code will do this when
> ++ * subsequently creating a [class@Gio.DesktopAppInfo] for each result.
> +  *
> +  * Returns: (array zero-terminated=1) (element-type GStrv) (transfer full): a
> +  *   list of strvs.  Free each item with [func@GLib.strfreev] and free the outer
> +@@ -4885,7 +4882,7 @@ g_app_info_get_all_impl (void)
> +  * #GDesktopAppInfoLookup is an opaque data structure and can only be accessed
> +  * using the following functions.
> +  *
> +- * Deprecated: 2.28: The [iface@GioUnix.DesktopAppInfoLookup] interface is
> ++ * Deprecated: 2.28: The [iface@Gio.DesktopAppInfoLookup] interface is
> +  *   deprecated and unused by GIO.
> +  **/
> + 
> +@@ -4903,14 +4900,14 @@ g_desktop_app_info_lookup_default_init (GDesktopAppInfoLookupInterface *iface)
> + 
> + /**
> +  * g_desktop_app_info_lookup_get_default_for_uri_scheme:
> +- * @lookup: a [iface@GioUnix.DesktopAppInfoLookup]
> ++ * @lookup: a [iface@Gio.DesktopAppInfoLookup]
> +  * @uri_scheme: a string containing a URI scheme.
> +  *
> +  * Gets the default application for launching applications
> +- * using this URI scheme for a particular [iface@GioUnix.DesktopAppInfoLookup]
> ++ * using this URI scheme for a particular [iface@Gio.DesktopAppInfoLookup]
> +  * implementation.
> +  *
> +- * The [iface@GioUnix.DesktopAppInfoLookup] interface and this function is used
> ++ * The [iface@Gio.DesktopAppInfoLookup] interface and this function is used
> +  * to implement [func@Gio.AppInfo.get_default_for_uri_scheme] backends
> +  * in a GIO module. There is no reason for applications to use it
> +  * directly. Applications should use
> +@@ -4919,7 +4916,7 @@ g_desktop_app_info_lookup_default_init (GDesktopAppInfoLookupInterface *iface)
> +  * Returns: (transfer full) (nullable): [iface@Gio.AppInfo] for given
> +  *   @uri_scheme or `NULL` on error.
> +  *
> +- * Deprecated: 2.28: The [iface@GioUnix.DesktopAppInfoLookup] interface is
> ++ * Deprecated: 2.28: The [iface@Gio.DesktopAppInfoLookup] interface is
> +  *   deprecated and unused by GIO.
> +  */
> + GAppInfo *
> +@@ -4941,7 +4938,7 @@ G_GNUC_END_IGNORE_DEPRECATIONS
> + 
> + /**
> +  * g_desktop_app_info_get_startup_wm_class:
> +- * @info: a [class@GioUnix.DesktopAppInfo] that supports startup notify
> ++ * @info: a [class@Gio.DesktopAppInfo] that supports startup notify
> +  *
> +  * Retrieves the `StartupWMClass` field from @info. This represents the
> +  * `WM_CLASS` property of the main window of the application, if launched
> +@@ -4962,7 +4959,7 @@ g_desktop_app_info_get_startup_wm_class (GDesktopAppInfo *info)
> + 
> + /**
> +  * g_desktop_app_info_get_string:
> +- * @info: a [class@GioUnix.DesktopAppInfo]
> ++ * @info: a [class@Gio.DesktopAppInfo]
> +  * @key: the key to look up
> +  *
> +  * Looks up a string value in the keyfile backing @info.
> +@@ -4986,7 +4983,7 @@ g_desktop_app_info_get_string (GDesktopAppInfo *info,
> + 
> + /**
> +  * g_desktop_app_info_get_locale_string:
> +- * @info: a [class@GioUnix.DesktopAppInfo]
> ++ * @info: a [class@Gio.DesktopAppInfo]
> +  * @key: the key to look up
> +  *
> +  * Looks up a localized string value in the keyfile backing @info
> +@@ -5013,7 +5010,7 @@ g_desktop_app_info_get_locale_string (GDesktopAppInfo *info,
> + 
> + /**
> +  * g_desktop_app_info_get_boolean:
> +- * @info: a [class@GioUnix.DesktopAppInfo]
> ++ * @info: a [class@Gio.DesktopAppInfo]
> +  * @key: the key to look up
> +  *
> +  * Looks up a boolean value in the keyfile backing @info.
> +@@ -5036,7 +5033,7 @@ g_desktop_app_info_get_boolean (GDesktopAppInfo *info,
> + 
> + /**
> +  * g_desktop_app_info_get_string_list:
> +- * @info: a [class@GioUnix.DesktopAppInfo]
> ++ * @info: a [class@Gio.DesktopAppInfo]
> +  * @key: the key to look up
> +  * @length: (out) (optional): return location for the number of returned
> +  *   strings, or `NULL`
> +@@ -5064,7 +5061,7 @@ g_desktop_app_info_get_string_list (GDesktopAppInfo *info,
> + 
> + /**
> +  * g_desktop_app_info_has_key:
> +- * @info: a [class@GioUnix.DesktopAppInfo]
> ++ * @info: a [class@Gio.DesktopAppInfo]
> +  * @key: the key to look up
> +  *
> +  * Returns whether @key exists in the `Desktop Entry` group
> +@@ -5088,7 +5085,7 @@ g_desktop_app_info_has_key (GDesktopAppInfo *info,
> + 
> + /**
> +  * g_desktop_app_info_list_actions:
> +- * @info: a [class@GioUnix.DesktopAppInfo]
> ++ * @info: a [class@Gio.DesktopAppInfo]
> +  *
> +  * Returns the list of
> +  * [‘additional application actions’](https://specifications.freedesktop.org/desktop-entry-spec/latest/ar01s11.html)
> +@@ -5125,9 +5122,9 @@ app_info_has_action (GDesktopAppInfo *info,
> + 
> + /**
> +  * g_desktop_app_info_get_action_name:
> +- * @info: a [class@GioUnix.DesktopAppInfo]
> ++ * @info: a [class@Gio.DesktopAppInfo]
> +  * @action_name: the name of the action as from
> +- *   [method@GioUnix.DesktopAppInfo.list_actions]
> ++ *   [method@Gio.DesktopAppInfo.list_actions]
> +  *
> +  * Gets the user-visible display name of the
> +  * [‘additional application actions’](https://specifications.freedesktop.org/desktop-entry-spec/latest/ar01s11.html)
> +@@ -5168,15 +5165,15 @@ g_desktop_app_info_get_action_name (GDesktopAppInfo *info,
> + 
> + /**
> +  * g_desktop_app_info_launch_action:
> +- * @info: a [class@GioUnix.DesktopAppInfo]
> ++ * @info: a [class@Gio.DesktopAppInfo]
> +  * @action_name: the name of the action as from
> +- *   [method@GioUnix.DesktopAppInfo.list_actions]
> ++ *   [method@Gio.DesktopAppInfo.list_actions]
> +  * @launch_context: (nullable): a [class@Gio.AppLaunchContext]
> +  *
> +  * Activates the named application action.
> +  *
> +  * You may only call this function on action names that were
> +- * returned from [method@GioUnix.DesktopAppInfo.list_actions].
> ++ * returned from [method@Gio.DesktopAppInfo.list_actions].
> +  *
> +  * Note that if the main entry of the desktop file indicates that the
> +  * application supports startup notification, and @launch_context is
> +diff --git a/gio/gunixmounts.c b/gio/gunixmounts.c
> +index 54edc57ed..009d6855f 100644
> +--- a/gio/gunixmounts.c
> ++++ b/gio/gunixmounts.c
> +@@ -1867,7 +1867,7 @@ g_unix_mount_entries_get (guint64 *time_read)
> +  * @n_entries_out: (optional) (out caller-allocates): return location for the
> +  *   number of mount entries returned
> +  *
> +- * Gets an array of [struct@GioUnix.MountEntry]s containing the Unix mounts
> ++ * Gets an array of [struct@Gio.UnixMountEntry]s containing the Unix mounts
> +  * listed in @table_path.
> +  *
> +  * This is a generalized version of [func@GioUnix.mount_entries_get], mainly
> +@@ -1899,7 +1899,7 @@ g_unix_mounts_get_from_file (const char *table_path,
> +  * @n_entries_out: (optional) (out caller-allocates): return location for the
> +  *   number of mount entries returned
> +  *
> +- * Gets an array of [struct@GioUnix.MountEntry]s containing the Unix mounts
> ++ * Gets an array of [struct@Gio.UnixMountEntry]s containing the Unix mounts
> +  * listed in @table_path.
> +  *
> +  * This is a generalized version of [func@GioUnix.mount_entries_get], mainly
> +@@ -2126,7 +2126,7 @@ g_unix_mount_points_get (guint64 *time_read)
> +  * @n_points_out: (optional) (out caller-allocates): return location for the
> +  *   number of mount points returned
> +  *
> +- * Gets an array of [struct@GioUnix.MountPoint]s containing the Unix mount
> ++ * Gets an array of [struct@Gio.UnixMountPoint]s containing the Unix mount
> +  * points listed in @table_path.
> +  *
> +  * This is a generalized version of [func@GioUnix.mount_points_get], mainly
> +@@ -2722,7 +2722,7 @@ g_unix_mount_monitor_new (void)
> +  * 
> +  * Frees a Unix mount.
> +  *
> +- * Deprecated: 2.84: Use [method@GioUnix.MountEntry.free] instead.
> ++ * Deprecated: 2.84: Use [func@GioUnix.MountEntry.free] instead.
> +  */
> + void
> + g_unix_mount_free (GUnixMountEntry *mount_entry)
> +@@ -2759,7 +2759,7 @@ g_unix_mount_entry_free (GUnixMountEntry *mount_entry)
> +  *
> +  * Returns: (transfer full): a new [struct@GioUnix.MountEntry]
> +  * Since: 2.54
> +- * Deprecated: 2.84: Use [method@GioUnix.MountEntry.copy] instead.
> ++ * Deprecated: 2.84: Use [func@GioUnix.MountEntry.copy] instead.
> +  */
> + GUnixMountEntry *
> + g_unix_mount_copy (GUnixMountEntry *mount_entry)
> +@@ -2850,7 +2850,7 @@ g_unix_mount_point_copy (GUnixMountPoint *mount_point)
> +  * 
> +  * Returns: `1`, `0` or `-1` if @mount1 is greater than, equal to,
> +  *    or less than @mount2, respectively
> +- * Deprecated: 2.84: Use [method@GioUnix.MountEntry.compare] instead.
> ++ * Deprecated: 2.84: Use [func@GioUnix.MountEntry.compare] instead.
> +  */
> + gint
> + g_unix_mount_compare (GUnixMountEntry *mount1,
> +@@ -2912,7 +2912,7 @@ g_unix_mount_entry_compare (GUnixMountEntry *mount1,
> +  * Gets the mount path for a Unix mount.
> +  * 
> +  * Returns: (type filename): the mount path for @mount_entry
> +- * Deprecated: 2.84: Use [method@GioUnix.MountEntry.get_mount_path] instead.
> ++ * Deprecated: 2.84: Use [func@GioUnix.MountEntry.get_mount_path] instead.
> +  */
> + const gchar *
> + g_unix_mount_get_mount_path (GUnixMountEntry *mount_entry)
> +@@ -2944,7 +2944,7 @@ g_unix_mount_entry_get_mount_path (GUnixMountEntry *mount_entry)
> +  * Gets the device path for a Unix mount.
> +  * 
> +  * Returns: (type filename): a string containing the device path
> +- * Deprecated: 2.84: Use [method@GioUnix.MountEntry.get_device_path] instead.
> ++ * Deprecated: 2.84: Use [func@GioUnix.MountEntry.get_device_path] instead.
> +  */
> + const gchar *
> + g_unix_mount_get_device_path (GUnixMountEntry *mount_entry)
> +@@ -2973,9 +2973,8 @@ g_unix_mount_entry_get_device_path (GUnixMountEntry *mount_entry)
> +  * g_unix_mount_get_root_path:
> +  * @mount_entry: a [struct@GioUnix.MountEntry]
> +  * 
> +- * Gets the root of the mount within the filesystem.
> +- *
> +- * This is useful e.g. for mounts created by bind operation, or btrfs subvolumes.
> ++ * Gets the root of the mount within the filesystem. This is useful e.g. for
> ++ * mounts created by bind operation, or btrfs subvolumes.
> +  * 
> +  * For example, the root path is equal to `/` for a mount created by
> +  * `mount /dev/sda1 /mnt/foo` and `/bar` for
> +@@ -2983,7 +2982,7 @@ g_unix_mount_entry_get_device_path (GUnixMountEntry *mount_entry)
> +  *
> +  * Returns: (nullable): a string containing the root, or `NULL` if not supported
> +  * Since: 2.60
> +- * Deprecated: 2.84: Use [method@GioUnix.MountEntry.get_root_path] instead.
> ++ * Deprecated: 2.84: Use [func@GioUnix.MountEntry.get_root_path] instead.
> +  */
> + const gchar *
> + g_unix_mount_get_root_path (GUnixMountEntry *mount_entry)
> +@@ -3020,7 +3019,7 @@ g_unix_mount_entry_get_root_path (GUnixMountEntry *mount_entry)
> +  * Gets the filesystem type for the Unix mount.
> +  * 
> +  * Returns: a string containing the file system type
> +- * Deprecated: 2.84: Use [method@GioUnix.MountEntry.get_fs_type] instead.
> ++ * Deprecated: 2.84: Use [func@GioUnix.MountEntry.get_fs_type] instead.
> +  */
> + const gchar *
> + g_unix_mount_get_fs_type (GUnixMountEntry *mount_entry)
> +@@ -3053,13 +3052,13 @@ g_unix_mount_entry_get_fs_type (GUnixMountEntry *mount_entry)
> +  * 
> +  * For example: `rw,relatime,seclabel,data=ordered`.
> +  * 
> +- * This is similar to [method@GioUnix.MountPoint.get_options], but it takes
> ++ * This is similar to [func@GioUnix.MountPoint.get_options], but it takes
> +  * a [struct@GioUnix.MountEntry] as an argument.
> +  *
> +  * Returns: (nullable): a string containing the options, or `NULL` if not
> +  *    available.
> +  * Since: 2.58
> +- * Deprecated: 2.84: Use [method@GioUnix.MountEntry.get_options] instead.
> ++ * Deprecated: 2.84: Use [func@GioUnix.MountEntry.get_options] instead.
> +  */
> + const gchar *
> + g_unix_mount_get_options (GUnixMountEntry *mount_entry)
> +@@ -3075,7 +3074,7 @@ g_unix_mount_get_options (GUnixMountEntry *mount_entry)
> +  *
> +  * For example: `rw,relatime,seclabel,data=ordered`.
> +  *
> +- * This is similar to [method@GioUnix.MountPoint.get_options], but it takes
> ++ * This is similar to [func@GioUnix.MountPoint.get_options], but it takes
> +  * a [struct@GioUnix.MountEntry] as an argument.
> +  *
> +  * Returns: (nullable): a string containing the options, or `NULL` if not
> +@@ -3097,7 +3096,7 @@ g_unix_mount_entry_get_options (GUnixMountEntry *mount_entry)
> +  * Checks if a Unix mount is mounted read only.
> +  * 
> +  * Returns: true if @mount_entry is read only; false otherwise
> +- * Deprecated: 2.84: Use [method@GioUnix.MountEntry.is_readonly] instead.
> ++ * Deprecated: 2.84: Use [func@GioUnix.MountEntry.is_readonly] instead.
> +  */
> + gboolean
> + g_unix_mount_is_readonly (GUnixMountEntry *mount_entry)
> +@@ -3136,7 +3135,7 @@ g_unix_mount_entry_is_readonly (GUnixMountEntry *mount_entry)
> +  * file system types and device paths are ignored.
> +  *
> +  * Returns: true if the Unix mount is for a system path; false otherwise
> +- * Deprecated: 2.84: Use [method@GioUnix.MountEntry.is_system_internal] instead.
> ++ * Deprecated: 2.84: Use [func@GioUnix.MountEntry.is_system_internal] instead.
> +  */
> + gboolean
> + g_unix_mount_is_system_internal (GUnixMountEntry *mount_entry)
> +@@ -3528,7 +3527,7 @@ type_to_icon (GUnixMountType type, gboolean is_mount_point, gboolean use_symboli
> +  * The result is a translated string.
> +  *
> +  * Returns: (transfer full): a newly allocated translated string
> +- * Deprecated: 2.84: Use [method@GioUnix.MountEntry.guess_name] instead.
> ++ * Deprecated: 2.84: Use [func@GioUnix.MountEntry.guess_name] instead.
> +  */
> + gchar *
> + g_unix_mount_guess_name (GUnixMountEntry *mount_entry)
> +@@ -3567,7 +3566,7 @@ g_unix_mount_entry_guess_name (GUnixMountEntry *mount_entry)
> +  * Guesses the icon of a Unix mount entry.
> +  *
> +  * Returns: (transfer full): a [iface@Gio.Icon]
> +- * Deprecated: 2.84: Use [method@GioUnix.MountEntry.guess_icon] instead.
> ++ * Deprecated: 2.84: Use [func@GioUnix.MountEntry.guess_icon] instead.
> +  */
> + GIcon *
> + g_unix_mount_guess_icon (GUnixMountEntry *mount_entry)
> +@@ -3598,7 +3597,7 @@ g_unix_mount_entry_guess_icon (GUnixMountEntry *mount_entry)
> +  *
> +  * Returns: (transfer full): a [iface@Gio.Icon]
> +  * Since: 2.34
> +- * Deprecated: 2.84: Use [method@GioUnix.MountEntry.guess_symbolic_icon] instead.
> ++ * Deprecated: 2.84: Use [func@GioUnix.MountEntry.guess_symbolic_icon] instead.
> +  */
> + GIcon *
> + g_unix_mount_guess_symbolic_icon (GUnixMountEntry *mount_entry)
> +@@ -3680,7 +3679,7 @@ g_unix_mount_point_guess_symbolic_icon (GUnixMountPoint *mount_point)
> +  * Guesses whether a Unix mount entry can be ejected.
> +  *
> +  * Returns: true if @mount_entry is deemed to be ejectable; false otherwise
> +- * Deprecated: 2.84: Use [method@GioUnix.MountEntry.guess_can_eject] instead.
> ++ * Deprecated: 2.84: Use [func@GioUnix.MountEntry.guess_can_eject] instead.
> +  */
> + gboolean
> + g_unix_mount_guess_can_eject (GUnixMountEntry *mount_entry)
> +@@ -3717,7 +3716,7 @@ g_unix_mount_entry_guess_can_eject (GUnixMountEntry *mount_entry)
> +  * Guesses whether a Unix mount entry should be displayed in the UI.
> +  *
> +  * Returns: true if @mount_entry is deemed to be displayable; false otherwise
> +- * Deprecated: 2.84: Use [method@GioUnix.MountEntry.guess_should_display] instead.
> ++ * Deprecated: 2.84: Use [func@GioUnix.MountEntry.guess_should_display] instead.
> +  */
> + gboolean
> + g_unix_mount_guess_should_display (GUnixMountEntry *mount_entry)
> +diff --git a/girepository/girepository.c b/girepository/girepository.c
> +index 1c816d1de..ebcd3d236 100644
> +--- a/girepository/girepository.c
> ++++ b/girepository/girepository.c
> +@@ -135,15 +135,6 @@ struct _GIRepository
> + 
> + G_DEFINE_TYPE (GIRepository, gi_repository, G_TYPE_OBJECT);
> + 
> +-static GITypelib *
> +-require_internal (GIRepository           *repository,
> +-                  const char             *namespace,
> +-                  const char             *version,
> +-                  GIRepositoryLoadFlags   flags,
> +-                  const char * const     *search_paths,
> +-                  size_t                  n_search_paths,
> +-                  GError                **error);
> +-
> + #ifdef G_PLATFORM_WIN32
> + #include <windows.h>
> + 
> +@@ -605,10 +596,6 @@ load_dependencies_recurse (GIRepository *repository,
> +     {
> +       int i;
> + 
> +-      const char * const *search_path =
> +-        (const char * const *) repository->typelib_search_path->pdata;
> +-      gsize search_path_len = repository->typelib_search_path->len;
> +-
> +       for (i = 0; dependencies[i]; i++)
> +         {
> +           char *dependency = dependencies[i];
> +@@ -621,9 +608,8 @@ load_dependencies_recurse (GIRepository *repository,
> +           dependency_namespace = g_strndup (dependency, (size_t) (last_dash - dependency));
> +           dependency_version = last_dash+1;
> + 
> +-          if (!require_internal (repository, dependency_namespace, dependency_version,
> +-                                 0, search_path, search_path_len,
> +-                                 error))
> ++          if (!gi_repository_require (repository, dependency_namespace, dependency_version,
> ++                                      0, error))
> +             {
> +               g_free (dependency_namespace);
> +               g_strfreev (dependencies);
> +@@ -663,7 +649,7 @@ static const char *
> + register_internal (GIRepository *repository,
> +                    const char   *source,
> +                    gboolean      lazy,
> +-                   GITypelib    *typelib,
> ++                   GITypelib     *typelib,
> +                    GError      **error)
> + {
> +   Header *header;
> +@@ -2026,54 +2012,6 @@ require_internal (GIRepository           *repository,
> +   return ret;
> + }
> + 
> +-static GITypelib *
> +-require_internal_with_platform_data (GIRepository           *repository,
> +-                                     const char             *namespace,
> +-                                     const char             *version,
> +-                                     GIRepositoryLoadFlags   flags,
> +-                                     const char * const     *search_paths,
> +-                                     size_t                  search_paths_len,
> +-                                     GError                **error)
> +-{
> +-  GITypelib *typelib;
> +-
> +-  typelib = require_internal (repository, namespace, version, flags,
> +-                              search_paths, search_paths_len,
> +-                              error);
> +-  if (!typelib)
> +-    return NULL;
> +-
> +-#if defined (G_OS_UNIX) || defined (G_OS_WIN32)
> +-  /* Backward compatibility hack: if we're loading Gio-2.0, we automatically
> +-   * load the platform specific introspection data that used to exist inside
> +-   * Gio-2.0
> +-   */
> +-  if (g_str_equal (namespace, "Gio") &&
> +-      (!version || g_str_equal (version, "2.0")))
> +-    {
> +-      GError *local_error = NULL;
> +-      const char *platform_namespace;
> +-
> +-#  if defined (G_OS_UNIX)
> +-      platform_namespace = "GioUnix";
> +-#  elif defined (G_OS_WIN32)
> +-      platform_namespace = "GioWin32";
> +-#  endif /* defined (G_OS_LINUX) */
> +-
> +-      if (!require_internal (repository, platform_namespace, version, flags,
> +-                             search_paths, search_paths_len,
> +-                             &local_error))
> +-        {
> +-          g_critical ("Unable to load platform-specific GIO introspection data: %s",
> +-                      local_error->message);
> +-          g_error_free (local_error);
> +-        }
> +-    }
> +-#endif /* defined(G_OS_UNIX) || defined(G_OS_WIN32) */
> +-
> +-  return typelib;
> +-}
> +-
> + /**
> +  * gi_repository_require:
> +  * @repository: A #GIRepository
> +@@ -2094,24 +2032,19 @@ require_internal_with_platform_data (GIRepository           *repository,
> +  * Since: 2.80
> +  */
> + GITypelib *
> +-gi_repository_require (GIRepository           *repository,
> +-                       const char             *namespace,
> +-                       const char             *version,
> +-                       GIRepositoryLoadFlags   flags,
> +-                       GError                **error)
> ++gi_repository_require (GIRepository  *repository,
> ++                       const char    *namespace,
> ++                       const char    *version,
> ++                       GIRepositoryLoadFlags flags,
> ++                       GError       **error)
> + {
> +-  const char * const *search_paths;
> +-  size_t search_paths_len;
> +-
> +-  g_return_val_if_fail (GI_IS_REPOSITORY (repository), NULL);
> +-  g_return_val_if_fail (namespace != NULL, NULL);
> ++  GITypelib *typelib;
> + 
> +-  search_paths = (const char * const *) repository->typelib_search_path->pdata;
> +-  search_paths_len = repository->typelib_search_path->len;
> ++  typelib = require_internal (repository, namespace, version, flags,
> ++                              (const char * const *) repository->typelib_search_path->pdata,
> ++                              repository->typelib_search_path->len, error);
> + 
> +-  return require_internal_with_platform_data (repository, namespace, version, flags,
> +-                                              search_paths, search_paths_len,
> +-                                              error);
> ++  return typelib;
> + }
> + 
> + /**
> +@@ -2145,12 +2078,8 @@ gi_repository_require_private (GIRepository           *repository,
> + {
> +   const char * const search_path[] = { typelib_dir, NULL };
> + 
> +-  g_return_val_if_fail (GI_IS_REPOSITORY (repository), NULL);
> +-  g_return_val_if_fail (namespace != NULL, NULL);
> +-
> +-  return require_internal_with_platform_data (repository, namespace, version, flags,
> +-                                              search_path, 1,
> +-                                              error);
> ++  return require_internal (repository, namespace, version, flags,
> ++                           search_path, 1, error);
> + }
> + 
> + static gboolean
> +diff --git a/girepository/introspection/meson.build b/girepository/introspection/meson.build
> +index 2c2a36c8f..a846a764c 100644
> +--- a/girepository/introspection/meson.build
> ++++ b/girepository/introspection/meson.build
> +@@ -234,6 +234,27 @@ gio_gir_args = [
> +   '--symbol-prefix=gio',
> + ]
> + 
> ++# For API compatibility reasons, Gio-2.0.gir needs to contain the platform
> ++# specific APIs which are also present in the (newer) GioUnix-2.0.gir and
> ++# GioWin32-2.0.gir repositories.
> ++# See https://gitlab.gnome.org/GNOME/glib/-/merge_requests/3892#note_2001361
> ++# These can be dropped when GIO next breaks API (i.e. with Gio-3.0.gir).
> ++if host_system == 'windows'
> ++  gio_gir_sources += [ gio_win32_include_headers, win32_sources ]
> ++  foreach h: gio_win32_include_headers
> ++    gio_gir_args += '--c-include=gio/' + fs.name(h)
> ++  endforeach
> ++  gio_gir_packages += 'gio-windows-2.0'
> ++  gio_gir_args += '--pkg=gio-windows-2.0'
> ++else
> ++  gio_gir_sources += [ gio_unix_include_headers, unix_sources ]
> ++  foreach h: gio_unix_include_headers
> ++    gio_gir_args += '--c-include=gio/' + fs.name(h)
> ++  endforeach
> ++  gio_gir_packages += 'gio-unix-2.0'
> ++  gio_gir_args += '--pkg=gio-unix-2.0'
> ++endif
> ++
> + gio_gir = gnome.generate_gir(libgio,
> +   sources: gio_gir_sources,
> +   namespace: 'Gio',
> +diff --git a/girepository/tests/callable-info.c b/girepository/tests/callable-info.c
> +index 973a54703..69fd5e940 100644
> +--- a/girepository/tests/callable-info.c
> ++++ b/girepository/tests/callable-info.c
> +@@ -210,32 +210,6 @@ test_callable_info_static_vfunc (RepositoryFixture *fx,
> +   gi_base_info_unref ((GIBaseInfo *) vfunc_info);
> + }
> + 
> +-#ifdef G_OS_UNIX
> +-static void
> +-test_callable_info_platform_unix_is_method (RepositoryFixture *fx,
> +-                                            const void *unused)
> +-{
> +-  GIBaseInfo *info;
> +-  GIFunctionInfo *func_info;
> +-
> +-  g_test_message ("Checking DesktopAppInfo in Gio");
> +-  info = gi_repository_find_by_name (fx->repository, "Gio", "DesktopAppInfo");
> +-  g_assert_null (info);
> +-
> +-  g_test_message ("Checking DesktopAppInfo in GioUnix");
> +-  info = gi_repository_find_by_name (fx->repository, "GioUnix", "DesktopAppInfo");
> +-  g_assert_nonnull (info);
> +-
> +-  /* Must provide Gio.DesktopAppInfo methods */
> +-  func_info = gi_object_info_find_method (GI_OBJECT_INFO (info), "has_key");
> +-  g_assert_true (gi_callable_info_is_method (GI_CALLABLE_INFO (func_info)));
> +-  g_assert_nonnull (func_info);
> +-  g_clear_pointer (&func_info, gi_base_info_unref);
> +-
> +-  gi_base_info_unref (info);
> +-}
> +-#endif
> +-
> + int
> + main (int argc, char **argv)
> + {
> +@@ -247,9 +221,5 @@ main (int argc, char **argv)
> +   ADD_REPOSITORY_TEST ("/callable-info/static-method", test_callable_info_static_method, &typelib_load_spec_gio);
> +   ADD_REPOSITORY_TEST ("/callable-info/static-vfunc", test_callable_info_static_vfunc, &typelib_load_spec_gio);
> + 
> +-#ifdef G_OS_UNIX
> +-  ADD_REPOSITORY_TEST ("/callable-info/platform/unix/is-method", test_callable_info_platform_unix_is_method, &typelib_load_spec_gio);
> +-#endif
> +-
> +   return g_test_run ();
> + }
> +diff --git a/girepository/tests/repository.c b/girepository/tests/repository.c
> +index ca33d9541..cbc21ed30 100644
> +--- a/girepository/tests/repository.c
> ++++ b/girepository/tests/repository.c
> +@@ -926,7 +926,7 @@ main (int   argc,
> +   ADD_REPOSITORY_TEST ("/repository/constructor-return-type", test_repository_constructor_return_type, &typelib_load_spec_gobject);
> +   ADD_REPOSITORY_TEST ("/repository/enum-info-c-identifier", test_repository_enum_info_c_identifier, &typelib_load_spec_glib);
> +   ADD_REPOSITORY_TEST ("/repository/enum-info-static-methods", test_repository_enum_info_static_methods, &typelib_load_spec_glib);
> +-  ADD_REPOSITORY_TEST ("/repository/error-quark", test_repository_error_quark, &typelib_load_spec_gio);
> ++  ADD_REPOSITORY_TEST ("/repository/error-quark", test_repository_error_quark, &typelib_load_spec_gio_platform);
> +   ADD_REPOSITORY_TEST ("/repository/flags-info-c-identifier", test_repository_flags_info_c_identifier, &typelib_load_spec_gobject);
> +   ADD_REPOSITORY_TEST ("/repository/fundamental-ref-func", test_repository_fundamental_ref_func, &typelib_load_spec_gobject);
> +   ADD_REPOSITORY_TEST ("/repository/instance-method-ownership-transfer", test_repository_instance_method_ownership_transfer, &typelib_load_spec_gio);
> +@@ -936,8 +936,8 @@ main (int   argc,
> +   ADD_REPOSITORY_TEST ("/repository/vfunc-info-with-no-invoker", test_repository_vfunc_info_with_no_invoker, &typelib_load_spec_gobject);
> +   ADD_REPOSITORY_TEST ("/repository/vfunc-info-with-invoker-on-interface", test_repository_vfunc_info_with_invoker_on_interface, &typelib_load_spec_gio);
> +   ADD_REPOSITORY_TEST ("/repository/vfunc-info-with-invoker-on-object", test_repository_vfunc_info_with_invoker_on_object, &typelib_load_spec_gio);
> +-  ADD_REPOSITORY_TEST ("/repository/find-by-gtype", test_repository_find_by_gtype, &typelib_load_spec_gio);
> +-  ADD_REPOSITORY_TEST ("/repository/loaded-namespaces", test_repository_loaded_namespaces, &typelib_load_spec_gio);
> ++  ADD_REPOSITORY_TEST ("/repository/find-by-gtype", test_repository_find_by_gtype, &typelib_load_spec_gio_platform);
> ++  ADD_REPOSITORY_TEST ("/repository/loaded-namespaces", test_repository_loaded_namespaces, &typelib_load_spec_gio_platform);
> +   g_test_add_func ("/repository/dup_default", test_repository_dup_default);
> + 
> +   return g_test_run ();
> +diff --git a/girepository/tests/test-common.h b/girepository/tests/test-common.h
> +index 9d31998d1..e7340c64b 100644
> +--- a/girepository/tests/test-common.h
> ++++ b/girepository/tests/test-common.h
> +@@ -36,6 +36,11 @@ typedef struct
> + static const TypelibLoadSpec typelib_load_spec_glib = { "GLib", "2.0" };
> + static const TypelibLoadSpec typelib_load_spec_gobject = { "GObject", "2.0" };
> + static const TypelibLoadSpec typelib_load_spec_gio = { "Gio", "2.0" };
> ++#if defined(G_OS_UNIX)
> ++static const TypelibLoadSpec typelib_load_spec_gio_platform = { "GioUnix", "2.0" };
> ++#elif defined(G_OS_WIN32)
> ++static const TypelibLoadSpec typelib_load_spec_gio_platform = { "GioWin32", "2.0" };
> ++#endif
> + 
> + void repository_init (int *argc,
> +                       char **argv[]);
> +-- 
> +2.50.1
> +
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
> index f9cb3417ec..9344230525 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -231,6 +231,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
>             file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
>             file://0010-Do-not-hardcode-python-path-into-various-tools.patch \
>             file://skip-timeout.patch \
> +           file://0001-Revert-Merge-branch-gir-gio-unix-split-into-main.patch \
>             "
>  SRC_URI:append:class-native = " file://relocate-modules.patch \
>                                  file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119374): https://lists.openembedded.org/g/openembedded-devel/message/119374
> Mute This Topic: https://lists.openembedded.org/mt/115202145/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


