Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11232EB64DD
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 17:57:55 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.1887.1688579870479112643
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jul 2023 10:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=TVWPiWeC;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5577004e21bso2575318a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Jul 2023 10:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688579869; x=1691171869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iR0GCvWcRRGswhJVoMVtdDdRG+5hQI6yyED0XOKLJ3s=;
        b=TVWPiWeCDghNOzyO5QOPL9LZUjno+DgD6WCNr1A03XNKDHnHUsrZUWBzGL4ONKmYxW
         yMYt6N1ML+ltiyqJnvlSxd7AoD2/jH91OPGF67C9V3hXC73c+ZLNSKztuVjqWx3/foUl
         Br2YbfpTHxKsaPr35sxhECP8Alt3pfaku1Q7P/VGT9zh6fdwrFhKAUwXTxM06a4MCYsG
         gPR73eFf/BvKbAJAWYOOfGvuv7SyHHYReiCa+0gK7cgz66+//7VJv8g7tnVE4kTT4xeJ
         ZlvoH/Hz9Y6UtyzuKy2cFDBRHEllbIol+Qx/zpqBxx2VLTtzZcnV4IgT/Y1G/Ckoj8Qb
         mvAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688579869; x=1691171869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iR0GCvWcRRGswhJVoMVtdDdRG+5hQI6yyED0XOKLJ3s=;
        b=B7hY///P/duo8vdYDIEXyBoArxsYHTaCGbiLWbU/k9i9SAQsjWJy2dPuP5i/75ZPZD
         u4fyAtqYkMiR+W2bDAos+6939F4cgeCza2tHFv8ZilMdxPLmKdgQ+Sn/Lbk/BTyUp6Mz
         eSNcQKNRuSQkA1JFb8XkjJw6HN2hfB4WpdVcNk6DaOoNzU8djf7s6NpWhJp74HdDCAGI
         s5ad7mpDy2C3PGsLaBCG3HKe4nlWGEo2WCJNjfCAIY3ogt5ZhJzxRAK44twce40zkfPe
         /WMP/CT0oc4sAfA29BGbeM+aRSWdKffssCmdspw1M3wQJSbPyvte+bwbxGAmLtaiLx37
         Wrcw==
X-Gm-Message-State: AC+VfDxWJoigxzgTITfay6F5oaPwRR1DLaNDW/KwWpP/MhSyEGYzjVS8
	C5CU/OsIR6qRf/eTU2Rd4NVN+8Q/rB4=
X-Google-Smtp-Source: ACHHUZ6M9VhbWVORZs1jGudoUa9l4X4dhAb0ibeFUQWtEKdgMDtZEMsJz/hTTdRcrEqxhh+4SjWNpw==
X-Received: by 2002:a05:6a21:33a4:b0:12d:23ea:9ccc with SMTP id yy36-20020a056a2133a400b0012d23ea9cccmr17621754pzb.39.1688579869384;
        Wed, 05 Jul 2023 10:57:49 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::81d4])
        by smtp.gmail.com with ESMTPSA id s7-20020a170902988700b001ac2be26340sm19391517plp.222.2023.07.05.10.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 10:57:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/2] python3-grpcio-tools: Upgrade to 1.56.0
Date: Wed,  5 Jul 2023 10:57:45 -0700
Message-ID: <20230705175746.3944873-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Jul 2023 17:57:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103675

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Delete old recipe

 ...0001-protobuf-Disable-musttail-attribute-on-mips.patch | 8 ++++----
 ...cio-tools_1.51.1.bb => python3-grpcio-tools_1.56.0.bb} | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.51.1.bb => python3-grpcio-tools_1.56.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch
index 8b13d7ae21..8c70b2b6a6 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch
@@ -14,11 +14,11 @@ Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 
 --- a/third_party/protobuf/src/google/protobuf/port_def.inc
 +++ b/third_party/protobuf/src/google/protobuf/port_def.inc
-@@ -255,6 +255,7 @@
+@@ -338,6 +338,7 @@ static_assert(PROTOBUF_ABSL_MIN(20230125
  #error PROTOBUF_TAILCALL was previously defined
  #endif
- #if __has_cpp_attribute(clang::musttail) && !defined(__arm__) && \
+ #if __has_cpp_attribute(clang::musttail) && !defined(__arm__) &&      \
 +    !defined(__mips__) &&                                        \
-     !defined(_ARCH_PPC) && !defined(__wasm__) &&                 \
-     !(defined(_MSC_VER) && defined(_M_IX86)) &&                  \
+     !defined(_ARCH_PPC) && !defined(__wasm__) &&                      \
+     !(defined(_MSC_VER) && defined(_M_IX86)) && !defined(__i386__) && \
      !(defined(__NDK_MAJOR__) && __NDK_MAJOR <= 24)
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.51.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.56.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.51.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.56.0.bb
index c1dbde1c9a..eb1994d7ce 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.51.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.56.0.bb
@@ -12,7 +12,7 @@ DEPENDS += "${PYTHON_PN}-grpcio"
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
             file://0001-protobuf-Disable-musttail-attribute-on-mips.patch \
             "
-SRC_URI[sha256sum] = "8e62d23d3fed9d4f81738f98dd193dbd2e21aed4a8f0dd715e75b5439e649727"
+SRC_URI[sha256sum] = "39f5877cea514b3da9f2683dfb3ffb45ef47b05f4ff39c287d7d61c5057f48b8"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-grpcio"
 
-- 
2.41.0


