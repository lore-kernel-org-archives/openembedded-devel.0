Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.5179.1585253786219445297
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2020 13:16:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ssajal@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 02QKG3lo013533
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2020 13:16:15 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Thu, 26 Mar 2020
 13:15:52 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 20885)	id D416E9005E4;
 Thu, 26 Mar 2020 13:15:52 -0700 (PDT)
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] gd: uprev from 2.2.5 to 2.3.0
Date: Thu, 26 Mar 2020 13:15:45 -0700
Message-ID: <20200326201545.73708-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Major release after 2.2.5.
Changelog: https://github.com/libgd/libgd/blob/gd-2.3.0/CHANGELOG.md

Changes:
- SRC_REV points to tag gd-2.3.0
- branch in SRC_URI points to master
- updated homepage
- removed patches as they were merged upstream
	 under gd-2.3.0 tag

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 ...c-Replace-strncpy-with-memccpy-to-fi.patch |  46 ---
 .../recipes-support/gd/gd/CVE-2017-6363.patch |  35 --
 .../gd/gd/CVE-2018-1000222.patch              |  82 -----
 .../gd/gd/CVE-2018-14553.patch                | 110 -------
 .../recipes-support/gd/gd/CVE-2019-6978.patch | 299 ------------------
 .../gd/{gd_2.2.5.bb => gd_2.3.0.bb}           |  13 +-
 6 files changed, 4 insertions(+), 581 deletions(-)
 delete mode 100644 meta-oe/recipes-support/gd/gd/0001-annotate.c-gdft.c-Replace-strncpy-with-memccpy-to-fi.patch
 delete mode 100644 meta-oe/recipes-support/gd/gd/CVE-2017-6363.patch
 delete mode 100644 meta-oe/recipes-support/gd/gd/CVE-2018-1000222.patch
 delete mode 100644 meta-oe/recipes-support/gd/gd/CVE-2018-14553.patch
 delete mode 100644 meta-oe/recipes-support/gd/gd/CVE-2019-6978.patch
 rename meta-oe/recipes-support/gd/{gd_2.2.5.bb => gd_2.3.0.bb} (74%)

diff --git a/meta-oe/recipes-support/gd/gd/0001-annotate.c-gdft.c-Replace-strncpy-with-memccpy-to-fi.patch b/meta-oe/recipes-support/gd/gd/0001-annotate.c-gdft.c-Replace-strncpy-with-memccpy-to-fi.patch
deleted file mode 100644
index c377b370e..000000000
--- a/meta-oe/recipes-support/gd/gd/0001-annotate.c-gdft.c-Replace-strncpy-with-memccpy-to-fi.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 85c7694a5cf34597909bdd1ca6931b0f99904c2e Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Tue, 19 Jun 2018 00:40:49 -0700
-Subject: [PATCH] annotate.c/gdft.c: Replace strncpy with memccpy to fix
- -Wstringop-truncation.
-
-Fixed for gcc8:
-git/src/gdft.c:1699:2: error: 'strncpy' output truncated before terminating nul copying as many bytes from a string as its length [-Werror=stringop-truncation]
-
-Upstream-Status: Submitted [https://github.com/libgd/libgd/pull/442]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- src/annotate.c | 2 +-
- src/gdft.c     | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/annotate.c b/src/annotate.c
-index 00aaf49..17df813 100644
---- a/src/annotate.c
-+++ b/src/annotate.c
-@@ -104,7 +104,7 @@ int main(int argc, char *argv[])
- 					fprintf(stderr, "Font maximum length is 1024, %d given\n", font_len);
- 					goto badLine;
- 				}
--				strncpy(font, st, font_len);
-+				memcpy(font, st, font_len);
- 			}
- 		} else if(!strcmp(st, "align")) {
- 			char *st = strtok(0, " \t\r\n");
-diff --git a/src/gdft.c b/src/gdft.c
-index 9fa8295..81dbe41 100644
---- a/src/gdft.c
-+++ b/src/gdft.c
-@@ -1696,7 +1696,7 @@ static char * font_path(char **fontpath, char *name_list)
- 		gdFree(path);
- 		return "could not alloc full list of fonts";
- 	}
--	strncpy(fontlist, name_list, name_list_len);
-+	memcpy(fontlist, name_list, name_list_len);
- 	fontlist[name_list_len] = 0;
- 
- 	/*
--- 
-2.10.2
-
diff --git a/meta-oe/recipes-support/gd/gd/CVE-2017-6363.patch b/meta-oe/recipes-support/gd/gd/CVE-2017-6363.patch
deleted file mode 100644
index 25b5880ff..000000000
--- a/meta-oe/recipes-support/gd/gd/CVE-2017-6363.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 8f7b60ea7db87de5df76169e3f3918e401ef8bf7 Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <vapier@gentoo.org>
-Date: Wed, 31 Jan 2018 14:50:16 -0500
-Subject: [PATCH] gd/gd2: make sure transparent palette index is within bounds
- #383
-
-The gd image formats allow for a palette of 256 colors,
-so if the transparent index is out of range, disable it.
-
-Upstream-Status: Backport
-[https://github.com/libgd/libgd.git commit:0be86e1926939a98afbd2f3a23c673dfc4df2a7c]
-CVE-2017-6363
-
-Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
----
- src/gd_gd.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/gd_gd.c b/src/gd_gd.c
-index f8d39cb..5a86fc3 100644
---- a/src/gd_gd.c
-+++ b/src/gd_gd.c
-@@ -54,7 +54,8 @@ _gdGetColors (gdIOCtx * in, gdImagePtr im, int gd2xFlag)
- 		if (!gdGetWord (&im->transparent, in)) {
- 			goto fail1;
- 		}
--		if (im->transparent == 257) {
-+		/* Make sure transparent index is within bounds of the palette. */
-+		if (im->transparent >= 256 || im->transparent < 0) {
- 			im->transparent = (-1);
- 		}
- 	}
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-support/gd/gd/CVE-2018-1000222.patch b/meta-oe/recipes-support/gd/gd/CVE-2018-1000222.patch
deleted file mode 100644
index 25924d1aa..000000000
--- a/meta-oe/recipes-support/gd/gd/CVE-2018-1000222.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 4b1e18a00ce7c4b7e6919c3b3109a034393b805a Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <vapier@gentoo.org>
-Date: Sat, 14 Jul 2018 13:54:08 -0400
-Subject: [PATCH] bmp: check return value in gdImageBmpPtr
-
-Closes #447.
-
-(cherry picked from commit ac16bdf2d41724b5a65255d4c28fb0ec46bc42f5)
-
-Upstream-Status: Backport [https://github.com/libgd/libgd/commit/4b1e18a00ce7c4b7e6919c3b3109a034393b805a]
-CVE: CVE-2018-1000222
-Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
----
- src/gd_bmp.c | 17 ++++++++++++++---
- 1 file changed, 14 insertions(+), 3 deletions(-)
-
-diff --git a/src/gd_bmp.c b/src/gd_bmp.c
-index ccafdcd..d625da1 100644
---- a/src/gd_bmp.c
-+++ b/src/gd_bmp.c
-@@ -48,6 +48,8 @@ static int bmp_read_4bit(gdImagePtr im, gdIOCtxPtr infile, bmp_info_t *info, bmp
- static int bmp_read_8bit(gdImagePtr im, gdIOCtxPtr infile, bmp_info_t *info, bmp_hdr_t *header);
- static int bmp_read_rle(gdImagePtr im, gdIOCtxPtr infile, bmp_info_t *info);
- 
-+static int _gdImageBmpCtx(gdImagePtr im, gdIOCtxPtr out, int compression);
-+
- #define BMP_DEBUG(s)
- 
- static int gdBMPPutWord(gdIOCtx *out, int w)
-@@ -88,8 +90,10 @@ BGD_DECLARE(void *) gdImageBmpPtr(gdImagePtr im, int *size, int compression)
- 	void *rv;
- 	gdIOCtx *out = gdNewDynamicCtx(2048, NULL);
- 	if (out == NULL) return NULL;
--	gdImageBmpCtx(im, out, compression);
--	rv = gdDPExtractData(out, size);
-+	if (!_gdImageBmpCtx(im, out, compression))
-+		rv = gdDPExtractData(out, size);
-+	else
-+		rv = NULL;
- 	out->gd_free(out);
- 	return rv;
- }
-@@ -142,6 +146,11 @@ BGD_DECLARE(void) gdImageBmp(gdImagePtr im, FILE *outFile, int compression)
- 		compression - whether to apply RLE or not.
- */
- BGD_DECLARE(void) gdImageBmpCtx(gdImagePtr im, gdIOCtxPtr out, int compression)
-+{
-+	_gdImageBmpCtx(im, out, compression);
-+}
-+
-+static int _gdImageBmpCtx(gdImagePtr im, gdIOCtxPtr out, int compression)
- {
- 	int bitmap_size = 0, info_size, total_size, padding;
- 	int i, row, xpos, pixel;
-@@ -149,6 +158,7 @@ BGD_DECLARE(void) gdImageBmpCtx(gdImagePtr im, gdIOCtxPtr out, int compression)
- 	unsigned char *uncompressed_row = NULL, *uncompressed_row_start = NULL;
- 	FILE *tmpfile_for_compression = NULL;
- 	gdIOCtxPtr out_original = NULL;
-+	int ret = 1;
- 
- 	/* No compression if its true colour or we don't support seek */
- 	if (im->trueColor) {
-@@ -326,6 +336,7 @@ BGD_DECLARE(void) gdImageBmpCtx(gdImagePtr im, gdIOCtxPtr out, int compression)
- 		out_original = NULL;
- 	}
- 
-+	ret = 0;
- cleanup:
- 	if (tmpfile_for_compression) {
- #ifdef _WIN32
-@@ -339,7 +350,7 @@ cleanup:
- 	if (out_original) {
- 		out_original->gd_free(out_original);
- 	}
--	return;
-+	return ret;
- }
- 
- static int compress_row(unsigned char *row, int length)
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-support/gd/gd/CVE-2018-14553.patch b/meta-oe/recipes-support/gd/gd/CVE-2018-14553.patch
deleted file mode 100644
index 344f34feb..000000000
--- a/meta-oe/recipes-support/gd/gd/CVE-2018-14553.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From a93eac0e843148dc2d631c3ba80af17e9c8c860f Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?F=C3=A1bio=20Cabral=20Pacheco?= <fcabralpacheco@gmail.com>
-Date: Fri, 20 Dec 2019 12:03:33 -0300
-Subject: [PATCH] Fix potential NULL pointer dereference in gdImageClone()
-
----
- src/gd.c                          |  9 +--------
- tests/gdimageclone/.gitignore     |  1 +
- tests/gdimageclone/CMakeLists.txt |  1 +
- tests/gdimageclone/Makemodule.am  |  3 ++-
- tests/gdimageclone/style.c        | 30 ++++++++++++++++++++++++++++++
- 5 files changed, 35 insertions(+), 9 deletions(-)
- create mode 100644 tests/gdimageclone/style.c
-
-diff --git a/src/gd.c b/src/gd.c
-index 592a028..d564d1f 100644
---- a/src/gd.c
-+++ b/src/gd.c
-@@ -2865,14 +2865,6 @@ BGD_DECLARE(gdImagePtr) gdImageClone (gdImagePtr src) {
- 		}
- 	}
- 
--	if (src->styleLength > 0) {
--		dst->styleLength = src->styleLength;
--		dst->stylePos    = src->stylePos;
--		for (i = 0; i < src->styleLength; i++) {
--			dst->style[i] = src->style[i];
--		}
--	}
--
- 	dst->interlace   = src->interlace;
- 
- 	dst->alphaBlendingFlag = src->alphaBlendingFlag;
-@@ -2907,6 +2899,7 @@ BGD_DECLARE(gdImagePtr) gdImageClone (gdImagePtr src) {
- 
- 	if (src->style) {
- 		gdImageSetStyle(dst, src->style, src->styleLength);
-+		dst->stylePos = src->stylePos;
- 	}
- 
- 	for (i = 0; i < gdMaxColors; i++) {
-diff --git a/tests/gdimageclone/.gitignore b/tests/gdimageclone/.gitignore
-index a70782d..f4129cc 100644
---- a/tests/gdimageclone/.gitignore
-+++ b/tests/gdimageclone/.gitignore
-@@ -1 +1,2 @@
- /bug00300
-+/style
-diff --git a/tests/gdimageclone/CMakeLists.txt b/tests/gdimageclone/CMakeLists.txt
-index e6ccc31..662f4e9 100644
---- a/tests/gdimageclone/CMakeLists.txt
-+++ b/tests/gdimageclone/CMakeLists.txt
-@@ -1,5 +1,6 @@
- LIST(APPEND TESTS_FILES
- 	bug00300
-+	style
- )
- 
- ADD_GD_TESTS()
-diff --git a/tests/gdimageclone/Makemodule.am b/tests/gdimageclone/Makemodule.am
-index 4b1b54c..51abf5c 100644
---- a/tests/gdimageclone/Makemodule.am
-+++ b/tests/gdimageclone/Makemodule.am
-@@ -1,5 +1,6 @@
- libgd_test_programs += \
--	gdimageclone/bug00300
-+	gdimageclone/bug00300 \
-+	gdimageclone/style
- 
- EXTRA_DIST += \
- 	gdimageclone/CMakeLists.txt
-diff --git a/tests/gdimageclone/style.c b/tests/gdimageclone/style.c
-new file mode 100644
-index 0000000..c2b246e
---- /dev/null
-+++ b/tests/gdimageclone/style.c
-@@ -0,0 +1,30 @@
-+/**
-+ * Cloning an image should exactly reproduce all style related data
-+ */
-+
-+
-+#include <string.h>
-+#include "gd.h"
-+#include "gdtest.h"
-+
-+
-+int main()
-+{
-+    gdImagePtr im, clone;
-+    int style[] = {0, 0, 0};
-+
-+    im = gdImageCreate(8, 8);
-+    gdImageSetStyle(im, style, sizeof(style)/sizeof(style[0]));
-+
-+    clone = gdImageClone(im);
-+    gdTestAssert(clone != NULL);
-+
-+    gdTestAssert(clone->styleLength == im->styleLength);
-+    gdTestAssert(clone->stylePos == im->stylePos);
-+    gdTestAssert(!memcmp(clone->style, im->style, sizeof(style)/sizeof(style[0])));
-+
-+    gdImageDestroy(clone);
-+    gdImageDestroy(im);
-+
-+    return gdNumFailures();
-+}
--- 
-2.20.1
-
diff --git a/meta-oe/recipes-support/gd/gd/CVE-2019-6978.patch b/meta-oe/recipes-support/gd/gd/CVE-2019-6978.patch
deleted file mode 100644
index 9beb23e83..000000000
--- a/meta-oe/recipes-support/gd/gd/CVE-2019-6978.patch
+++ /dev/null
@@ -1,299 +0,0 @@
-From 553702980ae89c83f2d6e254d62cf82e204956d0 Mon Sep 17 00:00:00 2001
-From: "Christoph M. Becker" <cmbecker69@gmx.de>
-Date: Thu, 17 Jan 2019 11:54:55 +0100
-Subject: [PATCH] Fix #492: Potential double-free in gdImage*Ptr()
-
-Whenever `gdImage*Ptr()` calls `gdImage*Ctx()` and the latter fails, we
-must not call `gdDPExtractData()`; otherwise a double-free would
-happen.  Since `gdImage*Ctx()` are void functions, and we can't change
-that for BC reasons, we're introducing static helpers which are used
-internally.
-
-We're adding a regression test for `gdImageJpegPtr()`, but not for
-`gdImageGifPtr()` and `gdImageWbmpPtr()` since we don't know how to
-trigger failure of the respective `gdImage*Ctx()` calls.
-
-This potential security issue has been reported by Solmaz Salimi (aka.
-Rooney).
----
- src/gd_gif_out.c                  | 18 +++++++++++++++---
- src/gd_jpeg.c                     | 20 ++++++++++++++++----
- src/gd_wbmp.c                     | 21 ++++++++++++++++++---
- tests/jpeg/.gitignore             |  1 +
- tests/jpeg/CMakeLists.txt         |  1 +
- tests/jpeg/Makemodule.am          |  3 ++-
- tests/jpeg/jpeg_ptr_double_free.c | 31 +++++++++++++++++++++++++++++++
- 7 files changed, 84 insertions(+), 11 deletions(-)
- create mode 100644 tests/jpeg/jpeg_ptr_double_free.c
-
-Upstream-Status: Backport [https://github.com/libgd/libgd/commit/553702980ae89c83f2d6e254d62cf82e204956d0]
-CVE: CVE-2019-6978
-
-Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
-
-
-diff --git a/src/gd_gif_out.c b/src/gd_gif_out.c
-index 298a581..d5a9534 100644
---- a/src/gd_gif_out.c
-+++ b/src/gd_gif_out.c
-@@ -99,6 +99,7 @@ static void char_init(GifCtx *ctx);
- static void char_out(int c, GifCtx *ctx);
- static void flush_char(GifCtx *ctx);
- 
-+static int _gdImageGifCtx(gdImagePtr im, gdIOCtxPtr out);
- 
- 
- 
-@@ -131,8 +132,11 @@ BGD_DECLARE(void *) gdImageGifPtr(gdImagePtr im, int *size)
- 	void *rv;
- 	gdIOCtx *out = gdNewDynamicCtx(2048, NULL);
- 	if (out == NULL) return NULL;
--	gdImageGifCtx(im, out);
--	rv = gdDPExtractData(out, size);
-+	if (!_gdImageGifCtx(im, out)) {
-+		rv = gdDPExtractData(out, size);
-+	} else {
-+		rv = NULL;
-+	}
- 	out->gd_free(out);
- 	return rv;
- }
-@@ -220,6 +224,12 @@ BGD_DECLARE(void) gdImageGif(gdImagePtr im, FILE *outFile)
- 
- */
- BGD_DECLARE(void) gdImageGifCtx(gdImagePtr im, gdIOCtxPtr out)
-+{
-+	_gdImageGifCtx(im, out);
-+}
-+
-+/* returns 0 on success, 1 on failure */
-+static int _gdImageGifCtx(gdImagePtr im, gdIOCtxPtr out)
- {
- 	gdImagePtr pim = 0, tim = im;
- 	int interlace, BitsPerPixel;
-@@ -231,7 +241,7 @@ BGD_DECLARE(void) gdImageGifCtx(gdImagePtr im, gdIOCtxPtr out)
- 		based temporary image. */
- 		pim = gdImageCreatePaletteFromTrueColor(im, 1, 256);
- 		if(!pim) {
--			return;
-+			return 1;
- 		}
- 		tim = pim;
- 	}
-@@ -247,6 +257,8 @@ BGD_DECLARE(void) gdImageGifCtx(gdImagePtr im, gdIOCtxPtr out)
- 		/* Destroy palette based temporary image. */
- 		gdImageDestroy(	pim);
- 	}
-+
-+	return 0;
- }
- 
- 
-diff --git a/src/gd_jpeg.c b/src/gd_jpeg.c
-index fc05842..96ef430 100644
---- a/src/gd_jpeg.c
-+++ b/src/gd_jpeg.c
-@@ -117,6 +117,8 @@ static void fatal_jpeg_error(j_common_ptr cinfo)
- 	exit(99);
- }
- 
-+static int _gdImageJpegCtx(gdImagePtr im, gdIOCtx *outfile, int quality);
-+
- /*
-  * Write IM to OUTFILE as a JFIF-formatted JPEG image, using quality
-  * QUALITY.  If QUALITY is in the range 0-100, increasing values
-@@ -231,8 +233,11 @@ BGD_DECLARE(void *) gdImageJpegPtr(gdImagePtr im, int *size, int quality)
- 	void *rv;
- 	gdIOCtx *out = gdNewDynamicCtx(2048, NULL);
- 	if (out == NULL) return NULL;
--	gdImageJpegCtx(im, out, quality);
--	rv = gdDPExtractData(out, size);
-+	if (!_gdImageJpegCtx(im, out, quality)) {
-+		rv = gdDPExtractData(out, size);
-+	} else {
-+		rv = NULL;
-+	}
- 	out->gd_free(out);
- 	return rv;
- }
-@@ -253,6 +258,12 @@ void jpeg_gdIOCtx_dest(j_compress_ptr cinfo, gdIOCtx *outfile);
- 
- */
- BGD_DECLARE(void) gdImageJpegCtx(gdImagePtr im, gdIOCtx *outfile, int quality)
-+{
-+	_gdImageJpegCtx(im, outfile, quality);
-+}
-+
-+/* returns 0 on success, 1 on failure */
-+static int _gdImageJpegCtx(gdImagePtr im, gdIOCtx *outfile, int quality)
- {
- 	struct jpeg_compress_struct cinfo;
- 	struct jpeg_error_mgr jerr;
-@@ -287,7 +298,7 @@ BGD_DECLARE(void) gdImageJpegCtx(gdImagePtr im, gdIOCtx *outfile, int quality)
- 		if(row) {
- 			gdFree(row);
- 		}
--		return;
-+		return 1;
- 	}
- 
- 	cinfo.err->emit_message = jpeg_emit_message;
-@@ -328,7 +339,7 @@ BGD_DECLARE(void) gdImageJpegCtx(gdImagePtr im, gdIOCtx *outfile, int quality)
- 	if(row == 0) {
- 		gd_error("gd-jpeg: error: unable to allocate JPEG row structure: gdCalloc returns NULL\n");
- 		jpeg_destroy_compress(&cinfo);
--		return;
-+		return 1;
- 	}
- 
- 	rowptr[0] = row;
-@@ -405,6 +416,7 @@ BGD_DECLARE(void) gdImageJpegCtx(gdImagePtr im, gdIOCtx *outfile, int quality)
- 	jpeg_finish_compress(&cinfo);
- 	jpeg_destroy_compress(&cinfo);
- 	gdFree(row);
-+	return 0;
- }
- 
- 
-diff --git a/src/gd_wbmp.c b/src/gd_wbmp.c
-index f19a1c9..a49bdbe 100644
---- a/src/gd_wbmp.c
-+++ b/src/gd_wbmp.c
-@@ -88,6 +88,8 @@ int gd_getin(void *in)
- 	return (gdGetC((gdIOCtx *)in));
- }
- 
-+static int _gdImageWBMPCtx(gdImagePtr image, int fg, gdIOCtx *out);
-+
- /*
- 	Function: gdImageWBMPCtx
- 
-@@ -100,6 +102,12 @@ int gd_getin(void *in)
- 		out   - the stream where to write
- */
- BGD_DECLARE(void) gdImageWBMPCtx(gdImagePtr image, int fg, gdIOCtx *out)
-+{
-+	_gdImageWBMPCtx(image, fg, out);
-+}
-+
-+/* returns 0 on success, 1 on failure */
-+static int _gdImageWBMPCtx(gdImagePtr image, int fg, gdIOCtx *out)
- {
- 	int x, y, pos;
- 	Wbmp *wbmp;
-@@ -107,7 +115,7 @@ BGD_DECLARE(void) gdImageWBMPCtx(gdImagePtr image, int fg, gdIOCtx *out)
- 	/* create the WBMP */
- 	if((wbmp = createwbmp(gdImageSX(image), gdImageSY(image), WBMP_WHITE)) == NULL) {
- 		gd_error("Could not create WBMP\n");
--		return;
-+		return 1;
- 	}
- 
- 	/* fill up the WBMP structure */
-@@ -123,11 +131,15 @@ BGD_DECLARE(void) gdImageWBMPCtx(gdImagePtr image, int fg, gdIOCtx *out)
- 
- 	/* write the WBMP to a gd file descriptor */
- 	if(writewbmp(wbmp, &gd_putout, out)) {
-+		freewbmp(wbmp);
- 		gd_error("Could not save WBMP\n");
-+		return 1;
- 	}
- 
- 	/* des submitted this bugfix: gdFree the memory. */
- 	freewbmp(wbmp);
-+
-+	return 0;
- }
- 
- /*
-@@ -271,8 +283,11 @@ BGD_DECLARE(void *) gdImageWBMPPtr(gdImagePtr im, int *size, int fg)
- 	void *rv;
- 	gdIOCtx *out = gdNewDynamicCtx(2048, NULL);
- 	if (out == NULL) return NULL;
--	gdImageWBMPCtx(im, fg, out);
--	rv = gdDPExtractData(out, size);
-+	if (!_gdImageWBMPCtx(im, fg, out)) {
-+		rv = gdDPExtractData(out, size);
-+	} else {
-+		rv = NULL;
-+	}
- 	out->gd_free(out);
- 	return rv;
- }
-diff --git a/tests/jpeg/.gitignore b/tests/jpeg/.gitignore
-index c28aa87..13bcf04 100644
---- a/tests/jpeg/.gitignore
-+++ b/tests/jpeg/.gitignore
-@@ -3,5 +3,6 @@
- /jpeg_empty_file
- /jpeg_im2im
- /jpeg_null
-+/jpeg_ptr_double_free
- /jpeg_read
- /jpeg_resolution
-diff --git a/tests/jpeg/CMakeLists.txt b/tests/jpeg/CMakeLists.txt
-index 19964b0..a8d8162 100644
---- a/tests/jpeg/CMakeLists.txt
-+++ b/tests/jpeg/CMakeLists.txt
-@@ -2,6 +2,7 @@ IF(JPEG_FOUND)
- LIST(APPEND TESTS_FILES
- 	jpeg_empty_file
- 	jpeg_im2im
-+	jpeg_ptr_double_free
- 	jpeg_null
- )
- 
-diff --git a/tests/jpeg/Makemodule.am b/tests/jpeg/Makemodule.am
-index 7e5d317..b89e169 100644
---- a/tests/jpeg/Makemodule.am
-+++ b/tests/jpeg/Makemodule.am
-@@ -2,7 +2,8 @@ if HAVE_LIBJPEG
- libgd_test_programs += \
- 	jpeg/jpeg_empty_file \
- 	jpeg/jpeg_im2im \
--	jpeg/jpeg_null
-+	jpeg/jpeg_null \
-+	jpeg/jpeg_ptr_double_free
- 
- if HAVE_LIBPNG
- libgd_test_programs += \
-diff --git a/tests/jpeg/jpeg_ptr_double_free.c b/tests/jpeg/jpeg_ptr_double_free.c
-new file mode 100644
-index 0000000..df5a510
---- /dev/null
-+++ b/tests/jpeg/jpeg_ptr_double_free.c
-@@ -0,0 +1,31 @@
-+/**
-+ * Test that failure to convert to JPEG returns NULL
-+ *
-+ * We are creating an image, set its width to zero, and pass this image to
-+ * `gdImageJpegPtr()` which is supposed to fail, and as such should return NULL.
-+ *
-+ * See also <https://github.com/libgd/libgd/issues/381>
-+ */
-+
-+
-+#include "gd.h"
-+#include "gdtest.h"
-+
-+
-+int main()
-+{
-+    gdImagePtr src, dst;
-+    int size;
-+
-+    src = gdImageCreateTrueColor(1, 10);
-+    gdTestAssert(src != NULL);
-+
-+    src->sx = 0; /* this hack forces gdImageJpegPtr() to fail */
-+
-+    dst = gdImageJpegPtr(src, &size, 0);
-+    gdTestAssert(dst == NULL);
-+
-+    gdImageDestroy(src);
-+
-+    return gdNumFailures();
-+}
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-support/gd/gd_2.2.5.bb b/meta-oe/recipes-support/gd/gd_2.3.0.bb
similarity index 74%
rename from meta-oe/recipes-support/gd/gd_2.2.5.bb
rename to meta-oe/recipes-support/gd/gd_2.3.0.bb
index a665de4bf..eec8a05ae 100644
--- a/meta-oe/recipes-support/gd/gd_2.2.5.bb
+++ b/meta-oe/recipes-support/gd/gd_2.3.0.bb
@@ -5,23 +5,18 @@ images, and flood fills, and to write out the result as a PNG or JPEG file. \
 This is particularly useful in Web applications, where PNG and JPEG are two \
 of the formats accepted for inline images by most browsers. Note that gd is not \
 a paint program."
-HOMEPAGE = "http://libgd.bitbucket.org/"
+HOMEPAGE = "http://libgd.github.io/"
 
 SECTION = "libs"
 LICENSE = "GD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=07384b3aa2e0d39afca0d6c40286f545"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8e5bc8627b9494741c905d65238c66b7"
 
 DEPENDS = "freetype libpng jpeg zlib tiff"
 
-SRC_URI = "git://github.com/libgd/libgd.git;branch=GD-2.2 \
-           file://0001-annotate.c-gdft.c-Replace-strncpy-with-memccpy-to-fi.patch \
-           file://CVE-2018-1000222.patch \
-           file://CVE-2019-6978.patch \
-           file://CVE-2017-6363.patch \
-           file://CVE-2018-14553.patch \
+SRC_URI = "git://github.com/libgd/libgd.git;branch=master \
           "
 
-SRCREV = "8255231b68889597d04d451a72438ab92a405aba"
+SRCREV = "b079fa06223c3ab862c8f0eea58a968727971988"
 
 S = "${WORKDIR}/git"
 
-- 
2.24.1

