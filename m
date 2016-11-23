Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1AD66719E5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:15 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y68so448537pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=IXr4S3hVwgn/n8r6Oz8hxMOou3x7U3RRbdxh8REa2FA=;
	b=ZIYqxHQjWENqyaOgmZRs6EmHsIQQkfTUXT1EznXgW0WlQ/Uhh8cb/m5LA6d7BLkEtP
	jWJivDRAQv+DYidKgBqC1WFhI59LqhFAvxO4BbTaYkzRcPmkGFjVmDgn6lkEOXd+KXb1
	OVQHQRx7Fwn1xY4yj6m7pFqykKwNT0OPRf8VhrmgmR0Rb68vHLezYGSjGb4kU6yujPvb
	w55pygjjSnktUFCZLfma+Fm3BvtjwnU+CiLtRGZN7W1R6C5ufNWr8qH2uhMoml+pd+gH
	R8DKQztXhazz1ymnBJDicLnRREys2GIFoY64PNBfC9BNFB/KcuCiW9sD40Rfw8v5smGJ
	goAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IXr4S3hVwgn/n8r6Oz8hxMOou3x7U3RRbdxh8REa2FA=;
	b=OD/Aht9TmWRgveMZn8ShYTYeEKylwwLwGgaDH3bszmAsAB3NhZ+exMCdNhrmh51zkt
	LNUwk1EWMavSoFZ7XdaqYBF7XJack9s9rFZ7u8ear3poTQEGqoDyca7nfVB+J2ulURtD
	UoAZDSMKrjTJ1udACx2fCC4imTFS+jplA5rcEHtCyCbzO7O0YRyridrasE/fQ/snXb62
	NgLDfSE3a7ggzRZam1aPlPOE+jSSrCyEu88hzeKXbWQFoJknm91++kVsrb9uXtodcvVi
	hZsOy+/d0r/bOXCUOwq4YOEq/TccUd/EZrk26E7/Eqv2SFsAHje8lbjiGpIkSiuHAxuk
	pupA==
X-Gm-Message-State: AKaTC03RQLl31lol1Vt+GwZnap78Oi9jWj6CXWU7i9EJTSkwlN07FszX1QrT0RvJ/VN1cw==
X-Received: by 10.98.8.84 with SMTP id c81mr1906902pfd.114.1479892937245;
	Wed, 23 Nov 2016 01:22:17 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:21:21 -0800
Message-Id: <20161123092209.23699-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-oe][PATCH 01/49] libqmi: Fix build with clang
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:18 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libqmi/libqmi/0001-Detect-clang.patch          | 84 ++++++++++++++++++++++
 .../recipes-connectivity/libqmi/libqmi_1.16.0.bb   |  4 +-
 2 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/libqmi/libqmi/0001-Detect-clang.patch

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi/0001-Detect-clang.patch b/meta-oe/recipes-connectivity/libqmi/libqmi/0001-Detect-clang.patch
new file mode 100644
index 0000000..4047ffb
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi/0001-Detect-clang.patch
@@ -0,0 +1,84 @@
+From 4cfb728804157e8f3c69e11ba4df449d8f76388f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 20 Oct 2016 04:42:26 +0000
+Subject: [PATCH] Detect clang
+
+Check for clang compiler since we need to disable
+unused-function warning for clang, at same time
+pass werror when checking for compiler options if
+werror is enabled so spurious options do not get
+enabled. Only the ones that are supported by given
+compiler are accepted.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+---
+ m4/compiler-warnings.m4 | 29 +++++++++++++++++++++++++----
+ 1 file changed, 25 insertions(+), 4 deletions(-)
+
+diff --git a/m4/compiler-warnings.m4 b/m4/compiler-warnings.m4
+index de4a8b0..e4ba718 100644
+--- a/m4/compiler-warnings.m4
++++ b/m4/compiler-warnings.m4
+@@ -2,10 +2,30 @@ AC_DEFUN([LIBQMI_COMPILER_WARNINGS],
+ [AC_ARG_ENABLE(more-warnings,
+ 	AS_HELP_STRING([--enable-more-warnings], [Possible values: no/yes/error]),
+ 	set_more_warnings="$enableval",set_more_warnings=error)
++
++# Clang throws a lot of warnings when it does not understand a flag. Disable
++# this warning for now so other warnings are visible.
++AC_MSG_CHECKING([if compiling with clang])
++AC_COMPILE_IFELSE([AC_LANG_PROGRAM([], [[
++#ifndef __clang__
++	not clang
++#endif
++	]])],
++	[CLANG=yes],
++	[CLANG=no]
++)
++AC_MSG_RESULT([$CLANG])
++AS_IF([test "x$CLANG" = "xyes"], [CLANG_FLAGS=-Wno-error=unused-function])
++CFLAGS="$CFLAGS $CLANG_FLAGS"
++LDFLAGS="$LDFLAGS $CLANG_FLAGS"
++
+ AC_MSG_CHECKING(for more warnings)
+ if test "$GCC" = "yes" -a "$set_more_warnings" != "no"; then
+ 	AC_MSG_RESULT(yes)
+ 	CFLAGS="-Wall -std=gnu89 $CFLAGS"
++	if test "x$set_more_warnings" = xerror; then
++		WERROR="-Werror"
++	fi
+ 
+ 	for option in -Wmissing-declarations -Wmissing-prototypes \
+ 		      -Wdeclaration-after-statement -Wstrict-prototypes \
+@@ -17,22 +37,23 @@ if test "$GCC" = "yes" -a "$set_more_warnings" != "no"; then
+ 		      -Wmissing-include-dirs -Waggregate-return \
+ 		      -Wformat-security; do
+ 		SAVE_CFLAGS="$CFLAGS"
+-		CFLAGS="$CFLAGS $option"
++		CFLAGS="$CFLAGS $option $WERROR"
+ 		AC_MSG_CHECKING([whether gcc understands $option])
+ 		AC_TRY_COMPILE([], [],
+ 			has_option=yes,
+ 			has_option=no,)
+ 		if test $has_option = no; then
+ 			CFLAGS="$SAVE_CFLAGS"
++		else
++			CFLAGS="$SAVE_CFLAGS $option"
+ 		fi
+ 		AC_MSG_RESULT($has_option)
+ 		unset has_option
+ 		unset SAVE_CFLAGS
+ 	done
++	CFLAGS="$CFLAGS $WERROR"
+ 	unset option
+-	if test "x$set_more_warnings" = xerror; then
+-		CFLAGS="$CFLAGS -Werror"
+-	fi
++	unset WERROR
+ else
+ 	AC_MSG_RESULT(no)
+ fi
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.16.0.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.16.0.bb
index 5ac889f..679b102 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.16.0.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.16.0.bb
@@ -11,6 +11,8 @@ DEPENDS = "glib-2.0 libgudev libmbim"
 
 inherit autotools pkgconfig bash-completion
 
-SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
+SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
+           file://0001-Detect-clang.patch \
+           "
 SRC_URI[md5sum] = "4970c110f160b33637a3515004c637b2"
 SRC_URI[sha256sum] = "7ab6bb47fd23bf4d3fa17424e40ea5552d08b19e5ee4f125f21f316c8086ba2a"
-- 
2.10.2


