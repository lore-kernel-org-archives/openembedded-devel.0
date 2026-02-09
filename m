Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED26E7E0D9
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 11:39:18 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45591.1770637155275419551
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Feb 2026 03:39:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FOo86fMq;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so11408415e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 03:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770637154; x=1771241954; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hBsQXfmehcwzh3K0vD9GTGtb2RlzvqyXl1UmFsGQyXo=;
        b=FOo86fMq0+5KaRz//XDAgGfAoi/xsJUie7vd0eZpOCLRMnWstsINe2dIZM8PjT+VXY
         tu9/uDBD+5R7x4HjGRoO1gvBjnNxpwj/sHQgPKAgwanfKTcRMWSXlDqCOBvaZrWaBE1X
         nnc3REekbDmUcpiFEqQ54XI0cLVRb/axqM38YgHcKezbSR9qdLl5ckILFs3r5U+Esvos
         dei0gUloojDgwiXHRxuCE/ArOSAICnxjfW8Ivrs27e1L9JHz2gwnh6Ub9AqyZfq5kl7u
         a3MO8SEIJqqKv4iIfAXLvb4Lc6taj7sgOpy+XcIFVeX2J+0A1t4FIgwzNuOLDHYHOj43
         TNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770637154; x=1771241954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hBsQXfmehcwzh3K0vD9GTGtb2RlzvqyXl1UmFsGQyXo=;
        b=L998K8nGwl95zIUI/gOkaMRaBjKE43yA3L9gopo5BcHnz+0RaSQ7STZnfm0GeEhB6s
         zJ399EsJLuQZI8gOz6xnHYNWDrmpzJt4OmNruvcLP7eR1vACnBXdBjXDgxcXmHGtP6sw
         4X5e+/vw86zaIocnsKFJQk8cKtnoycLcNJYsQ2O+ijZ9KLT6braPX5+snhCal37ZRUvw
         g+59y7zMd4AuLFaHNJn7QWfJNvTV/3GDatgU772aAjGRhWCugTZ4o5AzrpGNC0QhTHUx
         fVDgJZ/1xLpVspB/Gh6h/eqo0W+VSnfrKloE01BBubeNQ1ixoIx5wbRC4/xPaISPho9A
         RZKw==
X-Gm-Message-State: AOJu0YxCuCBiaP0/neZFh2i/K+g3NNnjE0+JiT+8x1tI9iaHgddgsse4
	jsGgeH1byO8sr8fsm/ShOBmuMk+qSDorG6kVN4aTT3XZ9AKabnKFGFQcfnuZiA==
X-Gm-Gg: AZuq6aKoRfcSJHnAAA+Z544dFt3VcefLkrE2nkJoEEUMIJ7dVTWptLgPHpCOw1UkKby
	xATIfJaupfZ13W3+4tWe3lqWpty4J3AO+aUNdGiAFRxJsZdJV0pWTUjvYx4DIZuit3HoAuQBmUu
	jc5+LrbX0jD4Y1dMtkgml7EHiGFWTLpTEj6/OD6dGzijYldU52gDxl6YWYy3x02IQA2WcqSysn3
	Wx78LXBheOArRMt1ikxXq5OQFgbRGLJweJe42KzrpShCXt13lR4wGCHJlLR0wp8+RCbW4uFsf/o
	c6KaBDzTqayM4S0+UuMEGXxJQ6ubZx+rtuPi/2zxc+smo+WCbz4Dzr5L7BjHkOzOmdFaKQT3vVC
	WKtIzQ3QvGu1As6BacgZCw3NCAHRikQTXKo8vdQrShpVV6SXZoX2P5U8o3dG5wxudIBI9Ntqtn/
	oE+yfU8Iyv
X-Received: by 2002:a05:600c:1548:b0:480:1e9e:f9c with SMTP id 5b1f17b1804b1-48320933613mr147022045e9.10.1770637153471;
        Mon, 09 Feb 2026 03:39:13 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834304232bsm56030375e9.2.2026.02.09.03.39.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 03:39:12 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 12/16] tigervnc: sync xserver component with oe-core
Date: Mon,  9 Feb 2026 12:38:59 +0100
Message-ID: <20260209113904.3442496-12-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260209113904.3442496-1-skandigraun@gmail.com>
References: <20260209113904.3442496-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 11:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124307

oe-core has a newer version of xserver than this recipe used to compile
TigerVNC with. This recipe updates xserver to the same version, 21.1.18.

TigerVNC only started to support this xserver version 2 versions later,
with 1.13. Due to this 3 commits were backported that add the missing
changes.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...ncrease-supported-Xorg-version-to-1..patch | 29 ++++++
 ...server21.1.1.patch-Add-Xorg-21-patch.patch | 95 +++++++++++++++++++
 .../files/0001-xvnc-adapt-for-1.21.patch      | 46 +++++++++
 .../tigervnc/tigervnc_1.11.0.bb               | 33 ++-----
 4 files changed, 180 insertions(+), 23 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/0001-xorg-version.h-Increase-supported-Xorg-version-to-1..patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/0001-xserver21.1.1.patch-Add-Xorg-21-patch.patch
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/0001-xvnc-adapt-for-1.21.patch

diff --git a/meta-oe/recipes-graphics/tigervnc/files/0001-xorg-version.h-Increase-supported-Xorg-version-to-1..patch b/meta-oe/recipes-graphics/tigervnc/files/0001-xorg-version.h-Increase-supported-Xorg-version-to-1..patch
new file mode 100644
index 0000000000..fd2871976a
--- /dev/null
+++ b/meta-oe/recipes-graphics/tigervnc/files/0001-xorg-version.h-Increase-supported-Xorg-version-to-1..patch
@@ -0,0 +1,29 @@
+From 59f302c28cc15f2d7749840a311c2085c75d5833 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Wed, 24 Nov 2021 21:09:36 +0100
+Subject: [PATCH] xorg-version.h: Increase supported Xorg version to 1.21
+
+From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
+
+Upstream-Status: Backport [https://github.com/TigerVNC/tigervnc/commit/736b50d04e1ba965696cd15d456dc2b7fc123150]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ unix/xserver/hw/vnc/xorg-version.h | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/unix/xserver/hw/vnc/xorg-version.h b/unix/xserver/hw/vnc/xorg-version.h
+index 5effe7e9..2449980d 100644
+--- a/unix/xserver/hw/vnc/xorg-version.h
++++ b/unix/xserver/hw/vnc/xorg-version.h
+@@ -36,8 +36,10 @@
+ #define XORG 119
+ #elif XORG_VERSION_CURRENT < ((1 * 10000000) + (20 * 100000) + (99 * 1000))
+ #define XORG 120
++#elif XORG_VERSION_CURRENT < ((1 * 10000000) + (21 * 100000) + (99 * 1000))
++#define XORG 121
+ #else
+-#error "X.Org newer than 1.20 is not supported"
++#error "X.Org newer than 1.21 is not supported"
+ #endif
+ 
+ #endif
diff --git a/meta-oe/recipes-graphics/tigervnc/files/0001-xserver21.1.1.patch-Add-Xorg-21-patch.patch b/meta-oe/recipes-graphics/tigervnc/files/0001-xserver21.1.1.patch-Add-Xorg-21-patch.patch
new file mode 100644
index 0000000000..deb326e7a9
--- /dev/null
+++ b/meta-oe/recipes-graphics/tigervnc/files/0001-xserver21.1.1.patch-Add-Xorg-21-patch.patch
@@ -0,0 +1,95 @@
+From 4af7be2ac0d6e39a23ab4a9df964a2888659051a Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Fri, 26 Nov 2021 11:15:21 +0100
+Subject: [PATCH] xserver21.1.1.patch: Add Xorg 21 patch
+
+From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
+
+Upstream-Status: Backport [https://github.com/TigerVNC/tigervnc/commit/0c5a2b2e7759c2829c07186cfce4d24aa9b5274e]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ unix/xserver21.patch | 75 ++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 75 insertions(+)
+ create mode 100644 unix/xserver21.patch
+
+diff --git a/unix/xserver21.patch b/unix/xserver21.patch
+new file mode 100644
+index 00000000..a349af75
+--- /dev/null
++++ b/unix/xserver21.patch
+@@ -0,0 +1,75 @@
++diff -urpN xorg-server-1.20.0/configure.ac xorg-server-1.20.0/configure.ac
++--- xorg-server-1.20.0/configure.ac	2018-05-10 09:32:34.000000000 -0700
+++++ xorg-server-1.20.0/configure.ac	2018-06-13 19:04:47.536413626 -0700
++@@ -74,6 +74,7 @@ dnl forcing an entire recompile.x
++ AC_CONFIG_HEADERS(include/version-config.h)
++ 
++ AM_PROG_AS
+++AC_PROG_CXX
++ AC_PROG_LN_S
++ LT_PREREQ([2.2])
++ LT_INIT([disable-static win32-dll])
++@@ -1777,6 +1778,10 @@ if test "x$XVFB" = xyes; then
++ 	AC_SUBST([XVFB_SYS_LIBS])
++ fi
++ 
+++dnl Xvnc DDX
+++AC_SUBST([XVNC_CPPFLAGS], ["-DHAVE_DIX_CONFIG_H $XSERVER_CFLAGS"])
+++AC_SUBST([XVNC_LIBS], ["$FB_LIB $FIXES_LIB $XEXT_LIB $CONFIG_LIB $DBE_LIB $RECORD_LIB $GLX_LIBS $RANDR_LIB $RENDER_LIB $DAMAGE_LIB $DRI3_LIB $PRESENT_LIB $MIEXT_SYNC_LIB $MIEXT_DAMAGE_LIB $MIEXT_SHADOW_LIB $XI_LIB $XKB_LIB $XKB_STUB_LIB $COMPOSITE_LIB $MAIN_LIB"])
+++AC_SUBST([XVNC_SYS_LIBS], ["$GLX_SYS_LIBS"])
++ 
++ dnl Xnest DDX
++ 
++@@ -1812,6 +1817,8 @@ if test "x$XORG" = xauto; then
++ fi
++ AC_MSG_RESULT([$XORG])
++ 
+++AC_DEFINE_UNQUOTED(XORG_VERSION_CURRENT, [$VENDOR_RELEASE], [Current Xorg version])
+++
++ if test "x$XORG" = xyes; then
++ 	XORG_DDXINCS='-I$(top_srcdir)/hw/xfree86 -I$(top_srcdir)/hw/xfree86/include -I$(top_srcdir)/hw/xfree86/common'
++ 	XORG_OSINCS='-I$(top_srcdir)/hw/xfree86/os-support -I$(top_srcdir)/hw/xfree86/os-support/bus -I$(top_srcdir)/os'
++@@ -2029,7 +2036,6 @@ if test "x$XORG" = xyes; then
++ 	AC_DEFINE(XORG_SERVER, 1, [Building Xorg server])
++ 	AC_DEFINE(XORGSERVER, 1, [Building Xorg server])
++ 	AC_DEFINE(XFree86Server, 1, [Building XFree86 server])
++-	AC_DEFINE_UNQUOTED(XORG_VERSION_CURRENT, [$VENDOR_RELEASE], [Current Xorg version])
++ 	AC_DEFINE(NEED_XF86_TYPES, 1, [Need XFree86 typedefs])
++ 	AC_DEFINE(NEED_XF86_PROTOTYPES, 1, [Need XFree86 helper functions])
++ 	AC_DEFINE(__XSERVERNAME__, "Xorg", [Name of X server])
++@@ -2565,6 +2571,7 @@ hw/dmx/Makefile
++ hw/dmx/man/Makefile
++ hw/vfb/Makefile
++ hw/vfb/man/Makefile
+++hw/vnc/Makefile
++ hw/xnest/Makefile
++ hw/xnest/man/Makefile
++ hw/xwin/Makefile
++diff -urpN xorg-server-1.20.0/hw/Makefile.am xorg-server-1.20.0/hw/Makefile.am
++--- xorg-server-1.20.0/hw/Makefile.am	2018-05-10 09:32:34.000000000 -0700
+++++ xorg-server-1.20.0/hw/Makefile.am	2018-06-13 19:04:47.536413626 -0700
++@@ -44,3 +44,5 @@
++ 
++ relink:
++ 	$(AM_V_at)for i in $(SUBDIRS) ; do $(MAKE) -C $$i relink || exit 1 ; done
+++
+++SUBDIRS += vnc
++diff -urpN xorg-server-1.20.0/mi/miinitext.c xorg-server-1.20.0/mi/miinitext.c
++--- xorg-server-1.20.0/mi/miinitext.c	2018-05-10 09:32:37.000000000 -0700
+++++ xorg-server-1.20.0/mi/miinitext.c	2018-06-13 19:05:14.742200675 -0700
++@@ -107,8 +107,15 @@ SOFTWARE.
++ #include "os.h"
++ #include "globals.h"
++ 
+++#ifdef TIGERVNC
+++extern void vncExtensionInit(void);
+++#endif
+++
++ /* List of built-in (statically linked) extensions */
++ static const ExtensionModule staticExtensions[] = {
+++#ifdef TIGERVNC
+++    {vncExtensionInit, "VNC-EXTENSION", NULL},
+++#endif
++     {GEExtensionInit, "Generic Event Extension", &noGEExtension},
++     {ShapeExtensionInit, "SHAPE", NULL},
++ #ifdef MITSHM
diff --git a/meta-oe/recipes-graphics/tigervnc/files/0001-xvnc-adapt-for-1.21.patch b/meta-oe/recipes-graphics/tigervnc/files/0001-xvnc-adapt-for-1.21.patch
new file mode 100644
index 0000000000..4f47e11ac4
--- /dev/null
+++ b/meta-oe/recipes-graphics/tigervnc/files/0001-xvnc-adapt-for-1.21.patch
@@ -0,0 +1,46 @@
+From 7d18a77dfbef8ffe2b17b31098c75316b13f1597 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Wed, 24 Nov 2021 21:10:56 +0100
+Subject: [PATCH] xvnc: adapt for 1.21
+
+From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
+
+VENDOR_STRING is gone as is DEFAULT_LOG_VERBOSITY
+site.h has been removed and is not needed.
+
+Upstream-Status: Backport [https://github.com/TigerVNC/tigervnc/commit/f2577107f7f55382c524d8c738a777e5cdd80f60]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ unix/xserver/hw/vnc/xvnc.c | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/unix/xserver/hw/vnc/xvnc.c b/unix/xserver/hw/vnc/xvnc.c
+index fda6205f..d16a4355 100644
+--- a/unix/xserver/hw/vnc/xvnc.c
++++ b/unix/xserver/hw/vnc/xvnc.c
+@@ -80,7 +80,6 @@ from the X Consortium.
+ #undef VENDOR_RELEASE
+ #undef VENDOR_STRING
+ #include "version-config.h"
+-#include "site.h"
+ 
+ #define XVNCVERSION "TigerVNC 1.11.0"
+ #define XVNCCOPYRIGHT ("Copyright (C) 1999-2020 TigerVNC Team and many others (see README.rst)\n" \
+@@ -148,15 +147,14 @@ static Bool Render = TRUE;
+ static Bool displaySpecified = FALSE;
+ static char displayNumStr[16];
+ 
+-static int vncVerbose = DEFAULT_LOG_VERBOSITY;
++static int vncVerbose = 0;
+ 
+ 
+ static void
+ vncPrintBanner(void)
+ {
+     ErrorF("\nXvnc %s - built %s\n%s", XVNCVERSION, buildtime, XVNCCOPYRIGHT);
+-    ErrorF("Underlying X server release %d, %s\n\n", VENDOR_RELEASE,
+-           VENDOR_STRING);
++    ErrorF("Underlying X server release %d\n\n", VENDOR_RELEASE);
+ }
+ 
+ static void
diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
index 699c0ed74f..f995c1ef08 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
@@ -21,15 +21,18 @@ SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.11-branch;protocol=ht
            file://0002-do-not-build-tests-sub-directory.patch \
            file://0003-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch \
            file://0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch \
+           file://0001-xserver21.1.1.patch-Add-Xorg-21-patch.patch \
+           file://0001-xorg-version.h-Increase-supported-Xorg-version-to-1..patch \
+           file://0001-xvnc-adapt-for-1.21.patch \
 "
 
 # Keep sync with xorg-server in oe-core
 XORG_PN ?= "xorg-server"
-XORG_PV ?= "1.20.6"
-SRC_URI += "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${XORG_PV}.tar.bz2;name=xorg"
+XORG_PV ?= "21.1.18"
+SRC_URI += "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${XORG_PV}.tar.xz;name=xorg"
 XORG_S = "${WORKDIR}/${XORG_PN}-${XORG_PV}"
-SRC_URI[xorg.md5sum] = "a98170084f2c8fed480d2ff601f8a14b"
-SRC_URI[xorg.sha256sum] = "6316146304e6e8a36d5904987ae2917b5d5b195dc9fc63d67f7aca137e5a51d1"
+SRC_URI[xorg.md5sum] = "43225ddc1fd8d7ae7671c25ab6d1f927"
+SRC_URI[xorg.sha256sum] = "c878d1930d87725d4a5bf498c24f4be8130d5b2646a9fd0f2994deff90116352"
 
 # It is the directory containing the Xorg source for the
 # machine on which you are building TigerVNC.
@@ -37,27 +40,11 @@ XSERVER_SOURCE_DIR="${S}/unix/xserver"
 
 do_patch[postfuncs] += "do_patch_xserver"
 do_patch_xserver () {
-    for subdir in Xext xkb GL hw/xquartz/bundle hw/xfree86/common; do
-        install -d ${XSERVER_SOURCE_DIR}/$subdir
-    done
-
-    for subdir in hw/dmx/doc man doc hw/dmx/doxygen; do
-        install -d ${XSERVER_SOURCE_DIR}/$subdir
-    done
-
-    sources="hw/xquartz/bundle/cpprules.in man/Xserver.man doc/smartsched \
-             hw/dmx/doxygen/doxygen.conf.in xserver.ent.in xkb/README.compiled \
-             hw/xfree86/xorgconf.cpp hw/xfree86/Xorg.sh.in"
-    for i in ${sources}; do
-        install -m 0644 ${XORG_S}/$i ${XSERVER_SOURCE_DIR}/$i;
-    done
-
-    cd ${XORG_S}
-    find . -type f | egrep '.*\.(c|h|am|ac|inc|m4|h.in|pc.in|man.pre|pl|txt)$' | \
-    xargs tar cf - | (cd ${XSERVER_SOURCE_DIR} && tar xf -)
+    # Put the xserver source in the right place in the tigervnc source tree
+    cp -rfl ${XORG_S}/* ${XSERVER_SOURCE_DIR}
 
     cd ${XSERVER_SOURCE_DIR}
-    xserverpatch="${S}/unix/xserver120.patch"
+    xserverpatch="${S}/unix/xserver21.patch"
     echo "Apply $xserverpatch"
     patch -p1 -b --suffix .vnc < $xserverpatch
 }

