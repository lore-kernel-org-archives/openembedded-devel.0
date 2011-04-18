Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QBloU-0007Fg-Gy
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 12:36:14 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so3317704fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2011 03:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=LnfiU/MWa+8JOScUqV8jB1y1l3rk0dO9z5H/OIYEEc0=;
	b=W7KB5d5eR4ES7Nrv5i0GoKu5OWDXcruPqvXu1DWMtBUjO3oV5tWVskwrTFU/zqJgrV
	PWWDGexKP/ygcTm1gEVYGFvi1ppPTlbq3UgS9XHesq43qZs60MD+AkImD3pDPBohzFiN
	8mIivkdohv29p+OuSYEmHLbAptecMlKhnwUns=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=IJTqQLWaXpjEbQ5MJwTMjjMOTuHjZ9AIAfI5cpXTwFDa5JHlREEpSAZ9ju8kdBXVTh
	pQ7eXqrQBZDnQumTk6XgJeC9WquChFRLfvBX0apSX6ibD5LI/2gG3OgFCHEgF4MkckPt
	7UltToJJaiOOUiF2hXmLBvhcUYOPhdR2OgZxY=
Received: by 10.223.6.198 with SMTP id a6mr4788431faa.130.1303122829718;
	Mon, 18 Apr 2011 03:33:49 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id c24sm1623114fak.31.2011.04.18.03.33.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2011 03:33:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Apr 2011 12:33:43 +0200
Message-Id: <dde0dbff882202068f41a761c74cd417caad5de1.1303122650.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc1
In-Reply-To: <cover.1303122650.git.Martin.Jansa@gmail.com>
References: <cover.1303122650.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 08/13] recipes-graphics: remove xorg recipes which were upgraded to same versions in oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Apr 2011 10:36:14 -0000

* be aware that PR went backwards in some cases, due to INC_PR in our recipes :/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-driver/xf86-input-keyboard_1.6.0.bb       |   17 ---------
 .../xorg-driver/xf86-input-mouse_1.7.0.bb          |   17 ---------
 meta-oe/recipes-graphics/xorg-lib/libxext_1.2.0.bb |   18 ---------
 meta-oe/recipes-graphics/xorg-lib/libxi_1.4.2.bb   |   21 -----------
 meta-oe/recipes-graphics/xorg-lib/libxt_1.1.1.bb   |   37 --------------------
 .../recipes-graphics/xorg-proto/fixesproto_5.0.bb  |   21 -----------
 .../recipes-graphics/xorg-proto/xextproto_7.2.0.bb |   19 ----------
 .../xorg-proto/xorg-proto-common.inc               |   19 ----------
 .../recipes-graphics/xorg-proto/xproto_7.0.21.bb   |   16 --------
 9 files changed, 0 insertions(+), 185 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-input-keyboard_1.6.0.bb
 delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-input-mouse_1.7.0.bb
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libxext_1.2.0.bb
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libxi_1.4.2.bb
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libxt_1.1.1.bb
 delete mode 100644 meta-oe/recipes-graphics/xorg-proto/fixesproto_5.0.bb
 delete mode 100644 meta-oe/recipes-graphics/xorg-proto/xextproto_7.2.0.bb
 delete mode 100644 meta-oe/recipes-graphics/xorg-proto/xorg-proto-common.inc
 delete mode 100644 meta-oe/recipes-graphics/xorg-proto/xproto_7.0.21.bb

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-keyboard_1.6.0.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-keyboard_1.6.0.bb
deleted file mode 100644
index cbbc7c7..0000000
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-keyboard_1.6.0.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require xorg-driver-input.inc
-
-SUMMARY = "X.Org X server -- keyboard input driver"
-
-DESCRIPTION = "keyboard is an Xorg input driver for keyboards. The \
-driver supports the standard OS-provided keyboard interface.  The driver \
-functions as a keyboard input device, and may be used as the X server's \
-core keyboard."
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=ea2099d24ac9e316a6d4b9f20b3d4e10"
-
-DEPENDS += " kbproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "e2abe9f13e526a73cb68a7d257546eba"
-SRC_URI[sha256sum] = "c46c790fec905d696573b7a374b10ab8b4389112a8f69993fe011006c99e858e"
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-mouse_1.7.0.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-mouse_1.7.0.bb
deleted file mode 100644
index 88b304f..0000000
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-mouse_1.7.0.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require xorg-driver-input.inc
-
-SUMMARY = "X.Org X server -- mouse input driver"
-
-DESCRIPTION = "mouse is an Xorg input driver for mice. The driver \
-supports most available mouse types and interfaces.  The mouse driver \
-functions as a pointer input device, and may be used as the X server's \
-core pointer. Multiple mice are supported by multiple instances of this \
-driver."
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=237eb1d1a602d29ef2af62d8fba60f19"
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "7f31472689c15b6de62eff04d0fb57d7"
-SRC_URI[sha256sum] = "4e989542b5e9e0c5f9087288b18e70de1064dd27c83a4bc6dce58f3ea9d74994"
diff --git a/meta-oe/recipes-graphics/xorg-lib/libxext_1.2.0.bb b/meta-oe/recipes-graphics/xorg-lib/libxext_1.2.0.bb
deleted file mode 100644
index 3d18d62..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/libxext_1.2.0.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "X11 miscellaneous extension library"
-
-require xorg-lib-common.inc
-
-LICENSE = "MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0542b0321c1c9a7a20b23a1b9fa45f91"
-
-DEPENDS += "xproto virtual/libx11 xextproto libxau libxdmcp"
-PROVIDES = "xext"
-
-PR = "r0"
-PE = "1"
-
-XORG_PN = "libXext"
-
-
-SRC_URI[md5sum] = "9bb236ff0193e9fc1c1fb504dd840331"
-SRC_URI[sha256sum] = "4aed3e211e41c47908c293515580e731c26048f61a1212bf0888d1f456de6ff7"
diff --git a/meta-oe/recipes-graphics/xorg-lib/libxi_1.4.2.bb b/meta-oe/recipes-graphics/xorg-lib/libxi_1.4.2.bb
deleted file mode 100644
index 94299c0..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/libxi_1.4.2.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require xorg-lib-common.inc
-
-SUMMARY = "XI: X Input extension library"
-
-DESCRIPTION = "libxi is an extension to the X11 protocol to support \
-input devices other than the core X keyboard and pointer.  It allows \
-client programs to select input from these devices independently from \
-each other and independently from the core devices."
-
-LICENSE = "MIT & MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=17b064789fab936a1c58c4e13d965b0f \
-                    file://src/XIGetDevFocus.c;endline=23;md5=cdfb0d435a33ec57ea0d1e8e395b729f"
-
-DEPENDS += "libxext inputproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "3d14f7bfc4a4335cf0144de9b67a5444"
-SRC_URI[sha256sum] = "272b8041efc0a0203fb0ba33481ddec989539aed862181b58c8c3e410e325691"
-
-XORG_PN = "libXi"
diff --git a/meta-oe/recipes-graphics/xorg-lib/libxt_1.1.1.bb b/meta-oe/recipes-graphics/xorg-lib/libxt_1.1.1.bb
deleted file mode 100644
index 8c22f62..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/libxt_1.1.1.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-require xorg-lib-common.inc
-
-SUMMARY = "Xt: X Toolkit Intrinsics library"
-
-DESCRIPTION = "The Intrinsics are a programming library tailored to the \
-special requirements of user interface construction within a network \
-window system, specifically the X Window System. The Intrinsics and a \
-widget set make up an X Toolkit. The Intrinsics provide the base \
-mechanism necessary to build a wide variety of interoperating widget \
-sets and application environments. The Intrinsics are a layer on top of \
-Xlib, the C Library X Interface. They extend the fundamental \
-abstractions provided by the X Window System while still remaining \
-independent of any particular user interface policy or style."
-
-LICENSE = "MIT & MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3239170e81427c5948287df07691f03f"
-
-DEPENDS += "libsm virtual/libx11 kbproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "eb22c0a1f172b06b97a3f5ae89768412"
-SRC_URI[sha256sum] = "a2a1c29c684e3c9082cdb920b5aea802b179d19107b9ab2170fda07575559da7"
-
-EXTRA_OECONF += "--disable-install-makestrs --disable-xkb"
-
-do_compile() {
-        (
-                unset CC LD CXX CCLD
-                oe_runmake -C util 'XT_CFLAGS=' 'CC=${BUILD_CC}' 'LD=${BUILD_LD}' 'CXX=${BUILD_CXX}' 'CCLD=${BUILD_CCLD}' 'CFLAGS=-D_GNU_SOURCE -I${STAGING_INCDIR_NATIVE} ${BUILD_CFLAGS}' 'LDFLAGS=${BUILD_LDFLAGS}' 'CXXFLAGS=${BUILD_CXXFLAGS}' 'CPPFLAGS=${BUILD_CPPFLAGS}' makestrs
-        ) || exit 1
-        oe_runmake
-}
-
-BBCLASSEXTEND = "native"
-
-XORG_PN = "libXt"
diff --git a/meta-oe/recipes-graphics/xorg-proto/fixesproto_5.0.bb b/meta-oe/recipes-graphics/xorg-proto/fixesproto_5.0.bb
deleted file mode 100644
index 004813f..0000000
--- a/meta-oe/recipes-graphics/xorg-proto/fixesproto_5.0.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require xorg-proto-common.inc
-SUMMARY = "XFixes: X Fixes extension headers"
-
-DESCRIPTION = "This package provides the wire protocol for the X Fixes \
-extension.  This extension is designed to provide server-side support \
-for application work arounds to shortcomings in the core X window \
-system."
-
-
-LICENSE = "MIT & MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=262a7a87da56e66dd639bf7334a110c6 \
-                    file://xfixesproto.h;endline=44;md5=3deb31fbde34b96c9f19072b8d854fea"
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "e7431ab84d37b2678af71e29355e101d"
-SRC_URI[sha256sum] = "ba2f3f31246bdd3f2a0acf8bd3b09ba99cab965c7fb2c2c92b7dc72870e424ce"
-
-
-CONFLICTS = "fixesext"
diff --git a/meta-oe/recipes-graphics/xorg-proto/xextproto_7.2.0.bb b/meta-oe/recipes-graphics/xorg-proto/xextproto_7.2.0.bb
deleted file mode 100644
index 9272ac1..0000000
--- a/meta-oe/recipes-graphics/xorg-proto/xextproto_7.2.0.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require xorg-proto-common.inc
-SUMMARY = "XExt: X Extension headers"
-
-DESCRIPTION = "This package provides the wire protocol for several X \
-extensions.  These protocol extensions include DOUBLE-BUFFER, DPMS, \
-Extended-Visual-Information, LBX, MIT_SHM, MIT_SUNDRY-NONSTANDARD, \
-Multi-Buffering, SECURITY, SHAPE, SYNC, TOG-CUP, XC-APPGROUP, XC-MISC, \
-XTEST.  In addition a small set of utility functions are also \
-available."
-
-LICENSE = "MIT & MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=86f273291759d0ba2a22585cd1c06c53"
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "220732210ceffb01bf1caf970e3b1bfb"
-SRC_URI[sha256sum] = "d2bc4208c6b1883ebe00bc5c0048e5d825038cda56775f74bb4aa89afdc576d5"
-
diff --git a/meta-oe/recipes-graphics/xorg-proto/xorg-proto-common.inc b/meta-oe/recipes-graphics/xorg-proto/xorg-proto-common.inc
deleted file mode 100644
index dc6fedf..0000000
--- a/meta-oe/recipes-graphics/xorg-proto/xorg-proto-common.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "X protocol headers: ${BPN}"
-HOMEPAGE = "http://www.x.org"
-BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=xorg"
-SECTION = "x11/libs"
-LICENSE = "MIT-X"
-
-DEPENDS = "util-macros"
-
-ALLOW_EMPTY = "1"
-
-INC_PR = "r2"
-
-SRC_URI = "${XORG_MIRROR}/individual/proto/${BPN}-${PV}.tar.bz2"
-
-S = "${WORKDIR}/${BPN}-${PV}"
-
-inherit autotools pkgconfig
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-graphics/xorg-proto/xproto_7.0.21.bb b/meta-oe/recipes-graphics/xorg-proto/xproto_7.0.21.bb
deleted file mode 100644
index 2bc9509..0000000
--- a/meta-oe/recipes-graphics/xorg-proto/xproto_7.0.21.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require xorg-proto-common.inc
-
-SUMMARY = "Xlib: C Language X interface headers"
-
-DESCRIPTION = "This package provides the basic headers for the X Window \
-System."
-
-LICENSE = "MIT & MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b9e051107d5628966739a0b2e9b32676"
-
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "c5a93a69b701cf81925fab02b35b0d0e"
-SRC_URI[sha256sum] = "38ee2f032c3a9e30504593f8b5e6c1161a6629daba93748a71c6f70c16f65548"
-
-- 
1.7.5.rc1



