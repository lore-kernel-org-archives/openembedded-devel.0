Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 468BB73E11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 14:53:51 +0000 (UTC)
Received: by widdq5 with SMTP id dq5so80646915wid.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 07:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=W2IKo8DfNvQD6uV5wUmtjHVUH0yMpLA2BKzxwSyvgvE=;
	b=JwGW3M277yHXZ2E/l97Gd/W3cJgAQNnYz5c2rURK1IetChTDx37sO39q5XS6PT77tq
	5/Ez7lQX64wH0n5m2iFT3qhzY8GRi63yrH2MAWWc1lB6pNhpcmYmBMSfNjqKJMhIBnq+
	A+qbCRxdpohduKY8yR5wZQyi8iyswL3IXJiolJut6REbqWWKgsI7tYaFJpYx0xYR8zG/
	SZyRBc1+P4v3FtdyiygPalKmh2cnzuh6L122r5k9ic3z4tm5e7SSXKIFrka1dsmbmEVx
	JsDDusCO74ZbldC+2dolaMtLml7ojvNqFxla8l37pCKNKLN3i5xPysibGDIqMyBzEC5S
	BW8w==
X-Received: by 10.194.58.71 with SMTP id o7mr5686164wjq.82.1440687231790;
	Thu, 27 Aug 2015 07:53:51 -0700 (PDT)
Received: from localhost.localdomain ([5.147.14.94])
	by smtp.googlemail.com with ESMTPSA id
	p5sm12973681wiy.17.2015.08.27.07.53.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Aug 2015 07:53:51 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Aug 2015 16:53:17 +0200
Message-Id: <1440687197-26742-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1440687197-26742-1-git-send-email-schnitzeltony@googlemail.com>
References: <1440687197-26742-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] gnome-disk-utility: fix build for libnotify 0.7.x
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
X-List-Received-Date: Thu, 27 Aug 2015 14:53:53 -0000
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


