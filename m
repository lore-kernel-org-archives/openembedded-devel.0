Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 830A065CAF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Oct 2014 08:29:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9N8TBGY029764
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Oct 2014 01:29:11 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 23 Oct 2014 01:29:11 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 23 Oct 2014 16:29:13 +0800
Message-ID: <1414052955-30856-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [meta-websever][PATCH 1/3] modphp: Security Advisory - php - CVE-2014-5120
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
X-List-Received-Date: Thu, 23 Oct 2014 08:29:19 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

gd_ctx.c in the GD component in PHP 5.4.x before 5.4.32 and 5.5.x before
5.5.16 does not ensure that pathnames lack %00 sequences, which might
allow remote attackers to overwrite arbitrary files via crafted input to
an application that calls the (1) imagegd, (2) imagegd2, (3) imagegif,
(4) imagejpeg, (5) imagepng, (6) imagewbmp, or (7) imagewebp function.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-5120

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
---
 .../modphp/files/php-CVE-2014-5120.patch           |   35 ++++++++++++++++++++
 meta-webserver/recipes-php/modphp/modphp5.inc      |    1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-webserver/recipes-php/modphp/files/php-CVE-2014-5120.patch

diff --git a/meta-webserver/recipes-php/modphp/files/php-CVE-2014-5120.patch b/meta-webserver/recipes-php/modphp/files/php-CVE-2014-5120.patch
new file mode 100644
index 0000000..f2e23b3
--- /dev/null
+++ b/meta-webserver/recipes-php/modphp/files/php-CVE-2014-5120.patch
@@ -0,0 +1,35 @@
+modphp: Security Advisory - php - CVE-2014-5120
+
+Upstream-Status: Backport
+
+Signed-off-by Yue Tao <yue.tao@windriver.com>
+
+From 706aefb78112a44d4932d4c9430c6a898696f51f Mon Sep 17 00:00:00 2001
+From: Stanislav Malyshev <stas@php.net>
+Date: Mon, 18 Aug 2014 22:49:10 -0700
+Subject: [PATCH] Fix bug #67730 - Null byte injection possible with imagexxx
+ functions
+
+---
+ ext/gd/gd_ctx.c |    5 +++++
+ 2 files changed, 7 insertions(+)
+
+diff --git a/ext/gd/gd_ctx.c b/ext/gd/gd_ctx.c
+index bff691f..eafbab5 100644
+--- a/ext/gd/gd_ctx.c
++++ b/ext/gd/gd_ctx.c
+@@ -124,6 +124,11 @@ static void _php_image_output_ctx(INTERNAL_FUNCTION_PARAMETERS, int image_type,
+ 				RETURN_FALSE;
+ 			}
+ 		} else if (Z_TYPE_P(to_zval) == IS_STRING) {
++			if (CHECK_ZVAL_NULL_PATH(to_zval)) {
++				php_error_docref(NULL TSRMLS_CC, E_WARNING, "Invalid 2nd parameter, filename must not contain null bytes");
++				RETURN_FALSE;
++			}
++
+ 			stream = php_stream_open_wrapper(Z_STRVAL_P(to_zval), "wb", REPORT_ERRORS|IGNORE_PATH|IGNORE_URL_WIN, NULL);
+ 			if (stream == NULL) {
+ 				RETURN_FALSE;
+-- 
+1.7.9.5
+
diff --git a/meta-webserver/recipes-php/modphp/modphp5.inc b/meta-webserver/recipes-php/modphp/modphp5.inc
index c1cdf72..4f14607 100644
--- a/meta-webserver/recipes-php/modphp/modphp5.inc
+++ b/meta-webserver/recipes-php/modphp/modphp5.inc
@@ -9,6 +9,7 @@ SRC_URI = "http://www.php.net/distributions/php-${PV}.tar.bz2 \
            file://pthread-check-threads-m4.patch \
            file://70_mod_php5.conf \
            file://0001-using-pkgconfig-to-check-libxml.patch \
+           file://php-CVE-2014-5120.patch \
 "
 
 S = "${WORKDIR}/php-${PV}"
-- 
1.7.10.4


