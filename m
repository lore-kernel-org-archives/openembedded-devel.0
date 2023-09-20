Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF43C04AAF
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 16:39:27 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.210.1695227961155516474
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Sep 2023 09:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: straka.derek@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-59e6ebdf949so16477007b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 09:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695227960; x=1695832760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yjEAdnViH0fYED4wk3FhvAEFJb+iy7MXftuvely+nA8=;
        b=uA1U1hQc92UJZWe5P3+XfOY4GbiODrOYjWhqPcrVtRC1pKmOe9wNcWG3QCF5VxpQDu
         wDevCVboXzEz1i2M3iNTpz8xC0LTYM9tRFu+kGtxrzXdJ59lJz347dk9UgqHYYwxM4vK
         nWcBosOYFDYpv2Ds6ne6ttpcMP6Gld7weRmmHk1Mh0taTZGRNZVhSiNv+MjRGnTWhiSn
         2tvGPpwiE9317/+gcHIjL/OnpKq8fDh6MScCuIQj1WVpVkjTHdijm3TmKAzeKWP6y4jy
         lw/LVDOoOglfRWMEzp631cJqYFCQPo8ZW7MN4El06fJEPn3weZaKo1ZNEBknF8ioNn7S
         KDww==
X-Gm-Message-State: AOJu0YxB/7vsExytbqfvmU0FyPALEH/b3WXRHu9HJQArnEDPlTn0cl4j
	UTmGaYQlkdo326Zaxjm5m1DtzkRqaeKxPA==
X-Google-Smtp-Source: AGHT+IHIWkt7Iec0ZoGmnSOhuVqVMI5NK/rU/Rx/0GdqBRDVwrcjhkiK8NdWBWOrMJ1KbiPM7maZxA==
X-Received: by 2002:a81:a18f:0:b0:59d:7924:ddbd with SMTP id y137-20020a81a18f000000b0059d7924ddbdmr6219637ywg.15.1695227959912;
        Wed, 20 Sep 2023 09:39:19 -0700 (PDT)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id m5-20020a817105000000b0058038e6609csm3859804ywc.74.2023.09.20.09.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 09:39:19 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-brotli: Update version 1.0.9 -> 1.1.0
Date: Wed, 20 Sep 2023 16:38:59 +0000
Message-Id: <20230920163859.1241378-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 16:39:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105018

Removed override for package extension as it is now a tgz

Changelog
=========
Added
decoder: BrotliDecoderAttachDictionary
decoder: BrotliDecoderOnFinish callback behind BROTLI_REPORTING
decoder: BrotliDecoderSetMetadataCallbacks
encoder: BrotliEncoderPrepareDictionary,
BrotliEncoderDestroyPreparedDictionary,
BrotliEncoderAttachPreparedDictionary
decoder: BrotliEncoderOnFinish callback behind BROTLI_REPORTING
common: BrotliSharedDictionaryCreateInstance,
BrotliSharedDictionaryDestroyInstance,
BrotliSharedDictionaryAttach
CLI: --dictionary option
java: encoder wrapper: Parameters.mode
java: Brotli{Input|Output}Stream.attachDictionary
java: wrapper: partial byte array input
typescript: decoder (transpiled from Java)

Removed
build: BROTLI_BUILD_PORTABLE option
Fixed
java: JNI decoder failed sometimes on power of 2 payloads

Improved
java / js: smaller decoder footprint
decoder: faster decoding
encoder: faster encoding
encoder: smaller stack frames

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python3-brotli_1.0.9.bb => python3-brotli_1.1.0.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-brotli_1.0.9.bb => python3-brotli_1.1.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-brotli_1.0.9.bb b/meta-python/recipes-devtools/python/python3-brotli_1.1.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-brotli_1.0.9.bb
rename to meta-python/recipes-devtools/python/python3-brotli_1.1.0.bb
index 5dfac5823..0f639f33e 100644
--- a/meta-python/recipes-devtools/python/python3-brotli_1.0.9.bb
+++ b/meta-python/recipes-devtools/python/python3-brotli_1.1.0.bb
@@ -5,9 +5,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=941ee9cd1609382f946352712a319b4b"
 
 PYPI_PACKAGE = "Brotli"
-PYPI_PACKAGE_EXT = "zip"
 
-SRC_URI[sha256sum] = "4d1b810aa0ed773f81dceda2cc7b403d01057458730e309856356d4ef4188438"
+SRC_URI[sha256sum] = "81de08ac11bcb85841e440c13611c00b67d3bf82698314928d0b676362546724"
 
 inherit pypi setuptools3
 
-- 
2.34.1


