Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B59E80A86
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 05:11:25 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.11242.1695791484874763119
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Sep 2023 22:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZIUBMFzn;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: samuli.piippo@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2b9d07a8d84so171121791fa.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 22:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695791482; x=1696396282; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8jwQMOWrsPBz+rQhoSqtGzP4RjlA/G3b1OGEMc3BMUw=;
        b=ZIUBMFznT5vLiL/mCayQ0AX+AvN05wMvHz8No7wNJHqvogQXDbWQrul56TmPVuKKsi
         Zm0uB5JuSmLoWcpmexvssQjbQPrFmAu1dyxNeMFYJXs2xM9i3LdMbJ/E8fpLg2qKm+ur
         PX8XzY6QKwfllT98+Bjt8ZZqjJEDVQTt7NTa+C5cY6vFnyrCCwFJ+9VBe1ZWSamEXX7u
         TuQjw3TTbzKwdrN+SZHajStkG7XYDU9Z2h9eUhVWz4v2imxaHZJJJj+L3TTd7p73mK59
         n9qGJNgPo8gg+l0WRn8Vpm6qcGl66IykYoXUNcEQ31XnA4DqPUxugqVDsJ4QUSnzRtPx
         /dSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695791482; x=1696396282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8jwQMOWrsPBz+rQhoSqtGzP4RjlA/G3b1OGEMc3BMUw=;
        b=J+k6WV73+EzcqT2TZN2PxHkq27xDgFRHgtTDND6cGC0e/Rl7A/LqQXEBkvotmyHSTh
         /JkOPHCy1xNQBCresLM0ICFaKTKG8Fp3mNKkZvPq7vqTIt6nEZpLWKYxMjo6zyMfNC4z
         IsopbE7Uh62rNBd42uTRfOKhGGB2WfOvlGab+b9nQbYKg0IgsbqANHmH5ckODFseR6Jd
         YpQVekpF9+5jFV97czTh4M7BiUSkPInof0D2GiHu0riiFjWXPDFs3/IAZhFb4dvO5ZDl
         PGfJcGjcuzQSBEAfNze39j8UJCwo3GQI2kVcqddsowKF67ZjDGKxsX6zdNf5Vh09fm1w
         57Dg==
X-Gm-Message-State: AOJu0YyiKAi/+xvtf6KFxm8RPZ+IJdEODkeWJsivwy2FWhRD6lK8wqu0
	BPEsrBc93P3BUc6kSNUFGx0igKNgGrGw0A==
X-Google-Smtp-Source: AGHT+IExa31ZdpeOEBghYCYBABP6R7KcqfZvRddkBNBVYi7aonH0cLzFIpm/zCQJ9jBuROolpZutHw==
X-Received: by 2002:a2e:9e49:0:b0:2bb:997a:493e with SMTP id g9-20020a2e9e49000000b002bb997a493emr816877ljk.35.1695791482129;
        Tue, 26 Sep 2023 22:11:22 -0700 (PDT)
Received: from dcbuildsrv.ci.qt.io ([192.89.120.62])
        by smtp.gmail.com with ESMTPSA id n10-20020a2e82ca000000b002bcc4d64758sm2829711ljh.103.2023.09.26.22.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 22:11:21 -0700 (PDT)
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-devel@lists.openembedded.org
Cc: Samuli Piippo <samuli.piippo@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] protobuf: stage protoc binary to sysroot
Date: Wed, 27 Sep 2023 05:11:01 +0000
Message-Id: <20230927051101.3088498-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 05:11:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105163

From: Samuli Piippo <samuli.piippo@gmail.com>

If protoc is enabled for the build, recipes using protobuf will
fail when protoc is not available in the recipe sysroot:

|   The imported target "protobuf::protoc" references the file
|
|      ".../recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/bin/protoc-3.21.5.0"
|
|   but this file does not exist.  Possible reasons include:
|
|   * The file was deleted, renamed, or moved to another location.
|
|   * An install or uninstall procedure did not complete successfully.
|
|   * The installation package was faulty and contained
|
|      ".../recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/cmake/protobuf/protobuf-targets.cmake"
|
|   but not all the files it references.

Use SYSROOT_DIRS to stage the binary to sysroot so it's always
available for other recipes.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
index d95e1c20f..06b21a0d6 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
@@ -92,6 +92,9 @@ PACKAGE_BEFORE_PN = "${PN}-compiler ${PN}-lite"
 FILES:${PN}-compiler = "${bindir} ${libdir}/libprotoc${SOLIBS}"
 FILES:${PN}-lite = "${libdir}/libprotobuf-lite${SOLIBS}"
 
+# CMake requires binaries to exist in sysroot, even if they have wrong architecture.
+SYSROOT_DIRS += "${bindir}"
+
 RDEPENDS:${PN}-compiler = "${PN}"
 RDEPENDS:${PN}-dev += "${PN}-compiler"
 RDEPENDS:${PN}-ptest = "bash ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-protobuf', '', d)}"
-- 
2.25.1


