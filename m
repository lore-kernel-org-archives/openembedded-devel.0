Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q7RBw-0003b1-76
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Apr 2011 13:46:32 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so1044407fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2011 04:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=RqiAk0YuVN16pwdGH9d5gDlzCSfrgEuG9FwJEAaIWdQ=;
	b=Un6ieUT7ioOu8RKplcgV673qs/BmLOd2P9DNdNwFY7LDSH985ztl9+KckRjygAzdv8
	sOTywqlj4KiRirWUg26E9CC7in/o7y0tXbqj+65669Y63oi3VpcIwvcHlZmtU28j2uzE
	qwDWxZbV+iK55tyEwAQ+Zn7SvC1Y6ciqkU6qk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=UKqUrQ5xlC4PwCkql1uNzdn1QQ/Nwy40RV7GbIgJiq19S1xT2di66wzhpYzxBsFjBb
	vFbwYxxkxRXpTwl8eWJiBX+Ed2dZHVyKGV5lHXU90Y/TGfRMuLQyluXluyVuwTbLPEpm
	A/2EYbJNz2xAXtUAY68iWbqEr9+GYSKDrn9dY=
Received: by 10.223.6.11 with SMTP id 11mr931553fax.93.1302090265568;
	Wed, 06 Apr 2011 04:44:25 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id t2sm112021faa.47.2011.04.06.04.44.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Apr 2011 04:44:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2011 13:44:05 +0200
Message-Id: <1302090248-16251-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1302090248-16251-1-git-send-email-Martin.Jansa@gmail.com>
References: <1302090248-16251-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/5] xorg: remove older versions
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
X-List-Received-Date: Wed, 06 Apr 2011 11:46:32 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/xorg-doc/xorg-sgml-doctools_1.6.bb         |    8 --
 recipes/xorg-driver/xf86-input-keyboard_1.5.0.bb   |    8 --
 recipes/xorg-driver/xf86-input-mouse_1.6.0.bb      |    7 --
 recipes/xorg-driver/xf86-input-synaptics_1.3.0.bb  |    9 --
 recipes/xorg-driver/xf86-input-vmmouse_12.6.10.bb  |    9 --
 recipes/xorg-driver/xf86-video-ati_6.13.2.bb       |    8 --
 recipes/xorg-driver/xf86-video-chips_1.2.3.bb      |    7 --
 recipes/xorg-driver/xf86-video-geode_2.11.11.bb    |    9 --
 recipes/xorg-driver/xf86-video-intel_2.14.0.bb     |   11 --
 .../xorg-driver/xf86-video-siliconmotion_1.7.4.bb  |    7 --
 .../xorg-lib/libx11-1.4.1/keysymdef_include.patch  |   19 ----
 .../libx11-1.4.1/x11_disable_makekeys.patch        |   29 ------
 recipes/xorg-lib/libx11_1.4.1.bb                   |    8 --
 recipes/xorg-lib/libxfixes_4.0.5.bb                |   13 ---
 recipes/xorg-lib/libxi_1.4.1.bb                    |   10 --
 recipes/xorg-lib/libxt_1.0.9.bb                    |   22 ----
 recipes/xorg-proto/fixesproto_4.1.2.bb             |    9 --
 recipes/xorg-proto/xextproto_7.1.2.bb              |    7 --
 recipes/xorg-proto/xproto_7.0.20.bb                |    7 --
 recipes/xorg-util/util-macros_1.11.0.bb            |    4 -
 .../xorg-xserver/xserver-xorg-1.9.4/dolt-fix.patch |   22 ----
 ...ack-assume-pixman-supports-overlapped-blt.patch |   14 ---
 .../hack-fbdev-ignore-return-mode.patch            |   39 --------
 .../xserver-xorg-1.9.4/randr-support.patch         |  102 --------------------
 recipes/xorg-xserver/xserver-xorg_1.9.4.bb         |   31 ------
 25 files changed, 0 insertions(+), 419 deletions(-)
 delete mode 100644 recipes/xorg-doc/xorg-sgml-doctools_1.6.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-keyboard_1.5.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-mouse_1.6.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-synaptics_1.3.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-input-vmmouse_12.6.10.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-ati_6.13.2.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-chips_1.2.3.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-geode_2.11.11.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-intel_2.14.0.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-siliconmotion_1.7.4.bb
 delete mode 100644 recipes/xorg-lib/libx11-1.4.1/keysymdef_include.patch
 delete mode 100644 recipes/xorg-lib/libx11-1.4.1/x11_disable_makekeys.patch
 delete mode 100644 recipes/xorg-lib/libx11_1.4.1.bb
 delete mode 100644 recipes/xorg-lib/libxfixes_4.0.5.bb
 delete mode 100644 recipes/xorg-lib/libxi_1.4.1.bb
 delete mode 100644 recipes/xorg-lib/libxt_1.0.9.bb
 delete mode 100644 recipes/xorg-proto/fixesproto_4.1.2.bb
 delete mode 100644 recipes/xorg-proto/xextproto_7.1.2.bb
 delete mode 100644 recipes/xorg-proto/xproto_7.0.20.bb
 delete mode 100644 recipes/xorg-util/util-macros_1.11.0.bb
 delete mode 100644 recipes/xorg-xserver/xserver-xorg-1.9.4/dolt-fix.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg-1.9.4/hack-assume-pixman-supports-overlapped-blt.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg-1.9.4/hack-fbdev-ignore-return-mode.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg-1.9.4/randr-support.patch
 delete mode 100644 recipes/xorg-xserver/xserver-xorg_1.9.4.bb

diff --git a/recipes/xorg-doc/xorg-sgml-doctools_1.6.bb b/recipes/xorg-doc/xorg-sgml-doctools_1.6.bb
deleted file mode 100644
index 34c8fcf..0000000
--- a/recipes/xorg-doc/xorg-sgml-doctools_1.6.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-doc-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "fe333413fd4139de07ebfa36039b8a59"
-SRC_URI[archive.sha256sum] = "98d20476e8a3e413c9597a94c9a578768afb28211c0d030dc7b8256055d5ae6a"
-
-FILES_${PN} += " /usr/share/sgml/X11"
diff --git a/recipes/xorg-driver/xf86-input-keyboard_1.5.0.bb b/recipes/xorg-driver/xf86-input-keyboard_1.5.0.bb
deleted file mode 100644
index 765084d..0000000
--- a/recipes/xorg-driver/xf86-input-keyboard_1.5.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- keyboard input driver"
-DEPENDS += " kbproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "b74d7162db5ce7899c17927c6cfa9522"
-SRC_URI[archive.sha256sum] = "2303510e905465ebee91f22cdd75706a15afb108258bc220c7500f213de19cb0"
diff --git a/recipes/xorg-driver/xf86-input-mouse_1.6.0.bb b/recipes/xorg-driver/xf86-input-mouse_1.6.0.bb
deleted file mode 100644
index 6a23ed4..0000000
--- a/recipes/xorg-driver/xf86-input-mouse_1.6.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- mouse input driver"
-PE = "1"
-PR = "${INC_PR}.1"
-
-SRC_URI[archive.md5sum] = "cef849b1a2743d2e84de98422f372974"
-SRC_URI[archive.sha256sum] = "c7ae245e5168276346145f196d1d1faed618f41d5174a2031c71fab6e1a2fbdb"
diff --git a/recipes/xorg-driver/xf86-input-synaptics_1.3.0.bb b/recipes/xorg-driver/xf86-input-synaptics_1.3.0.bb
deleted file mode 100644
index c0e66f1..0000000
--- a/recipes/xorg-driver/xf86-input-synaptics_1.3.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- mouse input driver"
-PE = "1"
-PR = "${INC_PR}.1"
-
-EXTRA_OEMAKE += " sdkdir=${STAGING_INCDIR}/xorg "
-
-SRC_URI[archive.md5sum] = "b4e58eba1bdca13f0929a4b03b262135"
-SRC_URI[archive.sha256sum] = "30a33250c4f3d2daa8a61cab847dc7befd3248db0fca139d17fd7b890b5a8fd7"
diff --git a/recipes/xorg-driver/xf86-input-vmmouse_12.6.10.bb b/recipes/xorg-driver/xf86-input-vmmouse_12.6.10.bb
deleted file mode 100644
index edf61b3..0000000
--- a/recipes/xorg-driver/xf86-input-vmmouse_12.6.10.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-driver-input.inc
-DESCRIPTION = "X.Org X server -- VMMouse input driver to use with VMWare"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "49c6e77851e9f7bc5cb7d85f061992f8"
-SRC_URI[archive.sha256sum] = "a6369d5a860627f2a38842d5563045b263a459e534f6ae08df48f330f9a40910"
-
-COMPATIBLE_HOST = "i.86.*-linux"
diff --git a/recipes/xorg-driver/xf86-video-ati_6.13.2.bb b/recipes/xorg-driver/xf86-video-ati_6.13.2.bb
deleted file mode 100644
index f9e4748..0000000
--- a/recipes/xorg-driver/xf86-video-ati_6.13.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- ATI display driver"
-DEPENDS += " xineramaproto xf86miscproto drm xf86driproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "a8f92fe3c458e511f4e2ead7f92c02b0"
-SRC_URI[archive.sha256sum] = "d85f60081e5b71bf19da4ca48bce95a9e9df3635c8540dd2640785bedfbc36ee"
diff --git a/recipes/xorg-driver/xf86-video-chips_1.2.3.bb b/recipes/xorg-driver/xf86-video-chips_1.2.3.bb
deleted file mode 100644
index ec34736..0000000
--- a/recipes/xorg-driver/xf86-video-chips_1.2.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- Chips display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "e3e8b8661b3ba2159f83f64e2aa6e29f"
-SRC_URI[archive.sha256sum] = "0561278e06f84d4ee20317b19831cc8d42c952a1577c7865163ad2d6d900cb1d"
diff --git a/recipes/xorg-driver/xf86-video-geode_2.11.11.bb b/recipes/xorg-driver/xf86-video-geode_2.11.11.bb
deleted file mode 100644
index 9574523..0000000
--- a/recipes/xorg-driver/xf86-video-geode_2.11.11.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.org server -- Geode GX2/LX display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "ea36cc51588a1ba73442237db2bf560b"
-SRC_URI[archive.sha256sum] = "861727b1f183060a2d0d89997e0fb3e1564c5d4c2e7b453ab2999f3d6c15400c"
-
-COMPATIBLE_HOST = "i.86.*-linux"
diff --git a/recipes/xorg-driver/xf86-video-intel_2.14.0.bb b/recipes/xorg-driver/xf86-video-intel_2.14.0.bb
deleted file mode 100644
index ae9b95f..0000000
--- a/recipes/xorg-driver/xf86-video-intel_2.14.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- Intel i8xx, i9xx display driver"
-DEPENDS += " virtual/libx11 libxvmc drm xf86driproto "
-RDEPENDS_${PN} += "xserver-xorg-extension-dri \
-             xserver-xorg-extension-dri2 \
-             xserver-xorg-extension-glx"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "05f187582aeabda57fcd6f2782cfbf8e"
-SRC_URI[archive.sha256sum] = "e18c37a579a960516e69de5c6f74750ca02208c0e41cf763ae5630c84db507df"
diff --git a/recipes/xorg-driver/xf86-video-siliconmotion_1.7.4.bb b/recipes/xorg-driver/xf86-video-siliconmotion_1.7.4.bb
deleted file mode 100644
index 7a47c47..0000000
--- a/recipes/xorg-driver/xf86-video-siliconmotion_1.7.4.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- SiliconMotion display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "3059e87586e16c34da89437cc6215b49"
-SRC_URI[archive.sha256sum] = "b47511480fab5c517e12bd67a332f452d1718b32d53a6201edfc1c279e6e04d7"
diff --git a/recipes/xorg-lib/libx11-1.4.1/keysymdef_include.patch b/recipes/xorg-lib/libx11-1.4.1/keysymdef_include.patch
deleted file mode 100644
index 1a30e34..0000000
--- a/recipes/xorg-lib/libx11-1.4.1/keysymdef_include.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-diff -uNr libX11-1.3.6.orig//configure.ac libX11-1.3.6/configure.ac
---- libX11-1.3.6.orig//configure.ac	2010-09-20 08:04:16.000000000 +0200
-+++ libX11-1.3.6/configure.ac	2010-09-28 16:29:26.000000000 +0200
-@@ -355,7 +355,14 @@
- # Find keysymdef.h
- #
- AC_MSG_CHECKING([keysym definitions])
--KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11
-+AC_ARG_WITH(keysymdefdir,
-+        AC_HELP_STRING([--with-keysymdefdir=DIR], [The location of keysymdef.h]),
-+        KEYSYMDEFDIR=$withval, KEYSYMDEFDIR="")
-+
-+if test x$KEYSYMDEFDIR = x; then
-+	KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11
-+fi
-+
- FILES="keysymdef.h XF86keysym.h Sunkeysym.h DECkeysym.h HPkeysym.h"
- for i in $FILES; do
-     if test -f "$KEYSYMDEFDIR/$i"; then
diff --git a/recipes/xorg-lib/libx11-1.4.1/x11_disable_makekeys.patch b/recipes/xorg-lib/libx11-1.4.1/x11_disable_makekeys.patch
deleted file mode 100644
index 9763313..0000000
--- a/recipes/xorg-lib/libx11-1.4.1/x11_disable_makekeys.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Index: libX11-1.3.4/src/util/Makefile.am
-===================================================================
---- libX11-1.3.4.orig/src/util/Makefile.am
-+++ libX11-1.3.4/src/util/Makefile.am
-@@ -1,24 +1 @@
--
--noinst_PROGRAMS=makekeys
--
--makekeys_CFLAGS = \
--	$(X11_CFLAGS) \
--	$(CWARNFLAGS)
--
--CC = @CC_FOR_BUILD@
--CPPFLAGS = @CPPFLAGS_FOR_BUILD@
--CFLAGS = @CFLAGS_FOR_BUILD@
--LDFLAGS = @LDFLAGS_FOR_BUILD@
--
- EXTRA_DIST = mkks.sh
--
--if LINT
--# Check source code with tools like lint & sparse
--
--ALL_LINT_FLAGS=$(LINT_FLAGS) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
--		$(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS)
--
--lint:
--	$(LINT) $(ALL_LINT_FLAGS) makekeys.c
--
--endif LINT
diff --git a/recipes/xorg-lib/libx11_1.4.1.bb b/recipes/xorg-lib/libx11_1.4.1.bb
deleted file mode 100644
index d07ee46..0000000
--- a/recipes/xorg-lib/libx11_1.4.1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require libx11.inc
-#--without-xcb is not an option anymore
-#http://cgit.freedesktop.org/xorg/lib/libX11/commit/?id=15e5eaf62897b3179d1fbe457cb19f886f0449f8
-DEPENDS_virtclass-native = "libxcb-native ${COMMON_DEPENDS}"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "4603bdbce1bd73cbc140de402fe6ed24"
-SRC_URI[archive.sha256sum] = "70f4e0f798645a0f269f362bfdbd4c7934dae3a2dd9ecbad28d6ede414f63ce2"
diff --git a/recipes/xorg-lib/libxfixes_4.0.5.bb b/recipes/xorg-lib/libxfixes_4.0.5.bb
deleted file mode 100644
index 582cc9f..0000000
--- a/recipes/xorg-lib/libxfixes_4.0.5.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X Fixes extension library."
-LICENSE = "BSD-X"
-DEPENDS += "virtual/libx11 xproto fixesproto xextproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "1b4b8386bd5d1751b2c7177223ad4629"
-SRC_URI[archive.sha256sum] = "2e6cd020460e4ef5d5a1d9b5d21143e9f5e580036a79c7de26ae539d7bcb8d74"
-
-BBCLASSEXTEND = "native"
-
-XORG_PN = "libXfixes"
diff --git a/recipes/xorg-lib/libxi_1.4.1.bb b/recipes/xorg-lib/libxi_1.4.1.bb
deleted file mode 100644
index 39f09a1..0000000
--- a/recipes/xorg-lib/libxi_1.4.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 Input extension library"
-DEPENDS += "libxext inputproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "e4b6fb1b08a92075469174f0cccde168"
-SRC_URI[archive.sha256sum] = "599f1c0930f94c2ae74711b2577a7f354c4a991cc97b5ec5bb655b855c1429a6"
-
-XORG_PN = "libXi"
diff --git a/recipes/xorg-lib/libxt_1.0.9.bb b/recipes/xorg-lib/libxt_1.0.9.bb
deleted file mode 100644
index ce38bb8..0000000
--- a/recipes/xorg-lib/libxt_1.0.9.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X11 toolkit intrinsics library"
-DEPENDS += "libsm virtual/libx11 kbproto"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "8a414f8f2327aaa616ca2dcac1f5d8c3"
-SRC_URI[archive.sha256sum] = "eab91b594b801f7f07a20f936dda70a629028858cbcf541becf94f2786ae6b01"
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
diff --git a/recipes/xorg-proto/fixesproto_4.1.2.bb b/recipes/xorg-proto/fixesproto_4.1.2.bb
deleted file mode 100644
index a9ad0d5..0000000
--- a/recipes/xorg-proto/fixesproto_4.1.2.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "bdb58ecc313b509247036d5c11fa99df"
-SRC_URI[archive.sha256sum] = "de4cbfccb533c190073445eb2a891d997e89f6fb58204f68ae82871de044f857"
-
-
-CONFLICTS = "fixesext"
diff --git a/recipes/xorg-proto/xextproto_7.1.2.bb b/recipes/xorg-proto/xextproto_7.1.2.bb
deleted file mode 100644
index ecf23cb..0000000
--- a/recipes/xorg-proto/xextproto_7.1.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "263ae968b223c23b2986603d84e5c30e"
-SRC_URI[archive.sha256sum] = "f6f829e112c8eca7c2f10b2193e8d927b9b7722283d647cfd2aea09758159199"
-
diff --git a/recipes/xorg-proto/xproto_7.0.20.bb b/recipes/xorg-proto/xproto_7.0.20.bb
deleted file mode 100644
index 8ab3380..0000000
--- a/recipes/xorg-proto/xproto_7.0.20.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require xorg-proto-common.inc
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "65633168e5315c19defb4652cd3d83c1"
-SRC_URI[archive.sha256sum] = "3fe87fe47d9b795e60ba3715d71f90f9929d57e9048f1d2a6ebb558e5aee9e2a"
-
diff --git a/recipes/xorg-util/util-macros_1.11.0.bb b/recipes/xorg-util/util-macros_1.11.0.bb
deleted file mode 100644
index 8392794..0000000
--- a/recipes/xorg-util/util-macros_1.11.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require util-macros.inc
-PR = "${INC_PR}.0"
-SRC_URI[archive.md5sum] = "8580021f3a9e242ab09d23d62e475d53"
-SRC_URI[archive.sha256sum] = "212c3d14474d7cffdbc22437d4896211a5dce6b99b02b96229c9be7d963c90cf"
diff --git a/recipes/xorg-xserver/xserver-xorg-1.9.4/dolt-fix.patch b/recipes/xorg-xserver/xserver-xorg-1.9.4/dolt-fix.patch
deleted file mode 100644
index e332ce0..0000000
--- a/recipes/xorg-xserver/xserver-xorg-1.9.4/dolt-fix.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Index: xorg-server/m4/dolt.m4
-===================================================================
---- xorg-server.orig/m4/dolt.m4	2009-04-14 21:14:56.000000000 +0400
-+++ xorg-server/m4/dolt.m4	2009-07-15 12:38:33.796848843 +0400
-@@ -147,7 +147,7 @@
-     cat <<__DOLTLIBTOOL__EOF__ > doltlibtool
- #!$DOLT_BASH
- __DOLTLIBTOOL__EOF__
--    cat <<'__DOLTLIBTOOL__EOF__' >>doltlibtool
-+    cat <<'__DOLTLIBTOOL__EOF__' | sed -e "s/@host_alias@/$host_alias/g" >>doltlibtool
- top_builddir_slash="${0%%doltlibtool}"
- : ${top_builddir_slash:=./}
- args=()
-@@ -163,7 +163,7 @@
- if $modeok && $tagok ; then
-     . ${top_builddir_slash}doltcompile "${args@<:@@@:>@}"
- else
--    exec ${top_builddir_slash}libtool "$[]@"
-+    exec ${top_builddir_slash}@host_alias@-libtool "$[]@"
- fi
- __DOLTLIBTOOL__EOF__
- 
diff --git a/recipes/xorg-xserver/xserver-xorg-1.9.4/hack-assume-pixman-supports-overlapped-blt.patch b/recipes/xorg-xserver/xserver-xorg-1.9.4/hack-assume-pixman-supports-overlapped-blt.patch
deleted file mode 100644
index a947582..0000000
--- a/recipes/xorg-xserver/xserver-xorg-1.9.4/hack-assume-pixman-supports-overlapped-blt.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-diff --git a/fb/fbcopy.c b/fb/fbcopy.c
-index 07eb663..ba394b7 100644
---- a/fb/fbcopy.c
-+++ b/fb/fbcopy.c
-@@ -91,8 +91,7 @@ fbCopyNtoN (DrawablePtr	pSrcDrawable,
-     while (nbox--)
-     {
- #ifndef FB_ACCESS_WRAPPER /* pixman_blt() doesn't support accessors yet */
--	if (pm == FB_ALLONES && alu == GXcopy && !reverse &&
--	    !upsidedown)
-+	if (pm == FB_ALLONES && alu == GXcopy)
- 	{
- 	    if (!pixman_blt ((uint32_t *)src, (uint32_t *)dst, srcStride, dstStride, srcBpp, dstBpp,
- 			     (pbox->x1 + dx + srcXoff),
diff --git a/recipes/xorg-xserver/xserver-xorg-1.9.4/hack-fbdev-ignore-return-mode.patch b/recipes/xorg-xserver/xserver-xorg-1.9.4/hack-fbdev-ignore-return-mode.patch
deleted file mode 100644
index d3661cb..0000000
--- a/recipes/xorg-xserver/xserver-xorg-1.9.4/hack-fbdev-ignore-return-mode.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Ugly hack that prevents server termination with xf86-video-fbdev-0.4.1
-(and probably other) while returning from chvt or resume on some
-hardware (e. g. zaurus).
-
-Correct fix would require debugging of fbdev mode during LeaveVT and
-EnterVT.
-
-This patch may cause staying in incorrect or corrupted display mode
-after EnterVT, but on man affected devices it does not cause any visible
-problems.
-
-Hacked code is never called on properly written drivers.
-
-Devices affected and testers involved for future patch removal:
-Sharp Zaurus (spitz/akita): Stanislav Brabec <utx@penguin.cz>
-
-See also:
-https://bugzilla.redhat.com/show_bug.cgi?id=238451
-
-The bug (first line indicates that your device is affected):
-
-(EE) FBDEV(0): FBIOPUT_VSCREENINFO succeeded but modified mode
-
-Fatal server error:
-EnterVT failed for screen 0
-
-Index: xorg-server-1.7.3/hw/xfree86/fbdevhw/fbdevhw.c
-===================================================================
---- xorg-server-1.7.3.orig/hw/xfree86/fbdevhw/fbdevhw.c
-+++ xorg-server-1.7.3/hw/xfree86/fbdevhw/fbdevhw.c
-@@ -571,7 +571,7 @@ fbdevHWSetMode(ScrnInfoPtr pScrn, Displa
- #if DEBUG
- 		print_fbdev_mode("returned", &set_var);
- #endif
--		return FALSE;
-+		/* return FALSE; UGLY HACK to allow return from chvt */
- 	}
- 
- 	if (!check)
diff --git a/recipes/xorg-xserver/xserver-xorg-1.9.4/randr-support.patch b/recipes/xorg-xserver/xserver-xorg-1.9.4/randr-support.patch
deleted file mode 100644
index abc7db4..0000000
--- a/recipes/xorg-xserver/xserver-xorg-1.9.4/randr-support.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-diff -uNr xorg-server-1.9.0.orig//hw/xfree86/common/xf86Xinput.c xorg-server-1.9.0/hw/xfree86/common/xf86Xinput.c
---- xorg-server-1.9.0.orig//hw/xfree86/common/xf86Xinput.c	2010-08-13 07:53:48.000000000 +0200
-+++ xorg-server-1.9.0/hw/xfree86/common/xf86Xinput.c	2010-08-28 21:31:10.000000000 +0200
-@@ -106,6 +106,8 @@
- 
- #include "os.h"
- 
-+#define RR_Rotate_All    (RR_Rotate_0|RR_Rotate_90|RR_Rotate_180|RR_Rotate_270)
-+
- EventListPtr xf86Events = NULL;
- 
- /**
-@@ -1359,4 +1361,73 @@
-     EnableDevice(dev, TRUE);
- }
- 
-+/* Taken from evdev-properties.h. */
-+#define EVDEV_PROP_SWAP_AXES "Evdev Axes Swap"
-+#define EVDEV_PROP_INVERT_AXES "Evdev Axis Inversion"
-+
-+/* This is a hack until we get device -> CRTC association. */
-+void
-+xf86InputRotationNotify(Rotation rotation)
-+{
-+    DeviceIntPtr dev;
-+    LocalDevicePtr local;
-+    int ret;
-+    int swap_axes = 0;
-+    CARD8 invert[2] = { 0, 0 };
-+    static Atom prop_swap = 0, prop_invert = 0;
-+    static int atom_generation = -1;
-+    
-+    if (atom_generation != serverGeneration) {
-+        prop_swap = 0;
-+        prop_invert = 0;
-+    }
-+
-+    switch (rotation & RR_Rotate_All) {
-+    case RR_Rotate_0:
-+        swap_axes = 1;
-+        invert[0] = 0;
-+ 	 invert[1] = 0;
-+        break;
-+    case RR_Rotate_90:
-+        swap_axes = 0;
-+        invert[0] = 0;
-+ 	 invert[1] = 1;
-+        break;
-+    case RR_Rotate_180:
-+        swap_axes = 1;
-+        invert[0] = 0;
-+        invert[1] = 0;
-+        break;
-+    case RR_Rotate_270:
-+        swap_axes = 0;
-+        invert[0] = 0;
-+ 	 invert[1] = 1;
-+        break;
-+    }
-+
-+    if (!prop_swap)
-+        prop_swap = MakeAtom(EVDEV_PROP_SWAP_AXES,
-+                             strlen(EVDEV_PROP_SWAP_AXES), TRUE);
-+    if (!prop_invert)
-+        prop_invert = MakeAtom(EVDEV_PROP_INVERT_AXES,
-+                               strlen(EVDEV_PROP_INVERT_AXES), TRUE);
-+
-+    for (dev = inputInfo.devices; dev; dev = dev->next) {
-+        local = dev->public.devicePrivate;
-+        ret = XIChangeDeviceProperty(dev, prop_swap, XA_INTEGER, 8,
-+                                     PropModeReplace, 1, &swap_axes, FALSE);
-+        if (ret != Success) {
-+            xf86Msg(X_ERROR, "Changing swap_xy property failed!\n");
-+            continue;
-+        }
-+        ret = XIChangeDeviceProperty(dev, prop_invert, XA_INTEGER, 8,
-+                                     PropModeReplace, 2, invert, FALSE);
-+        if (ret != Success) {
-+            xf86Msg(X_ERROR, "Changing invert property failed!\n");
-+            continue;
-+        }
-+    }
-+}
-+
-+
- /* end of xf86Xinput.c */
-diff -uNr xorg-server-1.9.0.orig//hw/xfree86/modes/xf86Crtc.c xorg-server-1.9.0/hw/xfree86/modes/xf86Crtc.c
---- xorg-server-1.9.0.orig//hw/xfree86/modes/xf86Crtc.c	2010-07-20 05:24:12.000000000 +0200
-+++ xorg-server-1.9.0/hw/xfree86/modes/xf86Crtc.c	2010-08-28 21:28:48.000000000 +0200
-@@ -387,6 +387,12 @@
-     if (didLock)
- 	crtc->funcs->unlock (crtc);
- 
-+    /*
-+     * Rotate Touchscreen
-+     */
-+    xf86InputRotationNotify(crtc->rotation);
-+
-+    
-     return ret;
- }
- 
diff --git a/recipes/xorg-xserver/xserver-xorg_1.9.4.bb b/recipes/xorg-xserver/xserver-xorg_1.9.4.bb
deleted file mode 100644
index 89e7a03..0000000
--- a/recipes/xorg-xserver/xserver-xorg_1.9.4.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-# Assign it here, since the hal->udev transition happens post 1.7 in angstrom
-DISTRO_XORG_CONFIG_MANAGER_angstrom = "udev"
-
-require xorg-xserver-common.inc
-
-DESCRIPTION = "the X.Org X server"
-DEPENDS += "pixman libpciaccess openssl dri2proto glproto xorg-minimal-fonts font-util-native"
-PE = "2"
-PR = "${INC_PR}.0"
-
-SRC_URI += " \
-            file://dolt-fix.patch \
-            file://randr-support.patch \
-            file://hack-fbdev-ignore-return-mode.patch \
-            file://hack-assume-pixman-supports-overlapped-blt.patch \
-           "
-SRC_URI[archive.md5sum] = "040f091dfdfb4e335116eb0032cc690b"
-SRC_URI[archive.sha256sum] = "ad11047ebba58f2e37b03c70c986db3ea0cc0f1a19d2d3612713ab77b8ec2458"
-
-do_install_prepend() {
-        mkdir -p ${D}/${libdir}/X11/fonts
-}
-
-# The NVidia driver requires Xinerama support in the X server. Ion uses it.
-PACKAGE_ARCH_ion = "${MACHINE_ARCH}"
-XINERAMA = "${@['--disable-xinerama','--enable-xinerama'][bb.data.getVar('MACHINE',d) in ['ion']]}"
-
-EXTRA_OECONF += " ${CONFIG_MANAGER_OPTION} ${XINERAMA} --disable-kdrive --disable-xephyr --disable-xsdl --disable-xfake --disable-xfbdev --disable-dmx"
-EXTRA_OECONF += " --enable-dri2 --disable-unit-tests --disable-docs --disable-devel-docs"
-
-export LDFLAGS += " -ldl "
-- 
1.7.4.1



