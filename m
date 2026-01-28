Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF988D3569C
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 10:09:11 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9893.1769594941276670931
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Jan 2026 02:09:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DiYWp/vg;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769594941; x=1801130941;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vBZdSo6607SLVixUx0K8SNkAOmxBhqewQfyZOi/KP+o=;
  b=DiYWp/vgzMNNo2I/IywpvSTiuMn8DLp01LytrtnBEIqXCrk0IOjQC6FV
   8y65f2IPhgO5IV6rM7UER+Xb1zBsZ3SH4j6cmq8cU/kw4cQ9l2LySve2o
   RViAH8k4Bky0wwNRq3PYTGCTDgB/uNgcV0TozLIAKhh+6xBbak5B+8I5C
   QfCS4Qp912ll/0IrQdZN36HOkT8DhHH4MzL7CAH5p25G5a77JtKRM/YVY
   d0MT6+JqFa3oJ/1HEn+BMomWDRTPEXgx2+GgciwHhpLCOrXQacXRMcTtN
   /QsBWyvG8bd8ofrNjbJ/U/tnhRrGw11+eA9F3vaoQGg8poWc/a8T2g+9X
   A==;
X-CSE-ConnectionGUID: TXV94WRlSemcsNxG15VQ1Q==
X-CSE-MsgGUID: QANwpozEStyByTE4klXaOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="206409669"
X-IronPort-AV: E=Sophos;i="6.21,258,1763391600"; 
   d="scan'208";a="206409669"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 19:08:57 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 649884075C8
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 10:08:57 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 0D4751C1009A
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 10:08:57 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id D678F2000A9E
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 10:08:54 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] fbida: upgrade 2.14 -> 2.15
Date: Wed, 28 Jan 2026 18:08:47 +0800
Message-ID: <20260128100848.7667-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 10:09:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123973

1. Changelog
   https://gitlab.com/kraxel/fbida/-/commit/a0d75fbab3ea01bf5b36f813f0ec0d1bfa2db745

2. Drop following patches as they were merged upstream.
   fbida-gcc10.patch
   0001-meson.build-install-fbgs-shell-script.patch
   0001-fbida-Include-missing-sys-types.h.patch
   0002-meson.build-add-features-options-for-png-gif-tiff-we.patch
   0001-meson.build-make-fbpdf-build-optional.patch

3. Drop 0003-meson.build-do-not-require-xkbcommon.patch as xkbcommon was added as DEPEND.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../fbida/{fbida_git.bb => fbida_2.15.bb}     |  14 +-
 ...01-fbida-Include-missing-sys-types.h.patch |  31 -----
 ...eson.build-install-fbgs-shell-script.patch |  28 ----
 ...eson.build-make-fbpdf-build-optional.patch |  66 ----------
 ...features-options-for-png-gif-tiff-we.patch | 124 ------------------
 ...meson.build-do-not-require-xkbcommon.patch |  27 ----
 .../fbida/files/fbida-gcc10.patch             |  61 ---------
 7 files changed, 4 insertions(+), 347 deletions(-)
 rename meta-oe/recipes-graphics/fbida/{fbida_git.bb => fbida_2.15.bb} (72%)
 delete mode 100644 meta-oe/recipes-graphics/fbida/files/0001-fbida-Include-missing-sys-types.h.patch
 delete mode 100644 meta-oe/recipes-graphics/fbida/files/0001-meson.build-install-fbgs-shell-script.patch
 delete mode 100644 meta-oe/recipes-graphics/fbida/files/0001-meson.build-make-fbpdf-build-optional.patch
 delete mode 100644 meta-oe/recipes-graphics/fbida/files/0002-meson.build-add-features-options-for-png-gif-tiff-we.patch
 delete mode 100644 meta-oe/recipes-graphics/fbida/files/0003-meson.build-do-not-require-xkbcommon.patch
 delete mode 100644 meta-oe/recipes-graphics/fbida/files/fbida-gcc10.patch

diff --git a/meta-oe/recipes-graphics/fbida/fbida_git.bb b/meta-oe/recipes-graphics/fbida/fbida_2.15.bb
similarity index 72%
rename from meta-oe/recipes-graphics/fbida/fbida_git.bb
rename to meta-oe/recipes-graphics/fbida/fbida_2.15.bb
index 2736f61004..99beccb274 100644
--- a/meta-oe/recipes-graphics/fbida/fbida_git.bb
+++ b/meta-oe/recipes-graphics/fbida/fbida_2.15.bb
@@ -7,20 +7,14 @@ SECTION = "utils"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e8feb78a32950a909621bbb51f634b39"
 
-DEPENDS = "virtual/libiconv jpeg fontconfig freetype libexif libdrm pixman udev libinput cairo"
+DEPENDS = "virtual/libiconv jpeg fontconfig freetype libexif libdrm pixman udev libinput cairo libxkbcommon"
 
-PV = "2.14+git"
-SRC_URI = "git://github.com/kraxel/fbida;protocol=https;branch=master \
+GITTAG = "${PN}-${PV}-1"
+SRC_URI = "git://github.com/kraxel/fbida;protocol=https;branch=master;tag=${GITTAG} \
            file://fix-preprocessor.patch \
            file://support-jpeg-turbo.patch \
-           file://fbida-gcc10.patch \
-           file://0001-meson.build-install-fbgs-shell-script.patch \
-           file://0002-meson.build-add-features-options-for-png-gif-tiff-we.patch \
-           file://0003-meson.build-do-not-require-xkbcommon.patch \
-           file://0001-meson.build-make-fbpdf-build-optional.patch \
-           file://0001-fbida-Include-missing-sys-types.h.patch \
 "
-SRCREV = "eb769e3d7f4a073d4c37ed524ebd5017c6a578f5"
+SRCREV = "a0d75fbab3ea01bf5b36f813f0ec0d1bfa2db745"
 
 inherit meson pkgconfig features_check
 
diff --git a/meta-oe/recipes-graphics/fbida/files/0001-fbida-Include-missing-sys-types.h.patch b/meta-oe/recipes-graphics/fbida/files/0001-fbida-Include-missing-sys-types.h.patch
deleted file mode 100644
index 0fb58f80e1..0000000000
--- a/meta-oe/recipes-graphics/fbida/files/0001-fbida-Include-missing-sys-types.h.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 17490e264e627ead81bf5840c8797de968485943 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 3 Jul 2023 11:25:26 -0700
-Subject: [PATCH] fbida: Include missing <sys/types.h>
-
-Fixes build on musl
-../git/gfx.h:43:5: error: unknown type name 'dev_t'; did you mean 'div_t'?
-    dev_t devnum;
-    ^~~~~
-    div_t
-TOPDIR/build/tmp/work/cortexa57-yoe-linux-musl/fbida/2.14+gitAUTOINC+eb769e3d7f-r0/recipe-sysroot/usr/include/stdlib.h:64:35: note: 'div_t' declared here
-typedef struct { int quot, rem; } div_t;
-                                  ^
-1 error generated
-
-Upstream-Status: Submitted [https://github.com/kraxel/fbida/pull/3]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gfx.h | 1 +
- 1 file changed, 1 insertion(+)
-
---- a/gfx.h
-+++ b/gfx.h
-@@ -1,5 +1,6 @@
- #include <stdbool.h>
- #include <inttypes.h>
-+#include <sys/types.h>
- 
- #include <pixman.h>
- #include <cairo.h>
diff --git a/meta-oe/recipes-graphics/fbida/files/0001-meson.build-install-fbgs-shell-script.patch b/meta-oe/recipes-graphics/fbida/files/0001-meson.build-install-fbgs-shell-script.patch
deleted file mode 100644
index 4d081258be..0000000000
--- a/meta-oe/recipes-graphics/fbida/files/0001-meson.build-install-fbgs-shell-script.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From f9c455e81ad4d870c8ae20b9af8598139231ad26 Mon Sep 17 00:00:00 2001
-From: "Meyer, Wolfgang" <Wolfgang.Meyer@gossenmetrawatt.com>
-Date: Fri, 9 Sep 2022 09:32:22 +0200
-Subject: [PATCH] meson.build: install fbgs shell script
-
-Upstream-Status: Submitted [https://github.com/kraxel/fbida/pull/4]
-Signed-off-by: "Meyer, Wolfgang" <Wolfgang.Meyer@gossenmetrawatt.com>
----
- meson.build | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/meson.build b/meson.build
-index cbed982..2129896 100644
---- a/meson.build
-+++ b/meson.build
-@@ -126,6 +126,9 @@ executable('fbpdf',
-            sources             : fbpdf_srcs,
-            dependencies        : fbpdf_deps,
-            install             : true)
-+install_data('fbgs',
-+             install_dir        : get_option('bindir'),
-+             install_mode       : 'rwxr--r--')
- 
- # build fbcon
- fbcon_srcs   = [ 'fbcon.c', 'drmtools.c', 'fbtools.c', 'gfx.c', 'vt.c', 'kbd.c' ]
--- 
-2.37.3
-
diff --git a/meta-oe/recipes-graphics/fbida/files/0001-meson.build-make-fbpdf-build-optional.patch b/meta-oe/recipes-graphics/fbida/files/0001-meson.build-make-fbpdf-build-optional.patch
deleted file mode 100644
index b872e213aa..0000000000
--- a/meta-oe/recipes-graphics/fbida/files/0001-meson.build-make-fbpdf-build-optional.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From c00a155e90a9b22bd6ab5fa5407bb9923ee16ca0 Mon Sep 17 00:00:00 2001
-From: "Meyer, Wolfgang" <Wolfgang.Meyer@gossenmetrawatt.com>
-Date: Fri, 16 Sep 2022 18:45:58 +0200
-Subject: [PATCH] meson.build: make fbpdf build optional
-
-Upstream-Status: Submitted [https://github.com/kraxel/fbida/pull/4]
-Signed-off-by: "Meyer, Wolfgang" <Wolfgang.Meyer@gossenmetrawatt.com>
----
- meson.build       | 22 ++++++++++++----------
- meson_options.txt |  1 +
- 2 files changed, 13 insertions(+), 10 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 6b3daf3..289d1ec 100644
---- a/meson.build
-+++ b/meson.build
-@@ -15,11 +15,11 @@ x11resdir    = x11resrun.stdout().strip()
- 
- # pkg-config deps
- pixman_dep   = dependency('pixman-1')
--poppler_dep  = dependency('poppler-glib')
-+poppler_dep  = dependency('poppler-glib', required: get_option('pdf'))
- cairo_dep    = dependency('cairo')
- drm_dep      = dependency('libdrm')
--gbm_dep      = dependency('gbm')
--epoxy_dep    = dependency('epoxy')
-+gbm_dep      = dependency('gbm', required: get_option('pdf'))
-+epoxy_dep    = dependency('epoxy', required: get_option('pdf'))
- exif_dep     = dependency('libexif')
- png_dep      = dependency('libpng', required: get_option('png'))
- tiff_dep     = dependency('libtiff-4', required: get_option('tiff'))
-@@ -132,13 +132,15 @@ fbpdf_deps   = [ drm_dep, gbm_dep, epoxy_dep,
-                  pixman_dep, poppler_dep, cairo_dep,
-                  udev_dep, input_dep ]
- 
--executable('fbpdf',
--           sources             : fbpdf_srcs,
--           dependencies        : fbpdf_deps,
--           install             : true)
--install_data('fbgs',
--             install_dir        : get_option('bindir'),
--             install_mode       : 'rwxr--r--')
-+if get_option('pdf').enabled()
-+    executable('fbpdf',
-+               sources             : fbpdf_srcs,
-+               dependencies        : fbpdf_deps,
-+               install             : true)
-+    install_data('fbgs',
-+                 install_dir        : get_option('bindir'),
-+                 install_mode       : 'rwxr--r--')
-+endif
- 
- # build fbcon
- fbcon_srcs   = [ 'fbcon.c', 'drmtools.c', 'fbtools.c', 'gfx.c', 'vt.c', 'kbd.c' ]
-diff --git a/meson_options.txt b/meson_options.txt
-index ce37188..74699ab 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -3,3 +3,4 @@ option('png', type: 'feature', value : 'enabled')
- option('tiff', type: 'feature', value : 'enabled')
- option('webp', type: 'feature', value : 'disabled')
- option('motif', type: 'feature', value : 'disabled')
-+option('pdf', type: 'feature', value : 'enabled')
--- 
-2.37.3
-
diff --git a/meta-oe/recipes-graphics/fbida/files/0002-meson.build-add-features-options-for-png-gif-tiff-we.patch b/meta-oe/recipes-graphics/fbida/files/0002-meson.build-add-features-options-for-png-gif-tiff-we.patch
deleted file mode 100644
index 4f54fbfba7..0000000000
--- a/meta-oe/recipes-graphics/fbida/files/0002-meson.build-add-features-options-for-png-gif-tiff-we.patch
+++ /dev/null
@@ -1,124 +0,0 @@
-From cdcde5c1fd106a69118dff98118600911392762f Mon Sep 17 00:00:00 2001
-From: "Meyer, Wolfgang" <Wolfgang.Meyer@gossenmetrawatt.com>
-Date: Fri, 16 Sep 2022 16:25:38 +0200
-Subject: [PATCH] meson.build: add features options for png, gif, tiff, webp, and motif
-
-Upstream-Status: Submitted [https://github.com/kraxel/fbida/pull/4]
-Signed-off-by: "Meyer, Wolfgang" <Wolfgang.Meyer@gossenmetrawatt.com>
----
- meson.build       | 41 +++++++++++++++++++++++++++--------------
- meson_options.txt |  5 +++++
- selections.c      |  4 ++++
- 3 files changed, 36 insertions(+), 14 deletions(-)
- create mode 100644 meson_options.txt
-
-diff --git a/meson.build b/meson.build
-index cd9cc49..b5e3ffc 100644
---- a/meson.build
-+++ b/meson.build
-@@ -23,9 +23,9 @@ drm_dep      = dependency('libdrm')
- gbm_dep      = dependency('gbm')
- epoxy_dep    = dependency('epoxy')
- exif_dep     = dependency('libexif')
--png_dep      = dependency('libpng')
--tiff_dep     = dependency('libtiff-4')
--webp_dep     = dependency('libwebp', required : false)
-+png_dep      = dependency('libpng', required: get_option('png'))
-+tiff_dep     = dependency('libtiff-4', required: get_option('tiff'))
-+webp_dep     = dependency('libwebp', required : get_option('webp'))
- udev_dep     = dependency('libudev')
- input_dep    = dependency('libinput')
- xkb_dep      = dependency('xkbcommon')
-@@ -36,20 +36,20 @@ jpeg_dep     = cc.find_library('jpeg')
- util_dep     = cc.find_library('util')
- math_dep     = cc.find_library('m', required : false)
- pcd_dep      = cc.find_library('pcd', required : false)
--gif_dep      = cc.find_library('gif', required : false)
-+gif_dep      = cc.find_library('gif', required: get_option('gif'))
- 
- # motif + x11 libs
--motif_dep    = cc.find_library('Xm', required : false)
--xpm_dep      = cc.find_library('Xpm', required : false)
--xt_dep       = cc.find_library('Xt', required : false)
--xext_dep     = cc.find_library('Xext', required : false)
--x11_dep      = cc.find_library('X11', required : false)
-+motif_dep    = cc.find_library('Xm', required : get_option('motif'))
-+xpm_dep      = cc.find_library('Xpm', required : get_option('motif'))
-+xt_dep       = cc.find_library('Xt', required : get_option('motif'))
-+xext_dep     = cc.find_library('Xext', required : get_option('motif'))
-+x11_dep      = cc.find_library('X11', required : get_option('motif'))
- 
- # image formats
- read_srcs    = [ 'readers.c', 'rd/read-ppm.c', 'rd/read-bmp.c',
--                 'rd/read-jpeg.c', 'rd/read-png.c', 'rd/read-tiff.c' ]
-+                 'rd/read-jpeg.c' ]
- write_srcs   = [ 'writers.c', 'wr/write-ppm.c', 'wr/write-ps.c',
--                 'wr/write-jpeg.c', 'wr/write-png.c', 'wr/write-tiff.c' ]
-+                 'wr/write-jpeg.c' ]
- image_deps   = [ jpeg_dep, png_dep, tiff_dep,
-                  pcd_dep, gif_dep, webp_dep ]
- 
-@@ -57,11 +57,21 @@ if pcd_dep.found()
-     read_srcs += 'rd/read-pcd.c'
-     config.set('HAVE_LIBPCD', true)
- endif
--if gif_dep.found()
-+if get_option('png').enabled()
-+    read_srcs += 'rd/read-png.c'
-+    write_srcs += 'wr/write-png.c'
-+    config.set('HAVE_LIBPNG', true)
-+endif
-+if get_option('tiff').enabled()
-+    read_srcs += 'rd/read-tiff.c'
-+    write_srcs += 'wr/write-tiff.c'
-+    config.set('HAVE_LIBTIFF', true)
-+endif
-+if get_option('gif').enabled()
-     read_srcs += 'rd/read-gif.c'
-     config.set('HAVE_LIBGIF', true)
- endif
--if webp_dep.found()
-+if get_option('webp').enabled()
-     read_srcs += 'rd/read-webp.c'
-     config.set('HAVE_LIBWEBP', true)
- endif
-@@ -168,7 +181,7 @@ ida_srcs     = [ 'ida.c', 'man.c', 'hex.c', 'x11.c', 'viewer.c',
- ida_deps     = [ pixman_dep, exif_dep, image_deps, math_dep,
-                  motif_dep, xpm_dep, xt_dep, xext_dep, x11_dep ]
- 
--if motif_dep.found()
-+if get_option('motif').enabled()
-     executable('ida',
-                sources             : ida_srcs,
-                dependencies        : ida_deps,
-diff --git a/meson_options.txt b/meson_options.txt
-new file mode 100644
-index 0000000..ce37188
---- /dev/null
-+++ b/meson_options.txt
-@@ -0,0 +1,5 @@
-+option('gif', type: 'feature', value : 'enabled')
-+option('png', type: 'feature', value : 'enabled')
-+option('tiff', type: 'feature', value : 'enabled')
-+option('webp', type: 'feature', value : 'disabled')
-+option('motif', type: 'feature', value : 'disabled')
-diff --git a/selections.c b/selections.c
-index 7b16264..ccdc686 100644
---- a/selections.c
-+++ b/selections.c
-@@ -609,8 +609,12 @@ void ipc_init()
- #ifdef HAVE_LIBGIF
-     targets[ntargets++] = MIME_IMAGE_GIF;
- #endif
-+#ifdef HAVE_LIBPNG
-     targets[ntargets++] = MIME_IMAGE_PNG;
-+#endif
-+#ifdef HAVE_LIBTIFF
-     targets[ntargets++] = MIME_IMAGE_TIFF;
-+#endif
-     targets[ntargets++] = XA_PIXMAP;
-     targets[ntargets++] = XA_STRING;
- 
--- 
-2.37.3
-
diff --git a/meta-oe/recipes-graphics/fbida/files/0003-meson.build-do-not-require-xkbcommon.patch b/meta-oe/recipes-graphics/fbida/files/0003-meson.build-do-not-require-xkbcommon.patch
deleted file mode 100644
index e769014131..0000000000
--- a/meta-oe/recipes-graphics/fbida/files/0003-meson.build-do-not-require-xkbcommon.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From ec82a194f3454ac203a134c9a99bac6d63095d25 Mon Sep 17 00:00:00 2001
-From: "Meyer, Wolfgang" <Wolfgang.Meyer@gossenmetrawatt.com>
-Date: Fri, 16 Sep 2022 18:29:03 +0200
-Subject: [PATCH] meson.build: do not require xkbcommon
-
-Upstream-Status: Pending
-Signed-off-by: "Meyer, Wolfgang" <Wolfgang.Meyer@gossenmetrawatt.com>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 341939c..b5dab14 100644
---- a/meson.build
-+++ b/meson.build
-@@ -26,7 +26,7 @@ tiff_dep     = dependency('libtiff-4', required: get_option('tiff'))
- webp_dep     = dependency('libwebp', required : get_option('webp'))
- udev_dep     = dependency('libudev')
- input_dep    = dependency('libinput')
--xkb_dep      = dependency('xkbcommon')
-+xkb_dep      = dependency('xkbcommon', required : false)
- tsm_dep      = dependency('libtsm', required : false)
- 
- # other library deps
--- 
-2.37.3
-
diff --git a/meta-oe/recipes-graphics/fbida/files/fbida-gcc10.patch b/meta-oe/recipes-graphics/fbida/files/fbida-gcc10.patch
deleted file mode 100644
index 1104289f3c..0000000000
--- a/meta-oe/recipes-graphics/fbida/files/fbida-gcc10.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-Fix build with gcc10
-
-Patch from https://src.fedoraproject.org/rpms/fbida/raw/master/f/fbida.gcc10.patch
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- fbida-2.14/fbi.c.org	2020-03-15 17:02:17.944189632 +0100
-+++ fbida-2.14/fbi.c	2020-03-15 17:02:21.880223224 +0100
-@@ -100,7 +100,6 @@
- 
- /* graphics interface */
- gfxstate                   *gfx;
--int                        debug;
- 
- /* framebuffer */
- char                       *fbdev = NULL;
---- fbida-2.14/filter.c	2020-03-15 16:44:17.159855150 +0100
-+++ fbida-2.14/filter.c	2020-03-15 16:44:27.017941447 +0100
-@@ -6,8 +6,6 @@
- #include "readers.h"
- #include "filter.h"
- 
--int debug = 0;
--
- /* ----------------------------------------------------------------------- */
- 
- static void
---- fbida-2.14/readers.c.org	2020-03-15 17:01:18.692683597 +0100
-+++ fbida-2.14/readers.c	2020-03-15 16:57:19.141632384 +0100
-@@ -6,6 +6,8 @@
- 
- #include "readers.h"
- 
-+int debug=0;
-+
- /* ----------------------------------------------------------------------- */
- 
- void load_bits_lsb(unsigned char *dst, unsigned char *src, int width,
-
---- fbida-2.14/viewer.c.org	2020-03-15 17:05:02.991595832 +0100
-+++ fbida-2.14/viewer.c	2020-03-15 17:04:55.424531467 +0100
-@@ -40,7 +40,6 @@
- #define PROCESS_LINES    16
- 
--int debug;
- Cursor ptrs[POINTER_COUNT];
- 
- /* ----------------------------------------------------------------------- */
- 
---- fbida-2.14/idaconfig.h.org	2020-03-15 17:07:09.239668196 +0100
-+++ fbida-2.14/idaconfig.h	2020-03-15 17:07:21.248770061 +0100
-@@ -17,7 +17,7 @@
- 
- /* -------------------------------------------------------------------------- */
- 
--char *ida_lists;
-+extern char *ida_lists;
- 
- void ida_init_config(void);
- void ida_read_config(void);
-- 
2.43.0


