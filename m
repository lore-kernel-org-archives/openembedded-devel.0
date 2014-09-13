Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id C725C65E0C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Sep 2014 01:11:06 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id kq14so2386751pab.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Sep 2014 18:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ztQ3rULIMnMzHRsdIi4ezAiiZo/DDJSModUG08vRfkI=;
	b=Xlf9wZ+hdAnPXC73adZsgjfP/dt4UaEuyF+L3tRy4tjp6JLEF9dLwtLy77+XIPKqJC
	RiUUhFn4xm4zycomunDULOskG67TADAx1SctOQsQ9wva9D9HNiTUu8KXQ2U42MD6SCql
	9RiA6HtT3eYMs3HiDlssuVyDwDZbs35lNzYp9oSjQq3W9gFGc5lE3GmRe8666XIu1SxY
	Id6lzjo+NoTnXNI5dg5N3YR4UFC9fA56Mnyu/RMVoxOZZx8SvIijLT7ydt9JrItuMbpn
	12j8NtFEkkVO3e06wWtffiUztAuzaK4v6ynPDHLfsvhDoAJc21/mDoTJ2Hvka/3AJbpp
	aC4A==
X-Received: by 10.70.47.161 with SMTP id e1mr19406700pdn.71.1410570668175;
	Fri, 12 Sep 2014 18:11:08 -0700 (PDT)
Received: from horton.arnolds.bogus (gatekeeper.gentoogeek.org.
	[66.159.242.209])
	by mx.google.com with ESMTPSA id gr5sm5012804pbc.33.2014.09.12.18.11.05
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 Sep 2014 18:11:06 -0700 (PDT)
From: Steve Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Sep 2014 18:13:43 -0700
Message-Id: <1410570823-14922-1-git-send-email-stephen.arnold42@gmail.com>
X-Mailer: git-send-email 2.0.4
Cc: "S. Lockwood-Childs" <sjl@vctlabs.com>
Subject: [meta-oe][PATCH 1/2] xchat: update recipe with build/configure fixes
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
X-List-Received-Date: Sat, 13 Sep 2014 01:11:08 -0000

Update recipe with build/configure fixes (rework autotools config,
add patch for separate build dir, add patch for automake foreign,
add PACKAGECONFIG option for python interface, move dbus to RDEPEND,
as dbus-glib header is required for build; the last one is a workaround
for the QA depend warning on more than one dep in PKGCONF).

Upstream-Status: Inappropriate (no more upstream)

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
Signed-off-by: Steve Arnold <stephen.arnold42@gmail.com>
---
 .../xchat/xchat-2.8.8/automake-foreign.patch       | 11 +++
 .../fix-includes-for-separate-build.patch          | 78 ++++++++++++++++++++++
 meta-oe/recipes-support/xchat/xchat_2.8.8.bb       | 19 +++---
 3 files changed, 99 insertions(+), 9 deletions(-)
 create mode 100644 meta-oe/recipes-support/xchat/xchat-2.8.8/automake-foreign.patch
 create mode 100644 meta-oe/recipes-support/xchat/xchat-2.8.8/fix-includes-for-separate-build.patch

diff --git a/meta-oe/recipes-support/xchat/xchat-2.8.8/automake-foreign.patch b/meta-oe/recipes-support/xchat/xchat-2.8.8/automake-foreign.patch
new file mode 100644
index 0000000..cfa2f6c
--- /dev/null
+++ b/meta-oe/recipes-support/xchat/xchat-2.8.8/automake-foreign.patch
@@ -0,0 +1,11 @@
+--- a/configure.in	2014-08-18 01:25:43.911597023 -0700
++++ b/configure.in	2014-08-18 01:26:27.763786629 -0700
+@@ -8,7 +8,7 @@
+ AC_CONFIG_HEADERS([config.h])
+ AC_CONFIG_SRCDIR([configure.in])
+ 
+-AM_INIT_AUTOMAKE([1.9 dist-bzip2 subdir-objects no-define])
++AM_INIT_AUTOMAKE([1.9 foreign dist-bzip2 subdir-objects no-define])
+ 
+ AM_MAINTAINER_MODE
+ AC_PROG_CC
diff --git a/meta-oe/recipes-support/xchat/xchat-2.8.8/fix-includes-for-separate-build.patch b/meta-oe/recipes-support/xchat/xchat-2.8.8/fix-includes-for-separate-build.patch
new file mode 100644
index 0000000..4394e52
--- /dev/null
+++ b/meta-oe/recipes-support/xchat/xchat-2.8.8/fix-includes-for-separate-build.patch
@@ -0,0 +1,78 @@
+diff -ur xchat-2.8.8-orig/plugins/perl/perl.c xchat-2.8.8/plugins/perl/perl.c
+--- xchat-2.8.8-orig/plugins/perl/perl.c	2014-08-30 14:09:05.125116286 -0700
++++ xchat-2.8.8/plugins/perl/perl.c	2014-08-30 14:09:45.281106532 -0700
+@@ -31,7 +31,7 @@
+ #endif
+ 
+ #undef PACKAGE
+-#include "../../config.h"		  /* for #define OLD_PERL */
++#include <config.h>		  /* for #define OLD_PERL */
+ #include "xchat-plugin.h"
+ 
+ static xchat_plugin *ph;		  /* plugin handle */
+diff -ur xchat-2.8.8-orig/src/common/network.c xchat-2.8.8/src/common/network.c
+--- xchat-2.8.8-orig/src/common/network.c	2014-08-30 14:09:05.137116222 -0700
++++ xchat-2.8.8/src/common/network.c	2014-08-30 14:13:52.729116323 -0700
+@@ -24,7 +24,7 @@
+ #include <unistd.h>
+ #include <glib.h>
+ 
+-#include "../../config.h"				  /* grab USE_IPV6 and LOOKUPD defines */
++#include <config.h>				  /* grab USE_IPV6 and LOOKUPD defines */
+ 
+ #define WANTSOCKET
+ #define WANTARPA
+diff -ur xchat-2.8.8-orig/src/common/ssl.c xchat-2.8.8/src/common/ssl.c
+--- xchat-2.8.8-orig/src/common/ssl.c	2014-08-30 14:09:05.137116222 -0700
++++ xchat-2.8.8/src/common/ssl.c	2014-08-30 14:14:08.449133899 -0700
+@@ -23,7 +23,7 @@
+ #include <string.h>				  /* strncpy() */
+ #include "ssl.h"					  /* struct cert_info */
+ #include "inet.h"
+-#include "../../config.h"		  /* HAVE_SNPRINTF */
++#include <config.h>		  /* HAVE_SNPRINTF */
+ 
+ #ifndef HAVE_SNPRINTF
+ #define snprintf g_snprintf
+diff -ur xchat-2.8.8-orig/src/common/util.c xchat-2.8.8/src/common/util.c
+--- xchat-2.8.8-orig/src/common/util.c	2014-08-30 14:09:05.133116243 -0700
++++ xchat-2.8.8/src/common/util.c	2014-08-30 14:10:23.633116070 -0700
+@@ -41,7 +41,7 @@
+ #include "xchatc.h"
+ #include <ctype.h>
+ #include "util.h"
+-#include "../../config.h"
++#include <config.h>
+ 
+ #define WANTSOCKET
+ #include "inet.h"
+diff -ur xchat-2.8.8-orig/src/common/xchat.h xchat-2.8.8/src/common/xchat.h
+--- xchat-2.8.8-orig/src/common/xchat.h	2014-08-30 14:09:05.133116243 -0700
++++ xchat-2.8.8/src/common/xchat.h	2014-08-30 14:13:42.797116472 -0700
+@@ -1,4 +1,4 @@
+-#include "../../config.h"
++#include <config.h>
+ 
+ #include <glib.h>
+ #include <time.h>			/* need time_t */
+diff -ur xchat-2.8.8-orig/src/fe-gtk/fe-gtk.h xchat-2.8.8/src/fe-gtk/fe-gtk.h
+--- xchat-2.8.8-orig/src/fe-gtk/fe-gtk.h	2014-08-30 14:09:05.129116272 -0700
++++ xchat-2.8.8/src/fe-gtk/fe-gtk.h	2014-08-30 14:10:13.309115951 -0700
+@@ -1,4 +1,4 @@
+-#include "../../config.h"
++#include <config.h>
+ 
+ #ifdef WIN32
+ /* If you're compiling this for Windows, your release is un-official
+diff -ur xchat-2.8.8-orig/src/fe-gtk/xtext.c xchat-2.8.8/src/fe-gtk/xtext.c
+--- xchat-2.8.8-orig/src/fe-gtk/xtext.c	2014-08-30 14:09:05.129116272 -0700
++++ xchat-2.8.8/src/fe-gtk/xtext.c	2014-08-30 14:10:00.313138254 -0700
+@@ -51,7 +51,7 @@
+ #include <gtk/gtkwindow.h>
+ 
+ #ifdef XCHAT
+-#include "../../config.h"			/* can define USE_XLIB here */
++#include <config.h>			/* can define USE_XLIB here */
+ #else
+ #define USE_XLIB
+ #endif
diff --git a/meta-oe/recipes-support/xchat/xchat_2.8.8.bb b/meta-oe/recipes-support/xchat/xchat_2.8.8.bb
index fe07bc2..6da11cd 100644
--- a/meta-oe/recipes-support/xchat/xchat_2.8.8.bb
+++ b/meta-oe/recipes-support/xchat/xchat_2.8.8.bb
@@ -2,33 +2,34 @@ SUMMARY = "Full-featured IRC chat client with scripting support"
 LICENSE = "GPLv2+"
 HOMEPAGE = "http://www.xchat.org"
 SECTION = "x11/network"
+
 DEPENDS = "libgcrypt zlib gtk+ libsexy"
 DEPENDS += "gdk-pixbuf-native"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
 
-PR = "r1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
 
-PNBLACKLIST[xchat] = "BROKEN: Doesn't work with B!=S"
+PR = "r2"
 
 SRC_URI = "http://xchat.org/files/source/2.8/xchat-${PV}.tar.bz2 \
     file://glib-2.32.patch \
+    file://automake-foreign.patch \
+    file://fix-includes-for-separate-build.patch \
 "
 
-inherit autotools gettext
+inherit autotools gettext pkgconfig
 
 PACKAGECONFIG ??= "dbus"
-PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus dbus-glib"
+PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus-glib"
 PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
+PACKAGECONFIG[python] = "--enable-python,--disable-python,python"
 
 EXTRA_OECONF = "\
+    --enable-maintainer-mode \
     --disable-perl \
-    --disable-python \
     --disable-tcl \
 "
-do_configure_prepend(){
-    rm -f ${S}/po/Makefile.in.in
-}
 
+RDEPENDS_${PN} += "dbus"
 FILES_${PN} += "${datadir}/dbus-1"
 FILES_${PN}-dbg += "${libdir}/xchat/plugins/.debug"
 
-- 
2.0.4


