Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 97E6977377
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 14:23:42 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 23 Feb 2016 06:23:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,489,1449561600"; d="scan'208";a="751677029"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2016 06:23:42 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Feb 2016 16:20:06 +0200
Message-Id: <14534fea3286420b1705a4d0d7a26d30fbe86d01.1456236552.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 27/34] gegl: update to 0.3.4
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
X-List-Received-Date: Tue, 23 Feb 2016 14:23:42 -0000

This fixes gobject introspection support.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../gegl/{gegl_0.2.0.bb => gegl_0.3.4.bb}          | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-graphics/gegl/{gegl_0.2.0.bb => gegl_0.3.4.bb} (46%)

diff --git a/meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb b/meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb
similarity index 46%
rename from meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb
rename to meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb
index bd2e5d4..64599d3 100644
--- a/meta-oe/recipes-graphics/gegl/gegl_0.2.0.bb
+++ b/meta-oe/recipes-graphics/gegl/gegl_0.3.4.bb
@@ -1,24 +1,28 @@
 SUMMARY = "GEGL (Generic Graphics Library) is a graph based image processing framework"
 LICENSE = "LGPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-DEPENDS = "babl librsvg glib-2.0 gtk+ pango cairo expat zlib libpng jpeg virtual/libsdl"
+DEPENDS = "babl librsvg glib-2.0 gtk+ pango cairo expat zlib libpng jpeg virtual/libsdl json-glib"
 
-inherit gnome
+EXTRA_OECONF = "--disable-docs"
 
-EXTRA_OECONF = "--disable-docs "
+inherit gnomebase vala
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[jasper] = "--with-jasper,--without-jasper,jasper"
 PACKAGECONFIG[avformat] = "--with-libavformat,--without-libavformat,libav"
+PACKAGECONFIG[lcms] = "--with-lcms,--without-lcms,lcms"
+PACKAGECONFIG[tiff] = "--with-libtiff,--without-libtiff,tiff"
+PACKAGECONFIG[webp] = "--with-webp,--without-webp,webp"
 
-SRC_URI = "http://ftp.gimp.org/pub/${BPN}/0.2/${BP}.tar.bz2 \
+SRC_URI = "http://ftp.gimp.org/pub/${BPN}/0.3/${BP}.tar.bz2 \
            file://pkgconfig.patch "
-SRC_URI[md5sum] = "32b00002f1f1e316115c4ed922e1dec8"
-SRC_URI[sha256sum] = "df2e6a0d9499afcbc4f9029c18d9d1e0dd5e8710a75e17c9b1d9a6480dd8d426"
+SRC_URI[md5sum] = "c19478321594d715a4cb324a0decda6f"
+SRC_URI[sha256sum] = "846290a790854d1e6b7c17a2d6f82ad7cb14c72e240bd3b81b98cc0ceddbc3ec"
 
-FILES_${PN} += "${libdir}/gegl-*/*.so"
-FILES_${PN}-dev += "${libdir}/gegl-*/*.la"
-FILES_${PN}-dbg += "${libdir}/gegl-*/.debug"
+# There are a couple of non-symlink .so files installed into libdir, which need to go into main package
+FILES_${PN}_append = " ${libdir}/gegl-0.3/*.so ${libdir}/gegl-0.3/*.json ${libdir}/libgegl-npd-0.3.so ${libdir}/libgegl-sc-0.3.so"
+FILES_${PN}-dev_append = " ${libdir}/gegl-0.3/*.la ${libdir}/libgegl-0.3.so"
+FILES_${PN}-dev_remove = "${libdir}/lib*.so"
 
 # Fails to build with thumb-1 (qemuarm)
 # gegl-0.2.0/operations/common/matting-global.c: In function 'matting_process':
-- 
2.7.0


