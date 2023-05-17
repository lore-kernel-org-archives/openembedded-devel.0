Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92573C77B75
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 11:38:49 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.47029.1684323523124541773
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 May 2023 04:38:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=inqRWh3l;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: samuli.piippo@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ac90178fdaso5612681fa.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 May 2023 04:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684323521; x=1686915521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=W/PDEFP09qIsRCA9NCRlVIAHT3yEP6anasQfHvl/QXU=;
        b=inqRWh3ljC6h9COnVmYGipZh0AVqILBOoCub8epI1NUcEx8PIeZmDbLenYQxrpzXmh
         QdhsL5tkI2wtmx3lKOX3CtaOTj8vFyr4ZuD6WTlmc5wAKfSExazHh2mMvaBaiJs8lvrv
         o/PB2tYlmRvyewszYsrA6QhMSTD4ryFpxv692uy2C/s3OGMRwgAK5cWgxRfrc39jWDcu
         dEG7gYpRDAwlLFUiQG1/abiZ+RJTVm+DACSK6OSSRQME5+XMvCPokycDWTXFMp75NLoY
         W8X/G1Oe7HoiPx2s8QRDGeHXdVXGiPoFl+nHKtf/LLpHBXnRlxZXrMZy8yGO50MCFIg4
         V4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684323521; x=1686915521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W/PDEFP09qIsRCA9NCRlVIAHT3yEP6anasQfHvl/QXU=;
        b=R+7b3Aau49uIUO+cwOSq5MwhRpTtyr7M8K3uJ/MYEjG47wtqJ55cWYC17bEgOXmZkH
         6KNBvDBfZ+k/UXlXLOInoTNZCoL11vA1o+ij7FiwmaI/yfuBqDNA37WgKlqaakzRvFRf
         7ZlAlTkbTNmop9hl7soI8ZkH0k+4scqC8elvM9NbvXgDCJ5hGyK+c/T5P5KHCTqJ/jJH
         OEteM6C1oF9oWvmVHLT24tKfrzjYuSdqDpBl7cPseFqI5gXpNNrh87VB26HQNDQP3qWj
         zYiwXM+3XCibkrrix40EKEjq7ksCFDul5HabL6Ah+iA9kDcLSPybCOOoR3rq0u3SOqBx
         vcbA==
X-Gm-Message-State: AC+VfDy/6NC6OSZU+ERXTtUx2CIjAcz1Op6eM+LMiQ9V7OjpTn91flwA
	WD2JKpwFAezZktb2ShV7s0V4rA79eFE=
X-Google-Smtp-Source: ACHHUZ7JuQuSHQWS1Pqch7HAWt6yj9ivCA51AxdUDv+bBpod+cTAEKr1GRv8HUvAgFgQhgchOfyZFQ==
X-Received: by 2002:a2e:9c8c:0:b0:2a8:c42f:6913 with SMTP id x12-20020a2e9c8c000000b002a8c42f6913mr9734152lji.36.1684323520537;
        Wed, 17 May 2023 04:38:40 -0700 (PDT)
Received: from dcbuildsrv.ci.qt.io ([192.89.120.62])
        by smtp.gmail.com with ESMTPSA id d4-20020a2e9284000000b002a8c409f1f5sm4563625ljh.110.2023.05.17.04.38.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 04:38:40 -0700 (PDT)
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][dunfell][PATCH] spirv-tools: switch from master branch to main for re2
Date: Wed, 17 May 2023 11:38:26 +0000
Message-Id: <20230517113826.2465574-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 May 2023 11:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102647

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 meta-oe/recipes-graphics/spir/spirv-tools_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/spir/spirv-tools_git.bb b/meta-oe/recipes-graphics/spir/spirv-tools_git.bb
index a76c97ad60..ffacee4c9f 100644
--- a/meta-oe/recipes-graphics/spir/spirv-tools_git.bb
+++ b/meta-oe/recipes-graphics/spir/spirv-tools_git.bb
@@ -11,7 +11,7 @@ DEST_DIR = "${S}/external"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;name=spirv-tools;branch=master;protocol=https \
 	git://github.com/KhronosGroup/SPIRV-Headers.git;name=spirv-headers;destsuffix=${DEST_DIR}/spirv-headers;branch=master;protocol=https \
 	git://github.com/google/effcee.git;name=effcee;destsuffix=${DEST_DIR}/effcee;branch=master;protocol=https \
-	git://github.com/google/re2.git;name=re2;destsuffix=${DEST_DIR}/re2;branch=master;protocol=https \
+	git://github.com/google/re2.git;name=re2;destsuffix=${DEST_DIR}/re2;branch=main;protocol=https \
 	git://github.com/google/googletest.git;name=googletest;destsuffix=${DEST_DIR}/googletest;branch=main;protocol=https \
         file://0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-file.patch \
         file://0001-Avoid-pessimizing-std-move-3124.patch \
-- 
2.25.1


