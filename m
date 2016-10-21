Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 27C0471AB1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2016 08:19:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u9L8JKD4028001
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2016 01:19:20 -0700 (PDT)
Received: from pek-lpgtest20.wrs.com (128.224.179.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Fri, 21 Oct 2016 01:19:15 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Oct 2016 16:19:14 +0800
Message-ID: <1477037954-141118-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] gd: Security Advisory CVE-2016-7568
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
X-List-Received-Date: Fri, 21 Oct 2016 08:19:22 -0000
Content-Type: text/plain

Backport patch to fix CVE-2016-7568 from gd upstream:

	https://github.com/libgd/libgd/commit/2806adfdc27a94d333199345394d7c302952b95f

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 ...01-Fix-integer-overflow-in-gdImageWebpCtx.patch | 41 ++++++++++++++++++++++
 meta-oe/recipes-support/gd/gd_2.2.3.bb             |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-support/gd/gd/0001-Fix-integer-overflow-in-gdImageWebpCtx.patch

diff --git a/meta-oe/recipes-support/gd/gd/0001-Fix-integer-overflow-in-gdImageWebpCtx.patch b/meta-oe/recipes-support/gd/gd/0001-Fix-integer-overflow-in-gdImageWebpCtx.patch
new file mode 100644
index 0000000..9967e23
--- /dev/null
+++ b/meta-oe/recipes-support/gd/gd/0001-Fix-integer-overflow-in-gdImageWebpCtx.patch
@@ -0,0 +1,41 @@
+From 2806adfdc27a94d333199345394d7c302952b95f Mon Sep 17 00:00:00 2001
+From: trylab <trylab@users.noreply.github.com>
+Date: Tue, 6 Sep 2016 18:35:32 +0800
+Subject: [PATCH] Fix integer overflow in gdImageWebpCtx
+
+Integer overflow can be happened in expression gdImageSX(im) * 4 *
+gdImageSY(im). It could lead to heap buffer overflow in the following
+code. This issue has been reported to the PHP Bug Tracking System. The
+proof-of-concept file will be supplied some days later. This issue was
+discovered by Ke Liu of Tencent's Xuanwu LAB.
+
+Upstream-Status: Backport
+
+CVE-2016-7568
+
+---
+ src/gd_webp.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/gd_webp.c b/src/gd_webp.c
+index 8eb4dee..9886399 100644
+--- a/src/gd_webp.c
++++ b/src/gd_webp.c
+@@ -199,6 +199,14 @@ BGD_DECLARE(void) gdImageWebpCtx (gdImagePtr im, gdIOCtx * outfile, int quality)
+ 		quality = 80;
+ 	}
+ 
++	if (overflow2(gdImageSX(im), 4)) {
++		return;
++	}
++
++	if (overflow2(gdImageSX(im) * 4, gdImageSY(im))) {
++		return;
++	}
++
+ 	argb = (uint8_t *)gdMalloc(gdImageSX(im) * 4 * gdImageSY(im));
+ 	if (!argb) {
+ 		return;
+-- 
+2.9.3
+
diff --git a/meta-oe/recipes-support/gd/gd_2.2.3.bb b/meta-oe/recipes-support/gd/gd_2.2.3.bb
index 9655e9c..f7d4f44 100644
--- a/meta-oe/recipes-support/gd/gd_2.2.3.bb
+++ b/meta-oe/recipes-support/gd/gd_2.2.3.bb
@@ -15,6 +15,7 @@ DEPENDS = "freetype libpng jpeg zlib tiff"
 SRC_URI = "git://github.com/libgd/libgd.git;branch=GD-2.2 \
            file://fix-gcc-unused-functions.patch \
            file://disable-jpeg_read-test.patch \
+           file://0001-Fix-integer-overflow-in-gdImageWebpCtx.patch \
           "
 
 SRCREV = "46ceef5970bf3a847ff61d1bdde7501d66c11d0c"
-- 
2.7.4


