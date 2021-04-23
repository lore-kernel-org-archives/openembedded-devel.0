Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.5982.1619157495236706151
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Apr 2021 22:58:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KlxApk5g;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id p2so19031517pgh.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Apr 2021 22:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mvN8BRJmtyu9j4pNtE5c5v+3rMH0W7GOGxHKgTlGlFo=;
        b=KlxApk5gpHDryX9E07Lah8ef7crjmaGBeAIqDTX0ntUgBllsezIO3CShuqpov0qIPl
         M3gwZEZ6iWFQWp/LE7UalDV3u1KUkYv5DeOgtCfqvAjjXPbYylX6+f5gjsR2FHChOclJ
         MIQ44qS5s2v3vDzfvOQYUxX48EvZSN4DhM6BvpU1eiY3oXNMytGU30tcVPwpdM3uNJvY
         iHtqeWhn+x1j2LP2DkQKhuN5NaQBUfLsktCTMLSkKTlvSgKVH1ongdCGdLuMTjVZRpX1
         4XawHrP2hi5Ce1XJAiKpKDGYlqw9YcoGs+bjb5b/309PRf/hJmT0kkgcFGeJ21wKJ5N/
         vc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mvN8BRJmtyu9j4pNtE5c5v+3rMH0W7GOGxHKgTlGlFo=;
        b=oRjkfh6Lhr/NRDPxfBvi7pb29XnzUWZvQtnSl5kc7XW4a/myGhFVvVu7soqyC4s61I
         mltpamE9r/7unkeA7Gg41BZsz+7NBmcxbvLgEac2q+LPwozq06nY3sjwd9Dzsvow6q+2
         ehlfHwV40RNEkkmq9C9vunigW1PsuPQKOlYZA2UJzhecwyah0vWnEEiOUwyAaWUCnwVi
         1kaaXf6ZFANEXy5ORgvlpwAUBVyoIwXXEmB69wfUq/UZnjManubSRWiW4CVFthyWScJp
         qtZJ6qBxF+h6hGc8YR9RjxlhIZ2TRp9pgMgtgI42qQTFruHyjlFKteE6MaYHYil9QQIW
         992w==
X-Gm-Message-State: AOAM532h+SjJ1WMldrUw+unFNtkFleXC6+TDQ2VVSgBTehwSENG+OJiZ
	EGbEuAaY1ViDYfNW3PwCGZmqz6OTg7uDnQ==
X-Google-Smtp-Source: ABdhPJwfn7QFsuRiublEPBvxUBoVn+UY9KDlvP6dEMbdTFxqCtFylMC7Y52fyPaLnZ2wbxAclaPiDw==
X-Received: by 2002:a63:150c:: with SMTP id v12mr2294084pgl.344.1619157494494;
        Thu, 22 Apr 2021 22:58:14 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id n23sm3782153pgl.49.2021.04.22.22.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 22:58:14 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-oe][PATCH] gd: Replace deprecated types from tiff
Date: Thu, 22 Apr 2021 22:58:12 -0700
Message-Id: <20210423055812.325405-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are now flagged with new tiff >= 4.3.0

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ith-uint32_t-and-uint16-with-uint16_.patch | 170 ++++++++++++++++++
 meta-oe/recipes-support/gd/gd_2.3.2.bb        |   3 +-
 2 files changed, 172 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/gd/gd/0001-replace-uint32-with-uint32_t-and-uint16-with-uint16_.patch

diff --git a/meta-oe/recipes-support/gd/gd/0001-replace-uint32-with-uint32_t-and-uint16-with-uint16_.patch b/meta-oe/recipes-support/gd/gd/0001-replace-uint32-with-uint32_t-and-uint16-with-uint16_.patch
new file mode 100644
index 0000000000..faf349b0b5
--- /dev/null
+++ b/meta-oe/recipes-support/gd/gd/0001-replace-uint32-with-uint32_t-and-uint16-with-uint16_.patch
@@ -0,0 +1,170 @@
+From 4ae9904a10f61ed60f4d4ee02eb1994a95664d7b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 22 Apr 2021 22:48:59 -0700
+Subject: [PATCH] replace uint32 with uint32_t and uint16 with uint16_6
+
+uint16 and uint32 are now deprecated in libtiff and suggestion is to use
+standard C99 types
+
+Upstream-Status: Submitted [https://github.com/libgd/libgd/pull/694]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/gd_tiff.c | 52 +++++++++++++++++++++++++--------------------------
+ 1 file changed, 26 insertions(+), 26 deletions(-)
+
+diff --git a/src/gd_tiff.c b/src/gd_tiff.c
+index b22ee6c..699d719 100644
+--- a/src/gd_tiff.c
++++ b/src/gd_tiff.c
+@@ -237,10 +237,10 @@ void tiffWriter(gdImagePtr image, gdIOCtx *out, int bitDepth)
+ 	int transparentColorR = -1;
+ 	int transparentColorG = -1;
+ 	int transparentColorB = -1;
+-	uint16 extraSamples[1];
+-	uint16 *colorMapRed = NULL;
+-	uint16 *colorMapGreen = NULL;
+-	uint16 *colorMapBlue = NULL;
++	uint16_t extraSamples[1];
++	uint16_t *colorMapRed = NULL;
++	uint16_t *colorMapGreen = NULL;
++	uint16_t *colorMapBlue = NULL;
+ 
+ 	tiff_handle *th;
+ 
+@@ -292,18 +292,18 @@ void tiffWriter(gdImagePtr image, gdIOCtx *out, int bitDepth)
+ 
+ 	/* build the color map for 8 bit images */
+ 	if(bitDepth != 24) {
+-		colorMapRed   = (uint16 *) gdMalloc(3 * (1 << bitsPerSample));
++		colorMapRed   = (uint16_t *) gdMalloc(3 * (1 << bitsPerSample));
+ 		if (!colorMapRed) {
+ 			gdFree(th);
+ 			return;
+ 		}
+-		colorMapGreen = (uint16 *) gdMalloc(3 * (1 << bitsPerSample));
++		colorMapGreen = (uint16_t *) gdMalloc(3 * (1 << bitsPerSample));
+ 		if (!colorMapGreen) {
+ 			gdFree(colorMapRed);
+ 			gdFree(th);
+ 			return;
+ 		}
+-		colorMapBlue  = (uint16 *) gdMalloc(3 *  (1 << bitsPerSample));
++		colorMapBlue  = (uint16_t *) gdMalloc(3 *  (1 << bitsPerSample));
+ 		if (!colorMapBlue) {
+ 			gdFree(colorMapRed);
+ 			gdFree(colorMapGreen);
+@@ -448,7 +448,7 @@ BGD_DECLARE(void) gdImageTiffCtx(gdImagePtr image, gdIOCtx *out)
+ /* Check if we are really in 8bit mode */
+ static int checkColorMap(n, r, g, b)
+ int n;
+-uint16 *r, *g, *b;
++uint16_t *r, *g, *b;
+ {
+ 	while (n-- > 0)
+ 		if (*r++ >= 256 || *g++ >= 256 || *b++ >= 256)
+@@ -460,8 +460,8 @@ uint16 *r, *g, *b;
+ /* Read and convert a TIFF colormap */
+ static int readTiffColorMap(gdImagePtr im, TIFF *tif, char is_bw, int photometric)
+ {
+-	uint16 *redcmap, *greencmap, *bluecmap;
+-	uint16 bps;
++	uint16_t *redcmap, *greencmap, *bluecmap;
++	uint16_t bps;
+ 	int i;
+ 
+ 	if (is_bw) {
+@@ -473,7 +473,7 @@ static int readTiffColorMap(gdImagePtr im, TIFF *tif, char is_bw, int photometri
+ 			gdImageColorAllocate(im, 255,255,255);
+ 		}
+ 	} else {
+-		uint16 min_sample_val, max_sample_val;
++		uint16_t min_sample_val, max_sample_val;
+ 
+ 		if (!TIFFGetField(tif, TIFFTAG_MINSAMPLEVALUE, &min_sample_val)) {
+ 			min_sample_val = 0;
+@@ -515,7 +515,7 @@ static int readTiffColorMap(gdImagePtr im, TIFF *tif, char is_bw, int photometri
+ 
+ static void readTiffBw (const unsigned char *src,
+ 			gdImagePtr im,
+-			uint16       photometric,
++			uint16_t       photometric,
+ 			int          startx,
+ 			int          starty,
+ 			int          width,
+@@ -547,7 +547,7 @@ static void readTiffBw (const unsigned char *src,
+ 
+ static void readTiff8bit (const unsigned char *src,
+                           gdImagePtr im,
+-                          uint16       photometric,
++                          uint16_t       photometric,
+                           int          startx,
+                           int          starty,
+                           int          width,
+@@ -634,10 +634,10 @@ static void readTiff8bit (const unsigned char *src,
+ 	}
+ }
+ 
+-static int createFromTiffTiles(TIFF *tif, gdImagePtr im, uint16 bps, uint16 photometric,
++static int createFromTiffTiles(TIFF *tif, gdImagePtr im, uint16_t bps, uint16_t photometric,
+                                char has_alpha, char is_bw, int extra)
+ {
+-	uint16  planar;
++	uint16_t  planar;
+ 	int im_width, im_height;
+ 	int tile_width, tile_height;
+ 	int  x, y, height, width;
+@@ -682,11 +682,11 @@ end:
+ 	return success;
+ }
+ 
+-static int createFromTiffLines(TIFF *tif, gdImagePtr im, uint16 bps, uint16 photometric,
++static int createFromTiffLines(TIFF *tif, gdImagePtr im, uint16_t bps, uint16_t photometric,
+                                char has_alpha, char is_bw, int extra)
+ {
+-	uint16  planar;
+-	uint32 im_height, im_width, y;
++	uint16_t  planar;
++	uint32_t im_height, im_width, y;
+ 
+ 	unsigned char *buffer;
+ 	int success = GD_SUCCESS;
+@@ -761,11 +761,11 @@ static int createFromTiffRgba(TIFF * tif, gdImagePtr im)
+ 	int color;
+ 	int width = im->sx;
+ 	int height = im->sy;
+-	uint32 *buffer;
+-	uint32 rgba;
++	uint32_t *buffer;
++	uint32_t rgba;
+ 	int success;
+ 
+-	buffer = (uint32 *) gdCalloc(sizeof(uint32), width * height);
++	buffer = (uint32_t *) gdCalloc(sizeof(uint32_t), width * height);
+ 	if (!buffer) {
+ 		return GD_FAILURE;
+ 	}
+@@ -810,11 +810,11 @@ BGD_DECLARE(gdImagePtr) gdImageCreateFromTiffCtx(gdIOCtx *infile)
+ 	TIFF *tif;
+ 	tiff_handle *th;
+ 
+-	uint16 bps, spp, photometric;
+-	uint16 orientation;
++	uint16_t bps, spp, photometric;
++	uint16_t orientation;
+ 	int width, height;
+-	uint16 extra, *extra_types;
+-	uint16 planar;
++	uint16_t extra, *extra_types;
++	uint16_t planar;
+ 	char	has_alpha, is_bw, is_gray;
+ 	char	force_rgba = FALSE;
+ 	char	save_transparent;
+@@ -867,7 +867,7 @@ BGD_DECLARE(gdImagePtr) gdImageCreateFromTiffCtx(gdIOCtx *infile)
+ 	}
+ 
+ 	if (!TIFFGetField (tif, TIFFTAG_PHOTOMETRIC, &photometric)) {
+-		uint16 compression;
++		uint16_t compression;
+ 		if (TIFFGetField(tif, TIFFTAG_COMPRESSION, &compression) &&
+ 		        (compression == COMPRESSION_CCITTFAX3 ||
+ 		         compression == COMPRESSION_CCITTFAX4 ||
diff --git a/meta-oe/recipes-support/gd/gd_2.3.2.bb b/meta-oe/recipes-support/gd/gd_2.3.2.bb
index 37896415ee..4e95fa9549 100644
--- a/meta-oe/recipes-support/gd/gd_2.3.2.bb
+++ b/meta-oe/recipes-support/gd/gd_2.3.2.bb
@@ -14,7 +14,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8e5bc8627b9494741c905d65238c66b7"
 DEPENDS = "freetype libpng jpeg zlib tiff"
 
 SRC_URI = "git://github.com/libgd/libgd.git;branch=master \
-          "
+           file://0001-replace-uint32-with-uint32_t-and-uint16-with-uint16_.patch \
+           "
 
 SRCREV = "2e40f55bfb460fc9d8cbcd290a0c9eb908d5af7e"
 
-- 
2.31.1

