Return-Path: <Jian.Liu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C26D27318A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Dec 2015 03:18:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBH3IojC015438
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Dec 2015 19:18:51 -0800
Received: from pek-jliu7-d1.corp.ad.wrs.com (128.224.162.169) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 16 Dec 2015 19:18:50 -0800
From: Jian Liu <jian.liu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Dec 2015 11:18:46 +0800
Message-ID: <1450322326-1715-1-git-send-email-jian.liu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-oe] php: uninitialized pointer in phar_make_dirstream()
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
X-List-Received-Date: Thu, 17 Dec 2015 03:18:50 -0000
Content-Type: text/plain

CVE-2015-7804:
Off-by-one error in the phar_parse_zipfile function in ext/phar/zip.c
in PHP before 5.5.30 and 5.6.x before 5.6.14 allows remote attackers
to cause a denial of service (uninitialized pointer dereference and
application crash) by including the / filename in a .zip PHAR archive.

This patch is from
http://git.php.net/?p=php-src.git;a=commitdiff;\
h=1ddf72180a52d247db88ea42a3e35f824a8fbda1;hp=f98ab19dc0c978e3caaa2614579e4a61f2c317f5

Signed-off-by: Jian Liu <jian.liu@windriver.com>
---
 .../php/php-5.6.12/php-CVE-2015-7804.patch         | 35 ++++++++++++++++++++++
 meta-oe/recipes-devtools/php/php.inc               |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/php/php-5.6.12/php-CVE-2015-7804.patch

diff --git a/meta-oe/recipes-devtools/php/php-5.6.12/php-CVE-2015-7804.patch b/meta-oe/recipes-devtools/php/php-5.6.12/php-CVE-2015-7804.patch
new file mode 100644
index 0000000..248d1d1
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php-5.6.12/php-CVE-2015-7804.patch
@@ -0,0 +1,35 @@
+FIx bug #70433 - Uninitialized pointer in phar_make_dirstream when zip entry filename is "/"
+
+Off-by-one error in the phar_parse_zipfile function in ext/phar/zip.c 
+in PHP before 5.5.30 and 5.6.x before 5.6.14 allows remote attackers 
+to cause a denial of service (uninitialized pointer dereference and 
+application crash) by including the / filename in a .zip PHAR archive.
+
+Written-by: Stanislav Malyshev <stas@php.net>
+
+diff -Nur php-5.6.12.orig/ext/phar/util.c php-5.6.12/ext/phar/util.c
+--- php-5.6.12.orig/ext/phar/util.c	2015-12-16 18:51:51.603455462 +0800
++++ php-5.6.12/ext/phar/util.c	2015-12-16 18:53:43.483456242 +0800
+@@ -1969,7 +1969,7 @@
+ 
+ 	while ((s = zend_memrchr(filename, '/', filename_len))) {
+ 		filename_len = s - filename;
+-		if (FAILURE == zend_hash_add_empty_element(&phar->virtual_dirs, filename, filename_len)) {
++		if (!filename_len || FAILURE == zend_hash_add_empty_element(&phar->virtual_dirs, filename, filename_len)) {
+ 			break;
+ 		}
+ 	}
+diff -Nur php-5.6.12.orig/ext/phar/zip.c php-5.6.12/ext/phar/zip.c
+--- php-5.6.12.orig/ext/phar/zip.c	2015-12-16 18:51:51.603455462 +0800
++++ php-5.6.12/ext/phar/zip.c	2015-12-16 18:54:39.667456634 +0800
+@@ -396,7 +396,9 @@
+ 
+ 		if (entry.filename[entry.filename_len - 1] == '/') {
+ 			entry.is_dir = 1;
+-			entry.filename_len--;
++			if(entry.filename_len > 1) {
++				entry.filename_len--;
++			}
+ 			entry.flags |= PHAR_ENT_PERM_DEF_DIR;
+ 		} else {
+ 			entry.is_dir = 0;
diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 4aa9c3f..d0c596c 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -15,6 +15,7 @@ SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
            file://0001-php-don-t-use-broken-wrapper-for-mkdir.patch \
            file://0001-acinclude-use-pkgconfig-for-libxml2-config.patch \
            file://php-CVE-2015-7803.patch \
+           file://php-CVE-2015-7804.patch \
           "
 
 SRC_URI_append_class-target += " \
-- 
1.9.1


