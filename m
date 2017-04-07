Return-Path: <Catalin.Enache@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A1DAD77DA8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Apr 2017 10:11:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v37ABvTm023886
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 7 Apr 2017 03:11:57 -0700 (PDT)
Received: from no3.corp.ad.wrs.com (128.224.125.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Fri, 7 Apr 2017 03:11:56 -0700
From: Catalin Enache <catalin.enache@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 7 Apr 2017 13:10:53 +0300
Message-ID: <1491559853-5493-1-git-send-email-catalin.enache@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] gd : CVE-2016-10167, CVE-2016-10168
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
X-List-Received-Date: Fri, 07 Apr 2017 10:12:00 -0000
Content-Type: text/plain

The gdImageCreateFromGd2Ctx function in gd_gd2.c in the GD Graphics
Library (aka libgd) before 2.2.4 allows remote attackers to cause a
denial of service (application crash) via a crafted image file.

Integer overflow in gd_io.c in the GD Graphics Library (aka libgd) before
2.2.4 allows remote attackers to have unspecified impact via vectors
involving the number of horizontal and vertical chunks in an image.

References:
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-10167
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-10168

Upstream patches:
https://github.com/libgd/libgd/commit/fe9ed49dafa993e3af96b6a5a589efeea9bfb36f
https://github.com/libgd/libgd/commit/69d2fd2c597ffc0c217de1238b9bf4d4bceba8e6

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
---
 meta-oe/recipes-support/gd/gd/CVE-2016-10167.patch | 48 ++++++++++++++++++++++
 meta-oe/recipes-support/gd/gd/CVE-2016-10168.patch | 38 +++++++++++++++++
 meta-oe/recipes-support/gd/gd_2.2.3.bb             |  4 +-
 3 files changed, 89 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/gd/gd/CVE-2016-10167.patch
 create mode 100644 meta-oe/recipes-support/gd/gd/CVE-2016-10168.patch

diff --git a/meta-oe/recipes-support/gd/gd/CVE-2016-10167.patch b/meta-oe/recipes-support/gd/gd/CVE-2016-10167.patch
new file mode 100644
index 0000000..54ef22c
--- /dev/null
+++ b/meta-oe/recipes-support/gd/gd/CVE-2016-10167.patch
@@ -0,0 +1,48 @@
+From 6ab531ef0d82efb9e00236ee5ea23928335d221f Mon Sep 17 00:00:00 2001
+From: Catalin Enache <catalin.enache@windriver.com>
+Date: Fri, 7 Apr 2017 12:30:22 +0300
+Subject: [PATCH] Fix DOS vulnerability in gdImageCreateFromGd2Ctx()
+
+We must not pretend that there are image data if there are none. Instead
+we fail reading the image file gracefully.
+
+Upstream-Status: Backport
+CVE: CVE-2016-10167
+
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ src/gd_gd2.c | 14 ++++++--------
+ 1 file changed, 6 insertions(+), 8 deletions(-)
+
+diff --git a/src/gd_gd2.c b/src/gd_gd2.c
+index 8df93c1..bae65ea 100644
+--- a/src/gd_gd2.c
++++ b/src/gd_gd2.c
+@@ -445,18 +445,16 @@ BGD_DECLARE(gdImagePtr) gdImageCreateFromGd2Ctx (gdIOCtxPtr in)
+ 
+ 						if (im->trueColor) {
+ 							if (!gdGetInt (&im->tpixels[y][x], in)) {
+-								/*printf("EOF while reading\n"); */
+-								/*gdImageDestroy(im); */
+-								/*return 0; */
+-								im->tpixels[y][x] = 0;
++								gd_error("gd2: EOF while reading\n");
++								gdImageDestroy(im);
++								return NULL;
+ 							}
+ 						} else {
+ 							int ch;
+ 							if (!gdGetByte (&ch, in)) {
+-								/*printf("EOF while reading\n"); */
+-								/*gdImageDestroy(im); */
+-								/*return 0; */
+-								ch = 0;
++								gd_error("gd2: EOF while reading\n");
++								gdImageDestroy(im);
++								return NULL;
+ 							}
+ 							im->pixels[y][x] = ch;
+ 						}
+-- 
+2.10.2
+
diff --git a/meta-oe/recipes-support/gd/gd/CVE-2016-10168.patch b/meta-oe/recipes-support/gd/gd/CVE-2016-10168.patch
new file mode 100644
index 0000000..aef1060
--- /dev/null
+++ b/meta-oe/recipes-support/gd/gd/CVE-2016-10168.patch
@@ -0,0 +1,38 @@
+From 2d37bdc03a6e2b820fe380016f22592a7733e0be Mon Sep 17 00:00:00 2001
+From: Catalin Enache <catalin.enache@windriver.com>
+Date: Fri, 7 Apr 2017 12:32:49 +0300
+Subject: [PATCH] Fix #354: Signed Integer Overflow gd_io.c
+
+GD2 stores the number of horizontal and vertical chunks as words (i.e. 2
+byte unsigned). These values are multiplied and assigned to an int when
+reading the image, what can cause integer overflows. We have to avoid
+that, and also make sure that either chunk count is actually greater
+than zero. If illegal chunk counts are detected, we bail out from
+reading the image.
+
+Upstream-Status: Backport
+CVE: CVE-2016-10168
+
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ src/gd_gd2.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/gd_gd2.c b/src/gd_gd2.c
+index bae65ea..9006bd2 100644
+--- a/src/gd_gd2.c
++++ b/src/gd_gd2.c
+@@ -151,6 +151,10 @@ _gd2GetHeader (gdIOCtxPtr in, int *sx, int *sy,
+ 	GD2_DBG (printf ("%d Chunks vertically\n", *ncy));
+ 
+ 	if (gd2_compressed (*fmt)) {
++		if (*ncx <= 0 || *ncy <= 0 || *ncx > INT_MAX / *ncy) {
++			GD2_DBG(printf ("Illegal chunk counts: %d * %d\n", *ncx, *ncy));
++			goto fail1;
++		}
+ 		nc = (*ncx) * (*ncy);
+ 
+ 		GD2_DBG (printf ("Reading %d chunk index entries\n", nc));
+-- 
+2.10.2
+
diff --git a/meta-oe/recipes-support/gd/gd_2.2.3.bb b/meta-oe/recipes-support/gd/gd_2.2.3.bb
index 4ff6b756..4e21d53 100644
--- a/meta-oe/recipes-support/gd/gd_2.2.3.bb
+++ b/meta-oe/recipes-support/gd/gd_2.2.3.bb
@@ -14,7 +14,9 @@ DEPENDS = "freetype libpng jpeg zlib tiff"
 
 SRC_URI = "git://github.com/libgd/libgd.git;branch=GD-2.2 \
            file://fix-gcc-unused-functions.patch \
-           file://CVE-2016-10166.patch"
+           file://CVE-2016-10166.patch \
+           file://CVE-2016-10167.patch \
+           file://CVE-2016-10168.patch"
 
 SRCREV = "46ceef5970bf3a847ff61d1bdde7501d66c11d0c"
 
-- 
2.10.2


