Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2693D769A7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Sep 2015 12:25:09 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 14 Sep 2015 05:25:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,527,1437462000"; d="scan'208";a="644443686"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 14 Sep 2015 05:25:09 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Sep 2015 15:26:45 +0300
Message-Id: <1442233610-32279-6-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1442233610-32279-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1442233610-32279-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 6/9] libwebp: remove the recipe due to its move to oe-core
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
X-List-Received-Date: Mon, 14 Sep 2015 12:25:09 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-oe/recipes-multimedia/webp/libwebp_0.4.0.bb | 47 ------------------------
 1 file changed, 47 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/webp/libwebp_0.4.0.bb

diff --git a/meta-oe/recipes-multimedia/webp/libwebp_0.4.0.bb b/meta-oe/recipes-multimedia/webp/libwebp_0.4.0.bb
deleted file mode 100644
index 7663b3b..0000000
--- a/meta-oe/recipes-multimedia/webp/libwebp_0.4.0.bb
+++ /dev/null
@@ -1,47 +0,0 @@
-SUMMARY = "WebP is an image format designed for the Web"
-DESCRIPTION = "WebP is a method of lossy and lossless compression that can be \
-               used on a large variety of photographic, translucent and \
-               graphical images found on the web. The degree of lossy \
-               compression is adjustable so a user can choose the trade-off \
-               between file size and image quality. WebP typically achieves \
-               an average of 30% more compression than JPEG and JPEG 2000, \
-               without loss of image quality."
-HOMEPAGE = "https://developers.google.com/speed/webp/"
-SECTION = "libs"
-
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://PATENTS;md5=7ec8a34de2073ea13ea2991006246d20"
-
-DEPENDS = "giflib"
-
-SRC_URI = "https://webp.googlecode.com/files/${BP}.tar.gz"
-SRC_URI[md5sum] = "c8dd1d26eb9566833aba269b86d97e68"
-SRC_URI[sha256sum] = "31913577e96386556855b41d210736449445fe96cfbe9289014e9b8afa944d69"
-
-EXTRA_OECONF = " \
-    --disable-experimental \
-    --disable-wic \
-    --enable-libwebpmux \
-    --enable-libwebpdemux \
-    --enable-threading \
-"
-
-inherit autotools lib_package
-
-PACKAGECONFIG ??= ""
-
-# libwebpdecoder is a subset of libwebp, don't build it unless requested
-PACKAGECONFIG[decoder] = "--enable-libwebpdecoder,--disable-libwebpdecoder"
-
-# Apply for examples programs: cwebp and dwebp
-PACKAGECONFIG[jpeg] = ",ac_cv_header_jpeglib_h=no,jpeg"
-PACKAGECONFIG[png] = ",ac_cv_header_png_h=no,libpng"
-PACKAGECONFIG[tiff] = ",ac_cv_header_tiffio_h=no,tiff"
-
-# Apply only for example program vwebp
-PACKAGECONFIG[gl] = ",,mesa-glut"
-
-PACKAGES =+ "${PN}-gif2webp"
-
-DESCRIPTION_${PN}-gif2webp = "Simple tool to convert animated GIFs to WebP"
-FILES_${PN}-gif2webp = "${bindir}/gif2webp"
-- 
2.1.4


