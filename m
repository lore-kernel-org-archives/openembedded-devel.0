Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C627C07CB1
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 18:47:45 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.46432.1701283663944528509
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Nov 2023 10:47:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HlPVKfQk;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40a4848c6e1so522195e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 10:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701283662; x=1701888462; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f/xGsmsJFwdNq9H7kP04WmjYu6ogI8kCvGfgAOPrMi0=;
        b=HlPVKfQk7w1qxDHqY5QXozooX1oYpnvrvmDpr6exoR4pmefpYcc9QhUtiVAPnCseu7
         B3XdPIH7l1KhQi0zy0CDQ/AmqbZkXkyJK8YN+Feqls7reCFttE6He1MDrZFzPBmDj0yI
         JrWZSdpaVKk6E4wylsVdhkAcR/1L89F38bkrY3JxRyifJlbGRvzNqpTTJiQMuW5dSPys
         kOnlf6W7t6RHR2VqwFIcctCRPNPygYAdn5nvlDbZeHwcBdF8G4Ol3fj7USwXiZrFsOA7
         igT3VQA1l1vTd9rBfYZrf41QUhrhL8YfbpcDskBcJk05E0kKvzUIAjevh0C9uGAYnbBp
         VEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701283662; x=1701888462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/xGsmsJFwdNq9H7kP04WmjYu6ogI8kCvGfgAOPrMi0=;
        b=juLRRAxCZeampnwKDDbVTGH0Jg6b5RwKJwV703HllEKq3lbKYl0Z/PEeerHZWU4H44
         KoG2xvHSA6H45Xwc34WhIMMoT99XVab08FJG4kLoRL694F2N8S+ZMV2q6NxaVbX5ZMSr
         u/0v6Fx173whKqiw35yxD2ojVwhHF4hPxJxnmwFcAwHzQKFg37lcVmyX3QTTBZwc4sRf
         qRPPLTW8A7CDMAewlv2CTdoK1suimNdfO41tx+Cxl7JBozT0CSrgSgwqu2Lige+AdB+l
         gXhSZLz/5xtyDZGO2TJAd2FSUxbzURlIVDNzbgeNHCwkwrRK6aPSc6a2q94Xh92gNnCJ
         eT9w==
X-Gm-Message-State: AOJu0YxaPcG474AKqWMA8ILJW7G6RTA9uZBboO3K++gjNvaKlV7plRpP
	vB1gneQ0NoFHBBGZAh6R3dmOOh5fQLswXA==
X-Google-Smtp-Source: AGHT+IHE7Qi5Td/KvUQClWCDkgPbNNWhO5MRgntWZ9GBg/PnB5Ul3jrJvjESSbl66/a/cf8FKyK4Cg==
X-Received: by 2002:a05:600c:3c98:b0:40b:4ffd:fef7 with SMTP id bg24-20020a05600c3c9800b0040b4ffdfef7mr3210948wmb.6.1701283661627;
        Wed, 29 Nov 2023 10:47:41 -0800 (PST)
Received: from localhost.localdomain ([176.33.70.43])
        by smtp.gmail.com with ESMTPSA id v9-20020a05600c444900b0040b461550c4sm3126070wmn.42.2023.11.29.10.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 10:47:40 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] brotli: upgrade 1.0.9 -> 1.1.0
Date: Wed, 29 Nov 2023 21:47:22 +0300
Message-Id: <20231129184722.458288-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 18:47:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107144

- Removed patch because of fixed in the new version.

Changelog:

Added

    * decoder: BrotliDecoderAttachDictionary
    * decoder: BrotliDecoderOnFinish callback behind BROTLI_REPORTING
    * decoder: BrotliDecoderSetMetadataCallbacks
    * encoder: BrotliEncoderPrepareDictionary,
    * BrotliEncoderDestroyPreparedDictionary,
    * BrotliEncoderAttachPreparedDictionary
    * decoder: BrotliEncoderOnFinish callback behind BROTLI_REPORTING
    * common: BrotliSharedDictionaryCreateInstance,
    * BrotliSharedDictionaryDestroyInstance,
    * BrotliSharedDictionaryAttach
    * CLI: --dictionary option
    * java: encoder wrapper: Parameters.mode
    * java: Brotli{Input|Output}Stream.attachDictionary
    * java: wrapper: partial byte array input
    * typescript: decoder (transpiled from Java)

Removed

    * build: BROTLI_BUILD_PORTABLE option

Fixed

    * java: JNI decoder failed sometimes on power of 2 payloads

Improved

    * java / js: smaller decoder footprint
    * decoder: faster decoding
    * encoder: faster encoding
    * encoder: smaller stack frames

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-extended/brotli/brotli/838.patch  | 48 -------------------
 .../{brotli_1.0.9.bb => brotli_1.1.0.bb}      |  7 ++-
 2 files changed, 3 insertions(+), 52 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/brotli/brotli/838.patch
 rename meta-oe/recipes-extended/brotli/{brotli_1.0.9.bb => brotli_1.1.0.bb} (87%)

diff --git a/meta-oe/recipes-extended/brotli/brotli/838.patch b/meta-oe/recipes-extended/brotli/brotli/838.patch
deleted file mode 100644
index 98b888760..000000000
--- a/meta-oe/recipes-extended/brotli/brotli/838.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-Upstream-Status: Backport [https://github.com/google/brotli/pull/838]
-From 092446fafb4bfb81738853b7c7f76b293cd92a80 Mon Sep 17 00:00:00 2001
-From: Evgenii Kliuchnikov <eustas.ru@gmail.com>
-Date: Wed, 2 Sep 2020 10:49:49 +0200
-Subject: [PATCH] Revert "Add runtime linker path to pkg-config files (#740)"
-
-This reverts commit 31754d4ffce14153b5c2addf7a11019ec23f51c1.
----
- scripts/libbrotlicommon.pc.in | 2 +-
- scripts/libbrotlidec.pc.in    | 2 +-
- scripts/libbrotlienc.pc.in    | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/scripts/libbrotlicommon.pc.in b/scripts/libbrotlicommon.pc.in
-index 10ca969e..2a8cf7a3 100644
---- a/scripts/libbrotlicommon.pc.in
-+++ b/scripts/libbrotlicommon.pc.in
-@@ -7,5 +7,5 @@ Name: libbrotlicommon
- URL: https://github.com/google/brotli
- Description: Brotli common dictionary library
- Version: @PACKAGE_VERSION@
--Libs: -L${libdir} -R${libdir} -lbrotlicommon
-+Libs: -L${libdir} -lbrotlicommon
- Cflags: -I${includedir}
-diff --git a/scripts/libbrotlidec.pc.in b/scripts/libbrotlidec.pc.in
-index e7c3124f..6f8ef2e4 100644
---- a/scripts/libbrotlidec.pc.in
-+++ b/scripts/libbrotlidec.pc.in
-@@ -7,6 +7,6 @@ Name: libbrotlidec
- URL: https://github.com/google/brotli
- Description: Brotli decoder library
- Version: @PACKAGE_VERSION@
--Libs: -L${libdir} -R${libdir} -lbrotlidec
-+Libs: -L${libdir} -lbrotlidec
- Requires.private: libbrotlicommon >= 1.0.2
- Cflags: -I${includedir}
-diff --git a/scripts/libbrotlienc.pc.in b/scripts/libbrotlienc.pc.in
-index 4dd0811b..2098afe2 100644
---- a/scripts/libbrotlienc.pc.in
-+++ b/scripts/libbrotlienc.pc.in
-@@ -7,6 +7,6 @@ Name: libbrotlienc
- URL: https://github.com/google/brotli
- Description: Brotli encoder library
- Version: @PACKAGE_VERSION@
--Libs: -L${libdir} -R${libdir} -lbrotlienc
-+Libs: -L${libdir} -lbrotlienc
- Requires.private: libbrotlicommon >= 1.0.2
- Cflags: -I${includedir}
diff --git a/meta-oe/recipes-extended/brotli/brotli_1.0.9.bb b/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb
similarity index 87%
rename from meta-oe/recipes-extended/brotli/brotli_1.0.9.bb
rename to meta-oe/recipes-extended/brotli/brotli_1.1.0.bb
index 708c1c194..83f44833b 100644
--- a/meta-oe/recipes-extended/brotli/brotli_1.0.9.bb
+++ b/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb
@@ -6,10 +6,9 @@ BUGTRACKER = "https://github.com/google/brotli/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=941ee9cd1609382f946352712a319b4b"
 
-SRC_URI = "git://github.com/google/brotli.git;branch=master;protocol=https \
-           file://838.patch "
-# tag 1.0.9
-SRCREV= "e61745a6b7add50d380cfd7d3883dd6c62fc2c71"
+SRC_URI = "git://github.com/google/brotli.git;branch=master;protocol=https"
+SRCREV= "ed738e842d2fbdf2d6459e39267a633c4a9b2f5d"
+
 S = "${WORKDIR}/git"
 
 inherit cmake lib_package
-- 
2.25.1


