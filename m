Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D9DC001DB
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 20:40:23 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.13560.1691268013193797108
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 13:40:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=LbsBE3ZB;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6874d1c8610so2280101b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 13:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691268012; x=1691872812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iVfAnjm+2b5mmwbmoFLIeCp/omWZMv2uWakP9e8OTqo=;
        b=LbsBE3ZB7RETT2LLzPxKuxf6/IOBqtWWocuCv3ZIlILE2U20U96eM2QLsSq5BYFQcr
         QxYLgJtSg5IC7aQGjTYG0/Suf+4g21+ZMEXtNn2AaPotneleJjfapeCRSZoVBL+5YsPS
         STm+1JMbgdW6ZVcvI5Bam9ANRkjBHl5oHNboPviTmjj8F7kYBHXD8A4LO9+A6t+KZs9M
         7o5An2AoTuPAenMmqKtDwMP9+wjop3ukGKXnJiQG9qigTDkdz1tw70QO7tRG/BYcf1oi
         3cc+X1kBlJNIxaenthfu4PstbJLmdK73uGrGsVef6nAFgw5AoSEI88g9F0qEzSzM6+zd
         37ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691268012; x=1691872812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iVfAnjm+2b5mmwbmoFLIeCp/omWZMv2uWakP9e8OTqo=;
        b=C7+IMIaNGTmNTOIq4KkRxzr4Dza7FvWR7aj76i6SMjNKyRSkVXISzuGD5cJShr32b6
         TPvkbaGk/rzhuTq8q8d0AwSXZgGqJAvCdcY1XQlEzsVo3RxTPqWSy/9JtDL55vDXQVv2
         LhE5BUfUpAjQGjeg5jkwjxxWNp2bgx5R2I+kpmgCNlMTtFEfhkzUn9/xwzCB60qOBYLW
         XLh8dt5mmLKcs8dkmpHVAZqvElGV8AnAQvZQZUxd+NOP5FNDOtGVNXBiUxkXK7hswCL+
         jMGa8TLetWsVUqlm3eklXKyII/f/SpYTe+IHmH2DEiexS/iDsR77KXvVY7L4OCZhZPcy
         7TIw==
X-Gm-Message-State: AOJu0YwUWUvTzNyY+iXJKcjetgJBtBz7nY3xEqU7RTs9dWFWOVzZmSoA
	aQPigfN11moso98/NNmJTI+1idaY/UbKcQ==
X-Google-Smtp-Source: AGHT+IG9l9tAhk1ZdegNaR3xG8ensZAp7mez4ClyAqKoGG9xsloFNYRkwT1fd/ITDQnBf3uxj18b7w==
X-Received: by 2002:a17:90a:1544:b0:268:1376:d501 with SMTP id y4-20020a17090a154400b002681376d501mr4092792pja.5.1691268012185;
        Sat, 05 Aug 2023 13:40:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::61c9])
        by smtp.gmail.com with ESMTPSA id e1-20020a17090a118100b002681131c36csm6494773pja.45.2023.08.05.13.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 13:40:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] nodejs: Upgrade to 18.17.0
Date: Sat,  5 Aug 2023 13:40:09 -0700
Message-ID: <20230805204009.601514-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 20:40:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104291

Update to latest release of latest LTS 18 release

License-Update: [1] [2] [3]

[1] https://github.com/nodejs/node/commit/0cfdb3affa518bf55cfd8120f0286099fabfb22a
[2] https://github.com/nodejs/node/commit/2ea6e030038d86376dea748f702ed14018f99aba
[3] https://github.com/nodejs/node/commit/261e1d23d11053b373ea51745f6c1187440c2b08

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../oe-npm-cache                                              | 0
 ...-cache-native_18.16.bb => nodejs-oe-cache-native_18.17.bb} | 0
 .../nodejs/{nodejs_18.16.0.bb => nodejs_18.17.0.bb}           | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-18.16 => nodejs-oe-cache-18.17}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_18.16.bb => nodejs-oe-cache-native_18.17.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_18.16.0.bb => nodejs_18.17.0.bb} (97%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-18.16/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-18.17/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-18.16/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-18.17/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_18.16.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_18.17.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_18.16.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_18.17.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_18.16.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_18.17.0.bb
similarity index 97%
rename from meta-oe/recipes-devtools/nodejs/nodejs_18.16.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_18.17.0.bb
index 3adb51549e..1d49218e65 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_18.16.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_18.17.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0be148d0e7298c5c94f7501affafbce5"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bc1f9ebe76be76f163e3b675303ad9cd"
 
 CVE_PRODUCT = "nodejs node.js"
 
@@ -39,7 +39,7 @@ SRC_URI:append:toolchain-clang:x86 = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "33d81a233e235a509adda4a4f2209008d04591979de6b3f0f67c1c906093f118"
+SRC_URI[sha256sum] = "80c0faadf5ea39c213ccb9aa5c2432977a0f1b5a0b766852abd0de06f2770406"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.41.0


