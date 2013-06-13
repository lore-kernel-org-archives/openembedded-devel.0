Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 045BA6A8B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jun 2013 04:00:11 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id y14so7965287pdi.30
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2013 21:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=NaN6rMUygUfrnqzyLdLAeYYJvmkiwk/+XrpZCG1FHUQ=;
	b=dO29zkN+kwBUmrk+6gwaXqZqwWX1egtM/yDbQUQ//4F3c3/ywVkxcQpYEVhUsvx3a7
	zEKPAC0BINpXx3FDR91rfXe/UZzBSb9LP4LnlO/52E8At2cjTphTIrEkH87F3MEBtDzF
	iuyJJEeo1QGhWTEYX+HmB+8Y4d18oHly2UxlNb/LXD4OSL9adV+Eyww/+OBg2frElz6t
	l2Tfi/QBB4ZpsUZlaeF2fd7J12Tw/UNagGU0MV342uz28JWuNPp/zXrfy6kFAaA3ULtr
	5FW3BKY5Q3LhzNdA8rKVIuPx7Z12ZXWGm8OExiwZUBYIM/W5+iMvxNSeXpHDFt4xEvpF
	K4sQ==
X-Received: by 10.66.231.103 with SMTP id tf7mr928404pac.154.1371096013070;
	Wed, 12 Jun 2013 21:00:13 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	eq5sm21590254pbc.15.2013.06.12.21.00.11 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 21:00:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Jun 2013 20:57:55 -0700
Message-Id: <1371095875-23485-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] gypsy: Fix build with newer glib
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
X-List-Received-Date: Thu, 13 Jun 2013 04:00:12 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...g_type_init-is-deprecated-for-glib-2.35.0.patch |  114 ++++++++++++++++++++
 meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb      |    4 +-
 2 files changed, 117 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-navigation/gypsy/files/0001-g_type_init-is-deprecated-for-glib-2.35.0.patch

diff --git a/meta-oe/recipes-navigation/gypsy/files/0001-g_type_init-is-deprecated-for-glib-2.35.0.patch b/meta-oe/recipes-navigation/gypsy/files/0001-g_type_init-is-deprecated-for-glib-2.35.0.patch
new file mode 100644
index 0000000..063bea6
--- /dev/null
+++ b/meta-oe/recipes-navigation/gypsy/files/0001-g_type_init-is-deprecated-for-glib-2.35.0.patch
@@ -0,0 +1,114 @@
+From 5b859b6e7c82f49d967c25398a8e75b61af9bcc0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 12 Jun 2013 20:58:51 -0700
+Subject: [PATCH] g_type_init() is deprecated for glib >= 2.35.0
+
+Call it for old versions.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+---
+ examples/list-known-gps-devices.c |    4 ++--
+ examples/simple-gps-dbus.c        |    3 ++-
+ examples/simple-gps-gypsy.c       |    4 ++--
+ examples/simple-gps-satellites.c  |    4 ++--
+ gypsy/gypsy-marshal.c             |    2 +-
+ src/main.c                        |    4 ++--
+ 6 files changed, 11 insertions(+), 10 deletions(-)
+
+diff --git a/examples/list-known-gps-devices.c b/examples/list-known-gps-devices.c
+index c7c4059..0a8b04b 100644
+--- a/examples/list-known-gps-devices.c
++++ b/examples/list-known-gps-devices.c
+@@ -20,9 +20,9 @@ main (int argc,
+     GError *error = NULL;
+     GPtrArray *known_devices;
+     int i;
+-
++#if !GLIB_CHECK_VERSION(2,35,0)
+     g_type_init ();
+-
++#endif
+     discovery = gypsy_discovery_new ();
+     known_devices = gypsy_discovery_list_devices (discovery, &error);
+ 
+diff --git a/examples/simple-gps-dbus.c b/examples/simple-gps-dbus.c
+index f7044e6..76b18aa 100644
+--- a/examples/simple-gps-dbus.c
++++ b/examples/simple-gps-dbus.c
+@@ -121,8 +121,9 @@ main (int    argc,
+ 	DBusConnection *conn;
+ 	DBusError error;
+ 	GMainLoop *mainloop;
+-
++#if !GLIB_CHECK_VERSION(2,35,0)
+ 	g_type_init ();
++#endif
+ 	conn = get_connection ();
+ 
+ 	dbus_error_init (&error);
+diff --git a/examples/simple-gps-gypsy.c b/examples/simple-gps-gypsy.c
+index 0b6b7a6..86033d9 100644
+--- a/examples/simple-gps-gypsy.c
++++ b/examples/simple-gps-gypsy.c
+@@ -67,9 +67,9 @@ main (int    argc,
+ 		g_print ("Usage: %s device\n", argv[0]);
+ 		return 0;
+ 	}
+-
++#if !GLIB_CHECK_VERSION(2,35,0) 
+ 	g_type_init ();
+-
++#endif
+ 	control = gypsy_control_get_default ();
+ 	path = gypsy_control_create (control, argv[1], &error);
+ 	if (path == NULL) {
+diff --git a/examples/simple-gps-satellites.c b/examples/simple-gps-satellites.c
+index 140c98f..9a3f95a 100644
+--- a/examples/simple-gps-satellites.c
++++ b/examples/simple-gps-satellites.c
+@@ -42,9 +42,9 @@ main (int    argc,
+ 		g_print ("Usage: %s device\n", argv[0]);
+ 		return 0;
+ 	}
+-
++#if !GLIB_CHECK_VERSION(2,35,0)
+ 	g_type_init ();
+-
++#endif
+ 	control = gypsy_control_get_default ();
+ 	path = gypsy_control_create (control, argv[1], &error);
+ 	if (path == NULL) {
+diff --git a/gypsy/gypsy-marshal.c b/gypsy/gypsy-marshal.c
+index 6964644..9ac0095 100644
+--- a/gypsy/gypsy-marshal.c
++++ b/gypsy/gypsy-marshal.c
+@@ -5,7 +5,7 @@
+ 
+ #ifdef G_ENABLE_DEBUG
+ #define g_marshal_value_peek_boolean(v)  g_value_get_boolean (v)
+-#define g_marshal_value_peek_char(v)     g_value_get_char (v)
++#define g_marshal_value_peek_char(v)     g_value_get_schar (v)
+ #define g_marshal_value_peek_uchar(v)    g_value_get_uchar (v)
+ #define g_marshal_value_peek_int(v)      g_value_get_int (v)
+ #define g_marshal_value_peek_uint(v)     g_value_get_uint (v)
+diff --git a/src/main.c b/src/main.c
+index 3e8a794..ec980e5 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -187,9 +187,9 @@ main (int    argc,
+ 	g_option_context_free (context);
+ 
+ 	umask (022);
+-
++#if !GLIB_CHECK_VERSION(2,35,0)
+ 	g_type_init ();
+-
++#endif
+ 	mainloop = g_main_loop_new (NULL, FALSE);
+ 
+ 	conn = dbus_g_bus_get (DBUS_BUS_SYSTEM, &error);
+-- 
+1.7.9.5
+
diff --git a/meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb b/meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb
index 51207c9..564d3d9 100644
--- a/meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb
+++ b/meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb
@@ -13,7 +13,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 SECTION = "x11"
 DEPENDS = "glib-2.0 dbus bluez4 dbus-glib libxslt"
 
-SRC_URI = "http://gypsy.freedesktop.org/releases/gypsy-${PV}.tar.gz"
+SRC_URI = "http://gypsy.freedesktop.org/releases/gypsy-${PV}.tar.gz \
+           file://0001-g_type_init-is-deprecated-for-glib-2.35.0.patch \
+          "
 PR = "r1"
 
 inherit autotools pkgconfig
-- 
1.7.9.5


