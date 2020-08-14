Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web12.12371.1597383423354195690
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 22:37:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gcENv1Oa;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id f193so4005118pfa.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 22:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aJCdLhW7XOAN/hXTbPnlVy8LiYQ/kBv50BF3b7CZ1rA=;
        b=gcENv1Oa9NKl9SOauKfsezmzTbJIc9myCp6GBd7xVvvhNljesL7sC517MTIrTkAbph
         amwvpJ7q62tok2BtDYvnauo3CvtyTuuUqVtES2s7jdVPUN2rq+4qMrtVxX461ew+uJfQ
         xz+gYmV1M/HXe508m75cqYUntvwjFXB1qWekCQV689kIjoDXcxkaSHqOgEu9u63weBTb
         QEoAF8Xl5EuUHHA7UYd6IG0Wm6eWkSwvYRVrdVzCOGkNXhGWtGqatbfN/ODHledPEKVJ
         rdl1gkFQdLr9Z+YyUGRG/UgOpVL9npPrBMKs1rtfzvF1pnJz1/iK3t4blR8eR2Zql5rb
         Pn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aJCdLhW7XOAN/hXTbPnlVy8LiYQ/kBv50BF3b7CZ1rA=;
        b=GJzl7RpIhvc3jFuW1GzUkJj5tGya3IzTgPIkyxgUuPVOyZo8nGQAPhrx86qGuAjD8p
         ZUfx2Yk3LCXNJTZ3xWAPSY2UYkXOzY2YtbIbMbzIJkj/RUq5O2pBKfSD1QJwVr2vHWYj
         GjzNJyu12gfYLK7SJuHTB+h0LON2zoLE46p/VfsPvsttcchnbgbNHZlJGSiNS/whqwbu
         sNGB3tpJrG5VDEFrKMxLKF0KgjYdGsa1QWrEmOewbSpXFTA5yMAyR6Nlt/NWOQU2liBV
         2lnlt4xpaTy3l72t4BKDYhELRi84ud4Ac9HhsT3tKjNgLTPKbcRlLqrhHiB5/ZiO0TPB
         oJOA==
X-Gm-Message-State: AOAM531KTZ8vDft0lXlfst79ZggpXyHq5Ic7Z42sIkJmntqQ42xetGwm
	2v3FHMxlPZSJcNiMMsBZXKy6SStjHvVgRQ==
X-Google-Smtp-Source: ABdhPJw2vITLDXWJEPkiIgxNtSNAFr+WvK+OOku/4LFDImenVdZB6x6xiUYslGkzH1kUXrFPKIrAgQ==
X-Received: by 2002:a62:8001:: with SMTP id j1mr681346pfd.45.1597383422257;
        Thu, 13 Aug 2020 22:37:02 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id k21sm7013974pgl.0.2020.08.13.22.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 22:37:01 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 04/21] fbida: Upgrade to 2.14
Date: Thu, 13 Aug 2020 22:36:40 -0700
Message-Id: <20200814053657.1701247-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814053657.1701247-1-raj.khem@gmail.com>
References: <20200814053657.1701247-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* Redo libjpeg detection to use cross cpp
* Add missing dependencies
* Use cairo only when it is compiled with EGL support which is not defaul
  in oe-core
* Fix build  with gcc10

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../fbida/{fbida_2.10.bb => fbida_2.14.bb}    | 16 ++---
 .../fbida/files/cairo-weak-detect.patch       | 17 ++++++
 .../fbida/files/fbida-gcc10.patch             | 61 +++++++++++++++++++
 .../fbida/files/fix-preprocessor.patch        | 20 ++----
 4 files changed, 93 insertions(+), 21 deletions(-)
 rename meta-oe/recipes-graphics/fbida/{fbida_2.10.bb => fbida_2.14.bb} (80%)
 create mode 100644 meta-oe/recipes-graphics/fbida/files/cairo-weak-detect.patch
 create mode 100644 meta-oe/recipes-graphics/fbida/files/fbida-gcc10.patch

diff --git a/meta-oe/recipes-graphics/fbida/fbida_2.10.bb b/meta-oe/recipes-graphics/fbida/fbida_2.14.bb
similarity index 80%
rename from meta-oe/recipes-graphics/fbida/fbida_2.10.bb
rename to meta-oe/recipes-graphics/fbida/fbida_2.14.bb
index 0bf48ace6b..29d0f64ac2 100644
--- a/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
+++ b/meta-oe/recipes-graphics/fbida/fbida_2.14.bb
@@ -6,20 +6,18 @@ AUTHOR = "Gerd Hoffmann"
 SECTION = "utils"
 
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e8feb78a32950a909621bbb51f634b39"
 
-DEPENDS = "virtual/libiconv jpeg fontconfig freetype libexif"
+DEPENDS = "virtual/libiconv jpeg fontconfig freetype libexif libdrm pixman poppler libepoxy cairo"
 
 SRC_URI = "https://www.kraxel.org/releases/fbida/fbida-${PV}.tar.gz \
 	   file://0001-Avoid-using-host-path.patch \
 	   file://fix-preprocessor.patch \
            file://support-jpeg-turbo.patch \
-           file://use-jpeg-turbo.patch \
+           file://cairo-weak-detect.patch \
+           file://fbida-gcc10.patch \
 	   "
-SRC_URI[md5sum] = "09460b964b58c2e39b665498eca29018"
-SRC_URI[sha256sum] = "7a5a3aac61b40a6a2bbf716d270a46e2f8e8d5c97e314e927d41398a4d0b6cb6"
-
-B = "${WORKDIR}/build"
+SRC_URI[sha256sum] = "95b7c01556cb6ef9819f358b314ddfeb8a4cbe862b521a3ed62f03d163154438"
 
 inherit pkgconfig
 
@@ -33,6 +31,10 @@ PACKAGECONFIG[tiff] = ",,tiff"
 PACKAGECONFIG[motif] = ",,libx11 libxext libxpm libxt openmotif"
 PACKAGECONFIG[webp] = ",,libwebp"
 PACKAGECONFIG[lirc] = ",,lirc"
+# This can only be enabled when cairo has egl enabled in its packageconfig support too
+PACKAGECONFIG[egl] = ",,"
+
+EXTRA_OEMAKE += ""${@bb.utils.contains('PACKAGECONFIG', 'egl', 'HAVE_CAIRO_GL=yes', 'HAVE_CAIRO_GL=no', d)}""
 
 do_compile() {
     sed -i -e 's# fbgs# \$(srcdir)/fbgs#; s#-Ijpeg#-I\$(srcdir)/jpeg#; s# jpeg/# \$(srcdir)/jpeg/#' ${S}/GNUmakefile
diff --git a/meta-oe/recipes-graphics/fbida/files/cairo-weak-detect.patch b/meta-oe/recipes-graphics/fbida/files/cairo-weak-detect.patch
new file mode 100644
index 0000000000..c7c579cc41
--- /dev/null
+++ b/meta-oe/recipes-graphics/fbida/files/cairo-weak-detect.patch
@@ -0,0 +1,17 @@
+OE configures cairo to disable EGL support, however fbida expects cairo with egl support
+this patch therefore makes it possible to set HAVE_CAIRO_GL via recipe
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/GNUmakefile
++++ b/GNUmakefile
+@@ -67,7 +67,7 @@ define make-config
+ LIB		:= $(LIB)
+ RESDIR		:= $(call ac_resdir)
+ HAVE_LINUX_FB_H	:= $(call ac_header,linux/fb.h)
+-HAVE_CAIRO_GL	:= $(call ac_pkg_config,cairo-gl)
++HAVE_CAIRO_GL	?= $(call ac_pkg_config,cairo-gl)
+ HAVE_LIBPCD	:= $(call ac_lib,pcd_open,pcd)
+ HAVE_LIBGIF	:= $(call ac_lib,DGifOpenFileName,gif)
+ HAVE_LIBWEBP	:= $(call ac_pkg_config,libwebp)
diff --git a/meta-oe/recipes-graphics/fbida/files/fbida-gcc10.patch b/meta-oe/recipes-graphics/fbida/files/fbida-gcc10.patch
new file mode 100644
index 0000000000..1104289f3c
--- /dev/null
+++ b/meta-oe/recipes-graphics/fbida/files/fbida-gcc10.patch
@@ -0,0 +1,61 @@
+Fix build with gcc10
+
+Patch from https://src.fedoraproject.org/rpms/fbida/raw/master/f/fbida.gcc10.patch
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- fbida-2.14/fbi.c.org	2020-03-15 17:02:17.944189632 +0100
++++ fbida-2.14/fbi.c	2020-03-15 17:02:21.880223224 +0100
+@@ -100,7 +100,6 @@
+ 
+ /* graphics interface */
+ gfxstate                   *gfx;
+-int                        debug;
+ 
+ /* framebuffer */
+ char                       *fbdev = NULL;
+--- fbida-2.14/filter.c	2020-03-15 16:44:17.159855150 +0100
++++ fbida-2.14/filter.c	2020-03-15 16:44:27.017941447 +0100
+@@ -6,8 +6,6 @@
+ #include "readers.h"
+ #include "filter.h"
+ 
+-int debug = 0;
+-
+ /* ----------------------------------------------------------------------- */
+ 
+ static void
+--- fbida-2.14/readers.c.org	2020-03-15 17:01:18.692683597 +0100
++++ fbida-2.14/readers.c	2020-03-15 16:57:19.141632384 +0100
+@@ -6,6 +6,8 @@
+ 
+ #include "readers.h"
+ 
++int debug=0;
++
+ /* ----------------------------------------------------------------------- */
+ 
+ void load_bits_lsb(unsigned char *dst, unsigned char *src, int width,
+
+--- fbida-2.14/viewer.c.org	2020-03-15 17:05:02.991595832 +0100
++++ fbida-2.14/viewer.c	2020-03-15 17:04:55.424531467 +0100
+@@ -40,7 +40,6 @@
+ #define PROCESS_LINES    16
+ 
+-int debug;
+ Cursor ptrs[POINTER_COUNT];
+ 
+ /* ----------------------------------------------------------------------- */
+ 
+--- fbida-2.14/idaconfig.h.org	2020-03-15 17:07:09.239668196 +0100
++++ fbida-2.14/idaconfig.h	2020-03-15 17:07:21.248770061 +0100
+@@ -17,7 +17,7 @@
+ 
+ /* -------------------------------------------------------------------------- */
+ 
+-char *ida_lists;
++extern char *ida_lists;
+ 
+ void ida_init_config(void);
+ void ida_read_config(void);
diff --git a/meta-oe/recipes-graphics/fbida/files/fix-preprocessor.patch b/meta-oe/recipes-graphics/fbida/files/fix-preprocessor.patch
index 909a0a6c0f..cdeac996a1 100644
--- a/meta-oe/recipes-graphics/fbida/files/fix-preprocessor.patch
+++ b/meta-oe/recipes-graphics/fbida/files/fix-preprocessor.patch
@@ -1,14 +1,6 @@
-Index: fbida-2.13/GNUmakefile
-===================================================================
---- fbida-2.13.orig/GNUmakefile
-+++ fbida-2.13/GNUmakefile
-@@ -53,8 +53,7 @@ include $(srcdir)/mk/Autoconf.mk
- 
- ac_jpeg_ver = $(shell \
- 	$(call ac_init,for libjpeg version);\
--	$(call ac_s_cmd,echo JPEG_LIB_VERSION \
--		| cpp -include jpeglib.h | tail -n 1);\
-+	$(call ac_s_cmd,cpp -include jpeglib.h -dM -E -x c /dev/null  | grep 'define JPEG_LIB_VERSION' | cut -f 3 -d' ');\
- 	$(call ac_fini))
- 
- define make-config
+--- a/scripts/jpeg-version.sh
++++ b/scripts/jpeg-version.sh
+@@ -1,2 +1,2 @@
+ #!/bin/sh
+-echo JPEG_LIB_VERSION | cpp $CFLAGS -include jpeglib.h | tail -1
++${CPP} -include jpeglib.h -dM -E -x c /dev/null | grep 'define JPEG_LIB_VERSION' | cut -f 3 -d' '
-- 
2.28.0

