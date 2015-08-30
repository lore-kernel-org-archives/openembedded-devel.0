Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id CB1C276E59
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2015 10:34:16 +0000 (UTC)
Received: by wicpl12 with SMTP id pl12so4079675wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2015 03:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=W2IKo8DfNvQD6uV5wUmtjHVUH0yMpLA2BKzxwSyvgvE=;
	b=DMaJNU0F9nioDUTNUgBChbCNjR6Gv321CyDRWPbGJbAqazKUEt7lmTmITTtaJa3mC4
	Qo4TbMaXAr5dWSeiY9haFD3yI9wvqemInFpIAie3ZF03MSmJIIQ3o9iUDzdBpsQYAprT
	EY3JlRKp3/QzmLlLGKPpHmA2kWMzaWWc0VW9ovHA5Jvb7/eOqL9BNTs0sxMYtnxNZIL7
	5ipDQC3kZ5se7hdwRtiMWeN8dppnwoiKly1qfqt+329j1cLEHaiMsAAOCzrLc0Z1IjRa
	Ev91ZK/GMBO/pzIE3kVuKTIyUONWhu12ghExZe8DxFx8KNlg2//TQkK2AsL6CvMTNFFo
	yiWg==
X-Received: by 10.194.92.143 with SMTP id cm15mr22530515wjb.17.1440930856310; 
	Sun, 30 Aug 2015 03:34:16 -0700 (PDT)
Received: from localhost.localdomain (p54AA5C5E.dip0.t-ipconnect.de.
	[84.170.92.94]) by smtp.googlemail.com with ESMTPSA id
	h9sm16778522wjx.20.2015.08.30.03.34.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 30 Aug 2015 03:34:15 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Aug 2015 12:33:59 +0200
Message-Id: <1440930840-3459-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1440930840-3459-1-git-send-email-schnitzeltony@googlemail.com>
References: <1440930840-3459-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCHv2 5/6] gnome-disk-utility: fix build for libnotify 0.7.x
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
X-List-Received-Date: Sun, 30 Aug 2015 10:34:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../0002-Require-libnotify-0.6.1.patch             | 49 ++++++++++++++++++++++
 .../gnome-disk-utility_2.32.0.bb                   |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0002-Require-libnotify-0.6.1.patch

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0002-Require-libnotify-0.6.1.patch b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0002-Require-libnotify-0.6.1.patch
new file mode 100644
index 0000000..0bc9707
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0002-Require-libnotify-0.6.1.patch
@@ -0,0 +1,49 @@
+From f8dea8dd411cba10a54ec083c3d5c9d641ec36c0 Mon Sep 17 00:00:00 2001
+From: William Jon McCann <jmccann@redhat.com>
+Date: Tue, 12 Oct 2010 00:12:49 -0400
+Subject: [PATCH] Require libnotify 0.6.1
+
+https://bugzilla.gnome.org/show_bug.cgi?id=631940
+
+Upstream-Status: Backport [1]
+
+[1] https://git.gnome.org/browse/gnome-disk-utility/commit/?id=f8dea8dd411cba10a54ec083c3d5c9d641ec36c0
+
+Signed-off-by: David Zeuthen <davidz@redhat.com>
+---
+ configure.ac                         | 2 +-
+ src/notification/notification-main.c | 5 +----
+ 2 files changed, 2 insertions(+), 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index c61212e..3790fcf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -128,7 +128,7 @@ DBUS_GLIB_REQUIRED=0.74
+ GNOME_KEYRING_REQUIRED=2.22
+ GTK2_REQUIRED=2.20.0
+ UNIQUE_REQUIRED=1.0
+-LIBNOTIFY_REQUIRED=0.3.0
++LIBNOTIFY_REQUIRED=0.6.1
+ NAUTILUS_REQUIRED=2.24.0
+ AVAHI_UI_REQUIRED=0.6.25
+ 
+diff --git a/src/notification/notification-main.c b/src/notification/notification-main.c
+index 18e9672..b6a713f 100644
+--- a/src/notification/notification-main.c
++++ b/src/notification/notification-main.c
+@@ -535,10 +535,7 @@ update_status_icon (NotificationData *data)
+                     _("A hard disk may be failing"),
+                     /* Translators: This is used as the text of the notification*/
+                     _("One or more hard disks report health problems. Click the icon to get more information."),
+-                    "gtk-dialog-warning",
+-                    NULL);
+-                notify_notification_attach_to_status_icon (data->ata_smart_notification,
+-                                                           data->status_icon);
++                    "gtk-dialog-warning");
+                 notify_notification_set_urgency (data->ata_smart_notification, NOTIFY_URGENCY_CRITICAL);
+                 notify_notification_set_timeout (data->ata_smart_notification, NOTIFY_EXPIRES_NEVER);
+                 show_notification (data);
+-- 
+2.1.0
+
diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
index 2c526c8..cfc5f77 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
@@ -16,6 +16,7 @@ SRC_URI += "\
     file://fix-dbus-interfaces.patch \
     file://sysrooted-pkg-config.patch \
     file://0001-Add-support-for-DeviceAutomountHint.patch \
+    file://0002-Require-libnotify-0.6.1.patch \
 "
 
 EXTRA_OECONF += "--disable-scrollkeeper"
-- 
2.1.0


