Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5144D76085
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 15:08:49 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id l41-v6so17782771wre.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 08:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=45ZHsLkFg+tBQe7zuKs7o8g+gv3UNILBwUKyba2DUYM=;
	b=fgS4/AQSldWwIBjCJKXOXwPfKUM/4+q13k9wnDZCIJY03nTqapxXUV7w81Ws1rpiC7
	5K02IKl7LTuKwf3SBDoJIa/zfLqsA7hh/0x/ZupJJL+sJXulLgLsyNFzwn9+UbRXlVxh
	fBX8ZiggEGtplLzjY0dPec8j1G7xP8g9FSDrolIEe1oj1S7NIuNMI1T0189hsSJcjttn
	c7EtzQpi1/fkxpKJzgt7rub/7JuZKAvDEWuud8zEUZGZeiR5lwBOV90NFZG6LFhdY9jm
	DiPb2seAmCcA7F3bPaRz3nO+SVGwoCP6KJe7OqJv30zWWMT5/C2YUphEIPeL9ATTdcya
	tsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=45ZHsLkFg+tBQe7zuKs7o8g+gv3UNILBwUKyba2DUYM=;
	b=QR7vMMBoG6QMbxzGXorxev9yMSswYCgDi241wyXZTvu++X+s7tJmkYtGbHAJcvQ9xJ
	vKMG8jD0RngeLDZAcZBLO0Uj1MGWXX96Ytgdy5uLNqJ1DnnzEbUFFpUWIOmYhBo1cays
	kWemZtOMk4fRWxKg5z18GFihHwDS5chKsgoShqm9dwMxx7cOGTcLmoy6+Z9Uf1/cgHM5
	tLZYMLySUzvm+/LaNOkyyYJjlMvb4xuov0iuEu1dQDjmwM9CnLZb+8/gNgUK+9Kl7wYG
	+Oo1rpvIWrjEWbEWICgpUd1gXOLdbjSTwZtjuTFd1FzHVUQEpkS8UWd1x751ctEWK+kZ
	XoZw==
X-Gm-Message-State: APt69E1MQqwlzpOIpyXsuCXrYAY9ukWduCLS3W3f1RwM/xmXpELEaTkS
	K3em3x73MQeIzlus7RNCyVsc9A==
X-Google-Smtp-Source: ADUXVKLOdsOqQmFIOb47n3PQpO067chANhjWCOugNNYx8Aws6YxXlGqPHtjmdBg22KPCTfAPJl3JbA==
X-Received: by 2002:a5d:4049:: with SMTP id
	w9-v6mr10781046wrp.96.1528643329688; 
	Sun, 10 Jun 2018 08:08:49 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BC13F69C25723999916AF42.dip0.t-ipconnect.de.
	[2003:f0:7bc1:3f69:c257:2399:9916:af42])
	by smtp.gmail.com with ESMTPSA id
	z16-v6sm43360230wro.41.2018.06.10.08.08.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Jun 2018 08:08:49 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2018 17:08:09 +0200
Message-Id: <20180610150821.9536-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180610150821.9536-1-schnitzeltony@gmail.com>
References: <20180610150821.9536-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 07/19] xfce4-panel: upgrade 4.12.2 -> 4.13.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Jun 2018 15:08:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is a development release but stoppers could not be found.

* Uses GTK3
* Fixes background color in systray panel-plugin

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...make-change-of-system-s-timezone-change-t.patch | 42 ----------------------
 ...o-not-display-desktop-icon-when-no-windo.patch} | 26 +++++++-------
 ...xfce4-panel_4.12.2.bb => xfce4-panel_4.13.3.bb} | 13 +++----
 3 files changed, 18 insertions(+), 63 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-panel/files/0001-clock-time-make-change-of-system-s-timezone-change-t.patch
 rename meta-xfce/recipes-xfce/xfce4-panel/files/{0002-windowmenu-do-not-display-desktop-icon-when-no-windo.patch => 0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch} (67%)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.12.2.bb => xfce4-panel_4.13.3.bb} (74%)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/files/0001-clock-time-make-change-of-system-s-timezone-change-t.patch b/meta-xfce/recipes-xfce/xfce4-panel/files/0001-clock-time-make-change-of-system-s-timezone-change-t.patch
deleted file mode 100644
index 9dca3ba57..000000000
--- a/meta-xfce/recipes-xfce/xfce4-panel/files/0001-clock-time-make-change-of-system-s-timezone-change-t.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From c582338ef4f33b3dc07a2636340d55b9fb530650 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Wed, 17 Feb 2016 00:15:44 +0100
-Subject: [PATCH] clock-time: make change of system's timezone change time for
- DEFAULT_TIMEZONE
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-clock_time->timezone is set in clock_time_init so the condition
-
-'clock_time->timezone != NULL
-
-is matching always.
-
-Tested by selecting seconds displayed (-> quick update) and changing timezone.
-
-Upstream-Status: Submitted [1]
-
-[1] https://bugzilla.xfce.org/show_bug.cgi?id=12453
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- plugins/clock/clock-time.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/plugins/clock/clock-time.c b/plugins/clock/clock-time.c
-index b015b13..4459b85 100644
---- a/plugins/clock/clock-time.c
-+++ b/plugins/clock/clock-time.c
-@@ -198,7 +198,7 @@ clock_time_get_time (ClockTime *clock_time)
- 
-   panel_return_val_if_fail (XFCE_IS_CLOCK_TIME (clock_time), NULL);
- 
--  if (clock_time->timezone != NULL)
-+  if (g_strcmp0 (clock_time->timezone_name, DEFAULT_TIMEZONE) != 0)
-     date_time = g_date_time_new_now (clock_time->timezone);
-   else
-     date_time = g_date_time_new_now_local ();
--- 
-2.5.0
-
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/files/0002-windowmenu-do-not-display-desktop-icon-when-no-windo.patch b/meta-xfce/recipes-xfce/xfce4-panel/files/0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch
similarity index 67%
rename from meta-xfce/recipes-xfce/xfce4-panel/files/0002-windowmenu-do-not-display-desktop-icon-when-no-windo.patch
rename to meta-xfce/recipes-xfce/xfce4-panel/files/0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch
index b2d960c00..1adb14552 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/files/0002-windowmenu-do-not-display-desktop-icon-when-no-windo.patch
+++ b/meta-xfce/recipes-xfce/xfce4-panel/files/0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch
@@ -14,23 +14,23 @@ Upstream-Status: Pending
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
- plugins/windowmenu/windowmenu.c |   12 ++++++------
- 1 files changed, 6 insertions(+), 6 deletions(-)
+ plugins/windowmenu/windowmenu.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/plugins/windowmenu/windowmenu.c b/plugins/windowmenu/windowmenu.c
-index c96123a..9404021 100644
+index f47e993e..061d6544 100644
 --- a/plugins/windowmenu/windowmenu.c
 +++ b/plugins/windowmenu/windowmenu.c
-@@ -256,7 +256,7 @@ window_menu_plugin_init (WindowMenuPlugin *plugin)
+@@ -251,7 +251,7 @@ window_menu_plugin_init (WindowMenuPlugin *plugin)
    g_signal_connect (G_OBJECT (plugin->button), "toggled",
        G_CALLBACK (window_menu_plugin_menu), plugin);
  
--  plugin->icon = xfce_panel_image_new_from_source ("user-desktop");
-+  plugin->icon = xfce_panel_image_new_from_source (NULL);
+-  plugin->icon = gtk_image_new_from_icon_name ("user-desktop", GTK_ICON_SIZE_BUTTON);
++  plugin->icon = gtk_image_new_from_icon_name (NULL, GTK_ICON_SIZE_BUTTON);
    gtk_container_add (GTK_CONTAINER (plugin->button), plugin->icon);
    gtk_widget_show (plugin->icon);
  }
-@@ -634,7 +634,7 @@ window_menu_plugin_active_window_changed (WnckScreen       *screen,
+@@ -640,7 +640,7 @@ window_menu_plugin_active_window_changed (WnckScreen       *screen,
            /* skip 'fake' windows */
            type = wnck_window_get_window_type (window);
            if (type == WNCK_WINDOW_DESKTOP || type == WNCK_WINDOW_DOCK)
@@ -39,22 +39,22 @@ index c96123a..9404021 100644
  
            /* get the window icon and set the tooltip */
            gtk_widget_set_tooltip_text (GTK_WIDGET (icon),
-@@ -648,11 +648,11 @@ window_menu_plugin_active_window_changed (WnckScreen       *screen,
+@@ -660,12 +660,12 @@ window_menu_plugin_active_window_changed (WnckScreen       *screen,
          }
        else
          {
 -          show_desktop_icon:
 +          show_no_icon:
  
--          /* desktop is shown right now */
--          xfce_panel_image_set_from_source (icon, "user-desktop");
+           /* desktop is shown right now */
+-          gtk_image_set_from_icon_name (GTK_IMAGE (icon), "user-desktop", icon_size);
++          gtk_image_set_from_icon_name (GTK_IMAGE (icon), NULL, icon_size);
+           gtk_image_set_pixel_size (GTK_IMAGE (icon), icon_size);
 -          gtk_widget_set_tooltip_text (GTK_WIDGET (icon), _("Desktop"));
-+          /* no icon is shown right now */
-+          xfce_panel_image_set_from_source (icon, NULL);
 +          gtk_widget_set_tooltip_text (GTK_WIDGET (icon), _("No Windows"));
          }
      }
  }
 -- 
-1.7.6.5
+2.14.3
 
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.2.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.3.bb
similarity index 74%
rename from meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.2.bb
rename to meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.3.bb
index 9cc9a4bbc..dea0c357e 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.2.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.3.bb
@@ -2,21 +2,18 @@ SUMMARY = "Xfce4 Panel"
 SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=26a8bd75d8f8498bdbbe64a27791d4ee"
-DEPENDS = "libxfce4util garcon libxfce4ui xfconf exo gtk+ gtk+3 dbus cairo virtual/libx11 libxml2 libwnck"
+DEPENDS = "libxfce4util garcon libxfce4ui xfconf exo gtk+ gtk+3 dbus cairo virtual/libx11 libxml2 libwnck3 vala-native"
 
-inherit xfce gtk-doc distro_features_check gtk-icon-cache
+inherit xfce gtk-doc gobject-introspection distro_features_check gtk-icon-cache
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "803c9aabc2925dc97f96de125c52ba2e"
-SRC_URI[sha256sum] = "42058abb81b8f87691d3999627447de71c3285bcf055f308aab5cefab2de0ce9"
+SRC_URI[md5sum] = "0ccb448e3792949eb0ae9db8dc22789b"
+SRC_URI[sha256sum] = "b467feb7ee9797ad12f56a152570e42a96b94ad63580d45536aabee282440ce8"
 SRC_URI += " \
-    file://0001-clock-time-make-change-of-system-s-timezone-change-t.patch \
-    file://0002-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
+    file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
 "
 
-EXTRA_OECONF += "--enable-gtk3"
-
 python populate_packages_prepend() {
     plugin_dir = d.expand('${libdir}/xfce4/panel/plugins/')
     plugin_name = d.expand('${PN}-plugin-%s')
-- 
2.14.3


