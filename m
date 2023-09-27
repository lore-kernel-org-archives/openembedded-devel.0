Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1354FE80A9B
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 06:57:37 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.12043.1695797850745660895
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Sep 2023 23:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=DqEk0Qk0;
 spf=pass (domain: mvista.com, ip: 209.85.160.172, mailfrom: sdoshi@mvista.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-418201cb9e9so26995881cf.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 23:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1695797849; x=1696402649; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PDlE2UHKwLF8Z7UuGr/sBw5yA4G/dnYcTBOQb11jwR0=;
        b=DqEk0Qk0vNeB2lnLR3n6KAHdJeBXTgTfEmQ92IIujA7QYYAA4DcefqSFXxz9fsKLfp
         DaBToetU/4k4d5WUc8Mn3uA4b4e1OOPhFgM8HJPEz9l54a2bT/a1PlQ4OU/R+eD0UUf0
         1gcQuE79ClST8e+yN7Ju1HOpBagSsymo1nqjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695797849; x=1696402649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDlE2UHKwLF8Z7UuGr/sBw5yA4G/dnYcTBOQb11jwR0=;
        b=R8suFCJJ02QMif1MCpYaMenVTPPfXsCSc2Qo7BmAg0eejZeXjcqWXrFRecWaLzKFpF
         ouognnDa6xfimPOzTkQEIo3TraN85I0ceXNjYrWHrK13u/8DWd/TSTyNINWxjICNbmkv
         lp/PFwtAAbDPKcy375QvNzjSUbV8BB53Pfi8iMEHffVaU+zlkt6tgwZF1RK9SSQMgF0j
         BrVhi5YO3ygKJpYArNqWZHPMmEKYlnExHJ7O8T0iMsaqTM4oizRur9NjsrJA+uLPkb6A
         e3x7+4JNbtBLc1PBoQdhgj4vqYh0ThSiZP6vcn1Lww/zcm3778Y93r0MkyEEO5zhDcfA
         q8/w==
X-Gm-Message-State: AOJu0Yy4yrBDGMjhVwenZQdIu6CLqGWutfV3S4940rceitQmaZcO/7ki
	wR7ERygcN5+ek/UWHN5KC9ntKNm2MZHNodVn/CA=
X-Google-Smtp-Source: AGHT+IFddx9VSWqOrWAKSx3dvnNuCyqmcjsuY/hcMS2eGGxnwMLrDAmMfKDWfVK96IfIb4KRI1JsWA==
X-Received: by 2002:ac8:7dc5:0:b0:418:1059:dfbc with SMTP id c5-20020ac87dc5000000b004181059dfbcmr1209723qte.45.1695797849379;
        Tue, 26 Sep 2023 23:57:29 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([43.254.176.110])
        by smtp.gmail.com with ESMTPSA id a21-20020a63e855000000b0057406c4306fsm10756861pgk.12.2023.09.26.23.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 23:57:29 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [meta-oe][dunfell][PATCH] php: Fix CVE-2023-3824
Date: Wed, 27 Sep 2023 12:27:23 +0530
Message-Id: <20230927065723.9561-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 06:57:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105172

From: Siddharth Doshi <sdoshi@mvista.com>

Upstream-Status: Backport from [https://github.com/php/php-src/commit/80316123f3e9dcce8ac419bd9dd43546e2ccb5ef]
CVE: CVE-2023-3824
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../php/php/CVE-2023-3824.patch               | 91 +++++++++++++++++++
 meta-oe/recipes-devtools/php/php_7.4.33.bb    |  1 +
 2 files changed, 92 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2023-3824.patch

diff --git a/meta-oe/recipes-devtools/php/php/CVE-2023-3824.patch b/meta-oe/recipes-devtools/php/php/CVE-2023-3824.patch
new file mode 100644
index 000000000..953b5258e
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/CVE-2023-3824.patch
@@ -0,0 +1,91 @@
+From 80316123f3e9dcce8ac419bd9dd43546e2ccb5ef Mon Sep 17 00:00:00 2001
+From: Niels Dossche <7771979+nielsdos@users.noreply.github.com>
+Date: Mon, 10 Jul 2023 13:25:34 +0200
+Subject: [PATCH] Fix buffer mismanagement in phar_dir_read()
+
+Fixes GHSA-jqcx-ccgc-xwhv.
+
+Upstream-Status: Backport from [https://github.com/php/php-src/commit/80316123f3e9dcce8ac419bd9dd43546e2ccb5ef]
+CVE: CVE-2023-3824
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ ext/phar/dirstream.c                    | 15 ++++++++------
+ ext/phar/tests/GHSA-jqcx-ccgc-xwhv.phpt | 27 +++++++++++++++++++++++++
+ 2 files changed, 36 insertions(+), 6 deletions(-)
+ create mode 100644 ext/phar/tests/GHSA-jqcx-ccgc-xwhv.phpt
+
+diff --git a/ext/phar/dirstream.c b/ext/phar/dirstream.c
+index 4710703c..490b1452 100644
+--- a/ext/phar/dirstream.c
++++ b/ext/phar/dirstream.c
+@@ -91,25 +91,28 @@ static int phar_dir_seek(php_stream *stream, zend_off_t offset, int whence, zend
+  */
+ static ssize_t phar_dir_read(php_stream *stream, char *buf, size_t count) /* {{{ */
+ {
+-	size_t to_read;
+ 	HashTable *data = (HashTable *)stream->abstract;
+ 	zend_string *str_key;
+ 	zend_ulong unused;
+ 
++	if (count != sizeof(php_stream_dirent)) {
++		return -1;
++	}
++
+ 	if (HASH_KEY_NON_EXISTENT == zend_hash_get_current_key(data, &str_key, &unused)) {
+ 		return 0;
+ 	}
+ 
+ 	zend_hash_move_forward(data);
+-	to_read = MIN(ZSTR_LEN(str_key), count);
+ 
+-	if (to_read == 0 || count < ZSTR_LEN(str_key)) {
++	php_stream_dirent *dirent = (php_stream_dirent *) buf;
++
++	if (sizeof(dirent->d_name) <= ZSTR_LEN(str_key)) {
+ 		return 0;
+ 	}
+ 
+-	memset(buf, 0, sizeof(php_stream_dirent));
+-	memcpy(((php_stream_dirent *) buf)->d_name, ZSTR_VAL(str_key), to_read);
+-	((php_stream_dirent *) buf)->d_name[to_read + 1] = '\0';
++	memset(dirent, 0, sizeof(php_stream_dirent));
++	PHP_STRLCPY(dirent->d_name, ZSTR_VAL(str_key), sizeof(dirent->d_name), ZSTR_LEN(str_key));
+ 
+ 	return sizeof(php_stream_dirent);
+ }
+diff --git a/ext/phar/tests/GHSA-jqcx-ccgc-xwhv.phpt b/ext/phar/tests/GHSA-jqcx-ccgc-xwhv.phpt
+new file mode 100644
+index 00000000..4e12f05f
+--- /dev/null
++++ b/ext/phar/tests/GHSA-jqcx-ccgc-xwhv.phpt
+@@ -0,0 +1,27 @@
++--TEST--
++GHSA-jqcx-ccgc-xwhv (Buffer overflow and overread in phar_dir_read())
++--SKIPIF--
++<?php if (!extension_loaded("phar")) die("skip"); ?>
++--INI--
++phar.readonly=0
++--FILE--
++<?php
++$phar = new Phar(__DIR__. '/GHSA-jqcx-ccgc-xwhv.phar');
++$phar->startBuffering();
++$phar->addFromString(str_repeat('A', PHP_MAXPATHLEN - 1), 'This is the content of file 1.');
++$phar->addFromString(str_repeat('B', PHP_MAXPATHLEN - 1).'C', 'This is the content of file 2.');
++$phar->stopBuffering();
++
++$handle = opendir('phar://' . __DIR__ . '/GHSA-jqcx-ccgc-xwhv.phar');
++var_dump(strlen(readdir($handle)));
++// Must not be a string of length PHP_MAXPATHLEN+1
++var_dump(readdir($handle));
++closedir($handle);
++?>
++--CLEAN--
++<?php
++unlink(__DIR__. '/GHSA-jqcx-ccgc-xwhv.phar');
++?>
++--EXPECTF--
++int(%d)
++bool(false)
+-- 
+2.24.4
+
diff --git a/meta-oe/recipes-devtools/php/php_7.4.33.bb b/meta-oe/recipes-devtools/php/php_7.4.33.bb
index cde482079..2a82d62ca 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.33.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.33.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
            file://debian-php-fixheader.patch \
            file://0001-configure.ac-don-t-include-build-libtool.m4.patch \
            file://0001-php.m4-don-t-unset-cache-variables.patch \
+           file://CVE-2023-3824.patch \
           "
 
 SRC_URI_append_class-target = " \
-- 
2.34.1


