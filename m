Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7D1F876E5F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2015 10:34:17 +0000 (UTC)
Received: by wicfv10 with SMTP id fv10so39300732wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2015 03:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=+SO+yxx44cgFSdIKATxVoeUy40BMn0U4G86/sZHOPNc=;
	b=0GcWtah1oFS68EojfgoqHztB71FMqmYFhBpp7Wort4icX5h28mHX3tsIAQZxRxN7vc
	voQGJGUfijqQQfhWiK/tPG8BA95khV1EVuUXS36ZiZH8DV3SWvd8MvQWDKWfoE8xLEha
	u+wCcgRwm5b/Eo8s3i2fAOlhIfdg2PB3bJiFVEEx1+0N6yZUcn1nibVK5FF/np8C23wD
	Zy4pMpUdW5tYgjufIiW9Kg5w4w9s50XmnfB47m83Rg+05oa/P59yRWPoYyELCehyE3kH
	xKlK8pqu1s76gqLTQ8EsQXdl0u9lKE3oxDGJQqZXHDOujL/xZ2lBHuccAGDGIkn7dDMQ
	DMVw==
X-Received: by 10.194.203.3 with SMTP id km3mr20047274wjc.114.1440930857372;
	Sun, 30 Aug 2015 03:34:17 -0700 (PDT)
Received: from localhost.localdomain (p54AA5C5E.dip0.t-ipconnect.de.
	[84.170.92.94]) by smtp.googlemail.com with ESMTPSA id
	h9sm16778522wjx.20.2015.08.30.03.34.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 30 Aug 2015 03:34:16 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Aug 2015 12:34:00 +0200
Message-Id: <1440930840-3459-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1440930840-3459-1-git-send-email-schnitzeltony@googlemail.com>
References: <1440930840-3459-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCHv2 6/6] gnome-bluetooth: fix build with libnotofy >= 0.7.0
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
X-List-Received-Date: Sun, 30 Aug 2015 10:34:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../0003-Fix-build-with-libnotify-0.7.0.patch      | 47 ++++++++++++++++++++++
 .../gnome-bluetooth/gnome-bluetooth_2.32.0.bb      |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0003-Fix-build-with-libnotify-0.7.0.patch

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0003-Fix-build-with-libnotify-0.7.0.patch b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0003-Fix-build-with-libnotify-0.7.0.patch
new file mode 100644
index 0000000..118ef93
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0003-Fix-build-with-libnotify-0.7.0.patch
@@ -0,0 +1,47 @@
+From 08a5b66d709781c0c596108278979a11b26331d5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Sun, 30 Aug 2015 12:14:53 +0200
+Subject: [PATCH] Fix build with libnotify >= 0.7.0
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Backport [1]
+
+[1] https://github.com/GNOME/gnome-bluetooth/commit/9f256799cc6b8367b2466f35b82f1d07076a950e
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ applet/notify.c | 2 +-
+ configure.ac    | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/applet/notify.c b/applet/notify.c
+index d2a4f51..cb01dfc 100644
+--- a/applet/notify.c
++++ b/applet/notify.c
+@@ -71,7 +71,7 @@ void show_notification(const gchar *summary, const gchar *message,
+ 		notify_notification_close(notify, NULL);
+ 	}
+ 
+-	notify = notify_notification_new(summary, message, icon_name, NULL);
++	notify = notify_notification_new(summary, message, icon_name);
+ 
+ 	notify_notification_set_timeout(notify, timeout);
+ 
+diff --git a/configure.ac b/configure.ac
+index 8bbce4e..98ec86e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -71,7 +71,7 @@ AM_CONDITIONAL([ICON_UPDATE], [test -n "$UPDATE_ICON_CACHE"])
+ GTK_REQUIRED=2.19.1
+ GLIB_REQUIRED=2.25.7
+ DBUS_GLIB_REQUIRED=0.74
+-NOTIFY_REQUIRED=0.4.3
++NOTIFY_REQUIRED=0.7.0
+ NAUTILUS_SENDTO_REQUIRED=2.31.7
+ 
+ dnl Requires for the properties window
+-- 
+2.1.0
+
diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
index 9edceb5..5d2a364 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
@@ -15,6 +15,7 @@ inherit gnomebase gtk-icon-cache
 SRC_URI += " \
     file://0001-bluetooth-input-Fix-compile-errors.patch \
     file://0002-bluetooth-client-use-valid-interface-names.patch \
+    file://0003-Fix-build-with-libnotify-0.7.0.patch \
 "
 SRC_URI[archive.md5sum] = "f129686fe46c4c98eb70a0cc85d59cae"
 SRC_URI[archive.sha256sum] = "57b1f06c96a1b85e1c19ff919d708cc38e95edae658881ed99968c325839a973"
-- 
2.1.0


