Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 93BB16B41A
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Aug 2013 13:08:43 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c1so781592eek.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Aug 2013 06:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=ttyeIE9AmE1pHg7g3TxDrz7cOpQqerF/NLCoxx3kCXQ=;
	b=spZZxGah1bF5U9bjpW1nDJWlSNGVGqRgcwkzGRcCDGX55IFd7ZOxbsLbQ1yhRAvADX
	/O3Kgs7Sf2zvwjYTorw6IfLbkElgk9d+9gxovd0NLcLAy3QOOXdkegaZuXaH9VootNfl
	VLLXKnknAxD3YWae0qnl6/Yfwd0Nlp7ZjNIlvYK4eEEAHEB1poYyCgc/WxcmFs0MxJIw
	sVspjjE9sh2Hh4Zlg9XN3/Bw0ZFyfqj71XB60JX+ttfu5uVu6S22E1zoP4aomKL0o4mY
	CJ393MXE/qoO5Da5T0LdcrEqRlR5x/l6sldeOZ2fAVXgVDLhbNQ84NpAKN+yiAw5Bxcn
	95ag==
X-Received: by 10.15.54.67 with SMTP id s43mr9456217eew.133.1375535323904;
	Sat, 03 Aug 2013 06:08:43 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a4sm19321351eez.0.2013.08.03.06.08.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 03 Aug 2013 06:08:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 Aug 2013 15:09:11 +0200
Message-Id: <1375535352-23015-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1375535352-23015-1-git-send-email-Martin.Jansa@gmail.com>
References: <1375535352-23015-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 3/4] efl: drop .inc and _svn.bb files for libs included in efl.git
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
X-List-Received-Date: Sat, 03 Aug 2013 13:08:44 -0000

* in preparation for merged source dir in efl.git I don't plan to support newer SRCREVs from subversion
* drop INC_PR and fold lib.inc into the recipe

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/ecore.inc                 | 114 --------
 ...75297-Add-ifdef-ECORE_XRANDR-around-the-e.patch | 287 +++++++++++++++++++++
 meta-efl/recipes-efl/efl/ecore_1.7.8.bb            | 115 ++++++++-
 meta-efl/recipes-efl/efl/ecore_svn.bb              |  14 -
 meta-efl/recipes-efl/efl/edje.inc                  |  66 -----
 meta-efl/recipes-efl/efl/edje_1.7.8.bb             |  66 ++++-
 meta-efl/recipes-efl/efl/edje_svn.bb               |  13 -
 meta-efl/recipes-efl/efl/eet.inc                   |  24 --
 meta-efl/recipes-efl/efl/eet_1.7.8.bb              |  24 +-
 meta-efl/recipes-efl/efl/eet_svn.bb                |  13 -
 meta-efl/recipes-efl/efl/eeze.inc                  |  17 --
 meta-efl/recipes-efl/efl/eeze_1.7.8.bb             |  17 +-
 meta-efl/recipes-efl/efl/eeze_svn.bb               |  13 -
 meta-efl/recipes-efl/efl/efreet.inc                |  17 --
 meta-efl/recipes-efl/efl/efreet_1.7.8.bb           |  16 +-
 meta-efl/recipes-efl/efl/efreet_svn.bb             |  13 -
 meta-efl/recipes-efl/efl/eina.inc                  |  13 -
 meta-efl/recipes-efl/efl/eina_1.7.8.bb             |  13 +-
 meta-efl/recipes-efl/efl/eina_svn.bb               |  13 -
 meta-efl/recipes-efl/efl/eio.inc                   |   9 -
 meta-efl/recipes-efl/efl/eio_1.7.8.bb              |   9 +-
 meta-efl/recipes-efl/efl/eio_svn.bb                |  13 -
 meta-efl/recipes-efl/efl/embryo.inc                |  14 -
 meta-efl/recipes-efl/efl/embryo_1.7.8.bb           |  14 +-
 meta-efl/recipes-efl/efl/embryo_svn.bb             |  13 -
 meta-efl/recipes-efl/efl/emotion.inc               |  17 --
 meta-efl/recipes-efl/efl/emotion_1.7.8.bb          |  16 +-
 meta-efl/recipes-efl/efl/emotion_svn.bb            |  13 -
 meta-efl/recipes-efl/efl/ethumb.inc                |  22 --
 meta-efl/recipes-efl/efl/ethumb_1.7.8.bb           |  21 +-
 meta-efl/recipes-efl/efl/ethumb_svn.bb             |  13 -
 meta-efl/recipes-efl/efl/evas.inc                  | 168 ------------
 meta-efl/recipes-efl/efl/evas_1.7.8.bb             | 168 +++++++++++-
 meta-efl/recipes-efl/efl/evas_svn.bb               |  13 -
 34 files changed, 755 insertions(+), 636 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/efl/ecore.inc
 create mode 100644 meta-efl/recipes-efl/efl/ecore/0001-Backport-aa75297-Add-ifdef-ECORE_XRANDR-around-the-e.patch
 delete mode 100644 meta-efl/recipes-efl/efl/ecore_svn.bb
 delete mode 100644 meta-efl/recipes-efl/efl/edje.inc
 delete mode 100644 meta-efl/recipes-efl/efl/edje_svn.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eet.inc
 delete mode 100644 meta-efl/recipes-efl/efl/eet_svn.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eeze.inc
 delete mode 100644 meta-efl/recipes-efl/efl/eeze_svn.bb
 delete mode 100644 meta-efl/recipes-efl/efl/efreet.inc
 delete mode 100644 meta-efl/recipes-efl/efl/efreet_svn.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eina.inc
 delete mode 100644 meta-efl/recipes-efl/efl/eina_svn.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eio.inc
 delete mode 100644 meta-efl/recipes-efl/efl/eio_svn.bb
 delete mode 100644 meta-efl/recipes-efl/efl/embryo.inc
 delete mode 100644 meta-efl/recipes-efl/efl/embryo_svn.bb
 delete mode 100644 meta-efl/recipes-efl/efl/emotion.inc
 delete mode 100644 meta-efl/recipes-efl/efl/emotion_svn.bb
 delete mode 100644 meta-efl/recipes-efl/efl/ethumb.inc
 delete mode 100644 meta-efl/recipes-efl/efl/ethumb_svn.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas.inc
 delete mode 100644 meta-efl/recipes-efl/efl/evas_svn.bb

diff --git a/meta-efl/recipes-efl/efl/ecore.inc b/meta-efl/recipes-efl/efl/ecore.inc
deleted file mode 100644
index fd75a00..0000000
--- a/meta-efl/recipes-efl/efl/ecore.inc
+++ /dev/null
@@ -1,114 +0,0 @@
-DESCRIPTION = "Ecore is the Enlightenment application framework library"
-LICENSE = "MIT BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d6ff2c3c85de2faf5fd7dcd9ccfc8886"
-DEPENDS = "virtual/libiconv tslib curl eet evas glib-2.0 gnutls \
-           libxtst libxcomposite libxinerama libxscrnsaver libxdamage libxrandr libxcursor libxfixes"
-DEPENDS_virtclass-native = "eet-native evas-native gettext-native"
-# optional
-# DEPENDS += "directfb virtual/libsdl openssl virtual/libiconv"
-
-inherit efl gettext
-
-BBCLASSEXTEND = "native"
-INC_PR = "r2"
-
-do_configure_prepend() {
-    touch ${S}/po/Makefile.in.in || true
-    sed -i -e 's: po::g' ${S}/Makefile.am
-}
-
-FILESPATHPKG =. "${BPN}-${PV}:${BPN}:"
-
-PACKAGES =+ "\
-    ${PN}-con \
-    ${PN}-config \
-    ${PN}-desktop \
-    ${PN}-directfb \
-    ${PN}-sdl \
-    ${PN}-evas \
-    ${PN}-fb \
-    ${PN}-file \
-    ${PN}-imf-evas \
-    ${PN}-imf \
-    ${PN}-ipc \
-    ${PN}-job \
-    ${PN}-txt \
-    ${PN}-x \
-    ${PN}-input \
-"
-# Some upgrade path tweaking
-AUTO_LIBNAME_PKGS = ""
-
-FILES_${PN} = "${libdir}/libecore*.so.* \
-    ${bindir} \
-"
-FILES_${PN}-con = "${libdir}/libecore_con*.so.*"
-FILES_${PN}-config = "${libdir}/libecore_config*.so.*"
-FILES_${PN}-desktop = "${libdir}/libecore_desktop*.so.*"
-FILES_${PN}-directfb = "${libdir}/libecore_directfb*.so.*"
-FILES_${PN}-sdl = "${libdir}/libecore_sdl*.so.*"
-FILES_${PN}-evas = "${libdir}/libecore_evas*.so.*"
-FILES_${PN}-fb = "${libdir}/libecore_fb*.so.*"
-FILES_${PN}-file = "${libdir}/libecore_file*.so.*"
-FILES_${PN}-imf = "${libdir}/libecore_imf*.so.* \
-    ${libdir}/ecore/immodules/*.so \
-"
-FILES_${PN}-imf-evas = "${libdir}/libecore_imf_evas*.so.*"
-FILES_${PN}-ipc = "${libdir}/libecore_ipc*.so.*"
-FILES_${PN}-job = "${libdir}/libecore_job*.so.*"
-FILES_${PN}-txt = "${libdir}/libecore_txt*.so.*"
-FILES_${PN}-x = "${libdir}/libecore_x*.so.*"
-FILES_${PN}-input = "${libdir}/libecore_input*.so.*"
-
-ECORE_OECONF = "\
-    --x-includes=${STAGING_INCDIR}/X11 \
-    --x-libraries=${STAGING_LIBDIR} \
-    --enable-simple-x11 \
-    --enable-ecore-config \
-    --enable-ecore-x \
-    --enable-ecore-job \
-    --enable-ecore-fb \
-    --enable-ecore-evas \
-    --enable-ecore-evas-software-16-x11 \
-    --enable-ecore-evas-xrender \
-    --enable-abstract-sockets \
-    --enable-ecore-con \
-    --enable-ecore-ipc \
-    --enable-ecore-file \
-    --enable-inotify \
-    --disable-ecore-desktop \
-    --disable-ecore-x-xcb \
-    --disable-ecore-x-xprint \
-    --disable-ecore-directfb \
-    --disable-ecore-sdl \
-    --enable-ecore-evas-opengl-x11 \
-    --disable-ecore-evas-dfb \
-    --disable-ecore-evas-sdl \
-    --disable-openssl \
-    --disable-poll \
-    --enable-xim \
-"
-
-EXTRA_OECONF = "${ECORE_OECONF} \
-                 --enable-curl \
-"
-
-EXTRA_OECONF_virtclass-native = "\
-                 ${ECORE_OECONF} \
-                 --disable-curl \
-                 --disable-ecore-x-composite \
-                 --disable-ecore-x-damage \
-                 --disable-ecore-x-dpms \
-                 --disable-ecore-x-randr \
-                 --disable-ecore-x-render \
-                 --disable-ecore-x-screensaver \
-                 --disable-ecore-x-shape \
-                 --disable-ecore-x-sync \
-                 --disable-ecore-x-xfixes \
-                 --disable-ecore-x-xinerama \
-                 --disable-ecore-x-xprint \
-                 --disable-ecore-x-xtest \
-                 --disable-ecore-x-cursor \
-                 --disable-ecore-x-input \
-                 --disable-ecore-x-dri \
-"
diff --git a/meta-efl/recipes-efl/efl/ecore/0001-Backport-aa75297-Add-ifdef-ECORE_XRANDR-around-the-e.patch b/meta-efl/recipes-efl/efl/ecore/0001-Backport-aa75297-Add-ifdef-ECORE_XRANDR-around-the-e.patch
new file mode 100644
index 0000000..c23c300
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/ecore/0001-Backport-aa75297-Add-ifdef-ECORE_XRANDR-around-the-e.patch
@@ -0,0 +1,287 @@
+From 27cd63650ce7ef98934cdb51df1c94db25d0ffc3 Mon Sep 17 00:00:00 2001
+From: Chris Michael <cp.michael@samsung.com>
+Date: Thu, 1 Aug 2013 15:18:01 +0100
+Subject: [PATCH] Backport: aa75297 : Add #ifdef ECORE_XRANDR around the edid
+ functions.
+
+NB: Cannot really happen for 1.8 (as --disable-ecore-x-randr has no
+effect), but really these should have been ifdef'd from the start.
+
+NB: IMO, Don't think a ChangeLog is really needed for this....
+
+Signed-off-by: Chris Michael <cp.michael@samsung.com>
+Signed-off-by: Deon Thomas <PrinceAMD.Elive@gmail.com>
+---
+ src/lib/ecore_x/xlib/ecore_x_randr.c | 60 +++++++++++++++++++++++++++++++-----
+ 1 file changed, 52 insertions(+), 8 deletions(-)
+
+diff --git a/src/lib/ecore_x/xlib/ecore_x_randr.c b/src/lib/ecore_x/xlib/ecore_x_randr.c
+index 1ccb5e5..9d80ac0 100644
+--- a/src/lib/ecore_x/xlib/ecore_x_randr.c
++++ b/src/lib/ecore_x/xlib/ecore_x_randr.c
+@@ -3374,6 +3374,7 @@ ecore_x_randr_edid_has_valid_header(unsigned char *edid, unsigned long edid_leng
+ EAPI Eina_Bool 
+ ecore_x_randr_edid_info_has_valid_checksum(unsigned char *edid, unsigned long edid_length)
+ {
++#ifdef ECORE_XRANDR
+    unsigned char *iter = NULL;
+    char sum = 0;
+    int i = 0, version = 0;
+@@ -3400,11 +3401,15 @@ ecore_x_randr_edid_info_has_valid_checksum(unsigned char *edid, unsigned long ed
+ 
+    if (sum) return EINA_FALSE;
+    return EINA_TRUE;
++#else
++   return EINA_FALSE;
++#endif
+ }
+ 
+ EAPI int 
+ ecore_x_randr_edid_version_get(unsigned char *edid, unsigned long edid_length)
+ {
++#ifdef ECORE_XRANDR
+    if ((edid_length > RANDR_EDID_VERSION_MINOR) && 
+        (ecore_x_randr_edid_has_valid_header(edid, edid_length)))
+      {
+@@ -3413,11 +3418,15 @@ ecore_x_randr_edid_version_get(unsigned char *edid, unsigned long edid_length)
+      }
+ 
+    return ECORE_X_RANDR_EDID_UNKNOWN_VALUE;
++#else
++   return 0;
++#endif
+ }
+ 
+ EAPI char *
+ ecore_x_randr_edid_manufacturer_name_get(unsigned char *edid, unsigned long edid_length)
+ {
++#ifdef ECORE_XRANDR
+    if ((edid_length > RANDR_EDID_MANUFACTURER + 1) && 
+        (ecore_x_randr_edid_has_valid_header(edid, edid_length)))
+      {
+@@ -3434,13 +3443,14 @@ ecore_x_randr_edid_manufacturer_name_get(unsigned char *edid, unsigned long edid
+ 
+         return name;
+      }
+-
++#endif
+    return NULL;
+ }
+ 
+ EAPI char *
+ ecore_x_randr_edid_display_name_get(unsigned char *edid, unsigned long edid_length)
+ {
++#ifdef ECORE_XRANDR
+    unsigned char *block = NULL;
+    int version = 0;
+ 
+@@ -3469,13 +3479,14 @@ ecore_x_randr_edid_display_name_get(unsigned char *edid, unsigned long edid_leng
+                }
+           }
+      }
+-
++#endif
+    return NULL;
+ }
+ 
+ EAPI char *
+ ecore_x_randr_edid_display_ascii_get(unsigned char *edid, unsigned long edid_length)
+ {
++#ifdef ECORE_XRANDR
+    unsigned char *block = NULL;
+    int version = 0;
+ 
+@@ -3504,13 +3515,14 @@ ecore_x_randr_edid_display_ascii_get(unsigned char *edid, unsigned long edid_len
+                }
+           }
+      }
+-
++#endif
+    return NULL;
+ }
+ 
+ EAPI char *
+ ecore_x_randr_edid_display_serial_get(unsigned char *edid, unsigned long edid_length)
+ {
++#ifdef ECORE_XRANDR
+    unsigned char *block = NULL;
+    int version = 0;
+ 
+@@ -3539,7 +3551,7 @@ ecore_x_randr_edid_display_serial_get(unsigned char *edid, unsigned long edid_le
+                }
+           }
+      }
+-
++#endif
+    return NULL;
+ }
+ 
+@@ -3552,77 +3564,90 @@ ecore_x_randr_edid_model_get(unsigned char *edid, unsigned long edid_length)
+ EAPI int 
+ ecore_x_randr_edid_manufacturer_serial_number_get(unsigned char *edid, unsigned long edid_length)
+ {
++#ifdef ECORE_XRANDR
+    if ((edid_length > RANDR_EDID_MANUFACTURER + 1) && 
+        (ecore_x_randr_edid_has_valid_header(edid, edid_length)))
+      return (int)(edid[0x0c] + (edid[0x0d] << 8) + 
+                   (edid[0x0e] << 16) + (edid[0x0f] << 24));
+ 
+    return ECORE_X_RANDR_EDID_UNKNOWN_VALUE;
++#else
++   return 0;
++#endif
+ }
+ 
+ EAPI int 
+ ecore_x_randr_edid_manufacturer_model_get(unsigned char *edid, unsigned long edid_length)
+ {
++#ifdef ECORE_XRANDR
+    if ((edid_length > RANDR_EDID_MANUFACTURER + 1) && 
+        (ecore_x_randr_edid_has_valid_header(edid, edid_length)))
+      return (int)(edid[0x0a] + (edid[0x0b] << 8));
+-
++#endif
+    return ECORE_X_RANDR_EDID_UNKNOWN_VALUE;
+ }
+ 
+ EAPI Eina_Bool 
+ ecore_x_randr_edid_dpms_available_get(unsigned char *edid, unsigned long edid_length)
+ {
++#ifdef ECORE_XRANDR
+    int version = 0;
+ 
+    version = ecore_x_randr_edid_version_get(edid, edid_length);
+    if (version < RANDR_EDID_VERSION_1_3) return EINA_FALSE;
+ 
+    return !!(edid[0x18] & 0xE0);
++#else
++   return EINA_FALSE;
++#endif
+ }
+ 
+ EAPI Eina_Bool 
+ ecore_x_randr_edid_dpms_standby_available_get(unsigned char *edid, unsigned long edid_length)
+ {
++#ifdef ECORE_XRANDR
+    int version = 0;
+ 
+    version = ecore_x_randr_edid_version_get(edid, edid_length);
+    if (version < RANDR_EDID_VERSION_1_3) return EINA_FALSE;
+ 
+    if (edid[0x18] & 0xE0) return !!(edid[0x18] & 0x80);
+-
++#endif
+    return EINA_FALSE;
+ }
+ 
+ EAPI Eina_Bool 
+ ecore_x_randr_edid_dpms_suspend_available_get(unsigned char *edid, unsigned long edid_length)
+ {
++#ifdef ECORE_XRANDR
+    int version = 0;
+ 
+    version = ecore_x_randr_edid_version_get(edid, edid_length);
+    if (version < RANDR_EDID_VERSION_1_3) return EINA_FALSE;
+ 
+    if (edid[0x18] & 0xE0) return !!(edid[0x18] & 0x40);
+-
++#endif
+    return EINA_FALSE;
+ }
+ 
+ EAPI Eina_Bool 
+ ecore_x_randr_edid_dpms_off_available_get(unsigned char *edid, unsigned long edid_length)
+ {
++#ifdef ECORE_XRANDR
+    int version = 0;
+ 
+    version = ecore_x_randr_edid_version_get(edid, edid_length);
+    if (version < RANDR_EDID_VERSION_1_3) return EINA_FALSE;
+ 
+    if (edid[0x18] & 0xE0) return !!(edid[0x18] & 0x20);
+-
++#endif
+    return EINA_FALSE;
+ }
+ 
+ EAPI Ecore_X_Randr_Edid_Aspect_Ratio 
+ ecore_x_randr_edid_display_aspect_ratio_preferred_get(unsigned char *edid, unsigned long edid_length)
+ {
++#ifdef ECORE_XRANDR
+    unsigned char *block = NULL;
+    int version = 0;
+ 
+@@ -3660,11 +3685,15 @@ ecore_x_randr_edid_display_aspect_ratio_preferred_get(unsigned char *edid, unsig
+      }
+ 
+    return ECORE_X_RANDR_EDID_UNKNOWN_VALUE;
++#else
++   return 0;
++#endif
+ }
+ 
+ EAPI Ecore_X_Randr_Edid_Aspect_Ratio 
+ ecore_x_randr_edid_display_aspect_ratios_get(unsigned char *edid, unsigned long edid_length)
+ {
++#ifdef ECORE_XRANDR
+    Ecore_X_Randr_Edid_Aspect_Ratio ret;
+    unsigned char *block = NULL;
+    int version = 0;
+@@ -3697,11 +3726,15 @@ ecore_x_randr_edid_display_aspect_ratios_get(unsigned char *edid, unsigned long
+      }
+ 
+    return ret;
++#else
++   return 0;
++#endif
+ }
+ 
+ EAPI Ecore_X_Randr_Edid_Display_Colorscheme 
+ ecore_x_randr_edid_display_colorscheme_get(unsigned char *edid, unsigned long edid_length)
+ {
++#ifdef ECORE_XRANDR
+    Ecore_X_Randr_Edid_Display_Colorscheme ret;
+    int version = 0;
+ 
+@@ -3723,22 +3756,30 @@ ecore_x_randr_edid_display_colorscheme_get(unsigned char *edid, unsigned long ed
+      ret = (edid[0x18] & 0x18);
+ 
+    return ret;
++#else
++   return 0;
++#endif
+ }
+ 
+ EAPI Eina_Bool 
+ ecore_x_randr_edid_display_type_digital_get(unsigned char *edid, unsigned long edid_length)
+ {
++#ifdef ECORE_XRANDR
+    int version = 0;
+ 
+    version = ecore_x_randr_edid_version_get(edid, edid_length);
+    if (version < RANDR_EDID_VERSION_1_3) return EINA_FALSE;
+ 
+    return !!(edid[0x14] & 0x80);
++#else
++   return EINA_FALSE;
++#endif
+ }
+ 
+ EAPI Ecore_X_Randr_Edid_Display_Interface_Type 
+ ecore_x_randr_edid_display_interface_type_get(unsigned char *edid, unsigned long edid_length)
+ {
++#ifdef ECORE_XRANDR
+    Ecore_X_Randr_Edid_Display_Interface_Type type;
+    int version = 0;
+ 
+@@ -3753,4 +3794,7 @@ ecore_x_randr_edid_display_interface_type_get(unsigned char *edid, unsigned long
+      type = ECORE_X_RANDR_EDID_UNKNOWN_VALUE;
+ 
+    return type;
++#else
++   return 0;
++#endif
+ }
+-- 
+1.8.3.2
+
diff --git a/meta-efl/recipes-efl/efl/ecore_1.7.8.bb b/meta-efl/recipes-efl/efl/ecore_1.7.8.bb
index ccd5d97..6f587d0 100644
--- a/meta-efl/recipes-efl/efl/ecore_1.7.8.bb
+++ b/meta-efl/recipes-efl/efl/ecore_1.7.8.bb
@@ -1,8 +1,121 @@
-require ${BPN}.inc
+DESCRIPTION = "Ecore is the Enlightenment application framework library"
+LICENSE = "MIT BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d6ff2c3c85de2faf5fd7dcd9ccfc8886"
+DEPENDS = "virtual/libiconv tslib curl eet evas glib-2.0 gnutls \
+           libxtst libxcomposite libxinerama libxscrnsaver libxdamage libxrandr libxcursor libxfixes"
+DEPENDS_virtclass-native = "eet-native evas-native gettext-native"
+# optional
+# DEPENDS += "directfb virtual/libsdl openssl virtual/libiconv"
+
+inherit efl gettext
+
+BBCLASSEXTEND = "native"
+
+do_configure_prepend() {
+    touch ${S}/po/Makefile.in.in || true
+    sed -i -e 's: po::g' ${S}/Makefile.am
+}
+
+FILESPATHPKG =. "${BPN}-${PV}:${BPN}:"
+
+PACKAGES =+ "\
+    ${PN}-con \
+    ${PN}-config \
+    ${PN}-desktop \
+    ${PN}-directfb \
+    ${PN}-sdl \
+    ${PN}-evas \
+    ${PN}-fb \
+    ${PN}-file \
+    ${PN}-imf-evas \
+    ${PN}-imf \
+    ${PN}-ipc \
+    ${PN}-job \
+    ${PN}-txt \
+    ${PN}-x \
+    ${PN}-input \
+"
+# Some upgrade path tweaking
+AUTO_LIBNAME_PKGS = ""
+
+FILES_${PN} = "${libdir}/libecore*.so.* \
+    ${bindir} \
+"
+FILES_${PN}-con = "${libdir}/libecore_con*.so.*"
+FILES_${PN}-config = "${libdir}/libecore_config*.so.*"
+FILES_${PN}-desktop = "${libdir}/libecore_desktop*.so.*"
+FILES_${PN}-directfb = "${libdir}/libecore_directfb*.so.*"
+FILES_${PN}-sdl = "${libdir}/libecore_sdl*.so.*"
+FILES_${PN}-evas = "${libdir}/libecore_evas*.so.*"
+FILES_${PN}-fb = "${libdir}/libecore_fb*.so.*"
+FILES_${PN}-file = "${libdir}/libecore_file*.so.*"
+FILES_${PN}-imf = "${libdir}/libecore_imf*.so.* \
+    ${libdir}/ecore/immodules/*.so \
+"
+FILES_${PN}-imf-evas = "${libdir}/libecore_imf_evas*.so.*"
+FILES_${PN}-ipc = "${libdir}/libecore_ipc*.so.*"
+FILES_${PN}-job = "${libdir}/libecore_job*.so.*"
+FILES_${PN}-txt = "${libdir}/libecore_txt*.so.*"
+FILES_${PN}-x = "${libdir}/libecore_x*.so.*"
+FILES_${PN}-input = "${libdir}/libecore_input*.so.*"
+
+ECORE_OECONF = "\
+    --x-includes=${STAGING_INCDIR}/X11 \
+    --x-libraries=${STAGING_LIBDIR} \
+    --enable-simple-x11 \
+    --enable-ecore-config \
+    --enable-ecore-x \
+    --enable-ecore-job \
+    --enable-ecore-fb \
+    --enable-ecore-evas \
+    --enable-ecore-evas-software-16-x11 \
+    --enable-ecore-evas-xrender \
+    --enable-abstract-sockets \
+    --enable-ecore-con \
+    --enable-ecore-ipc \
+    --enable-ecore-file \
+    --enable-inotify \
+    --disable-ecore-desktop \
+    --disable-ecore-x-xcb \
+    --disable-ecore-x-xprint \
+    --disable-ecore-directfb \
+    --disable-ecore-sdl \
+    --enable-ecore-evas-opengl-x11 \
+    --disable-ecore-evas-dfb \
+    --disable-ecore-evas-sdl \
+    --disable-openssl \
+    --disable-poll \
+    --enable-xim \
+"
+
+EXTRA_OECONF = "${ECORE_OECONF} \
+                 --enable-curl \
+"
+
+EXTRA_OECONF_virtclass-native = "\
+                 ${ECORE_OECONF} \
+                 --disable-curl \
+                 --disable-ecore-x-composite \
+                 --disable-ecore-x-damage \
+                 --disable-ecore-x-dpms \
+                 --disable-ecore-x-randr \
+                 --disable-ecore-x-render \
+                 --disable-ecore-x-screensaver \
+                 --disable-ecore-x-shape \
+                 --disable-ecore-x-sync \
+                 --disable-ecore-x-xfixes \
+                 --disable-ecore-x-xinerama \
+                 --disable-ecore-x-xprint \
+                 --disable-ecore-x-xtest \
+                 --disable-ecore-x-cursor \
+                 --disable-ecore-x-input \
+                 --disable-ecore-x-dri \
+"
 
 SRC_URI = "\
     ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
     file://fix-ecore-fb-initialization.patch \
+    file://0001-Backport-aa75297-Add-ifdef-ECORE_XRANDR-around-the-e.patch \
 "
 
 SRC_URI[md5sum] = "5a8ca096d8c15647b2493d4664a4b895"
diff --git a/meta-efl/recipes-efl/efl/ecore_svn.bb b/meta-efl/recipes-efl/efl/ecore_svn.bb
deleted file mode 100644
index f421c2b..0000000
--- a/meta-efl/recipes-efl/efl/ecore_svn.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require ${BPN}.inc
-
-SRCREV = "${EFL_SRCREV}"
-PV = "1.7.4+svnr${SRCPV}"
-PR = "${INC_PR}.0"
-DEFAULT_PREFERENCE = "-1"
-
-SRCNAME_append = "-1.7"
-
-SRC_URI = "\
-    ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \
-    file://fix-ecore-fb-initialization.patch \
-"
-S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/edje.inc b/meta-efl/recipes-efl/efl/edje.inc
deleted file mode 100644
index b34453c..0000000
--- a/meta-efl/recipes-efl/efl/edje.inc
+++ /dev/null
@@ -1,66 +0,0 @@
-DESCRIPTION = "Edje is the Enlightenment graphical design & layout library"
-DEPENDS = "lua5.1 eet evas ecore embryo edje-native eina libsndfile1 eio"
-DEPENDS_virtclass-native = "lua5.1-native evas-native ecore-native eet-native embryo-native eina-native"
-DEPENDS_virtclass-nativesdk = "evas-native ecore-native eet-native embryo-native eina-native"
-# GPLv2 because of epp in PN-utils
-LICENSE = "MIT BSD GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c18cc221a14a84b033db27794dc36df8"
-
-inherit efl
-
-BBCLASSEXTEND = "native nativesdk"
-INC_PR = "r0"
-
-do_configure_prepend_virtclass-native() {
-    sed -i 's:EMBRYO_PREFIX"/bin:"${STAGING_BINDIR}:' ${S}/src/bin/edje_cc_out.c
-    sed -i 's: cpp -I: /usr/bin/cpp -I:' ${S}/src/bin/edje_cc_parse.c
-    sed -i 's:\"gcc -I:\"/usr/bin/gcc -I:' ${S}/src/bin/edje_cc_parse.c
-}
-# The new lua stuff is a bit broken...
-do_configure_append() {
-    for i in $(find "${S}" -name "Makefile") ; do
-        sed -i -e 's:-L/usr/local/lib::g'  $i
-    done
-}
-
-do_compile_append() {
-    sed -i -e s:local/::g -e 's:-L${STAGING_LIBDIR}::g' ${S}/edje.pc
-}
-
-# gain some extra performance at the expense of RAM - generally i'd say bad
-# and a possible source of bugs
-#EXTRA_OECONF = "--enable-edje-program-cache"
-
-# Since r44323 edje has a fixed-point mode
-require edje-fpu.inc
-EXTRA_OECONF += "${@get_edje_fpu_setting(bb, d)}"
-
-SNDFILE = "--enable-sndfile"
-SNDFILE_virtclass-native = "--disable-sndfile"
-SNDFILE_virtclass-nativesdk = "--disable-sndfile"
-EXTRA_OECONF += "${SNDFILE}"
-
-PACKAGES =+ "${PN}-utils"
-RDEPENDS_${PN}-utils = "cpp cpp-symlinks embryo-tests"
-
-RRECOMMENDS_${PN}-utils = "\
-    evas-saver-png \
-    evas-saver-jpeg \
-    evas-saver-eet \
-"
-
-DEBIAN_NOAUTONAME_${PN}-utils = "1"
-# Some upgrade path tweaking
-AUTO_LIBNAME_PKGS = ""
-
-FILES_${PN}-utils = "\
-    ${bindir}/edje_* \
-    ${bindir}/inkscape2edc \
-    ${libdir}/edje/utils/epp \
-    ${datadir}/edje/include/edje.inc \
-"
-
-FILES_${PN} += "${libdir}/${PN}/modules/*/*/module.so \
-                ${datadir}/mime/packages/edje.xml"
-FILES_${PN}-dev += "${libdir}/${PN}/modules/*/*/module.la"
-FILES_${PN}-dbg += "${libdir}/${PN}/modules/*/*/.debug"
diff --git a/meta-efl/recipes-efl/efl/edje_1.7.8.bb b/meta-efl/recipes-efl/efl/edje_1.7.8.bb
index ea3fc74..ed43c32 100644
--- a/meta-efl/recipes-efl/efl/edje_1.7.8.bb
+++ b/meta-efl/recipes-efl/efl/edje_1.7.8.bb
@@ -1,4 +1,68 @@
-require ${BPN}.inc
+DESCRIPTION = "Edje is the Enlightenment graphical design & layout library"
+DEPENDS = "lua5.1 eet evas ecore embryo edje-native eina libsndfile1 eio"
+DEPENDS_virtclass-native = "lua5.1-native evas-native ecore-native eet-native embryo-native eina-native"
+DEPENDS_virtclass-nativesdk = "evas-native ecore-native eet-native embryo-native eina-native"
+# GPLv2 because of epp in PN-utils
+LICENSE = "MIT BSD GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c18cc221a14a84b033db27794dc36df8"
+
+inherit efl
+
+BBCLASSEXTEND = "native nativesdk"
+
+do_configure_prepend_virtclass-native() {
+    sed -i 's:EMBRYO_PREFIX"/bin:"${STAGING_BINDIR}:' ${S}/src/bin/edje_cc_out.c
+    sed -i 's: cpp -I: /usr/bin/cpp -I:' ${S}/src/bin/edje_cc_parse.c
+    sed -i 's:\"gcc -I:\"/usr/bin/gcc -I:' ${S}/src/bin/edje_cc_parse.c
+}
+# The new lua stuff is a bit broken...
+do_configure_append() {
+    for i in $(find "${S}" -name "Makefile") ; do
+        sed -i -e 's:-L/usr/local/lib::g'  $i
+    done
+}
+
+do_compile_append() {
+    sed -i -e s:local/::g -e 's:-L${STAGING_LIBDIR}::g' ${S}/edje.pc
+}
+
+# gain some extra performance at the expense of RAM - generally i'd say bad
+# and a possible source of bugs
+#EXTRA_OECONF = "--enable-edje-program-cache"
+
+# Since r44323 edje has a fixed-point mode
+require edje-fpu.inc
+EXTRA_OECONF += "${@get_edje_fpu_setting(bb, d)}"
+
+SNDFILE = "--enable-sndfile"
+SNDFILE_virtclass-native = "--disable-sndfile"
+SNDFILE_virtclass-nativesdk = "--disable-sndfile"
+EXTRA_OECONF += "${SNDFILE}"
+
+PACKAGES =+ "${PN}-utils"
+RDEPENDS_${PN}-utils = "cpp cpp-symlinks embryo-tests"
+
+RRECOMMENDS_${PN}-utils = "\
+    evas-saver-png \
+    evas-saver-jpeg \
+    evas-saver-eet \
+"
+
+DEBIAN_NOAUTONAME_${PN}-utils = "1"
+# Some upgrade path tweaking
+AUTO_LIBNAME_PKGS = ""
+
+FILES_${PN}-utils = "\
+    ${bindir}/edje_* \
+    ${bindir}/inkscape2edc \
+    ${libdir}/edje/utils/epp \
+    ${datadir}/edje/include/edje.inc \
+"
+
+FILES_${PN} += "${libdir}/${PN}/modules/*/*/module.so \
+                ${datadir}/mime/packages/edje.xml"
+FILES_${PN}-dev += "${libdir}/${PN}/modules/*/*/module.la"
+FILES_${PN}-dbg += "${libdir}/${PN}/modules/*/*/.debug"
 
 SRC_URI = "\
     ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
diff --git a/meta-efl/recipes-efl/efl/edje_svn.bb b/meta-efl/recipes-efl/efl/edje_svn.bb
deleted file mode 100644
index 5b13b9e..0000000
--- a/meta-efl/recipes-efl/efl/edje_svn.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require ${BPN}.inc
-
-SRCREV = "${EFL_SRCREV}"
-PV = "1.7.4+svnr${SRCPV}"
-PR = "${INC_PR}.0"
-DEFAULT_PREFERENCE = "-1"
-
-SRCNAME_append = "-1.7"
-
-SRC_URI = "\
-    ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \
-"
-S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/eet.inc b/meta-efl/recipes-efl/efl/eet.inc
deleted file mode 100644
index a7864ec..0000000
--- a/meta-efl/recipes-efl/efl/eet.inc
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION = "EET is the Enlightenment data storage library"
-DEPENDS = "pkgconfig zlib jpeg openssl eina gnutls"
-LICENSE = "MIT BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=da947f414a2ca4323245f1abb1980953"
-
-inherit efl
-
-BBCLASSEXTEND = "native"
-INC_PR = "r0"
-
-EXTRA_OECONF = "\
-    --enable-openssl \
-    --enable-cypher \
-    --enable-signature \
-    --disable-coverage \
-    --enable-old-eet-file-format \
-    --disable-assert \
-"
-
-PACKAGES =+ "${PN}-utils"
-
-FILES_${PN}-utils = "\
-    ${bindir}/${PN} \
-"
diff --git a/meta-efl/recipes-efl/efl/eet_1.7.8.bb b/meta-efl/recipes-efl/efl/eet_1.7.8.bb
index df4d7c1..8258973 100644
--- a/meta-efl/recipes-efl/efl/eet_1.7.8.bb
+++ b/meta-efl/recipes-efl/efl/eet_1.7.8.bb
@@ -1,4 +1,26 @@
-require ${BPN}.inc
+DESCRIPTION = "EET is the Enlightenment data storage library"
+DEPENDS = "pkgconfig zlib jpeg openssl eina gnutls"
+LICENSE = "MIT BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=da947f414a2ca4323245f1abb1980953"
+
+inherit efl
+
+BBCLASSEXTEND = "native"
+
+EXTRA_OECONF = "\
+    --enable-openssl \
+    --enable-cypher \
+    --enable-signature \
+    --disable-coverage \
+    --enable-old-eet-file-format \
+    --disable-assert \
+"
+
+PACKAGES =+ "${PN}-utils"
+
+FILES_${PN}-utils = "\
+    ${bindir}/${PN} \
+"
 
 SRC_URI = "\
     ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
diff --git a/meta-efl/recipes-efl/efl/eet_svn.bb b/meta-efl/recipes-efl/efl/eet_svn.bb
deleted file mode 100644
index 5b13b9e..0000000
--- a/meta-efl/recipes-efl/efl/eet_svn.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require ${BPN}.inc
-
-SRCREV = "${EFL_SRCREV}"
-PV = "1.7.4+svnr${SRCPV}"
-PR = "${INC_PR}.0"
-DEFAULT_PREFERENCE = "-1"
-
-SRCNAME_append = "-1.7"
-
-SRC_URI = "\
-    ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \
-"
-S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/eeze.inc b/meta-efl/recipes-efl/efl/eeze.inc
deleted file mode 100644
index 5d523c9..0000000
--- a/meta-efl/recipes-efl/efl/eeze.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "Eeze is a library to simplify the use of devices"
-LICENSE = "MIT BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=315521fe061b6fd4290ef01db714a3c8"
-DEPENDS = "ecore eet udev"
-
-inherit efl
-
-BBCLASSEXTEND = "native"
-INC_PR = "r0"
-
-# Some upgrade path tweaking
-AUTO_LIBNAME_PKGS = ""
-
-FILES_${PN} += "${libdir}/enlightenment/utils/eeze_scanner"
-FILES_${PN}-dbg += "${libdir}/enlightenment/utils/.debug"
-
-RRECOMMENDS_${PN} += "eject"
diff --git a/meta-efl/recipes-efl/efl/eeze_1.7.8.bb b/meta-efl/recipes-efl/efl/eeze_1.7.8.bb
index bcf1c04..f081f33 100644
--- a/meta-efl/recipes-efl/efl/eeze_1.7.8.bb
+++ b/meta-efl/recipes-efl/efl/eeze_1.7.8.bb
@@ -1,4 +1,19 @@
-require ${BPN}.inc
+DESCRIPTION = "Eeze is a library to simplify the use of devices"
+LICENSE = "MIT BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=315521fe061b6fd4290ef01db714a3c8"
+DEPENDS = "ecore eet udev"
+
+inherit efl
+
+BBCLASSEXTEND = "native"
+
+# Some upgrade path tweaking
+AUTO_LIBNAME_PKGS = ""
+
+FILES_${PN} += "${libdir}/enlightenment/utils/eeze_scanner"
+FILES_${PN}-dbg += "${libdir}/enlightenment/utils/.debug"
+
+RRECOMMENDS_${PN} += "eject"
 
 SRC_URI = "\
     ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
diff --git a/meta-efl/recipes-efl/efl/eeze_svn.bb b/meta-efl/recipes-efl/efl/eeze_svn.bb
deleted file mode 100644
index 5b13b9e..0000000
--- a/meta-efl/recipes-efl/efl/eeze_svn.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require ${BPN}.inc
-
-SRCREV = "${EFL_SRCREV}"
-PV = "1.7.4+svnr${SRCPV}"
-PR = "${INC_PR}.0"
-DEFAULT_PREFERENCE = "-1"
-
-SRCNAME_append = "-1.7"
-
-SRC_URI = "\
-    ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \
-"
-S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/efreet.inc b/meta-efl/recipes-efl/efl/efreet.inc
deleted file mode 100644
index 6c68526..0000000
--- a/meta-efl/recipes-efl/efl/efreet.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "The Enlightenment freedesktop.org library"
-DEPENDS = "ecore"
-LICENSE = "MIT BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=9594ec75c5a57e71fccedcbe10dd3ef4"
-
-inherit efl gettext
-
-INC_PR = "r0"
-
-PACKAGES =+ "${PN}-mime ${PN}-trash"
-FILES_${PN}-mime = "${libdir}/libefreet_mime.so.*"
-FILES_${PN}-trash = "${libdir}/libefreet_trash.so.*"
-
-# efreet_desktop_cache_create is needed for e-wm start, don't include it in -tests
-FILES_${PN} += "${libdir}/efreet/efreet_desktop_cache_create \
-                ${libdir}/efreet/efreet_icon_cache_create \
-"
diff --git a/meta-efl/recipes-efl/efl/efreet_1.7.8.bb b/meta-efl/recipes-efl/efl/efreet_1.7.8.bb
index d1eadb7..e7abdaa 100644
--- a/meta-efl/recipes-efl/efl/efreet_1.7.8.bb
+++ b/meta-efl/recipes-efl/efl/efreet_1.7.8.bb
@@ -1,4 +1,18 @@
-require ${BPN}.inc
+DESCRIPTION = "The Enlightenment freedesktop.org library"
+DEPENDS = "ecore"
+LICENSE = "MIT BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9594ec75c5a57e71fccedcbe10dd3ef4"
+
+inherit efl gettext
+
+PACKAGES =+ "${PN}-mime ${PN}-trash"
+FILES_${PN}-mime = "${libdir}/libefreet_mime.so.*"
+FILES_${PN}-trash = "${libdir}/libefreet_trash.so.*"
+
+# efreet_desktop_cache_create is needed for e-wm start, don't include it in -tests
+FILES_${PN} += "${libdir}/efreet/efreet_desktop_cache_create \
+                ${libdir}/efreet/efreet_icon_cache_create \
+"
 
 SRC_URI = "\
     ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
diff --git a/meta-efl/recipes-efl/efl/efreet_svn.bb b/meta-efl/recipes-efl/efl/efreet_svn.bb
deleted file mode 100644
index 5b13b9e..0000000
--- a/meta-efl/recipes-efl/efl/efreet_svn.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require ${BPN}.inc
-
-SRCREV = "${EFL_SRCREV}"
-PV = "1.7.4+svnr${SRCPV}"
-PR = "${INC_PR}.0"
-DEFAULT_PREFERENCE = "-1"
-
-SRCNAME_append = "-1.7"
-
-SRC_URI = "\
-    ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \
-"
-S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/eina.inc b/meta-efl/recipes-efl/efl/eina.inc
deleted file mode 100644
index 4a77de3..0000000
--- a/meta-efl/recipes-efl/efl/eina.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION = "Eina is the Enlightenment data library"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=9cc092d35d7bbfcd986232cde130a551"
-
-BBCLASSEXTEND = "native"
-INC_PR = "r0"
-
-inherit efl
-
-# Some upgrade path tweaking
-AUTO_LIBNAME_PKGS = ""
-
-FILES_${PN} += "${libdir}/eina"
diff --git a/meta-efl/recipes-efl/efl/eina_1.7.8.bb b/meta-efl/recipes-efl/efl/eina_1.7.8.bb
index 04f16c4..68a6667 100644
--- a/meta-efl/recipes-efl/efl/eina_1.7.8.bb
+++ b/meta-efl/recipes-efl/efl/eina_1.7.8.bb
@@ -1,4 +1,15 @@
-require ${BPN}.inc
+DESCRIPTION = "Eina is the Enlightenment data library"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9cc092d35d7bbfcd986232cde130a551"
+
+BBCLASSEXTEND = "native"
+
+inherit efl
+
+# Some upgrade path tweaking
+AUTO_LIBNAME_PKGS = ""
+
+FILES_${PN} += "${libdir}/eina"
 
 SRC_URI = "\
     ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
diff --git a/meta-efl/recipes-efl/efl/eina_svn.bb b/meta-efl/recipes-efl/efl/eina_svn.bb
deleted file mode 100644
index 5b13b9e..0000000
--- a/meta-efl/recipes-efl/efl/eina_svn.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require ${BPN}.inc
-
-SRCREV = "${EFL_SRCREV}"
-PV = "1.7.4+svnr${SRCPV}"
-PR = "${INC_PR}.0"
-DEFAULT_PREFERENCE = "-1"
-
-SRCNAME_append = "-1.7"
-
-SRC_URI = "\
-    ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \
-"
-S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/eio.inc b/meta-efl/recipes-efl/efl/eio.inc
deleted file mode 100644
index 4d28fab..0000000
--- a/meta-efl/recipes-efl/efl/eio.inc
+++ /dev/null
@@ -1,9 +0,0 @@
-DESCRIPTION = "Enlightenment Input Output Library"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=180fca752525726bd6ba021689509a08"
-DEPENDS = "ecore eina"
-
-inherit efl
-
-BBCLASSEXTEND = "native"
-INC_PR = "r0"
diff --git a/meta-efl/recipes-efl/efl/eio_1.7.8.bb b/meta-efl/recipes-efl/efl/eio_1.7.8.bb
index 9634459..f5827da 100644
--- a/meta-efl/recipes-efl/efl/eio_1.7.8.bb
+++ b/meta-efl/recipes-efl/efl/eio_1.7.8.bb
@@ -1,4 +1,11 @@
-require ${BPN}.inc
+DESCRIPTION = "Enlightenment Input Output Library"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=180fca752525726bd6ba021689509a08"
+DEPENDS = "ecore eina"
+
+inherit efl
+
+BBCLASSEXTEND = "native"
 
 SRC_URI = "\
     ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
diff --git a/meta-efl/recipes-efl/efl/eio_svn.bb b/meta-efl/recipes-efl/efl/eio_svn.bb
deleted file mode 100644
index 5b13b9e..0000000
--- a/meta-efl/recipes-efl/efl/eio_svn.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require ${BPN}.inc
-
-SRCREV = "${EFL_SRCREV}"
-PV = "1.7.4+svnr${SRCPV}"
-PR = "${INC_PR}.0"
-DEFAULT_PREFERENCE = "-1"
-
-SRCNAME_append = "-1.7"
-
-SRC_URI = "\
-    ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \
-"
-S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/embryo.inc b/meta-efl/recipes-efl/efl/embryo.inc
deleted file mode 100644
index 7997a5f..0000000
--- a/meta-efl/recipes-efl/efl/embryo.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "The Enlightenment C-like scripting language for Edje"
-
-inherit efl
-
-LICENSE = "MIT BSD CompuPhase"
-LIC_FILES_CHKSUM = "file://COPYING;md5=220a7f1107df42c62428d8ebe559ed14"
-
-BBCLASSEXTEND = "native"
-INC_PR = "r0"
-
-DEPENDS += "eina"
-
-# Some upgrade path tweaking
-AUTO_LIBNAME_PKGS = ""
diff --git a/meta-efl/recipes-efl/efl/embryo_1.7.8.bb b/meta-efl/recipes-efl/efl/embryo_1.7.8.bb
index 3f1e883..c4dfbca 100644
--- a/meta-efl/recipes-efl/efl/embryo_1.7.8.bb
+++ b/meta-efl/recipes-efl/efl/embryo_1.7.8.bb
@@ -1,4 +1,16 @@
-require ${BPN}.inc
+DESCRIPTION = "The Enlightenment C-like scripting language for Edje"
+
+inherit efl
+
+LICENSE = "MIT BSD CompuPhase"
+LIC_FILES_CHKSUM = "file://COPYING;md5=220a7f1107df42c62428d8ebe559ed14"
+
+BBCLASSEXTEND = "native"
+
+DEPENDS += "eina"
+
+# Some upgrade path tweaking
+AUTO_LIBNAME_PKGS = ""
 
 SRC_URI = "\
     ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
diff --git a/meta-efl/recipes-efl/efl/embryo_svn.bb b/meta-efl/recipes-efl/efl/embryo_svn.bb
deleted file mode 100644
index 5b13b9e..0000000
--- a/meta-efl/recipes-efl/efl/embryo_svn.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require ${BPN}.inc
-
-SRCREV = "${EFL_SRCREV}"
-PV = "1.7.4+svnr${SRCPV}"
-PR = "${INC_PR}.0"
-DEFAULT_PREFERENCE = "-1"
-
-SRCNAME_append = "-1.7"
-
-SRC_URI = "\
-    ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \
-"
-S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/emotion.inc b/meta-efl/recipes-efl/efl/emotion.inc
deleted file mode 100644
index a4ef02d..0000000
--- a/meta-efl/recipes-efl/efl/emotion.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "The Enlightenment multimedia library"
-LICENSE = "MIT BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=69f44058245ce5c596d56bb622d5dabd"
-# we no longer build the libxine backend, since the gstreamer backend seems more promising
-DEPENDS = "eet eeze evas ecore edje gstreamer gst-plugins-base eio"
-
-INC_PR = "r2"
-
-inherit efl
-
-EXTRA_OECONF = "--disable-xine --disable-generic-vlc --enable-gstreamer --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc"
-
-PACKAGES =+ "emotion-backend-gstreamer"
-FILES_emotion-backend-gstreamer = "${libdir}/emotion/*.so"
-RRECOMMENDS_${PN} = "emotion-backend-gstreamer"
-# upgrade path from libemotion0 to libemotion1
-RREPLACES_${PN} = "libemotion0"
diff --git a/meta-efl/recipes-efl/efl/emotion_1.7.8.bb b/meta-efl/recipes-efl/efl/emotion_1.7.8.bb
index b5177d4..c6eae15 100644
--- a/meta-efl/recipes-efl/efl/emotion_1.7.8.bb
+++ b/meta-efl/recipes-efl/efl/emotion_1.7.8.bb
@@ -1,4 +1,18 @@
-require ${BPN}.inc
+DESCRIPTION = "The Enlightenment multimedia library"
+LICENSE = "MIT BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=69f44058245ce5c596d56bb622d5dabd"
+# we no longer build the libxine backend, since the gstreamer backend seems more promising
+DEPENDS = "eet eeze evas ecore edje gstreamer gst-plugins-base eio"
+
+inherit efl
+
+EXTRA_OECONF = "--disable-xine --disable-generic-vlc --enable-gstreamer --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc"
+
+PACKAGES =+ "emotion-backend-gstreamer"
+FILES_emotion-backend-gstreamer = "${libdir}/emotion/*.so"
+RRECOMMENDS_${PN} = "emotion-backend-gstreamer"
+# upgrade path from libemotion0 to libemotion1
+RREPLACES_${PN} = "libemotion0"
 
 SRC_URI = "\
     ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
diff --git a/meta-efl/recipes-efl/efl/emotion_svn.bb b/meta-efl/recipes-efl/efl/emotion_svn.bb
deleted file mode 100644
index 5b13b9e..0000000
--- a/meta-efl/recipes-efl/efl/emotion_svn.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require ${BPN}.inc
-
-SRCREV = "${EFL_SRCREV}"
-PV = "1.7.4+svnr${SRCPV}"
-PR = "${INC_PR}.0"
-DEFAULT_PREFERENCE = "-1"
-
-SRCNAME_append = "-1.7"
-
-SRC_URI = "\
-    ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \
-"
-S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/ethumb.inc b/meta-efl/recipes-efl/efl/ethumb.inc
deleted file mode 100644
index 32a1306..0000000
--- a/meta-efl/recipes-efl/efl/ethumb.inc
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "EFL based thumbnail generation library"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e6a6db9e80255adbafa16e817d9a4d8c"
-DEPENDS = "libexif eet-native evas ecore edje eet edbus emotion epdf"
-
-INC_PR = "r0"
-
-inherit efl
-
-EXTRA_OECONF = "\
-    --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
-    --with-eet-eet=${STAGING_BINDIR_NATIVE}/eet \
-    --disable-docs \
-"
-
-# Some upgrade path tweaking, as in evas
-AUTO_LIBNAME_PKGS = ""
-
-FILES_${PN} += "\
-    ${bindir}/ethumbd \
-    ${libexecdir}/ethumbd_slave \
-"
diff --git a/meta-efl/recipes-efl/efl/ethumb_1.7.8.bb b/meta-efl/recipes-efl/efl/ethumb_1.7.8.bb
index 8d7d8bd..1d36322 100644
--- a/meta-efl/recipes-efl/efl/ethumb_1.7.8.bb
+++ b/meta-efl/recipes-efl/efl/ethumb_1.7.8.bb
@@ -1,4 +1,23 @@
-require ${BPN}.inc
+DESCRIPTION = "EFL based thumbnail generation library"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e6a6db9e80255adbafa16e817d9a4d8c"
+DEPENDS = "libexif eet-native evas ecore edje eet edbus emotion epdf"
+
+inherit efl
+
+EXTRA_OECONF = "\
+    --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
+    --with-eet-eet=${STAGING_BINDIR_NATIVE}/eet \
+    --disable-docs \
+"
+
+# Some upgrade path tweaking, as in evas
+AUTO_LIBNAME_PKGS = ""
+
+FILES_${PN} += "\
+    ${bindir}/ethumbd \
+    ${libexecdir}/ethumbd_slave \
+"
 
 SRC_URI = "\
     ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
diff --git a/meta-efl/recipes-efl/efl/ethumb_svn.bb b/meta-efl/recipes-efl/efl/ethumb_svn.bb
deleted file mode 100644
index 5b13b9e..0000000
--- a/meta-efl/recipes-efl/efl/ethumb_svn.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require ${BPN}.inc
-
-SRCREV = "${EFL_SRCREV}"
-PV = "1.7.4+svnr${SRCPV}"
-PR = "${INC_PR}.0"
-DEFAULT_PREFERENCE = "-1"
-
-SRCNAME_append = "-1.7"
-
-SRC_URI = "\
-    ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \
-"
-S = "${WORKDIR}/${SRCNAME}"
diff --git a/meta-efl/recipes-efl/efl/evas.inc b/meta-efl/recipes-efl/efl/evas.inc
deleted file mode 100644
index 4e5e1e3..0000000
--- a/meta-efl/recipes-efl/efl/evas.inc
+++ /dev/null
@@ -1,168 +0,0 @@
-DESCRIPTION = "Evas is the Enlightenment canvas API"
-LICENSE = "MIT BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b9b25b03d63aa496552658c7e78b11a1"
-# can also depend on valgrind, libsdl-x11, directfb
-DEPENDS = "librsvg eina eet freetype jpeg libpng tiff virtual/libx11 libxext libxrender fontconfig libfribidi giflib"
-DEPENDS_virtclass-native = "freetype-native libxext-native libpng-native jpeg-native tiff-native eet-native eina-native libfribidi-native"
-
-inherit efl
-
-BBCLASSEXTEND = "native"
-INC_PR = "r1"
-FILESPATHPKG =. "${BPN}-${PV}:${BPN}:"
-
-python populate_packages_prepend () {
-    for plugin_type in "engines loaders savers".split():
-        bb.note( "splitting packages for evas %s..." % plugin_type )
-        basedir = d.expand( '${libdir}/evas/modules/%s' % plugin_type)
-
-        do_split_packages(d, basedir, '^(.*)',
-        output_pattern = 'evas-' + plugin_type[:-1] + "-%s",
-        description = 'Evas module %s',
-        allow_dirs=True, recursive=False, extra_depends="" )
-        
-        plugin_type = "cserve2"
-        bb.note( "splitting packages for evas %s..." % plugin_type )
-        basedir = d.expand( '${libdir}/evas/%s/loaders' % plugin_type)
-
-        do_split_packages(d, basedir, '^(.*)',
-        output_pattern = 'evas-' + plugin_type + "-%s",
-        description = 'Evas csever2 loader module %s',
-        allow_dirs=True, recursive=False, extra_depends="" )
-}
-
-do_install_append() {
-    find "${D}" -name .debug -type d -exec rm -rf {} \;
-}
-
-FILES_${PN}-dev += "${libdir}/evas/modules/*/*/*/*.a ${libdir}/evas/modules/*/*/*/*.la"
-FILES_${PN}-dbg += "${libdir}/evas/modules/*/*/*/.debug/ ${libdir}/evas/cserve2/loaders/*/*/.debug/"
-FILES_${PN}-cserve2 += "${libexecdir}/evas_cserve2* ${libexecdir}/dummy_slave"
-
-PACKAGES += "${PN}-cserve2"
-PACKAGES_DYNAMIC += "^evas-engine-.* ^evas-loader-.* ^evas-saver-.* ^evas-cserve2-.*"
-
-# evas-loader-svg is gone as we don't have esvg and probably won't have anytime soon
-# http://www.intesis.hr/news/16-esvg-source
-# http://blog.gmane.org/gmane.comp.window-managers.enlightenment.user/page=3
-RRECOMMENDS_${PN} += "evas-loader-generic evas-generic-loader-svn"
-
-RRECOMMENDS_${PN} = " \
-    evas-engine-fb \
-    evas-engine-software-generic \
-    evas-engine-software-x11 \
-    evas-engine-software-16 \
-    evas-engine-software-16-x11 \
-    evas-engine-xrender-x11 \
-    \
-    evas-loader-png \
-    evas-loader-jpeg \
-    evas-loader-gif \
-    evas-loader-svg \
-"
-
-# Some upgrade path tweaking
-AUTO_LIBNAME_PKGS = ""
-
-EVAS_CPU_TWEAKS = ""
-# Disabled for now, see http://thread.gmane.org/gmane.comp.window-managers.enlightenment.devel/25194
-EVAS_CPU_TWEAKS_armv7a = "--disable-cpu-neon"
-
-# common options
-EVAS_OECONF = " \
-                --x-includes=${STAGING_INCDIR}/X11 \
-                --x-libraries=${STAGING_LIBDIR} \
-                --enable-evas-magic-debug \
-                --enable-fb \
-                --disable-directfb \
-                --disable-sdl \
-                --enable-buffer=static \
-                --enable-static-software-generic \
-                --disable-software-ddraw \
-                --disable-software-qtopia \
-                --disable-software-xcb \
-                --disable-xrender-xcb \
-                --disable-glitz-x11 \
-                --enable-image-loader-eet=static \
-                --disable-image-loader-edb \
-                --enable-image-loader-png \
-                --enable-image-loader-jpeg \
-                --enable-image-loader-tiff \
-                --enable-image-loader-xpm \
-                --enable-cpu-c \
-                --enable-fontconfig \
-                --enable-font-loader-eet \
-                --enable-scale-sample \
-                --enable-scale-smooth \
-                --enable-convert-yuv \
-                --enable-small-dither-mask \
-                --disable-no-dither-mask \
-                --disable-convert-8-rgb-332 \
-                --disable-convert-8-rgb-666 \
-                --disable-convert-8-rgb-232 \
-                --disable-convert-8-rgb-222 \
-                --disable-convert-8-rgb-221 \
-                --disable-convert-8-rgb-121 \
-                --disable-convert-8-rgb-111 \
-                --enable-convert-16-rgb-565 \
-                --disable-convert-16-rgb-555 \
-                --disable-convert-16-rgb-444 \
-                --disable-convert-16-rgb-ipq \
-                --enable-convert-16-rgb-rot-0 \
-                --enable-convert-16-rgb-rot-90 \
-                --disable-convert-16-rgb-rot-180 \
-                --enable-convert-16-rgb-rot-270 \
-"
-
-# either sgx or 6410 atm
-GLES ?= "sgx"
-
-# This is a hack to get openGL|ES 2.x support enabled for people that have the SDK headers in staging.
-# We put this in the main recipe, since it will just not build the gl stuff when the headers are missing
-
-# If the above sentence confuse you: everything is built and configured as before if you don't have the SDK
-
-EXTRA_OECONF = "${EVAS_OECONF} \
-                ${EVAS_CPU_TWEAKS} \
-                --enable-pthreads \
-                --enable-async-events \
-                --enable-async-preload \
-                --enable-simple-x11 \
-                --enable-software-x11 \
-                --enable-xrender-x11 \
-                --enable-software-16-x11 \
-                --enable-image-loader-gif \
-                --enable-image-loader-svg \
-                --enable-convert-24-rgb-888 \
-                --enable-convert-24-bgr-888 \
-                --enable-convert-32-rgb-8888 \
-                --enable-convert-32-rgbx-8888 \
-                --enable-convert-32-bgr-8888 \
-                --enable-convert-32-bgrx-8888 \
-                --enable-convert-32-rgb-rot-0 \
-                --enable-convert-32-rgb-rot-90 \
-                --disable-convert-32-rgb-rot-180 \
-                --enable-convert-32-rgb-rot-270 \
-                --enable-gl-x11 \
-                --enable-gl-xlib \
-                --enable-gl-flavor-gles \
-                --enable-gles-variety-${GLES} \
-"
-EXTRA_OECONF_virtclass-native = "${EVAS_OECONF} \
-                --disable-software-x11 \
-                --disable-software-16-x11 \
-                --disable-gl-x11 \
-                --disable-gl-xlib \
-                --disable-xrender-x11 \
-                --disable-image-loader-gif \
-                --disable-image-loader-svg \
-                --disable-convert-24-rgb-888 \
-                --disable-convert-24-bgr-888 \
-                --disable-convert-32-rgb-8888 \
-                --disable-convert-32-rgbx-8888 \
-                --disable-convert-32-bgr-8888 \
-                --disable-convert-32-bgrx-8888 \
-                --disable-convert-32-rgb-rot-0 \
-                --disable-convert-32-rgb-rot-90 \
-                --disable-convert-32-rgb-rot-270 \
-"
diff --git a/meta-efl/recipes-efl/efl/evas_1.7.8.bb b/meta-efl/recipes-efl/efl/evas_1.7.8.bb
index f9bf8d0..5f2bf78 100644
--- a/meta-efl/recipes-efl/efl/evas_1.7.8.bb
+++ b/meta-efl/recipes-efl/efl/evas_1.7.8.bb
@@ -1,4 +1,170 @@
-require ${BPN}.inc
+DESCRIPTION = "Evas is the Enlightenment canvas API"
+LICENSE = "MIT BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b9b25b03d63aa496552658c7e78b11a1"
+# can also depend on valgrind, libsdl-x11, directfb
+DEPENDS = "librsvg eina eet freetype jpeg libpng tiff virtual/libx11 libxext libxrender fontconfig libfribidi giflib"
+DEPENDS_virtclass-native = "freetype-native libxext-native libpng-native jpeg-native tiff-native eet-native eina-native libfribidi-native"
+
+inherit efl
+
+BBCLASSEXTEND = "native"
+FILESPATHPKG =. "${BPN}-${PV}:${BPN}:"
+
+python populate_packages_prepend () {
+    for plugin_type in "engines loaders savers".split():
+        bb.note( "splitting packages for evas %s..." % plugin_type )
+        basedir = d.expand( '${libdir}/evas/modules/%s' % plugin_type)
+
+        do_split_packages(d, basedir, '^(.*)',
+        output_pattern = 'evas-' + plugin_type[:-1] + "-%s",
+        description = 'Evas module %s',
+        allow_dirs=True, recursive=False, extra_depends="" )
+        
+        plugin_type = "cserve2"
+        bb.note( "splitting packages for evas %s..." % plugin_type )
+        basedir = d.expand( '${libdir}/evas/%s/loaders' % plugin_type)
+
+        do_split_packages(d, basedir, '^(.*)',
+        output_pattern = 'evas-' + plugin_type + "-%s",
+        description = 'Evas csever2 loader module %s',
+        allow_dirs=True, recursive=False, extra_depends="" )
+}
+
+do_install_append() {
+    find "${D}" -name .debug -type d -exec rm -rf {} \;
+}
+
+FILES_${PN}-dev += "${libdir}/evas/modules/*/*/*/*.a ${libdir}/evas/modules/*/*/*/*.la"
+FILES_${PN}-dbg += "${libdir}/evas/modules/*/*/*/.debug/ ${libdir}/evas/cserve2/loaders/*/*/.debug/"
+FILES_${PN}-cserve2 += "${libexecdir}/evas_cserve2* ${libexecdir}/dummy_slave"
+
+PACKAGES += "${PN}-cserve2"
+PACKAGES_DYNAMIC += "^evas-engine-.* ^evas-loader-.* ^evas-saver-.* ^evas-cserve2-.*"
+
+# evas-loader-svg is gone as we don't have esvg and probably won't have anytime soon
+# http://www.intesis.hr/news/16-esvg-source
+# http://blog.gmane.org/gmane.comp.window-managers.enlightenment.user/page=3
+RRECOMMENDS_${PN} += "evas-loader-generic evas-generic-loader-svn"
+
+RRECOMMENDS_${PN} = " \
+    evas-engine-fb \
+    evas-engine-software-generic \
+    evas-engine-software-x11 \
+    evas-engine-software-16 \
+    evas-engine-software-16-x11 \
+    evas-engine-xrender-x11 \
+    \
+    evas-loader-png \
+    evas-loader-jpeg \
+    evas-loader-gif \
+    evas-loader-svg \
+"
+
+# Some upgrade path tweaking
+AUTO_LIBNAME_PKGS = ""
+
+EVAS_CPU_TWEAKS = ""
+# Disabled for now, see http://thread.gmane.org/gmane.comp.window-managers.enlightenment.devel/25194
+EVAS_CPU_TWEAKS_armv7a = "--disable-cpu-neon"
+
+# common options
+EVAS_OECONF = " \
+                --x-includes=${STAGING_INCDIR}/X11 \
+                --x-libraries=${STAGING_LIBDIR} \
+                --enable-evas-magic-debug \
+                --enable-fb \
+                --disable-directfb \
+                --disable-sdl \
+                --enable-buffer=static \
+                --enable-static-software-generic \
+                --disable-software-ddraw \
+                --disable-software-qtopia \
+                --disable-software-xcb \
+                --disable-xrender-xcb \
+                --disable-glitz-x11 \
+                --enable-image-loader-eet=static \
+                --disable-image-loader-edb \
+                --enable-image-loader-png \
+                --enable-image-loader-jpeg \
+                --enable-image-loader-tiff \
+                --enable-image-loader-xpm \
+                --enable-cpu-c \
+                --enable-fontconfig \
+                --enable-font-loader-eet \
+                --enable-scale-sample \
+                --enable-scale-smooth \
+                --enable-convert-yuv \
+                --enable-small-dither-mask \
+                --disable-no-dither-mask \
+                --disable-convert-8-rgb-332 \
+                --disable-convert-8-rgb-666 \
+                --disable-convert-8-rgb-232 \
+                --disable-convert-8-rgb-222 \
+                --disable-convert-8-rgb-221 \
+                --disable-convert-8-rgb-121 \
+                --disable-convert-8-rgb-111 \
+                --enable-convert-16-rgb-565 \
+                --disable-convert-16-rgb-555 \
+                --disable-convert-16-rgb-444 \
+                --disable-convert-16-rgb-ipq \
+                --enable-convert-16-rgb-rot-0 \
+                --enable-convert-16-rgb-rot-90 \
+                --disable-convert-16-rgb-rot-180 \
+                --enable-convert-16-rgb-rot-270 \
+"
+
+# either sgx or 6410 atm
+GLES ?= "sgx"
+
+# This is a hack to get openGL|ES 2.x support enabled for people that have the SDK headers in staging.
+# We put this in the main recipe, since it will just not build the gl stuff when the headers are missing
+
+# If the above sentence confuse you: everything is built and configured as before if you don't have the SDK
+
+EXTRA_OECONF = "${EVAS_OECONF} \
+                ${EVAS_CPU_TWEAKS} \
+                --enable-pthreads \
+                --enable-async-events \
+                --enable-async-preload \
+                --enable-simple-x11 \
+                --enable-software-x11 \
+                --enable-xrender-x11 \
+                --enable-software-16-x11 \
+                --enable-image-loader-gif \
+                --enable-image-loader-svg \
+                --enable-convert-24-rgb-888 \
+                --enable-convert-24-bgr-888 \
+                --enable-convert-32-rgb-8888 \
+                --enable-convert-32-rgbx-8888 \
+                --enable-convert-32-bgr-8888 \
+                --enable-convert-32-bgrx-8888 \
+                --enable-convert-32-rgb-rot-0 \
+                --enable-convert-32-rgb-rot-90 \
+                --disable-convert-32-rgb-rot-180 \
+                --enable-convert-32-rgb-rot-270 \
+                --enable-gl-x11 \
+                --enable-gl-xlib \
+                --enable-gl-flavor-gles \
+                --enable-gles-variety-${GLES} \
+"
+EXTRA_OECONF_virtclass-native = "${EVAS_OECONF} \
+                --disable-software-x11 \
+                --disable-software-16-x11 \
+                --disable-gl-x11 \
+                --disable-gl-xlib \
+                --disable-xrender-x11 \
+                --disable-image-loader-gif \
+                --disable-image-loader-svg \
+                --disable-convert-24-rgb-888 \
+                --disable-convert-24-bgr-888 \
+                --disable-convert-32-rgb-8888 \
+                --disable-convert-32-rgbx-8888 \
+                --disable-convert-32-bgr-8888 \
+                --disable-convert-32-bgrx-8888 \
+                --disable-convert-32-rgb-rot-0 \
+                --disable-convert-32-rgb-rot-90 \
+                --disable-convert-32-rgb-rot-270 \
+"
 
 SRC_URI = "\
     ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
diff --git a/meta-efl/recipes-efl/efl/evas_svn.bb b/meta-efl/recipes-efl/efl/evas_svn.bb
deleted file mode 100644
index 5b13b9e..0000000
--- a/meta-efl/recipes-efl/efl/evas_svn.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require ${BPN}.inc
-
-SRCREV = "${EFL_SRCREV}"
-PV = "1.7.4+svnr${SRCPV}"
-PR = "${INC_PR}.0"
-DEFAULT_PREFERENCE = "-1"
-
-SRCNAME_append = "-1.7"
-
-SRC_URI = "\
-    ${E_SVN}/branches;module=${SRCNAME};protocol=http;scmdata=keep \
-"
-S = "${WORKDIR}/${SRCNAME}"
-- 
1.8.3.2


