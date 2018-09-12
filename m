Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 53480796D2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2018 09:32:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8C9WBTP022407
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2018 02:32:32 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 12 Sep 2018 02:32:02 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Sep 2018 02:32:02 -0700
Message-ID: <20180912093202.124643-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] gd: Fix CVE-2018-1000222
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
X-List-Received-Date: Wed, 12 Sep 2018 09:32:41 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

check return value in gdImageBmpPtr

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../gd/gd/CVE-2018-1000222.patch              | 82 +++++++++++++++++++
 meta-oe/recipes-support/gd/gd_2.2.5.bb        |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta-oe/recipes-support/gd/gd/CVE-2018-1000222.patch

diff --git a/meta-oe/recipes-support/gd/gd/CVE-2018-1000222.patch b/meta-oe/recipes-support/gd/gd/CVE-2018-1000222.patch
new file mode 100644
index 000000000..25924d1aa
--- /dev/null
+++ b/meta-oe/recipes-support/gd/gd/CVE-2018-1000222.patch
@@ -0,0 +1,82 @@
+From 4b1e18a00ce7c4b7e6919c3b3109a034393b805a Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Sat, 14 Jul 2018 13:54:08 -0400
+Subject: [PATCH] bmp: check return value in gdImageBmpPtr
+
+Closes #447.
+
+(cherry picked from commit ac16bdf2d41724b5a65255d4c28fb0ec46bc42f5)
+
+Upstream-Status: Backport [https://github.com/libgd/libgd/commit/4b1e18a00ce7c4b7e6919c3b3109a034393b805a]
+CVE: CVE-2018-1000222
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ src/gd_bmp.c | 17 ++++++++++++++---
+ 1 file changed, 14 insertions(+), 3 deletions(-)
+
+diff --git a/src/gd_bmp.c b/src/gd_bmp.c
+index ccafdcd..d625da1 100644
+--- a/src/gd_bmp.c
++++ b/src/gd_bmp.c
+@@ -48,6 +48,8 @@ static int bmp_read_4bit(gdImagePtr im, gdIOCtxPtr infile, bmp_info_t *info, bmp
+ static int bmp_read_8bit(gdImagePtr im, gdIOCtxPtr infile, bmp_info_t *info, bmp_hdr_t *header);
+ static int bmp_read_rle(gdImagePtr im, gdIOCtxPtr infile, bmp_info_t *info);
+ 
++static int _gdImageBmpCtx(gdImagePtr im, gdIOCtxPtr out, int compression);
++
+ #define BMP_DEBUG(s)
+ 
+ static int gdBMPPutWord(gdIOCtx *out, int w)
+@@ -88,8 +90,10 @@ BGD_DECLARE(void *) gdImageBmpPtr(gdImagePtr im, int *size, int compression)
+ 	void *rv;
+ 	gdIOCtx *out = gdNewDynamicCtx(2048, NULL);
+ 	if (out == NULL) return NULL;
+-	gdImageBmpCtx(im, out, compression);
+-	rv = gdDPExtractData(out, size);
++	if (!_gdImageBmpCtx(im, out, compression))
++		rv = gdDPExtractData(out, size);
++	else
++		rv = NULL;
+ 	out->gd_free(out);
+ 	return rv;
+ }
+@@ -142,6 +146,11 @@ BGD_DECLARE(void) gdImageBmp(gdImagePtr im, FILE *outFile, int compression)
+ 		compression - whether to apply RLE or not.
+ */
+ BGD_DECLARE(void) gdImageBmpCtx(gdImagePtr im, gdIOCtxPtr out, int compression)
++{
++	_gdImageBmpCtx(im, out, compression);
++}
++
++static int _gdImageBmpCtx(gdImagePtr im, gdIOCtxPtr out, int compression)
+ {
+ 	int bitmap_size = 0, info_size, total_size, padding;
+ 	int i, row, xpos, pixel;
+@@ -149,6 +158,7 @@ BGD_DECLARE(void) gdImageBmpCtx(gdImagePtr im, gdIOCtxPtr out, int compression)
+ 	unsigned char *uncompressed_row = NULL, *uncompressed_row_start = NULL;
+ 	FILE *tmpfile_for_compression = NULL;
+ 	gdIOCtxPtr out_original = NULL;
++	int ret = 1;
+ 
+ 	/* No compression if its true colour or we don't support seek */
+ 	if (im->trueColor) {
+@@ -326,6 +336,7 @@ BGD_DECLARE(void) gdImageBmpCtx(gdImagePtr im, gdIOCtxPtr out, int compression)
+ 		out_original = NULL;
+ 	}
+ 
++	ret = 0;
+ cleanup:
+ 	if (tmpfile_for_compression) {
+ #ifdef _WIN32
+@@ -339,7 +350,7 @@ cleanup:
+ 	if (out_original) {
+ 		out_original->gd_free(out_original);
+ 	}
+-	return;
++	return ret;
+ }
+ 
+ static int compress_row(unsigned char *row, int length)
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-support/gd/gd_2.2.5.bb b/meta-oe/recipes-support/gd/gd_2.2.5.bb
index 62d0df008..548d2c578 100644
--- a/meta-oe/recipes-support/gd/gd_2.2.5.bb
+++ b/meta-oe/recipes-support/gd/gd_2.2.5.bb
@@ -15,6 +15,7 @@ DEPENDS = "freetype libpng jpeg zlib tiff"
 
 SRC_URI = "git://github.com/libgd/libgd.git;branch=GD-2.2 \
            file://0001-annotate.c-gdft.c-Replace-strncpy-with-memccpy-to-fi.patch \
+           file://CVE-2018-1000222.patch \
           "
 
 SRCREV = "8255231b68889597d04d451a72438ab92a405aba"
-- 
2.17.1


