Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 95AEA65C8A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Sep 2015 15:43:45 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so125433608wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Sep 2015 08:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=gvYZ+ufwdH/cW0G/VpXcjtd9K5lnNhZibXaaaxJUAeQ=;
	b=GmpT5Y5i68ZtRd/DK5b2MTz+KqJF2EOHuOW3bby2PTg5MXRR7dCCT99ppnbbLBlhZR
	C/irEMyeyFZnMTRxmcVR/SoyU5hVCFV5IR9snPavTz1wa0a5eXcRMs2g4dOaO6c+32Qw
	yq35ArvqzrYzNH2D9LjB6IjETZQXIp4LQNHKsjEDoW2y3KEevfGbKHVtmfjhyRDPkxEu
	OM+1JsdTaIdJQgUANEjnTARooG9W1WmwWe/rki9XA59E0v4HJAHcNR5MXnZeHSLjVgv8
	XB/gQtkGve0SSBYVHLdEHS6prDv0yhCIvYhqiRtVQeM/GsL+ta0Entvt1wYqhE6ATQ11
	4kPA==
X-Received: by 10.180.21.169 with SMTP id w9mr46742363wie.73.1441727025731;
	Tue, 08 Sep 2015 08:43:45 -0700 (PDT)
Received: from localhost.localdomain ([5.147.14.94])
	by smtp.googlemail.com with ESMTPSA id
	lu5sm5496240wjb.9.2015.09.08.08.43.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Sep 2015 08:43:44 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Sep 2015 17:42:59 +0200
Message-Id: <1441726980-32656-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1441726980-32656-1-git-send-email-schnitzeltony@googlemail.com>
References: <1441726980-32656-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 8/9] gnome-settings-daemon: fix build for libnotify > 0.7.x
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Sep 2015 15:43:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../files/0001-Require-libnotify-0.6.0.patch       | 81 ++++++++++++++++++++++
 .../gnome-settings-daemon_2.32.1.bb                |  5 +-
 2 files changed, 85 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-settings-daemon/files/0001-Require-libnotify-0.6.0.patch

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/files/0001-Require-libnotify-0.6.0.patch b/meta-gnome/recipes-gnome/gnome-settings-daemon/files/0001-Require-libnotify-0.6.0.patch
new file mode 100644
index 0000000..6dd33f3
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/files/0001-Require-libnotify-0.6.0.patch
@@ -0,0 +1,81 @@
+From e1ab570b0dce479ba235e5542ea07d1b5bafc4c9 Mon Sep 17 00:00:00 2001
+From: William Jon McCann <jmccann@redhat.com>
+Date: Mon, 11 Oct 2010 23:35:45 -0400
+Subject: [PATCH] Require libnotify 0.6.0
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+
+Upstream-Status: Backport
+
+---
+ configure.ac                                      |  2 +-
+ plugins/a11y-keyboard/gsd-a11y-keyboard-manager.c |  8 ++------
+ plugins/xrandr/gsd-xrandr-manager.c               | 13 +++----------
+ 3 files changed, 6 insertions(+), 17 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8a90053..8624b2a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -54,7 +54,7 @@ GTK_REQUIRED_VERSION=2.91.0
+ GCONF_REQUIRED_VERSION=2.6.1
+ GIO_REQUIRED_VERSION=2.17.3
+ GNOME_DESKTOP_REQUIRED_VERSION=2.29.92
+-LIBNOTIFY_REQUIRED_VERSION=0.4.3
++LIBNOTIFY_REQUIRED_VERSION=0.6.1
+ 
+ EXTRA_COMPILE_WARNINGS(yes)
+ 
+diff --git a/plugins/a11y-keyboard/gsd-a11y-keyboard-manager.c b/plugins/a11y-keyboard/gsd-a11y-keyboard-manager.c
+index 9ca820a..f5964b9 100644
+--- a/plugins/a11y-keyboard/gsd-a11y-keyboard-manager.c
++++ b/plugins/a11y-keyboard/gsd-a11y-keyboard-manager.c
+@@ -608,9 +608,7 @@ ax_slowkeys_warning_post_bubble (GsdA11yKeyboardManager *manager,
+         gsd_a11y_keyboard_manager_ensure_status_icon (manager);
+         manager->priv->notification = notify_notification_new (title,
+                                                                message,
+-                                                               "preferences-desktop-accessibility",
+-                                                               NULL);
+-        notify_notification_attach_to_status_icon (manager->priv->notification, manager->priv->status_icon);
++                                                               "preferences-desktop-accessibility");
+         notify_notification_set_timeout (manager->priv->notification, NOTIFICATION_TIMEOUT * 1000);
+ 
+         notify_notification_add_action (manager->priv->notification,
+@@ -747,9 +745,7 @@ ax_stickykeys_warning_post_bubble (GsdA11yKeyboardManager *manager,
+         gsd_a11y_keyboard_manager_ensure_status_icon (manager);
+         manager->priv->notification = notify_notification_new (title,
+                                                                message,
+-                                                               "preferences-desktop-accessibility",
+-                                                               NULL);
+-        notify_notification_attach_to_status_icon (manager->priv->notification, manager->priv->status_icon);
++                                                               "preferences-desktop-accessibility");
+         notify_notification_set_timeout (manager->priv->notification, NOTIFICATION_TIMEOUT * 1000);
+ 
+         notify_notification_add_action (manager->priv->notification,
+diff --git a/plugins/xrandr/gsd-xrandr-manager.c b/plugins/xrandr/gsd-xrandr-manager.c
+index 02536a3..ef57d5b 100644
+--- a/plugins/xrandr/gsd-xrandr-manager.c
++++ b/plugins/xrandr/gsd-xrandr-manager.c
+@@ -1084,16 +1084,9 @@ error_message (GsdXrandrManager *mgr, const char *primary_text, GError *error_to
+ 
+         g_assert (error_to_display == NULL || secondary_text == NULL);
+ 
+-        if (priv->status_icon)
+-                notification = notify_notification_new_with_status_icon (primary_text,
+-                                                                         error_to_display ? error_to_display->message : secondary_text,
+-                                                                         GSD_XRANDR_ICON_NAME,
+-                                                                         priv->status_icon);
+-        else
+-                notification = notify_notification_new (primary_text,
+-                                                        error_to_display ? error_to_display->message : secondary_text,
+-                                                        GSD_XRANDR_ICON_NAME,
+-                                                        NULL);
++        notification = notify_notification_new (primary_text,
++                                                error_to_display ? error_to_display->message : secondary_text,
++                                                GSD_XRANDR_ICON_NAME);
+ 
+         notify_notification_show (notification, NULL); /* NULL-GError */
+ #else
+-- 
+2.1.0
+
diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
index e06c5f9..f8ece37 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
@@ -8,7 +8,10 @@ DEPENDS = "intltool libxxf86misc libsndfile1 libxtst glib-2.0 polkit gtk+ gconf
 
 inherit gnome
 
-SRC_URI = "git://git.gnome.org/gnome-settings-daemon;branch=gnome-2-32"
+SRC_URI = " \
+    git://git.gnome.org/gnome-settings-daemon;branch=gnome-2-32 \
+    file://0001-Require-libnotify-0.6.0.patch \
+"
 SRCREV = "0160f6725cfb872e017f3958f108792c3b882872"
 
 S = "${WORKDIR}/git"
-- 
2.1.0


