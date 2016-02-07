Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 755337666E
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Feb 2016 21:12:17 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id y7so109655paa.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Feb 2016 13:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=mc/hA6YC6BwxdMAh39NpKawSitnHf1Fx61pyZEAoPk0=;
	b=Ygcd/VSAn4ICv+PmvwohKVQl0rBV9fRZZmuJm+1N3irRDlfTxJKl31IbDnCqxRpbhb
	6RwyPCq7FMtlFyMflzJED6YOUV7tlI0Kb3/60p7aT8SO7QdBhSPzk48eF5RS1VOxtf42
	KLI5wSBZyXkaWodxI+DbzV0eugEKYPIyluww1hTduGFK4EbWj1mPKeEnAsOAlHIsvZR/
	xYlS93NCZN6nIku2ELGO/1rna+UVf1/RH/vc6JYMBnsOW+WfMC9KCUtPsEY4ueuJZ+KS
	HM2MZrtrzQoU6WfxEK4caa7Tqo+O1El+tSqJ8s7U1PWgWupBK6E4QWWizNmZq3efh97Q
	WGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=mc/hA6YC6BwxdMAh39NpKawSitnHf1Fx61pyZEAoPk0=;
	b=Ni94EmmSIhQicJ6gC9On+QU/22yy/6U6r0QaTtpQO6F6kz2GHBCKWBlWuGJ4e0o3iV
	46PKIXZoU+QxFNfGwsM8ca2zb9fP+BDFJAGfE4zUwdKfqohEtkUIuK4FeirMq3fogtjS
	QK9HIOSikBfSUHeJBZrMDC37zldOCTF4blhSEIWLvqsBNaGyTZ2PwF5O1dAfBBeWRFSj
	Lf9lBp2KAfMArvgEedxd6G7CvTQrMLfnA/oOXr+7cNGZNqwkmgIPhzXJCQ/C7ZHq5hbO
	Q7rBGlvPrIvAHHQEJUpDIKCogJPCdIPkMIPIy5sKj/g4OnBPIZlSBSw5k1/eOv9f3fJ7
	Fkzw==
X-Gm-Message-State: AG10YORqXKdX8Q8r0jaJ4EGLhoFLkCHrMMqhIAiKLE7jncUu0yTcuw05/fZtmEj9yYbH/Q==
X-Received: by 10.66.187.77 with SMTP id fq13mr19939678pac.25.1454879538139;
	Sun, 07 Feb 2016 13:12:18 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	g81sm38382783pfj.1.2016.02.07.13.12.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 07 Feb 2016 13:12:17 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: otavio@ossystems.com.br, openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Sun,  7 Feb 2016 13:11:57 -0800
Message-Id: <0e1e5f42a8cac06bfcb10a1e4c37bbc35ba30891.1454879225.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454879225.git.akuster@mvista.com>
References: <cover.1454879225.git.akuster@mvista.com>
In-Reply-To: <cover.1454879225.git.akuster@mvista.com>
References: <cover.1454879225.git.akuster@mvista.com>
Subject: [PATCH 5/7] php: Security fix CVE-2015-7804
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
X-List-Received-Date: Sun, 07 Feb 2016 21:12:17 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2015-7804 php: uninitialized pointer in phar_make_dirstream()

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-devtools/php/php/CVE-2015-7804.patch   | 62 ++++++++++++++++++++++
 meta-oe/recipes-devtools/php/php_5.5.21.bb         |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2015-7804.patch

diff --git a/meta-oe/recipes-devtools/php/php/CVE-2015-7804.patch b/meta-oe/recipes-devtools/php/php/CVE-2015-7804.patch
new file mode 100644
index 0000000..ad211a3
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/CVE-2015-7804.patch
@@ -0,0 +1,62 @@
+From e78ac461dbefb7c4a3e9fde78d50fbc56b7b0183 Mon Sep 17 00:00:00 2001
+From: Stanislav Malyshev <stas@php.net>
+Date: Mon, 28 Sep 2015 17:12:35 -0700
+Subject: [PATCH] FIx bug #70433 - Uninitialized pointer in phar_make_dirstream
+ when zip entry filename is "/"
+
+Upstream-status: Backport
+
+https://git.php.net/?p=php-src.git;a=patch;h=e78ac461dbefb7c4a3e9fde78d50fbc56b7b0183
+
+CVE: CVE-2015-7804
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ ext/phar/dirstream.c         |   2 +-
+ ext/phar/tests/bug70433.phpt |  23 +++++++++++++++++++++++
+ ext/phar/tests/bug70433.zip  | Bin 0 -> 264 bytes
+ 3 files changed, 24 insertions(+), 1 deletion(-)
+ create mode 100644 ext/phar/tests/bug70433.phpt
+ create mode 100755 ext/phar/tests/bug70433.zip
+
+Index: php-5.5.21/ext/phar/dirstream.c
+===================================================================
+--- php-5.5.21.orig/ext/phar/dirstream.c
++++ php-5.5.21/ext/phar/dirstream.c
+@@ -207,7 +207,7 @@ static php_stream *phar_make_dirstream(c
+ 	zend_hash_internal_pointer_reset(manifest);
+ 
+ 	while (FAILURE != zend_hash_has_more_elements(manifest)) {
+-		if (HASH_KEY_NON_EXISTENT == zend_hash_get_current_key_ex(manifest, &key, &keylen, &unused, 0, NULL)) {
++		if (HASH_KEY_IS_STRING != zend_hash_get_current_key_ex(manifest, &key, &keylen, &unused, 0, NULL)) {
+ 			break;
+ 		}
+ 
+Index: php-5.5.21/ext/phar/tests/bug70433.phpt
+===================================================================
+--- /dev/null
++++ php-5.5.21/ext/phar/tests/bug70433.phpt
+@@ -0,0 +1,23 @@
++--TEST--
++Phar - bug #70433 - Uninitialized pointer in phar_make_dirstream when zip entry filename is "/"
++--SKIPIF--
++<?php if (!extension_loaded("phar")) die("skip"); ?>
++--FILE--
++<?php
++$phar = new PharData(__DIR__."/bug70433.zip");
++var_dump($phar);
++$meta = $phar->getMetadata();
++var_dump($meta);
++?>
++DONE
++--EXPECTF--
++object(PharData)#1 (3) {
++  ["pathName":"SplFileInfo":private]=>
++  string(0) ""
++  ["glob":"DirectoryIterator":private]=>
++  bool(false)
++  ["subPathName":"RecursiveDirectoryIterator":private]=>
++  string(0) ""
++}
++NULL
++DONE
diff --git a/meta-oe/recipes-devtools/php/php_5.5.21.bb b/meta-oe/recipes-devtools/php/php_5.5.21.bb
index 3582b45..ed286d6 100644
--- a/meta-oe/recipes-devtools/php/php_5.5.21.bb
+++ b/meta-oe/recipes-devtools/php/php_5.5.21.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
            file://0001-php-don-t-use-broken-wrapper-for-mkdir.patch \
            file://0001-acinclude-use-pkgconfig-for-libxml2-config.patch \
            file://CVE-2015-7803.patch \
+           file://CVE-2015-7804.patch \
           "
 
 SRC_URI_append_class-target += " \
-- 
2.3.5


