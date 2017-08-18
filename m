Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5CD6D7859A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Aug 2017 06:54:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7I6sUYb008686
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 23:54:33 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 17 Aug 2017 23:54:30 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <catalin.enache@windriver.com>
Date: Fri, 18 Aug 2017 14:55:11 +0800
Message-ID: <1503039311-7221-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [meta-oe][PATCH] gd: update to 2.2.4
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
X-List-Received-Date: Fri, 18 Aug 2017 06:54:32 -0000
Content-Type: text/plain

* Remove the following patches which already merged in upstream:
    fix-gcc-unused-functions.patch
    .gitignore-the-new-test-case.patch
    CVE-2016-10166.patch
    CVE-2016-10167.patch
    CVE-2016-10168.patch
    CVE-2016-6906-1.patch
    CVE-2016-6906-2.patch
    Fix-290-TGA-RLE-decoding-is-broken.patch

* Update LICENSE's MD5 check sum.
  The COPYING file has been update with the following commits in
  upstream:

  commit f863b3c2d300ff5344f6752e5813b0d6985e79c4
    Resolve #282: COPYING vs. docs/naturaldocs/license.txt

  commit 9ccdaedbd9a2cfd1c8a9a258c09af161e796bd41
    Sync COPYING and docs/naturaldocs/license.txt

  These two commits updated the copyright statement regarding the
  authorship of gd and adjust the format.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../gd/files/fix-gcc-unused-functions.patch        |  43 ---
 .../gd/gd/.gitignore-the-new-test-case.patch       |  24 --
 meta-oe/recipes-support/gd/gd/CVE-2016-10166.patch |  60 ----
 meta-oe/recipes-support/gd/gd/CVE-2016-10167.patch |  48 ---
 meta-oe/recipes-support/gd/gd/CVE-2016-10168.patch |  38 ---
 .../recipes-support/gd/gd/CVE-2016-6906-1.patch    | 167 ----------
 .../recipes-support/gd/gd/CVE-2016-6906-2.patch    | 135 --------
 .../gd/gd/Fix-290-TGA-RLE-decoding-is-broken.patch | 359 ---------------------
 .../gd/{gd_2.2.3.bb => gd_2.2.4.bb}                |  27 +-
 9 files changed, 4 insertions(+), 897 deletions(-)
 delete mode 100644 meta-oe/recipes-support/gd/files/fix-gcc-unused-functions.patch
 delete mode 100644 meta-oe/recipes-support/gd/gd/.gitignore-the-new-test-case.patch
 delete mode 100644 meta-oe/recipes-support/gd/gd/CVE-2016-10166.patch
 delete mode 100644 meta-oe/recipes-support/gd/gd/CVE-2016-10167.patch
 delete mode 100644 meta-oe/recipes-support/gd/gd/CVE-2016-10168.patch
 delete mode 100644 meta-oe/recipes-support/gd/gd/CVE-2016-6906-1.patch
 delete mode 100644 meta-oe/recipes-support/gd/gd/CVE-2016-6906-2.patch
 delete mode 100644 meta-oe/recipes-support/gd/gd/Fix-290-TGA-RLE-decoding-is-broken.patch
 rename meta-oe/recipes-support/gd/{gd_2.2.3.bb => gd_2.2.4.bb} (61%)

diff --git a/meta-oe/recipes-support/gd/files/fix-gcc-unused-functions.patch b/meta-oe/recipes-support/gd/files/fix-gcc-unused-functions.patch
deleted file mode 100644
index 02cb5ad..0000000
--- a/meta-oe/recipes-support/gd/files/fix-gcc-unused-functions.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-gdft.c: remove functions that cause warnings about being unused
-
-Upstream-Status: Backport (Fixed in master branch)
-
-Signed-off-by: Derek Straka <derek@asterius.io>
---- git/src/gdft.c.orig	2016-08-12 10:20:41.418440091 -0400
-+++ git/src/gdft.c	2016-08-12 10:22:34.226442987 -0400
-@@ -139,16 +139,6 @@
- }
- #else
- 
--#ifndef HAVE_LIBFONTCONFIG
--static char * font_pattern(char **fontpath, char *fontpattern)
--{
--	(void)fontpath;
--	(void)fontpattern;
--
--	return "libgd was not built with FontConfig support\n";
--}
--#endif /* HAVE_LIBFONTCONFIG */
--
- #include "gdcache.h"
- /* 2.0.16 Christophe Thomas: starting with FreeType 2.1.6, this is
-   mandatory, and it has been supported for a long while. */
-@@ -446,16 +436,15 @@
- 	return (strcmp (a->fontlist, b->fontlist) == 0 && a->flags == b->flags);
- }
- 
-+#ifdef HAVE_LIBFONTCONFIG
- static int useFontConfig(int flag)
- {
--#ifdef HAVE_LIBFONTCONFIG
- 	if (fontConfigFlag) {
- 		return (!(flag & gdFTEX_FONTPATHNAME));
- 	}
--#endif
- 	return flag & gdFTEX_FONTCONFIG;
- }
--
-+#endif
- static void *
- fontFetch (char **error, void *key)
- {
diff --git a/meta-oe/recipes-support/gd/gd/.gitignore-the-new-test-case.patch b/meta-oe/recipes-support/gd/gd/.gitignore-the-new-test-case.patch
deleted file mode 100644
index eab4975..0000000
--- a/meta-oe/recipes-support/gd/gd/.gitignore-the-new-test-case.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 8520274759cb8f95e483b02a445aff225e13467b Mon Sep 17 00:00:00 2001
-From: "Christoph M. Becker" <cmbecker69@gmx.de>
-Date: Tue, 16 Aug 2016 16:00:27 +0200
-Subject: [PATCH] .gitignore the new test case
-
-Upstream-Status: Backport
-
-Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
----
- tests/tga/.gitignore | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tests/tga/.gitignore b/tests/tga/.gitignore
-index e88e124..7a659b1 100644
---- a/tests/tga/.gitignore
-+++ b/tests/tga/.gitignore
-@@ -4,3 +4,4 @@
- /bug00248
- /bug00248a
- /tga_null
-+/tga_read
--- 
-2.10.2
-
diff --git a/meta-oe/recipes-support/gd/gd/CVE-2016-10166.patch b/meta-oe/recipes-support/gd/gd/CVE-2016-10166.patch
deleted file mode 100644
index 7ccfbea..0000000
--- a/meta-oe/recipes-support/gd/gd/CVE-2016-10166.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From c92240c1670c20c2f854761d3a89ab61dd158c91 Mon Sep 17 00:00:00 2001
-From: "Christoph M. Becker" <cmbecker69@gmx.de>
-Date: Sat, 6 Aug 2016 10:08:53 +0200
-Subject: [PATCH] Fix potential unsigned underflow
-
-No need to decrease `u`, so we don't do it. While we're at it, we also factor
-out the overflow check of the loop, what improves performance and readability.
-
-This issue has been reported by Stefan Esser to security@libgd.org.
-
-Upstream-Status: Backport
-CVE: CVE-2016-10166
-
-Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
----
- src/gd_interpolation.c | 19 ++++++++++---------
- 1 file changed, 10 insertions(+), 9 deletions(-)
-
-diff --git a/src/gd_interpolation.c b/src/gd_interpolation.c
-index 7e7943d..9944349 100644
---- a/src/gd_interpolation.c
-+++ b/src/gd_interpolation.c
-@@ -829,8 +829,13 @@ static inline LineContribType * _gdContributionsAlloc(unsigned int line_length,
- {
- 	unsigned int u = 0;
- 	LineContribType *res;
--	int overflow_error = 0;
-+	size_t weights_size;
- 
-+	if (overflow2(windows_size, sizeof(double))) {
-+		return NULL;
-+	} else {
-+		weights_size = windows_size * sizeof(double);
-+	}
- 	res = (LineContribType *) gdMalloc(sizeof(LineContribType));
- 	if (!res) {
- 		return NULL;
-@@ -847,15 +852,11 @@ static inline LineContribType * _gdContributionsAlloc(unsigned int line_length,
- 		return NULL;
- 	}
- 	for (u = 0 ; u < line_length ; u++) {
--		if (overflow2(windows_size, sizeof(double))) {
--			overflow_error = 1;
--		} else {
--			res->ContribRow[u].Weights = (double *) gdMalloc(windows_size * sizeof(double));
--		}
--		if (overflow_error == 1 || res->ContribRow[u].Weights == NULL) {
-+		res->ContribRow[u].Weights = (double *) gdMalloc(weights_size);
-+		if (res->ContribRow[u].Weights == NULL) {
- 			unsigned int i;
--			u--;
--			for (i=0;i<=u;i++) {
-+
-+			for (i=0;i<u;i++) {
- 				gdFree(res->ContribRow[i].Weights);
- 			}
- 			gdFree(res->ContribRow);
--- 
-2.10.2
-
diff --git a/meta-oe/recipes-support/gd/gd/CVE-2016-10167.patch b/meta-oe/recipes-support/gd/gd/CVE-2016-10167.patch
deleted file mode 100644
index 54ef22c..0000000
--- a/meta-oe/recipes-support/gd/gd/CVE-2016-10167.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 6ab531ef0d82efb9e00236ee5ea23928335d221f Mon Sep 17 00:00:00 2001
-From: Catalin Enache <catalin.enache@windriver.com>
-Date: Fri, 7 Apr 2017 12:30:22 +0300
-Subject: [PATCH] Fix DOS vulnerability in gdImageCreateFromGd2Ctx()
-
-We must not pretend that there are image data if there are none. Instead
-we fail reading the image file gracefully.
-
-Upstream-Status: Backport
-CVE: CVE-2016-10167
-
-Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
----
- src/gd_gd2.c | 14 ++++++--------
- 1 file changed, 6 insertions(+), 8 deletions(-)
-
-diff --git a/src/gd_gd2.c b/src/gd_gd2.c
-index 8df93c1..bae65ea 100644
---- a/src/gd_gd2.c
-+++ b/src/gd_gd2.c
-@@ -445,18 +445,16 @@ BGD_DECLARE(gdImagePtr) gdImageCreateFromGd2Ctx (gdIOCtxPtr in)
- 
- 						if (im->trueColor) {
- 							if (!gdGetInt (&im->tpixels[y][x], in)) {
--								/*printf("EOF while reading\n"); */
--								/*gdImageDestroy(im); */
--								/*return 0; */
--								im->tpixels[y][x] = 0;
-+								gd_error("gd2: EOF while reading\n");
-+								gdImageDestroy(im);
-+								return NULL;
- 							}
- 						} else {
- 							int ch;
- 							if (!gdGetByte (&ch, in)) {
--								/*printf("EOF while reading\n"); */
--								/*gdImageDestroy(im); */
--								/*return 0; */
--								ch = 0;
-+								gd_error("gd2: EOF while reading\n");
-+								gdImageDestroy(im);
-+								return NULL;
- 							}
- 							im->pixels[y][x] = ch;
- 						}
--- 
-2.10.2
-
diff --git a/meta-oe/recipes-support/gd/gd/CVE-2016-10168.patch b/meta-oe/recipes-support/gd/gd/CVE-2016-10168.patch
deleted file mode 100644
index aef1060..0000000
--- a/meta-oe/recipes-support/gd/gd/CVE-2016-10168.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 2d37bdc03a6e2b820fe380016f22592a7733e0be Mon Sep 17 00:00:00 2001
-From: Catalin Enache <catalin.enache@windriver.com>
-Date: Fri, 7 Apr 2017 12:32:49 +0300
-Subject: [PATCH] Fix #354: Signed Integer Overflow gd_io.c
-
-GD2 stores the number of horizontal and vertical chunks as words (i.e. 2
-byte unsigned). These values are multiplied and assigned to an int when
-reading the image, what can cause integer overflows. We have to avoid
-that, and also make sure that either chunk count is actually greater
-than zero. If illegal chunk counts are detected, we bail out from
-reading the image.
-
-Upstream-Status: Backport
-CVE: CVE-2016-10168
-
-Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
----
- src/gd_gd2.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/gd_gd2.c b/src/gd_gd2.c
-index bae65ea..9006bd2 100644
---- a/src/gd_gd2.c
-+++ b/src/gd_gd2.c
-@@ -151,6 +151,10 @@ _gd2GetHeader (gdIOCtxPtr in, int *sx, int *sy,
- 	GD2_DBG (printf ("%d Chunks vertically\n", *ncy));
- 
- 	if (gd2_compressed (*fmt)) {
-+		if (*ncx <= 0 || *ncy <= 0 || *ncx > INT_MAX / *ncy) {
-+			GD2_DBG(printf ("Illegal chunk counts: %d * %d\n", *ncx, *ncy));
-+			goto fail1;
-+		}
- 		nc = (*ncx) * (*ncy);
- 
- 		GD2_DBG (printf ("Reading %d chunk index entries\n", nc));
--- 
-2.10.2
-
diff --git a/meta-oe/recipes-support/gd/gd/CVE-2016-6906-1.patch b/meta-oe/recipes-support/gd/gd/CVE-2016-6906-1.patch
deleted file mode 100644
index 97b7f72..0000000
--- a/meta-oe/recipes-support/gd/gd/CVE-2016-6906-1.patch
+++ /dev/null
@@ -1,167 +0,0 @@
-From fb0e0cce0b9f25389ab56604c3547351617e1415 Mon Sep 17 00:00:00 2001
-From: "Christoph M. Becker" <cmbecker69@gmx.de>
-Date: Tue, 16 Aug 2016 16:26:19 +0200
-Subject: [PATCH] Fix OOB reads of the TGA decompression buffer
-
-It is possible to craft TGA files which will overflow the decompression
-buffer, but not the image's bitmap. Therefore we augment the check for the
-bitmap's overflow with a check for the buffer's overflow.
-
-This issue had been reported by Ibrahim El-Sayed to security@libgd.org.
-
-CVE-2016-6906
-
-Upstream-Status: Backport
-CVE: CVE-2016-6906
-
-Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
----
- src/gd_tga.c                |   6 ++++--
- tests/tga/.gitignore        |   1 +
- tests/tga/CMakeLists.txt    |   1 +
- tests/tga/Makemodule.am     |   2 ++
- tests/tga/heap_overflow.c   |  51 ++++++++++++++++++++++++++++++++++++++++++++
- tests/tga/heap_overflow.tga | Bin 0 -> 605 bytes
- 6 files changed, 59 insertions(+), 2 deletions(-)
- create mode 100644 tests/tga/heap_overflow.c
- create mode 100644 tests/tga/heap_overflow.tga
-
-diff --git a/src/gd_tga.c b/src/gd_tga.c
-index 8737b04..68e4b17 100644
---- a/src/gd_tga.c
-+++ b/src/gd_tga.c
-@@ -300,7 +300,8 @@ int read_image_tga( gdIOCtx *ctx, oTga *tga )
- 				encoded_pixels = ( ( decompression_buffer[ buffer_caret ] & ~TGA_RLE_FLAG ) + 1 );
- 				buffer_caret++;
- 
--				if ((bitmap_caret + (encoded_pixels * pixel_block_size)) > image_block_size) {
-+				if ((bitmap_caret + (encoded_pixels * pixel_block_size)) > image_block_size
-+						|| buffer_caret + pixel_block_size > rle_size) {
- 					gdFree( decompression_buffer );
- 					gdFree( conversion_buffer );
- 					return -1;
-@@ -316,7 +317,8 @@ int read_image_tga( gdIOCtx *ctx, oTga *tga )
- 				encoded_pixels = decompression_buffer[ buffer_caret ] + 1;
- 				buffer_caret++;
- 
--				if ((bitmap_caret + (encoded_pixels * pixel_block_size)) > image_block_size) {
-+				if ((bitmap_caret + (encoded_pixels * pixel_block_size)) > image_block_size
-+						|| buffer_caret + (encoded_pixels * pixel_block_size) > rle_size) {
- 					gdFree( decompression_buffer );
- 					gdFree( conversion_buffer );
- 					return -1;
-diff --git a/tests/tga/.gitignore b/tests/tga/.gitignore
-index 7a659b1..cf0556b 100644
---- a/tests/tga/.gitignore
-+++ b/tests/tga/.gitignore
-@@ -3,5 +3,6 @@
- /bug00247a
- /bug00248
- /bug00248a
-+/heap_overflow
- /tga_null
- /tga_read
-diff --git a/tests/tga/CMakeLists.txt b/tests/tga/CMakeLists.txt
-index 789fb14..11542a0 100644
---- a/tests/tga/CMakeLists.txt
-+++ b/tests/tga/CMakeLists.txt
-@@ -5,6 +5,7 @@ LIST(APPEND TESTS_FILES
- 	bug00247a
- 	bug00248
- 	bug00248a
-+	heap_overflow
- 	tga_read
- )
- 
-diff --git a/tests/tga/Makemodule.am b/tests/tga/Makemodule.am
-index a1e6af6..916d707 100644
---- a/tests/tga/Makemodule.am
-+++ b/tests/tga/Makemodule.am
-@@ -4,6 +4,7 @@ libgd_test_programs += \
- 	tga/bug00247a \
- 	tga/bug00248 \
- 	tga/bug00248a \
-+	tga/heap_overflow \
- 	tga/tga_null \
- 	tga/tga_read
- 
-@@ -14,6 +15,7 @@ EXTRA_DIST += \
- 	tga/bug00247a.tga \
- 	tga/bug00248.tga \
- 	tga/bug00248a.tga \
-+	tga/heap_overflow.tga \
- 	tga/tga_read_rgb.png \
- 	tga/tga_read_rgb.tga \
- 	tga/tga_read_rgb_rle.tga
-diff --git a/tests/tga/heap_overflow.c b/tests/tga/heap_overflow.c
-new file mode 100644
-index 0000000..0e9a2d0
---- /dev/null
-+++ b/tests/tga/heap_overflow.c
-@@ -0,0 +1,51 @@
-+/**
-+ * Test that the crafted TGA file doesn't trigger OOB reads.
-+ */
-+
-+
-+#include "gd.h"
-+#include "gdtest.h"
-+
-+
-+static size_t read_test_file(char **buffer, char *basename);
-+
-+
-+int main()
-+{
-+    gdImagePtr im;
-+    char *buffer;
-+    size_t size;
-+
-+    size = read_test_file(&buffer, "heap_overflow.tga");
-+    im = gdImageCreateFromTgaPtr(size, (void *) buffer);
-+    gdTestAssert(im == NULL);
-+    free(buffer);
-+
-+    return gdNumFailures();
-+}
-+
-+
-+static size_t read_test_file(char **buffer, char *basename)
-+{
-+    char *filename;
-+    FILE *fp;
-+    size_t exp_size, act_size;
-+
-+    filename = gdTestFilePath2("tga", basename);
-+    fp = fopen(filename, "rb");
-+    gdTestAssert(fp != NULL);
-+
-+	fseek(fp, 0, SEEK_END);
-+	exp_size = ftell(fp);
-+	fseek(fp, 0, SEEK_SET);
-+
-+    *buffer = malloc(exp_size);
-+    gdTestAssert(*buffer != NULL);
-+    act_size = fread(*buffer, sizeof(**buffer), exp_size, fp);
-+    gdTestAssert(act_size == exp_size);
-+
-+    fclose(fp);
-+    free(filename);
-+
-+    return act_size;
-+}
-diff --git a/tests/tga/heap_overflow.tga b/tests/tga/heap_overflow.tga
-new file mode 100644
-index 0000000000000000000000000000000000000000..e9bc0ecb2a847ac6edba92dd0ff61167b49002cd
-GIT binary patch
-literal 605
-zcmZQz;9`IQ9tIu;g&7<$F3o7Yg1qzyh6tefy9wZAs2d<Uh*yuz=?XwW4Qvuv#g2nS
-zp93+mT0rVR>T&8(2TGy=f_l)@gSap~$FayUFu(!|SyJIFga^{8fGj~vwq8kkVgvv>
-Cavop+
-
-literal 0
-HcmV?d00001
-
--- 
-2.10.2
-
diff --git a/meta-oe/recipes-support/gd/gd/CVE-2016-6906-2.patch b/meta-oe/recipes-support/gd/gd/CVE-2016-6906-2.patch
deleted file mode 100644
index 8b6de97..0000000
--- a/meta-oe/recipes-support/gd/gd/CVE-2016-6906-2.patch
+++ /dev/null
@@ -1,135 +0,0 @@
-From 58b6dde319c301b0eae27d12e2a659e067d80558 Mon Sep 17 00:00:00 2001
-From: "Christoph M. Becker" <cmbecker69@gmx.de>
-Date: Tue, 16 Aug 2016 16:26:19 +0200
-Subject: [PATCH] Fix OOB reads of the TGA decompression buffer
-
-It is possible to craft TGA files which will overflow the decompression
-buffer, but not the image's bitmap. Therefore we also have to check for
-potential decompression buffer overflows.
-
-This issue had been reported by Ibrahim El-Sayed to security@libgd.org;
-a modified case exposing an off-by-one error of the first patch had been
-provided by Konrad Beckmann.
-
-This commit is an amendment to commit fb0e0cce, so we use CVE-2016-6906
-as well.
-
-Upstream-Status: Backport
-CVE: CVE-2016-6906
-
-Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
----
- src/gd_tga.c                  |   8 +++++++-
- tests/tga/Makemodule.am       |   3 ++-
- tests/tga/heap_overflow.c     |  16 ++++++++++++----
- tests/tga/heap_overflow_1.tga | Bin 0 -> 605 bytes
- tests/tga/heap_overflow_2.tga | Bin 0 -> 8746 bytes
- 5 files changed, 21 insertions(+), 6 deletions(-)
- create mode 100644 tests/tga/heap_overflow_1.tga
- create mode 100644 tests/tga/heap_overflow_2.tga
-
-diff --git a/src/gd_tga.c b/src/gd_tga.c
-index 68e4b17..f80f0b1 100644
---- a/src/gd_tga.c
-+++ b/src/gd_tga.c
-@@ -295,7 +295,13 @@ int read_image_tga( gdIOCtx *ctx, oTga *tga )
- 		buffer_caret = 0;
- 
- 		while( bitmap_caret < image_block_size ) {
--			
-+
-+			if (buffer_caret + pixel_block_size > rle_size) {
-+				gdFree( decompression_buffer );
-+				gdFree( conversion_buffer );
-+				return -1;
-+			}
-+
- 			if ((decompression_buffer[buffer_caret] & TGA_RLE_FLAG) == TGA_RLE_FLAG) {
- 				encoded_pixels = ( ( decompression_buffer[ buffer_caret ] & ~TGA_RLE_FLAG ) + 1 );
- 				buffer_caret++;
-diff --git a/tests/tga/Makemodule.am b/tests/tga/Makemodule.am
-index 916d707..ab08dbf 100644
---- a/tests/tga/Makemodule.am
-+++ b/tests/tga/Makemodule.am
-@@ -15,7 +15,8 @@ EXTRA_DIST += \
- 	tga/bug00247a.tga \
- 	tga/bug00248.tga \
- 	tga/bug00248a.tga \
--	tga/heap_overflow.tga \
-+	tga/heap_overflow_1.tga \
-+	tga/heap_overflow_2.tga \
- 	tga/tga_read_rgb.png \
- 	tga/tga_read_rgb.tga \
- 	tga/tga_read_rgb_rle.tga
-diff --git a/tests/tga/heap_overflow.c b/tests/tga/heap_overflow.c
-index 0e9a2d0..ddd4b63 100644
---- a/tests/tga/heap_overflow.c
-+++ b/tests/tga/heap_overflow.c
-@@ -1,5 +1,5 @@
- /**
-- * Test that the crafted TGA file doesn't trigger OOB reads.
-+ * Test that crafted TGA files don't trigger OOB reads.
-  */
- 
- 
-@@ -7,21 +7,29 @@
- #include "gdtest.h"
- 
- 
-+static void check_file(char *basename);
- static size_t read_test_file(char **buffer, char *basename);
- 
- 
- int main()
- {
-+    check_file("heap_overflow_1.tga");
-+    check_file("heap_overflow_2.tga");
-+
-+    return gdNumFailures();
-+}
-+
-+
-+static void check_file(char *basename)
-+{
-     gdImagePtr im;
-     char *buffer;
-     size_t size;
- 
--    size = read_test_file(&buffer, "heap_overflow.tga");
-+    size = read_test_file(&buffer, basename);
-     im = gdImageCreateFromTgaPtr(size, (void *) buffer);
-     gdTestAssert(im == NULL);
-     free(buffer);
--
--    return gdNumFailures();
- }
- 
- 
-diff --git a/tests/tga/heap_overflow_1.tga b/tests/tga/heap_overflow_1.tga
-new file mode 100644
-index 0000000000000000000000000000000000000000..e9bc0ecb2a847ac6edba92dd0ff61167b49002cd
-GIT binary patch
-literal 605
-zcmZQz;9`IQ9tIu;g&7<$F3o7Yg1qzyh6tefy9wZAs2d<Uh*yuz=?XwW4Qvuv#g2nS
-zp93+mT0rVR>T&8(2TGy=f_l)@gSap~$FayUFu(!|SyJIFga^{8fGj~vwq8kkVgvv>
-Cavop+
-
-literal 0
-HcmV?d00001
-
-diff --git a/tests/tga/heap_overflow_2.tga b/tests/tga/heap_overflow_2.tga
-new file mode 100644
-index 0000000000000000000000000000000000000000..2b681f2df8941d6823aa761be0a7fa3c02c92cbf
-GIT binary patch
-literal 8746
-zcmeIxF$#b%6a>*<djij4?cuz+Vi5?!RIY)@*eDAQ@`zPSwQE1NTI<YQEqdQG#s5@h
-zwDFtAoIjm)CIQa|$z*q(vz}DbnPjrN&RI{Y=}a=&UFWPP)joCZ<31}ey8!(}FZZ71
-zWop>#e)AY=opmMw&j!h4cb&7IRMVMcvb)Y%PpaumGTB|{tS8lUCYkK6bJmk;IzMDC
-D4PYIN
-
-literal 0
-HcmV?d00001
-
--- 
-2.10.2
-
diff --git a/meta-oe/recipes-support/gd/gd/Fix-290-TGA-RLE-decoding-is-broken.patch b/meta-oe/recipes-support/gd/gd/Fix-290-TGA-RLE-decoding-is-broken.patch
deleted file mode 100644
index 64f5c62..0000000
--- a/meta-oe/recipes-support/gd/gd/Fix-290-TGA-RLE-decoding-is-broken.patch
+++ /dev/null
@@ -1,359 +0,0 @@
-From 4f8e26f2a40ffaa3a5b77be6a49989a1a42e2b83 Mon Sep 17 00:00:00 2001
-From: "Christoph M. Becker" <cmbecker69@gmx.de>
-Date: Tue, 16 Aug 2016 14:27:23 +0200
-Subject: [PATCH] Fix #290: TGA RLE decoding is broken
-
-We make it work only, for now. Actually, it doesn't make sense that
-`oTga::bitmap` is an `int *` as we're storing only bytes there. If this
-will be changed, we can even get rid of the `conversion_buffer` in
-`read_image_tga` altogether, and read the image data into the
-`decompression_buffer` (if RLE'd) or the `tga->bitmap` (if uncompressed)
-directly.
-
-Upstream-Status: Backport
-
-Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
----
- src/gd_tga.c                   |  18 ++++++++++--------
- tests/tga/CMakeLists.txt       |   1 +
- tests/tga/Makemodule.am        |   8 ++++++--
- tests/tga/tga_read.c           |  40 ++++++++++++++++++++++++++++++++++++++++
- tests/tga/tga_read_rgb.png     | Bin 0 -> 2349 bytes
- tests/tga/tga_read_rgb.tga     | Bin 0 -> 90444 bytes
- tests/tga/tga_read_rgb_rle.tga | Bin 0 -> 9987 bytes
- 7 files changed, 57 insertions(+), 10 deletions(-)
- create mode 100644 tests/tga/tga_read.c
- create mode 100644 tests/tga/tga_read_rgb.png
- create mode 100644 tests/tga/tga_read_rgb.tga
- create mode 100644 tests/tga/tga_read_rgb_rle.tga
-
-diff --git a/src/gd_tga.c b/src/gd_tga.c
-index ec6781f..8737b04 100644
---- a/src/gd_tga.c
-+++ b/src/gd_tga.c
-@@ -207,12 +207,13 @@ int read_image_tga( gdIOCtx *ctx, oTga *tga )
- {
- 	int pixel_block_size = (tga->bits / 8);
- 	int image_block_size = (tga->width * tga->height) * pixel_block_size;
--	uint8_t* decompression_buffer = NULL;
-+	int* decompression_buffer = NULL;
- 	unsigned char* conversion_buffer = NULL;
- 	int buffer_caret = 0;
- 	int bitmap_caret = 0;
- 	int i = 0;
- 	int encoded_pixels;
-+	int rle_size;
- 
- 	if(overflow2(tga->width, tga->height)) {
- 		return -1;
-@@ -266,7 +267,7 @@ int read_image_tga( gdIOCtx *ctx, oTga *tga )
- 		/*! \brief Read in RLE compressed RGB TGA
- 		 *  Chunk load the pixel data from an RLE compressed RGB type TGA.
- 		 */
--		decompression_buffer = (uint8_t*) gdMalloc(image_block_size * sizeof(uint8_t));
-+		decompression_buffer = (int*) gdMalloc(image_block_size * sizeof(int));
- 		if (decompression_buffer == NULL) {
- 			return -1;
- 		}
-@@ -277,7 +278,8 @@ int read_image_tga( gdIOCtx *ctx, oTga *tga )
- 			return -1;
- 		}
- 
--		if (gdGetBuf(conversion_buffer, image_block_size, ctx) != image_block_size) {
-+		rle_size = gdGetBuf(conversion_buffer, image_block_size, ctx);
-+		if (rle_size <= 0) {
- 			gdFree(conversion_buffer);
- 			gdFree(decompression_buffer);
- 			return -1;
-@@ -285,7 +287,7 @@ int read_image_tga( gdIOCtx *ctx, oTga *tga )
- 
- 		buffer_caret = 0;
- 
--		while( buffer_caret < image_block_size) {
-+		while( buffer_caret < rle_size) {
- 			decompression_buffer[buffer_caret] = (int)conversion_buffer[buffer_caret];
- 			buffer_caret++;
- 		}
-@@ -298,14 +300,14 @@ int read_image_tga( gdIOCtx *ctx, oTga *tga )
- 				encoded_pixels = ( ( decompression_buffer[ buffer_caret ] & ~TGA_RLE_FLAG ) + 1 );
- 				buffer_caret++;
- 
--				if ((bitmap_caret + (encoded_pixels * pixel_block_size)) >= image_block_size) {
-+				if ((bitmap_caret + (encoded_pixels * pixel_block_size)) > image_block_size) {
- 					gdFree( decompression_buffer );
- 					gdFree( conversion_buffer );
- 					return -1;
- 				}
- 
- 				for (i = 0; i < encoded_pixels; i++) {
--					memcpy(tga->bitmap + bitmap_caret, decompression_buffer + buffer_caret, pixel_block_size);
-+					memcpy(tga->bitmap + bitmap_caret, decompression_buffer + buffer_caret, pixel_block_size * sizeof(int));
- 					bitmap_caret += pixel_block_size;
- 				}
- 				buffer_caret += pixel_block_size;
-@@ -314,13 +316,13 @@ int read_image_tga( gdIOCtx *ctx, oTga *tga )
- 				encoded_pixels = decompression_buffer[ buffer_caret ] + 1;
- 				buffer_caret++;
- 
--				if ((bitmap_caret + (encoded_pixels * pixel_block_size)) >= image_block_size) {
-+				if ((bitmap_caret + (encoded_pixels * pixel_block_size)) > image_block_size) {
- 					gdFree( decompression_buffer );
- 					gdFree( conversion_buffer );
- 					return -1;
- 				}
- 
--				memcpy(tga->bitmap + bitmap_caret, decompression_buffer + buffer_caret, encoded_pixels * pixel_block_size);
-+				memcpy(tga->bitmap + bitmap_caret, decompression_buffer + buffer_caret, encoded_pixels * pixel_block_size * sizeof(int));
- 				bitmap_caret += (encoded_pixels * pixel_block_size);
- 				buffer_caret += (encoded_pixels * pixel_block_size);
- 			}
-diff --git a/tests/tga/CMakeLists.txt b/tests/tga/CMakeLists.txt
-index c3a589c..789fb14 100644
---- a/tests/tga/CMakeLists.txt
-+++ b/tests/tga/CMakeLists.txt
-@@ -5,6 +5,7 @@ LIST(APPEND TESTS_FILES
- 	bug00247a
- 	bug00248
- 	bug00248a
-+	tga_read
- )
- 
- ADD_GD_TESTS()
-diff --git a/tests/tga/Makemodule.am b/tests/tga/Makemodule.am
-index dff828f..a1e6af6 100644
---- a/tests/tga/Makemodule.am
-+++ b/tests/tga/Makemodule.am
-@@ -4,7 +4,8 @@ libgd_test_programs += \
- 	tga/bug00247a \
- 	tga/bug00248 \
- 	tga/bug00248a \
--	tga/tga_null
-+	tga/tga_null \
-+	tga/tga_read
- 
- EXTRA_DIST += \
- 	tga/CMakeLists.txt \
-@@ -12,4 +13,7 @@ EXTRA_DIST += \
- 	tga/bug00247.tga \
- 	tga/bug00247a.tga \
- 	tga/bug00248.tga \
--	tga/bug00248a.tga
-+	tga/bug00248a.tga \
-+	tga/tga_read_rgb.png \
-+	tga/tga_read_rgb.tga \
-+	tga/tga_read_rgb_rle.tga
-diff --git a/tests/tga/tga_read.c b/tests/tga/tga_read.c
-new file mode 100644
-index 0000000..310b72f
---- /dev/null
-+++ b/tests/tga/tga_read.c
-@@ -0,0 +1,40 @@
-+/**
-+ * Basic test case for reading TGA files.
-+ */
-+
-+
-+#include "gd.h"
-+#include "gdtest.h"
-+
-+
-+static void assert_equals(char *exp, char *orig);
-+
-+
-+int main()
-+{
-+    assert_equals("tga_read_rgb.png", "tga_read_rgb.tga");
-+    assert_equals("tga_read_rgb.png", "tga_read_rgb_rle.tga");
-+
-+    return gdNumFailures();
-+}
-+
-+
-+static void assert_equals(char *exp, char *orig)
-+{
-+    gdImagePtr im;
-+    FILE *fp;
-+    char *filename;
-+
-+    fp = gdTestFileOpen2("tga", orig);
-+    gdTestAssertMsg(fp != NULL, "can't open %s", orig);
-+
-+    im = gdImageCreateFromTga(fp);
-+    gdTestAssertMsg(im != NULL, "can't read %s", orig);
-+    fclose(fp);
-+
-+    filename = gdTestFilePath2("tga", exp);
-+    gdAssertImageEqualsToFile(filename, im);
-+    gdFree(filename);
-+
-+    gdImageDestroy(im);
-+}
-diff --git a/tests/tga/tga_read_rgb.png b/tests/tga/tga_read_rgb.png
-new file mode 100644
-index 0000000000000000000000000000000000000000..bc468e3d927eaeb77d2f5c3bc35b970457f60f18
-GIT binary patch
-literal 2349
-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
-
-literal 0
-HcmV?d00001
-
-diff --git a/tests/tga/tga_read_rgb.tga b/tests/tga/tga_read_rgb.tga
-new file mode 100644
-index 0000000000000000000000000000000000000000..5f11f5a080f3424dff6ff368db6af140a5777e23
-GIT binary patch
-literal 90444
-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
-
-literal 0
-HcmV?d00001
-
-diff --git a/tests/tga/tga_read_rgb_rle.tga b/tests/tga/tga_read_rgb_rle.tga
-new file mode 100644
-index 0000000000000000000000000000000000000000..ce845ad0c3da65205af25854d64568b1cf0921e3
-GIT binary patch
-literal 9987
-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
-
-literal 0
-HcmV?d00001
-
--- 
-2.10.2
-
diff --git a/meta-oe/recipes-support/gd/gd_2.2.3.bb b/meta-oe/recipes-support/gd/gd_2.2.4.bb
similarity index 61%
rename from meta-oe/recipes-support/gd/gd_2.2.3.bb
rename to meta-oe/recipes-support/gd/gd_2.2.4.bb
index 5621706..4932bb7 100644
--- a/meta-oe/recipes-support/gd/gd_2.2.3.bb
+++ b/meta-oe/recipes-support/gd/gd_2.2.4.bb
@@ -9,20 +9,14 @@ HOMEPAGE = "http://libgd.bitbucket.org/"
 
 SECTION = "libs"
 LICENSE = "GD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c97638cafd3581eb87abd37332137669"
+LIC_FILES_CHKSUM = "file://COPYING;md5=07384b3aa2e0d39afca0d6c40286f545"
+
 DEPENDS = "freetype libpng jpeg zlib tiff"
 
 SRC_URI = "git://github.com/libgd/libgd.git;branch=GD-2.2 \
-           file://fix-gcc-unused-functions.patch \
-           file://CVE-2016-10166.patch \
-           file://CVE-2016-10167.patch \
-           file://CVE-2016-10168.patch \
-           file://.gitignore-the-new-test-case.patch \
-           file://Fix-290-TGA-RLE-decoding-is-broken.patch;apply=no \
-           file://CVE-2016-6906-1.patch;apply=no \
-           file://CVE-2016-6906-2.patch;apply=no"
+          "
 
-SRCREV = "46ceef5970bf3a847ff61d1bdde7501d66c11d0c"
+SRCREV = "de09874b15a4c88772db35ced842330f5de23e76"
 
 S = "${WORKDIR}/git"
 
@@ -39,19 +33,6 @@ EXTRA_OECONF += " --disable-rpath \
 
 EXTRA_OEMAKE = 'LDFLAGS="${LDFLAGS}"'
 
-do_git_apply () {
-       cd ${S}
-       if [ ! -f tests/tga/tga_read_rgb.png ]; then
-               git apply ${S}/../Fix-290-TGA-RLE-decoding-is-broken.patch
-               git apply ${S}/../CVE-2016-6906-1.patch
-               git apply ${S}/../CVE-2016-6906-2.patch
-       fi
-}
-
-do_patch_append() {
-    bb.build.exec_func('do_git_apply', d)
-}
-
 do_install_append() {
     # cleanup buildpaths from gdlib.pc
     sed -i -e 's#${STAGING_DIR_HOST}##g' ${D}${libdir}/pkgconfig/gdlib.pc
-- 
2.7.4


