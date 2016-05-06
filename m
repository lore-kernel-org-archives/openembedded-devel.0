Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7E1507327F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 14:33:56 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id n129so9056237wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 07:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Um/MaXU0u5hsHaZEkC6cjV1MkCIa02LjXysuri1hqsU=;
	b=VI4oG2AgM3mWayuLUW4TtkHuYLKjMSD1nBi805D50Z8p7mLb9bKGFK087r9umwej+Y
	FwsIvsEjD8rSwFVRdzLmci6aULD0mlAdriNBUYa7p4jAViHqM0U54xTZGoU9cdsy8DBc
	SYWXjuhTgYLEGqc0J76uXkNU3I9f1QqMx23KfID1Sy6YHCER/yojJf0k3BaNQMq2D/Vm
	9Ygm+YuqBZp8d4A4Y0OaZwraLAsUi1//heFGehQzhAnJg9L6GVvomqQyY9yqYwFJRLem
	N5JJtjdYYAijPk7oOle6kk9+7N7sdguBqMpjdbenp/9Jt1eEW3zZsFEAjlEKccXPf/PV
	ukiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Um/MaXU0u5hsHaZEkC6cjV1MkCIa02LjXysuri1hqsU=;
	b=MfjhOH30hhmN8DVQcuzGJ/WNJ6r3BnPKmod0r4sZIazEc4UL9dArftBgcabcf6yiH/
	3jQRCl270oWJbSAm+oWfhmohtlCu+jYzg7/YK10DEHvIUuRVd7QIY1C7bFD5hmCGIq9J
	A6+09Gd/e0UjuqfHjQa0Dd9VuVy1e6kjbxOm3jWKhwpVV950XS4SVD4Xc1uj+JFHA7/d
	LS/swWNw7vb1JEstYwWeg0wRN3+ttzHnP/HBZsEuwGFcbwfGL4IScPt2MGnMI/JfZcZk
	rr/MRlZdr0fR9IeyN92ANWGiGR9WBpe5tHx3yQXuCDbZ7kxRFQS8izWuEhrSIsxRYO1K
	1ozA==
X-Gm-Message-State: AOPr4FU24WvpC+BJYDpWJPwu4ga9yG+TQep55pkeiRQlFPr1EqoOG4qLIZk0RyZTOmzHBg==
X-Received: by 10.194.32.199 with SMTP id l7mr20309205wji.137.1462545236972;
	Fri, 06 May 2016 07:33:56 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	q125sm8736941wmd.19.2016.05.06.07.33.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 07:33:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 May 2016 16:35:22 +0200
Message-Id: <1462545324-27232-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.8.2
Cc: Herrie <github.com@herrie.org>
Subject: [PATCH][krogoth][meta-oe 1/3] pidgin: Update to 2.10.12
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
X-List-Received-Date: Fri, 06 May 2016 14:33:57 -0000

From: Herrie <github.com@herrie.org>

Which is compatible with GnuTLS that's included in Krogoth.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 .../pidgin/pidgin/pidgin-cross-python-265.patch    | 35 ++++++++++++++--------
 .../pidgin/pidgin/pidgin.desktop-set-icon.patch    | 11 -------
 .../pidgin/{pidgin_2.10.9.bb => pidgin_2.10.12.bb} | 10 ++-----
 3 files changed, 26 insertions(+), 30 deletions(-)
 delete mode 100644 meta-oe/recipes-support/pidgin/pidgin/pidgin.desktop-set-icon.patch
 rename meta-oe/recipes-support/pidgin/{pidgin_2.10.9.bb => pidgin_2.10.12.bb} (91%)

diff --git a/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.patch b/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.patch
index 57c4c46..cfc681c 100644
--- a/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.patch
+++ b/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.patch
@@ -1,16 +1,27 @@
-Index: pidgin-2.6.5/configure.ac
-===================================================================
---- pidgin-2.6.5.orig/configure.ac
-+++ pidgin-2.6.5/configure.ac
-@@ -1470,8 +1470,9 @@ if test "_$pythonpath" != _ ; then
- 		AC_CHECK_LIB(pthread, pthread_create, )
- 		AC_CHECK_LIB(util, openpty, )
- 		AC_CHECK_LIB(db, dbopen, )
--		PY_LIBS="-L$PY_EXEC_PREFIX/lib/python$PY_VERSION/config -lpython$PY_VERSION"
--		PY_CFLAGS="-I$PY_PREFIX/include/python$PY_VERSION"
+From 428836ba7f9048970626ef0d6b805107f7c52d33 Mon Sep 17 00:00:00 2001
+From: Herrie <github.com@herrie.org>
+Date: Thu, 5 May 2016 13:33:29 +0200
+Subject: [PATCH] Updated python patch
+
+---
+ configure.ac | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 94ea8cf..2285adb 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1587,9 +1587,9 @@ dnl (Thanks to XChat)
+ if test "x$enable_consoleui" = "xyes" -a ! -z "$PYTHON" -a x"$PYTHON" != x"no" ; then
+ 	AC_MSG_CHECKING(for Python compile flags)
+ 	if test -f ${PYTHON}-config; then
+-		PY_CFLAGS=`${PYTHON}-config --includes`
+-		PY_LIBS=`${PYTHON}-config --libs`
+-		AC_DEFINE(USE_PYTHON, [1], [Define if python headers are available.])
 +		m4_pattern_allow([^PKG_CONFIG_SYSROOT_DIR$])
 +		PY_LIBS="-L$PKG_CONFIG_SYSROOT_DIR/usr/lib/python$PY_VERSION/config -lpython$PY_VERSION"
-+		PY_CFLAGS="-I$PKG_CONFIG_SYSROOT_DIR/usr/include/python$PY_VERSION"
- 		AC_DEFINE(USE_PYTHON, [1], [Define if python headers are available.])
++		PY_CFLAGS="-I$PKG_CONFIG_SYSROOT_DIR/usr/include/python$PY_VERSION"		AC_DEFINE(USE_PYTHON, [1], [Define if python headers are available.])
  		AC_MSG_RESULT(ok)
  	else
+ 		AC_MSG_RESULT([Cannot find ${PYTHON}-config])
+
diff --git a/meta-oe/recipes-support/pidgin/pidgin/pidgin.desktop-set-icon.patch b/meta-oe/recipes-support/pidgin/pidgin/pidgin.desktop-set-icon.patch
deleted file mode 100644
index 05f7689..0000000
--- a/meta-oe/recipes-support/pidgin/pidgin/pidgin.desktop-set-icon.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- pidgin-2.0.1/pidgin.desktop.in.orig	2007-06-20 23:50:44.000000000 +0000
-+++ pidgin-2.0.1/pidgin.desktop.in	2007-06-20 23:51:05.000000000 +0000
-@@ -4,7 +4,7 @@
- _GenericName=Internet Messenger
- _Comment=Send instant messages over multiple protocols
- Exec=pidgin
--Icon=pidgin
-+Icon=/usr/share/icons/hicolor/48x48/apps/pidgin.png
- StartupNotify=true
- Terminal=false
- Type=Application
diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb b/meta-oe/recipes-support/pidgin/pidgin_2.10.12.bb
similarity index 91%
rename from meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb
rename to meta-oe/recipes-support/pidgin/pidgin_2.10.12.bb
index 8352110..9133c1c 100644
--- a/meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin_2.10.12.bb
@@ -2,23 +2,19 @@ DESCRIPTION = "multi-protocol instant messaging client"
 SECTION = "x11/network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-DEPENDS = "python startup-notification avahi gtk+ ncurses gnutls virtual/libintl gstreamer dbus intltool-native farsight2 libidn"
+DEPENDS = "python startup-notification avahi gtk+ ncurses gnutls virtual/libintl gstreamer dbus intltool-native farsight2 libidn libxml2 gconf dbus-glib"
 
 inherit autotools gettext pkgconfig gconf perlnative
 
-# http://errors.yoctoproject.org/Errors/Details/25824/
-PNBLACKLIST[pidgin] ?= "Not compatible with gnutls version 3.4 currently in oe-core and also depends on broken libnice through farsight2"
-
 SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/pidgin/pidgin-${PV}.tar.bz2 \
     file://sanitize-configure.ac.patch \
-    file://pidgin.desktop-set-icon.patch \
     file://purple-OE-branding-25.patch \
     file://pidgin-cross-python-265.patch \
 "
 
-SRC_URI[md5sum] = "10a4a69d077893f6dd3438cd8af94e81"
-SRC_URI[sha256sum] = "dc362ed8577f623eea4554a79e917073aa726825074fea402f2e515f0f51f319"
+SRC_URI[md5sum] = "14e0f5cfb2ed065e4dc80391a806ac76"
+SRC_URI[sha256sum] = "2c7523f0fefe89749c03b2b738ab9f7bd186da435be4762f1487eee31e77ffdd"
 
 EXTRA_OECONF = " \
     --enable-vv \
-- 
2.8.2


