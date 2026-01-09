Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B36D9D167E2
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 09:29:16 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6761.1767950948707800738
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 01:29:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N98xE5zH;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a0d0788adaso28613625ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 01:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767950948; x=1768555748; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U2pZHRAiVfSh6E6LajNFH2m98oCuhj9G2bi0Xr/CEbo=;
        b=N98xE5zHCpyCxJuI8MVwJdQx57wUiuH7zgqbUNxrqXZVmTrSG0rQ1hsPUVTBAkjHMz
         96ipJ6DDqKBFGWDMR93sDGaz0Vbk+RcjgeAczTkca/BIMlZuN2Svt4DkMYs6/rqQ2uxn
         f/ocmzuWZIpnv0pVGlTy1/kRr5vKUpT4RATzOo/vDUT4EzDFaweW+tlOmxRdX/A5pLkv
         yXxaq+WYlRqetVff5olKc5unRG1TB9EBNV2HeeFrwRh54lCz4p/AcFu0AjgMg/oaj+fX
         6nQYIedZ+6ZCris76w6uYfte6C9/4Nz7eBwiaq4+GNi+G7Pua+zmB/vJf7YL5ujfNtSl
         Do2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767950948; x=1768555748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U2pZHRAiVfSh6E6LajNFH2m98oCuhj9G2bi0Xr/CEbo=;
        b=bO/gvOmttV0Wyl1pedUAN50C4N8cVviLVMKtfIAN62Prt5bBHe3UTKzFXDTQudzbN5
         TE5IrzlBDzuwvSrbsEGRN2xWhi/mA8lliicYUVmxV0J05VyC+KH9x3ZXCVM6QMaHsgvl
         FfD7Y1P5zwrgbuolRuHCC2SRxovO8S5N9Uh9X6RpzfhZLMgfFKKpLiYG3uDtH4FTFaUe
         xyuOVkRbJ+ihaPnXXKP6qVkzNq4CHJz//MnM9uTryMNIMKV8rlvI/qgbCmg+irHwd9UU
         Th/RlNIEDe5BxVYEYpYInmr0AmYcWhRWyb7njiyLSaAJcFLBepvRo8Cg0IvK2gbqbbse
         pBPQ==
X-Gm-Message-State: AOJu0YwSRtoHRZ5IqBr7WNmFPcMnum/38Uso17m2cdGWg7pI8ujEc7VP
	0+dYAdlE65FoFAaSVrmqwvc/gWbpJtbuAWrnjfvYyFekKEHjh8nAbFXmFnL82A==
X-Gm-Gg: AY/fxX5t8Q/OYe6eYWe4vKLuZ328Q4tNgg3cJ8Y5JrxH4x2DCQ3Xp0S1eoVhK1jBXr7
	M9rp2CX+9bUcEsvevP55FvEjUbWohvZC1eA8kSFRePMsqsdk2x0Ttbn9T22wfkwXqD2WNLRIuy+
	8GRprPnODUDF3/hhiBtCFrrdo2+XNnzZlUsflqLJOHmiRWKyCCpKYBO9QwOBIJRn+Z0QuPAOHge
	tt0/vpEdP3gGewfSC1OJcc3KKtiqOhIseLkq56xHfZK8OVjBeqjoPazUg6+Klqj1aoSsyBS3tlh
	dl2RbCmboSNQS/Ne2w/6FAu2ZAZs+Jxp4ZzMKzgWaVsr/JXEx45pf2nmf0sL7szVDesQ2ktKLYL
	rcrd4MUj7z6NIIg5snyDofdbT2EXz2yOhZULnZCRA99d1EnrmLgr+ycc3N0iOIm8Py4fn9o89xs
	xJb6MWSM9U8KEWgwBZmNFDfQxIr7AZgcvamA==
X-Google-Smtp-Source: AGHT+IHqJ+Zo++u383fjjZwDBB4NLNKoM7Il6iFqkh9BvfJH3SddoqySMUmsk13B2n05u0xoGW1reA==
X-Received: by 2002:a17:902:f682:b0:2a0:a33f:3049 with SMTP id d9443c01a7336-2a3ee40e4a6mr81965295ad.4.1767950947834;
        Fri, 09 Jan 2026 01:29:07 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88e3sm99529295ad.75.2026.01.09.01.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:29:07 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 07/12] open62541: patch CVE-2024-53429
Date: Fri,  9 Jan 2026 22:28:37 +1300
Message-ID: <20260109092843.1924568-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109092843.1924568-1-ankur.tyagi85@gmail.com>
References: <20260109092843.1924568-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 09:29:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123285

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-53429

Backport the patch mentioned in the comment[1] which fixed this CVE.

[1] https://github.com/open62541/open62541/issues/6825#issuecomment-2460650733

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../opcua/open62541/CVE-2024-53429.patch      | 44 +++++++++++++++++++
 .../opcua/open62541_1.3.8.bb                  |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/opcua/open62541/CVE-2024-53429.patch

diff --git a/meta-networking/recipes-protocols/opcua/open62541/CVE-2024-53429.patch b/meta-networking/recipes-protocols/opcua/open62541/CVE-2024-53429.patch
new file mode 100644
index 0000000000..7afd7eb752
--- /dev/null
+++ b/meta-networking/recipes-protocols/opcua/open62541/CVE-2024-53429.patch
@@ -0,0 +1,44 @@
+From c69c42bb55f66e1721367dc9c98d0b4a63b14c25 Mon Sep 17 00:00:00 2001
+From: Julius Pfrommer <julius.pfrommer@web.de>
+Date: Tue, 22 Oct 2024 21:47:15 +0200
+Subject: [PATCH] refactor(core): Validate Variant ArrayLength against its
+ ArrayDimensions during binary decode
+
+This lead to the fuzzer complaing since we hade the check for _encode
+but not for _decode. This is not a direct memory issue per se. But the
+consistency check allows early discovery of problematic values and
+can potentially remove bugs where the user relies on the array
+dimensions and the array length to match.
+
+CVE: CVE-2024-53429
+Upstream-Status: Backport [https://github.com/open62541/open62541/commit/b9473527623125b5ca264dae4551f8cc414b3bc3]
+(cherry picked from commit b9473527623125b5ca264dae4551f8cc414b3bc3)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/ua_types_encoding_binary.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/src/ua_types_encoding_binary.c b/src/ua_types_encoding_binary.c
+index 7b3a4f6b8..0272ba399 100644
+--- a/src/ua_types_encoding_binary.c
++++ b/src/ua_types_encoding_binary.c
+@@ -1093,9 +1093,18 @@ DECODE_BINARY(Variant) {
+     }
+ 
+     /* Decode array dimensions */
+-    if(isArray && (encodingByte & (u8)UA_VARIANT_ENCODINGMASKTYPE_DIMENSIONS) > 0)
++    if(isArray && (encodingByte & (u8)UA_VARIANT_ENCODINGMASKTYPE_DIMENSIONS) > 0) {
+         ret |= Array_decodeBinary((void**)&dst->arrayDimensions, &dst->arrayDimensionsSize,
+                                   &UA_TYPES[UA_TYPES_INT32], ctx);
++        /* Validate array length against array dimensions */
++        size_t totalSize = 1;
++        for(size_t i = 0; i < dst->arrayDimensionsSize; ++i) {
++            if(dst->arrayDimensions[i] == 0)
++                return UA_STATUSCODE_BADDECODINGERROR;
++            totalSize *= dst->arrayDimensions[i];
++        }
++        UA_CHECK(totalSize == dst->arrayLength, ret = UA_STATUSCODE_BADDECODINGERROR);
++    }
+ 
+     ctx->depth--;
+     return ret;
diff --git a/meta-networking/recipes-protocols/opcua/open62541_1.3.8.bb b/meta-networking/recipes-protocols/opcua/open62541_1.3.8.bb
index 19a50aee3a..ed859c9c92 100644
--- a/meta-networking/recipes-protocols/opcua/open62541_1.3.8.bb
+++ b/meta-networking/recipes-protocols/opcua/open62541_1.3.8.bb
@@ -19,6 +19,7 @@ SRC_URI = " \
     git://github.com/OPCFoundation/UA-Nodeset;name=ua-nodeset;protocol=https;branch=v1.04;destsuffix=git/deps/ua-nodeset \
     git://github.com/LiamBindle/MQTT-C.git;name=mqtt-c;protocol=https;branch=master;destsuffix=git/deps/mqtt-c \
     file://0001-fix-build-do-not-install-git-files.patch \
+    file://CVE-2024-53429.patch \
 "
 
 S = "${WORKDIR}/git"

