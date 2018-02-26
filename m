Return-Path: <Li.Zhou@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4158E786EA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Feb 2018 07:55:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w1Q7t6IN023617
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 23:55:06 -0800 (PST)
Received: from pek-lzhou2-d1.corp.ad.wrs.com (128.224.163.239) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server
	(TLS) id 14.3.361.1; Sun, 25 Feb 2018 23:54:30 -0800
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 26 Feb 2018 15:50:30 +0800
Message-ID: <20180226075031.17262-1-li.zhou@windriver.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
X-Originating-IP: [128.224.163.239]
Subject: [meta-oe][PATCH 1/2] php: Security Advisory - php - CVE-2018-5711
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
X-List-Received-Date: Mon, 26 Feb 2018 07:55:05 -0000
Content-Type: text/plain

Porting the patch from <http://git.php.net/?p=php-src.git;a=commit;
h=8d6e9588671136837533fe3785657c31c5b52767> to solve CVE-2018-5711.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 .../php/php-7.1.9/CVE-2018-5711.patch              | 56 ++++++++++++++++++++++
 meta-oe/recipes-devtools/php/php_7.1.9.bb          |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/php/php-7.1.9/CVE-2018-5711.patch

diff --git a/meta-oe/recipes-devtools/php/php-7.1.9/CVE-2018-5711.patch b/meta-oe/recipes-devtools/php/php-7.1.9/CVE-2018-5711.patch
new file mode 100644
index 0000000..596244d
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php-7.1.9/CVE-2018-5711.patch
@@ -0,0 +1,56 @@
+From b04cd19b76374ebce8f3326275bdfd7e9b9aeab5 Mon Sep 17 00:00:00 2001
+From: Li Zhou <li.zhou@windriver.com>
+Date: Sun, 11 Feb 2018 15:03:21 +0800
+Subject: [PATCH] Fixed bug #75571: Potential infinite loop in
+ gdImageCreateFromGifCtx
+
+Due to a signedness confusion in `GetCode_` a corrupt GIF file can
+trigger an infinite loop.  Furthermore we make sure that a GIF without
+any palette entries is treated as invalid *after* open palette entries
+have been removed.
+
+Upstream-Status: Backport
+CVE: CVE-2018-5711
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ ext/gd/libgd/gd_gif_in.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/ext/gd/libgd/gd_gif_in.c b/ext/gd/libgd/gd_gif_in.c
+index 76ba152..7156e4b 100644
+--- a/ext/gd/libgd/gd_gif_in.c
++++ b/ext/gd/libgd/gd_gif_in.c
+@@ -261,10 +261,6 @@ terminated:
+ 	if (!im) {
+ 		return 0;
+ 	}
+-	if (!im->colorsTotal) {
+-		gdImageDestroy(im);
+-		return 0;
+-	}
+ 	/* Check for open colors at the end, so
+ 	   we can reduce colorsTotal and ultimately
+ 	   BitsPerPixel */
+@@ -275,6 +271,10 @@ terminated:
+ 			break;
+ 		}
+ 	}
++	if (!im->colorsTotal) {
++		gdImageDestroy(im);
++		return 0;
++	}
+ 	return im;
+ }
+ /* }}} */
+@@ -375,7 +375,7 @@ static int
+ GetCode_(gdIOCtx *fd, CODE_STATIC_DATA *scd, int code_size, int flag, int *ZeroDataBlockP)
+ {
+ 	int           i, j, ret;
+-	unsigned char count;
++	int           count;
+ 
+ 	if (flag) {
+ 		scd->curbit = 0;
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-devtools/php/php_7.1.9.bb b/meta-oe/recipes-devtools/php/php_7.1.9.bb
index acf68a0..1d9e35a 100644
--- a/meta-oe/recipes-devtools/php/php_7.1.9.bb
+++ b/meta-oe/recipes-devtools/php/php_7.1.9.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c0af599f66d0461c5837c695fcbc5c1e"
 SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch \
             file://0001-Specify-tag-with-libtool.patch \
             file://CVE-2017-16642.patch \
+            file://CVE-2018-5711.patch \
            "
 SRC_URI[md5sum] = "2397be54f3281cdf30c7ef076b28f7d0"
 SRC_URI[sha256sum] = "314dcc10dfdd7c4443edb4fe1e133a44f2b2a8351be8c9eb6ab9222d45fd9bae"
-- 
2.9.3


