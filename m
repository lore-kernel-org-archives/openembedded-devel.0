Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web09.2516.1632253131723317984
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Sep 2021 12:38:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: sakib.sajal@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 18LJcoit016264
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Sep 2021 12:38:50 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 18LJcntc018819
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Sep 2021 12:38:50 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 21 Sep 2021 12:38:49 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Tue, 21 Sep 2021 12:38:49 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 21 Sep 2021 12:38:49 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] gd: upgrade 2.3.2 -> 2.3.3
Date: Tue, 21 Sep 2021 15:38:48 -0400
Message-ID: <20210921193848.22683-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 ...-of-bands-in-reading-tga-header-file.patch |  29 ---
 ...ith-uint32_t-and-uint16-with-uint16_.patch | 170 ------------------
 .../gd/{gd_2.3.2.bb => gd_2.3.3.bb}           |   8 +-
 3 files changed, 3 insertions(+), 204 deletions(-)
 delete mode 100644 meta-oe/recipes-support/gd/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch
 delete mode 100644 meta-oe/recipes-support/gd/gd/0001-replace-uint32-with-uint32_t-and-uint16-with-uint16_.patch
 rename meta-oe/recipes-support/gd/{gd_2.3.2.bb => gd_2.3.3.bb} (81%)

diff --git a/meta-oe/recipes-support/gd/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch b/meta-oe/recipes-support/gd/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch
deleted file mode 100644
index 6152a1184..000000000
--- a/meta-oe/recipes-support/gd/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 8b111b2b4a4842179be66db68d84dda91a246032 Mon Sep 17 00:00:00 2001
-From: maryam ebrahimzadeh <maryam.ebr@student.sharif.edu>
-Date: Mon, 19 Jul 2021 10:07:13 +0430
-Subject: [PATCH] fix read out-of-bands in reading tga header file
-
----
- src/gd_tga.c | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/src/gd_tga.c b/src/gd_tga.c
-index cae9428..286febb 100644
---- a/src/gd_tga.c
-+++ b/src/gd_tga.c
-@@ -191,7 +191,11 @@ int read_header_tga(gdIOCtx *ctx, oTga *tga)
- 			return -1;
- 		}
- 
--		gdGetBuf(tga->ident, tga->identsize, ctx);
-+		
-+		if (gdGetBuf(tga->ident, tga->identsize, ctx) != tga->identsize) {
-+			gd_error("fail to read header ident");
-+			return -1;
-+		}
- 	}
- 
- 	return 1;
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/gd/gd/0001-replace-uint32-with-uint32_t-and-uint16-with-uint16_.patch b/meta-oe/recipes-support/gd/gd/0001-replace-uint32-with-uint32_t-and-uint16-with-uint16_.patch
deleted file mode 100644
index faf349b0b..000000000
--- a/meta-oe/recipes-support/gd/gd/0001-replace-uint32-with-uint32_t-and-uint16-with-uint16_.patch
+++ /dev/null
@@ -1,170 +0,0 @@
-From 4ae9904a10f61ed60f4d4ee02eb1994a95664d7b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 22 Apr 2021 22:48:59 -0700
-Subject: [PATCH] replace uint32 with uint32_t and uint16 with uint16_6
-
-uint16 and uint32 are now deprecated in libtiff and suggestion is to use
-standard C99 types
-
-Upstream-Status: Submitted [https://github.com/libgd/libgd/pull/694]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/gd_tiff.c | 52 +++++++++++++++++++++++++--------------------------
- 1 file changed, 26 insertions(+), 26 deletions(-)
-
-diff --git a/src/gd_tiff.c b/src/gd_tiff.c
-index b22ee6c..699d719 100644
---- a/src/gd_tiff.c
-+++ b/src/gd_tiff.c
-@@ -237,10 +237,10 @@ void tiffWriter(gdImagePtr image, gdIOCtx *out, int bitDepth)
- 	int transparentColorR = -1;
- 	int transparentColorG = -1;
- 	int transparentColorB = -1;
--	uint16 extraSamples[1];
--	uint16 *colorMapRed = NULL;
--	uint16 *colorMapGreen = NULL;
--	uint16 *colorMapBlue = NULL;
-+	uint16_t extraSamples[1];
-+	uint16_t *colorMapRed = NULL;
-+	uint16_t *colorMapGreen = NULL;
-+	uint16_t *colorMapBlue = NULL;
- 
- 	tiff_handle *th;
- 
-@@ -292,18 +292,18 @@ void tiffWriter(gdImagePtr image, gdIOCtx *out, int bitDepth)
- 
- 	/* build the color map for 8 bit images */
- 	if(bitDepth != 24) {
--		colorMapRed   = (uint16 *) gdMalloc(3 * (1 << bitsPerSample));
-+		colorMapRed   = (uint16_t *) gdMalloc(3 * (1 << bitsPerSample));
- 		if (!colorMapRed) {
- 			gdFree(th);
- 			return;
- 		}
--		colorMapGreen = (uint16 *) gdMalloc(3 * (1 << bitsPerSample));
-+		colorMapGreen = (uint16_t *) gdMalloc(3 * (1 << bitsPerSample));
- 		if (!colorMapGreen) {
- 			gdFree(colorMapRed);
- 			gdFree(th);
- 			return;
- 		}
--		colorMapBlue  = (uint16 *) gdMalloc(3 *  (1 << bitsPerSample));
-+		colorMapBlue  = (uint16_t *) gdMalloc(3 *  (1 << bitsPerSample));
- 		if (!colorMapBlue) {
- 			gdFree(colorMapRed);
- 			gdFree(colorMapGreen);
-@@ -448,7 +448,7 @@ BGD_DECLARE(void) gdImageTiffCtx(gdImagePtr image, gdIOCtx *out)
- /* Check if we are really in 8bit mode */
- static int checkColorMap(n, r, g, b)
- int n;
--uint16 *r, *g, *b;
-+uint16_t *r, *g, *b;
- {
- 	while (n-- > 0)
- 		if (*r++ >= 256 || *g++ >= 256 || *b++ >= 256)
-@@ -460,8 +460,8 @@ uint16 *r, *g, *b;
- /* Read and convert a TIFF colormap */
- static int readTiffColorMap(gdImagePtr im, TIFF *tif, char is_bw, int photometric)
- {
--	uint16 *redcmap, *greencmap, *bluecmap;
--	uint16 bps;
-+	uint16_t *redcmap, *greencmap, *bluecmap;
-+	uint16_t bps;
- 	int i;
- 
- 	if (is_bw) {
-@@ -473,7 +473,7 @@ static int readTiffColorMap(gdImagePtr im, TIFF *tif, char is_bw, int photometri
- 			gdImageColorAllocate(im, 255,255,255);
- 		}
- 	} else {
--		uint16 min_sample_val, max_sample_val;
-+		uint16_t min_sample_val, max_sample_val;
- 
- 		if (!TIFFGetField(tif, TIFFTAG_MINSAMPLEVALUE, &min_sample_val)) {
- 			min_sample_val = 0;
-@@ -515,7 +515,7 @@ static int readTiffColorMap(gdImagePtr im, TIFF *tif, char is_bw, int photometri
- 
- static void readTiffBw (const unsigned char *src,
- 			gdImagePtr im,
--			uint16       photometric,
-+			uint16_t       photometric,
- 			int          startx,
- 			int          starty,
- 			int          width,
-@@ -547,7 +547,7 @@ static void readTiffBw (const unsigned char *src,
- 
- static void readTiff8bit (const unsigned char *src,
-                           gdImagePtr im,
--                          uint16       photometric,
-+                          uint16_t       photometric,
-                           int          startx,
-                           int          starty,
-                           int          width,
-@@ -634,10 +634,10 @@ static void readTiff8bit (const unsigned char *src,
- 	}
- }
- 
--static int createFromTiffTiles(TIFF *tif, gdImagePtr im, uint16 bps, uint16 photometric,
-+static int createFromTiffTiles(TIFF *tif, gdImagePtr im, uint16_t bps, uint16_t photometric,
-                                char has_alpha, char is_bw, int extra)
- {
--	uint16  planar;
-+	uint16_t  planar;
- 	int im_width, im_height;
- 	int tile_width, tile_height;
- 	int  x, y, height, width;
-@@ -682,11 +682,11 @@ end:
- 	return success;
- }
- 
--static int createFromTiffLines(TIFF *tif, gdImagePtr im, uint16 bps, uint16 photometric,
-+static int createFromTiffLines(TIFF *tif, gdImagePtr im, uint16_t bps, uint16_t photometric,
-                                char has_alpha, char is_bw, int extra)
- {
--	uint16  planar;
--	uint32 im_height, im_width, y;
-+	uint16_t  planar;
-+	uint32_t im_height, im_width, y;
- 
- 	unsigned char *buffer;
- 	int success = GD_SUCCESS;
-@@ -761,11 +761,11 @@ static int createFromTiffRgba(TIFF * tif, gdImagePtr im)
- 	int color;
- 	int width = im->sx;
- 	int height = im->sy;
--	uint32 *buffer;
--	uint32 rgba;
-+	uint32_t *buffer;
-+	uint32_t rgba;
- 	int success;
- 
--	buffer = (uint32 *) gdCalloc(sizeof(uint32), width * height);
-+	buffer = (uint32_t *) gdCalloc(sizeof(uint32_t), width * height);
- 	if (!buffer) {
- 		return GD_FAILURE;
- 	}
-@@ -810,11 +810,11 @@ BGD_DECLARE(gdImagePtr) gdImageCreateFromTiffCtx(gdIOCtx *infile)
- 	TIFF *tif;
- 	tiff_handle *th;
- 
--	uint16 bps, spp, photometric;
--	uint16 orientation;
-+	uint16_t bps, spp, photometric;
-+	uint16_t orientation;
- 	int width, height;
--	uint16 extra, *extra_types;
--	uint16 planar;
-+	uint16_t extra, *extra_types;
-+	uint16_t planar;
- 	char	has_alpha, is_bw, is_gray;
- 	char	force_rgba = FALSE;
- 	char	save_transparent;
-@@ -867,7 +867,7 @@ BGD_DECLARE(gdImagePtr) gdImageCreateFromTiffCtx(gdIOCtx *infile)
- 	}
- 
- 	if (!TIFFGetField (tif, TIFFTAG_PHOTOMETRIC, &photometric)) {
--		uint16 compression;
-+		uint16_t compression;
- 		if (TIFFGetField(tif, TIFFTAG_COMPRESSION, &compression) &&
- 		        (compression == COMPRESSION_CCITTFAX3 ||
- 		         compression == COMPRESSION_CCITTFAX4 ||
diff --git a/meta-oe/recipes-support/gd/gd_2.3.2.bb b/meta-oe/recipes-support/gd/gd_2.3.3.bb
similarity index 81%
rename from meta-oe/recipes-support/gd/gd_2.3.2.bb
rename to meta-oe/recipes-support/gd/gd_2.3.3.bb
index 32484ce79..cbd45c088 100644
--- a/meta-oe/recipes-support/gd/gd_2.3.2.bb
+++ b/meta-oe/recipes-support/gd/gd_2.3.3.bb
@@ -9,16 +9,14 @@ HOMEPAGE = "http://libgd.github.io/"
 
 SECTION = "libs"
 LICENSE = "GD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8e5bc8627b9494741c905d65238c66b7"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ace63adfdac78400fc30fa22ee9c1bb1"
 
 DEPENDS = "freetype libpng jpeg zlib tiff"
 
-SRC_URI = "git://github.com/libgd/libgd.git;branch=master \
-           file://0001-replace-uint32-with-uint32_t-and-uint16-with-uint16_.patch \
-           file://0001-fix-read-out-of-bands-in-reading-tga-header-file.patch \
+SRC_URI = "git://github.com/libgd/libgd.git;nobranch=1 \
            "
 
-SRCREV = "2e40f55bfb460fc9d8cbcd290a0c9eb908d5af7e"
+SRCREV = "b5319a41286107b53daa0e08e402aa1819764bdc"
 
 S = "${WORKDIR}/git"
 
-- 
2.33.0

