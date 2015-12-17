Return-Path: <Jian.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 59D04601F6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Dec 2015 03:18:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBH3IPZf007881
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Dec 2015 19:18:25 -0800 (PST)
Received: from pek-jliu7-d1.corp.ad.wrs.com (128.224.162.169) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 16 Dec 2015 19:18:24 -0800
From: Jian Liu <jian.liu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Dec 2015 11:18:20 +0800
Message-ID: <1450322300-1671-1-git-send-email-jian.liu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-oe] php: NULL pointer dereference in phar_get_fp_offset()
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
X-List-Received-Date: Thu, 17 Dec 2015 03:18:25 -0000
Content-Type: text/plain

CVE-2015-7803:
The phar_get_entry_data function in ext/phar/util.c in PHP
before 5.5.30 and 5.6.x before 5.6.14 allows remote attackers
to cause a denial of service (NULL pointer dereference and
application crash) via a .phar file with a crafted TAR archive
entry in which the Link indicator references a file that does
not exist.

This patch is from
http://git.php.net/?p=php-src.git;a=commitdiff;\
h=d698f0ae51f67c9cce870b09c59df3d6ba959244;hp=bb98ed600ab6787d9d367927d49439be9a83441e

Signed-off-by: Jian Liu <jian.liu@windriver.com>
---
 .../php/php-5.6.12/php-CVE-2015-7803.patch         | 72 ++++++++++++++++++++++
 meta-oe/recipes-devtools/php/php.inc               |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/php/php-5.6.12/php-CVE-2015-7803.patch

diff --git a/meta-oe/recipes-devtools/php/php-5.6.12/php-CVE-2015-7803.patch b/meta-oe/recipes-devtools/php/php-5.6.12/php-CVE-2015-7803.patch
new file mode 100644
index 0000000..77ff44f
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php-5.6.12/php-CVE-2015-7803.patch
@@ -0,0 +1,72 @@
+Fix bug #69720: Null pointer dereference in phar_get_fp_offset()
+
+The phar_get_entry_data function in ext/phar/util.c in PHP 
+before 5.5.30 and 5.6.x before 5.6.14 allows remote attackers 
+to cause a denial of service (NULL pointer dereference and 
+application crash) via a .phar file with a crafted TAR archive 
+entry in which the Link indicator references a file that does 
+not exist.
+
+Written-by: Stanislav Malyshev <stas@php.net>
+
+Binary files php-5.6.12.orig/ext/phar/tests/bug69720.phar and php-5.6.12/ext/phar/tests/bug69720.phar differ
+diff -Nur php-5.6.12.orig/ext/phar/tests/bug69720.phpt php-5.6.12/ext/phar/tests/bug69720.phpt
+--- php-5.6.12.orig/ext/phar/tests/bug69720.phpt	1970-01-01 08:00:00.000000000 +0800
++++ php-5.6.12/ext/phar/tests/bug69720.phpt	2015-12-16 17:15:56.703415339 +0800
+@@ -0,0 +1,40 @@
++--TEST--
++Phar - bug #69720 - Null pointer dereference in phar_get_fp_offset()
++--SKIPIF--
++<?php if (!extension_loaded("phar")) die("skip"); ?>
++--FILE--
++<?php
++try {
++    // open an existing phar
++    $p = new Phar(__DIR__."/bug69720.phar",0);
++    // Phar extends SPL's DirectoryIterator class
++	echo $p->getMetadata();
++    foreach (new RecursiveIteratorIterator($p) as $file) {
++        // $file is a PharFileInfo class, and inherits from SplFileInfo
++	$temp="";
++        $temp= $file->getFileName() . "\n";
++        $temp.=file_get_contents($file->getPathName()) . "\n"; // display contents
++	var_dump($file->getMetadata());
++    }
++}
++ catch (Exception $e) {
++    echo 'Could not open Phar: ', $e;
++}
++?>
++--EXPECTF--
++
++MY_METADATA_NULL
++
++Warning: file_get_contents(phar:///%s): failed to open stream: phar error: "test.php" is not a file in phar "%s.phar" in %s.php on line %d
++array(1) {
++  ["whatever"]=>
++  int(123)
++}
++object(DateTime)#2 (3) {
++  ["date"]=>
++  string(26) "2000-01-01 00:00:00.000000"
++  ["timezone_type"]=>
++  int(3)
++  ["timezone"]=>
++  string(3) "UTC"
++}
+diff -Nur php-5.6.12.orig/ext/phar/util.c php-5.6.12/ext/phar/util.c
+--- php-5.6.12.orig/ext/phar/util.c	2015-12-16 17:06:04.011411206 +0800
++++ php-5.6.12/ext/phar/util.c	2015-12-16 17:18:08.683416259 +0800
+@@ -494,7 +494,11 @@
+ 	(*ret)->is_tar = entry->is_tar;
+ 	(*ret)->fp = phar_get_efp(entry, 1 TSRMLS_CC);
+ 	if (entry->link) {
+-		(*ret)->zero = phar_get_fp_offset(phar_get_link_source(entry TSRMLS_CC) TSRMLS_CC);
++		phar_entry_info *link = phar_get_link_source(entry TSRMLS_CC);
++		if(!link) {
++			return FAILURE;
++		}
++		(*ret)->zero = phar_get_fp_offset(link TSRMLS_CC);
+ 	} else {
+ 		(*ret)->zero = phar_get_fp_offset(entry TSRMLS_CC);
+ 	}
diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 67d2362..4aa9c3f 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -14,6 +14,7 @@ SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
            file://acinclude-xml2-config.patch \
            file://0001-php-don-t-use-broken-wrapper-for-mkdir.patch \
            file://0001-acinclude-use-pkgconfig-for-libxml2-config.patch \
+           file://php-CVE-2015-7803.patch \
           "
 
 SRC_URI_append_class-target += " \
-- 
1.9.1


