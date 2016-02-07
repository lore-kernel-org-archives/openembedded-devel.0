Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id A4BE67666E
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Feb 2016 21:12:15 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id c10so7458396pfc.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Feb 2016 13:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=bx4spCvHcRfTi5O3pgWpUDDiwwS+JKVf2CtHie+wVQw=;
	b=ryYzs38IudLDUYPwQUjExzqYRVu/tQjpTAjSVV/mRRyhIKj9skL3SyZge6lOlRGLyo
	DIr0lq/aSEGcT6kerbjPN8u7Nsc/rF+e15LyVrd6nWxBg54u2i0HB1+D2USqU284+nGu
	uPaEFSO8Dru5dBL+HIdDuFVK9nSrKrl19GEG3aqcQxpr6HjNdh2nnfe0bFEZ0N3ba2JA
	PV6/UnPsmzb35N0hikfccunNw89BRKI3Pye+OYzgw/A6yfks/tY+V/OSL//MT2EOsb/h
	auuD5dmOqbIS4DTR57cBPVV3glsZFj9G0w82E4wQTjhkRMI8820sMb/SSfTk/paB1un8
	pvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=bx4spCvHcRfTi5O3pgWpUDDiwwS+JKVf2CtHie+wVQw=;
	b=JvJG2OqTOcL0SSiv1Vb/MlNFjZdKDzsrkJHzbtSFZjKfjg/6vZ+3KJSZ07tRlir3mZ
	gonfU4C1iXGl/bS0PgDbseX+NFy9jVFDeLx417hcUS/Auq6bag/PgY5S76gsz1Wq2UUa
	seSMJZlrI25zAIWFJudquIfVghhL4z+kLeSKJk9xCXGPZ5hB65ixhhrGlOKRv6Eks6Ju
	+p6zu2tF/rP4P6OAlDoQGWIANLYm3BF5fPQ8OYxIJqk+4kS09eyzKc6mt2pULsByILim
	v1VBQVJ9vS32Uxx2Esn4h6Ean1aVhfeK4i0licd5lXAMS5r07cNUZ6izxMVGmOiLpP78
	8Ycg==
X-Gm-Message-State: AG10YOTWcxSD4PGdHew7IfmRHnaRFYlZ5Z1g4USBHNLP3Iq45dTVZu7rZM0O09JE+exNmw==
X-Received: by 10.98.68.212 with SMTP id m81mr37034092pfi.135.1454879536428;
	Sun, 07 Feb 2016 13:12:16 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	g81sm38382783pfj.1.2016.02.07.13.12.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 07 Feb 2016 13:12:14 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: otavio@ossystems.com.br, openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Sun,  7 Feb 2016 13:11:56 -0800
Message-Id: <047a9fae678ebb70c75dc6dff4aea8fca34b5350.1454879225.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454879225.git.akuster@mvista.com>
References: <cover.1454879225.git.akuster@mvista.com>
In-Reply-To: <cover.1454879225.git.akuster@mvista.com>
References: <cover.1454879225.git.akuster@mvista.com>
Subject: [PATCH 4/7] php: Security fix CVE-2015-7803
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
X-List-Received-Date: Sun, 07 Feb 2016 21:12:15 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2015-7803 php: NULL pointer dereference in phar_get_fp_offset()

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-devtools/php/php/CVE-2015-7803.patch   | 82 ++++++++++++++++++++++
 meta-oe/recipes-devtools/php/php_5.5.21.bb         |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2015-7803.patch

diff --git a/meta-oe/recipes-devtools/php/php/CVE-2015-7803.patch b/meta-oe/recipes-devtools/php/php/CVE-2015-7803.patch
new file mode 100644
index 0000000..5636f25
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/CVE-2015-7803.patch
@@ -0,0 +1,82 @@
+From d698f0ae51f67c9cce870b09c59df3d6ba959244 Mon Sep 17 00:00:00 2001
+From: Stanislav Malyshev <stas@php.net>
+Date: Mon, 28 Sep 2015 15:51:59 -0700
+Subject: [PATCH] Fix bug #69720: Null pointer dereference in
+ phar_get_fp_offset()
+
+Upsteam-Status: Backport
+https://git.php.net/?p=php-src.git;a=patch;h=d698f0ae51f67c9cce870b09c59df3d6ba959244
+
+CVE: CVE-2015-7803
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ ext/phar/tests/bug69720.phar | Bin 0 -> 8192 bytes
+ ext/phar/tests/bug69720.phpt |  40 ++++++++++++++++++++++++++++++++++++++++
+ ext/phar/util.c              |   6 +++++-
+ 3 files changed, 45 insertions(+), 1 deletion(-)
+ create mode 100644 ext/phar/tests/bug69720.phar
+ create mode 100644 ext/phar/tests/bug69720.phpt
+
+Index: php-5.5.21/ext/phar/tests/bug69720.phpt
+===================================================================
+--- /dev/null
++++ php-5.5.21/ext/phar/tests/bug69720.phpt
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
+Index: php-5.5.21/ext/phar/util.c
+===================================================================
+--- php-5.5.21.orig/ext/phar/util.c
++++ php-5.5.21/ext/phar/util.c
+@@ -494,7 +494,11 @@ really_get_entry:
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
diff --git a/meta-oe/recipes-devtools/php/php_5.5.21.bb b/meta-oe/recipes-devtools/php/php_5.5.21.bb
index 4ad198a..3582b45 100644
--- a/meta-oe/recipes-devtools/php/php_5.5.21.bb
+++ b/meta-oe/recipes-devtools/php/php_5.5.21.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
            file://acinclude-xml2-config.patch \
            file://0001-php-don-t-use-broken-wrapper-for-mkdir.patch \
            file://0001-acinclude-use-pkgconfig-for-libxml2-config.patch \
+           file://CVE-2015-7803.patch \
           "
 
 SRC_URI_append_class-target += " \
-- 
2.3.5


