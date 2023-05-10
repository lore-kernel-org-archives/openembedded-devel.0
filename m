Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC83C77B7D
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 18:06:30 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.24714.1683741984425498797
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 May 2023 11:06:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=QT5LeXs5;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1ab14cb3aaeso53990055ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 May 2023 11:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683741984; x=1686333984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hHPtLVy7LK+HOgFNbzqHdmnpAYmOm4nwWLqU+5Ql5oI=;
        b=QT5LeXs5Xnix2vlDgPdBK2bL6hDWx0e1etMh1TC501iRyrEqK6i9dz6m2zpHJBwJ77
         7TJnX5Ma1+fpbCFRsRZ6OMOFWjfQJUTPBiyuOnl6H9YG6Rw3s6y7fGlsdgFhGqS/qEkg
         /nAR3YtKeKroQKJT4Acbuxv46Kr0QlGcetYvUYX09vNzFwDEETzaEHeznrqgeTy863CI
         7HCGynvg9VxOwbPYwQOoA8V07vCYfcEo3tlvY6dJbn/CJoPm2UBV2+zDwMlZ7vQRbRYu
         uJkCf73shx16UU7nGJCU8PWxjuBTMZ/K4ivwEmpGWDFcN8Rin7Fwy4DM2Aps8hpOx1g4
         kLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683741984; x=1686333984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hHPtLVy7LK+HOgFNbzqHdmnpAYmOm4nwWLqU+5Ql5oI=;
        b=PLqqvR3YeOHTevP0SGEeSJ2XzBxbndnGdOY9/1CBM6x0PcMWk3JYUULXx4mj4TD6JF
         a1zX38aIonwF9+238MLf1tmay7xQF+DcMOJm6zmzesIPX5ooaVyADRuFkFJAYMqusUiI
         I0gLwZj7gb9wEd/NnTNKCw6fWlcSmZUxrj0Ow2i/VDDUoxLZkvXx3Np5sJ1tcfA90Ccv
         mqXG8aUJe6p2CSusvqBepeCdS9A3GMVhMjbENV5NwceWffbrlPWh6Oq3b8wuRteU262N
         q6dnz4ymflFNMGKMwaHRyR8DKKAl2c+st/qb9Ngo9LM5DpN7KPQRQLCRbc6psdgYZcI8
         ovKw==
X-Gm-Message-State: AC+VfDxVQtOT4afQO3k3bFdQZsPoPsZW5b8njOuLVvl2xY94FpMjN4cp
	GBBqXI58n/8C2xTopJryWaad5ZkYfcY42w==
X-Google-Smtp-Source: ACHHUZ5eaTKKSPnedvQxsIk8xaac5CiXvEUoWl83wHXHhCRiP8OnXDXbUaR2ETh1kHqx3HbGgkQVgA==
X-Received: by 2002:a17:902:d38c:b0:1ab:675:3e31 with SMTP id e12-20020a170902d38c00b001ab06753e31mr21876385pld.37.1683741983453;
        Wed, 10 May 2023 11:06:23 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::298a])
        by smtp.gmail.com with ESMTPSA id w16-20020a1709027b9000b00199203a4fa3sm4072910pll.203.2023.05.10.11.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 11:06:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] nodejs: Upgrade to 18.16.0
Date: Wed, 10 May 2023 11:06:21 -0700
Message-Id: <20230510180621.4052225-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 May 2023 18:06:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102536

License-Update: Add missing licenses for Ada [1] BSD, Simduf [2] BSD, posteject
[3] MIT

[1] https://github.com/nodejs/node/commit/0bc4c17e5705ea042cda392343d7301bb91873ed
[2] https://github.com/nodejs/node/commit/c9845fc3341fcdce298ad7f1630e329d71a6e746
[3] https://github.com/nodejs/node/commit/4aaec0726694ad0d3cb05d7f2593a90363c32f32

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../oe-npm-cache                                              | 0
 ...-cache-native_18.14.bb => nodejs-oe-cache-native_18.16.bb} | 0
 .../0001-Disable-running-gyp-files-for-bundled-deps.patch     | 2 +-
 .../nodejs/{nodejs_18.14.2.bb => nodejs_18.16.0.bb}           | 4 ++--
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-18.14 => nodejs-oe-cache-18.16}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_18.14.bb => nodejs-oe-cache-native_18.16.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_18.14.2.bb => nodejs_18.16.0.bb} (97%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-18.14/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-18.16/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-18.14/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-18.16/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_18.14.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_18.16.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_18.14.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_18.16.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
index 356c98d176..12f6cd8b96 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
@@ -41,6 +41,6 @@ do_unpack[postfuncs] += "prune_sources"
  out/Makefile: config.gypi common.gypi node.gyp \
 -	deps/uv/uv.gyp deps/llhttp/llhttp.gyp deps/zlib/zlib.gyp \
 +	deps/llhttp/llhttp.gyp \
- 	deps/simdutf/simdutf.gyp \
+ 	deps/simdutf/simdutf.gyp deps/ada/ada.gyp \
  	tools/v8_gypfiles/toolchain.gypi tools/v8_gypfiles/features.gypi \
  	tools/v8_gypfiles/inspector.gypi tools/v8_gypfiles/v8.gyp
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_18.14.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_18.16.0.bb
similarity index 97%
rename from meta-oe/recipes-devtools/nodejs/nodejs_18.14.2.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_18.16.0.bb
index 19df7d542a..06631f27db 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_18.14.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_18.16.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2dff1ccca11e333f1388e34f7e2d1de3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0be148d0e7298c5c94f7501affafbce5"
 
 CVE_PRODUCT = "nodejs node.js"
 
@@ -39,7 +39,7 @@ SRC_URI:append:toolchain-clang:x86 = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "fbc364dd25fee2cacc0f2033db2d86115fc07575310ea0e64408b8170d09c685"
+SRC_URI[sha256sum] = "33d81a233e235a509adda4a4f2209008d04591979de6b3f0f67c1c906093f118"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.40.1


