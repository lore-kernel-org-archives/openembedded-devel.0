Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FADAC4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 06:50:01 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.44735.1671518999807307212
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Dec 2022 22:50:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JoJylVao;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: samuli.piippo@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id g13so476814lfv.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 22:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=85gfWC0+v9s9SKcF1NDhVkZbXsFsbBnTrOuJXQDPdgg=;
        b=JoJylVaoOfPohoYBGSheZsoR9AMcWvraoDD8220AtaIZz0+fXUL/qODEBOGmaGR0Sw
         tyQ2JgrapEdEmEaLu0Q4jRTxkc6Khnra3PhpUlCniawxLrNgh/LRx78FHrtgtoccJLng
         kuAmboduTp6R0iGqsVvQUtj3lxBXVmZeWcBL8CqjIyZUeoGTeM3aSFPUgNJolw1ga2Az
         hjYWSPjnjTke8rnVh02GgiMXgWXyu3rZLVILV0Hx9/dIgLVFdOHGLknFEYnircvaLqqe
         xqjKXslxUM/d/RCKKGZsXXGzdw7lkNSWN0RWNr5Z+7WcejC9zCuEm7yk2GKF+luL3jn3
         jKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=85gfWC0+v9s9SKcF1NDhVkZbXsFsbBnTrOuJXQDPdgg=;
        b=Pv4GZ2LklmUj//vcy/Z5/S4nml/kGA8HpYk9Sn72i+QURmn4dQX1qtn0p39yce2J97
         tIqR/gegxAQROAc1jNiGMTslVuQiK/1vxKMJz0WK3HMi4t9SaenpGIQPGfBG4bRqfOPP
         O0kp7Acm2+Lo1MCqQDvUA6lyQM3ui+hsEQ/KJ3HTbQYjKsYXOrfP/jVTgOKbca41cbJk
         CpCh/Hlg0CpLikYQcD8cnipyIbTxNaqBfck2v03yxlCJ488fklMMEwicgL1UPSHIW7WB
         wm1w9zv9uHvefVEUeRVk2TktC5NdxD1XzSgHQGJn5m7vCF7Zycd/n3yQWkruPsLT2VmK
         eyZA==
X-Gm-Message-State: AFqh2kpkZjFz6gjqeS99Q85JySwnkP/W6KQQFAOWwrl4wId1Qwc3fWlV
	HphIUdm1CuxyCgbHJ2q7OODXQG8BgCU=
X-Google-Smtp-Source: AMrXdXtckjE/EcoT5cKBvJwg2EGRecB7eGl9NQoAFcuNiMQXFrXx1S6hDXdnGLoqYesttgu7/hOukw==
X-Received: by 2002:a05:6512:2392:b0:4c4:6a8e:30 with SMTP id c18-20020a056512239200b004c46a8e0030mr4273033lfv.30.1671518997746;
        Mon, 19 Dec 2022 22:49:57 -0800 (PST)
Received: from dcbuildsrv.ci.qt.io ([192.89.120.62])
        by smtp.gmail.com with ESMTPSA id a10-20020ac25e6a000000b00498f67cbfa9sm1344232lfr.22.2022.12.19.22.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 22:49:57 -0800 (PST)
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-devel@lists.openembedded.org
Cc: Samuli Piippo <samuli.piippo@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][langdale][PATCH] protobuf: stage protoc binary to sysroot
Date: Tue, 20 Dec 2022 06:49:29 +0000
Message-Id: <20221220064929.2063720-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 06:50:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100122

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
(cherry picked from commit d7f46fa816964e30edb2ccfecc57a26251cc351c)
---
 meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
index c8b9158e6c..201908f3c9 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
@@ -92,6 +92,8 @@ PACKAGE_BEFORE_PN = "${PN}-compiler ${PN}-lite"
 FILES:${PN}-compiler = "${bindir} ${libdir}/libprotoc${SOLIBS}"
 FILES:${PN}-lite = "${libdir}/libprotobuf-lite${SOLIBS}"
 
+SYSROOT_DIRS += "${bindir}"
+
 RDEPENDS:${PN}-compiler = "${PN}"
 RDEPENDS:${PN}-dev += "${PN}-compiler"
 RDEPENDS:${PN}-ptest = "bash ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-protobuf', '', d)}"
-- 
2.25.1


