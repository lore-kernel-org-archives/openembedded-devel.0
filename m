Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9185CC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 04:53:11 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web09.6128.1647924790324085631
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 21:53:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jjF4ESgE;
 spf=pass (domain: gmail.com, ip: 209.85.214.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id q5so5264200plg.3
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 21:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lifKh1qWlWhdcSm5CKFv0zfhJ4KOlACr8cho8J0HkNk=;
        b=jjF4ESgEQmUm20jl+XqPzKTaeQs/Wxp5wy0r1A1HB251Z5GM3rbNoXZh64kfbzfYGl
         RSxAkJXKkZu9TU1te5k9nu383bd6B9MfbGNu8S0TUa20rdMLrhLWCfHUGZvD5lKE+S+x
         iPeMuxy+n+Iw4qziN6aToAfuHnBu5DSjbiLVEm0MkgCe1LMw5BJ+moxwDfsgVeRuZu4m
         ZMeka/5VoH1b9vUVKiuayNDMoPwUGJ02Sn9bY59cgCMbRnj2P8+JgOxT5pwoPwRrubQx
         Xe46zp1L7/K4J0nt05UITA8JanTAh/Vw+yyUeLIsxE+As8gzFCTOpIAjymVAbN0RTk4x
         6utg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lifKh1qWlWhdcSm5CKFv0zfhJ4KOlACr8cho8J0HkNk=;
        b=Wj5YdED2GWPKErEpSqxw/zFhjh5bami85d9GuhsvuNmkptMFThPI3S6q0bsrOPlG5M
         A3c5G5dQ0zWWsUwlfL44bGc2oN0QR4rFrJG3rMfHb1BaebEJ9L9Eqsxsi2AFty7xeGUJ
         xKxdKLQOxShjOXvipPkQ/8mTCtJIUGr6tEqpy2BMqiKPod/oVsnEZrH9SasKOLZkSv2m
         3cjFmGan0iSeAXwfeSIprHDOBGQyy+pi+nvbAsAiclz67Vog60OS86TdPdyWJ55LFxRf
         QvZWYjCiJHsQmb8MmShUVxSaZgxTD9S/SnUbRoEK9Zo4+L5IqmPpx4WFT6mr39jKiQbh
         ZU4Q==
X-Gm-Message-State: AOAM533dpglQA4tWV8sd4EOVUnWtY2fIcw/poWZSp9d2SuPkd8FgZVz9
	/y8rILXPXBINunScTTBMYv5mWwgW0fVcDQ==
X-Google-Smtp-Source: 
 ABdhPJxpn7wQ2Fk+QPg5PBFt5VEgZnbA2DS+8hLqtV+crvMSLTnM4lIvvdRYYkszxWHH9GkyimiTcQ==
X-Received: by 2002:a17:902:b709:b0:151:49e7:d4e1 with SMTP id
 d9-20020a170902b70900b0015149e7d4e1mr16673935pls.144.1647924789285;
        Mon, 21 Mar 2022 21:53:09 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 d5-20020a17090acd0500b001b9c05b075dsm1039024pju.44.2022.03.21.21.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 21:53:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] grpc: Enable cpp plugin for target version too
Date: Mon, 21 Mar 2022 21:53:06 -0700
Message-Id: <20220322045307.2841335-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 04:53:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96130

This is needed by packages like sysdig

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/grpc/grpc_1.41.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.41.1.bb b/meta-oe/recipes-devtools/grpc/grpc_1.41.1.bb
index 3fe7993107..315d8eb38c 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.41.1.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.41.1.bb
@@ -13,7 +13,7 @@ DEPENDS:append:class-nativesdk = " grpc-native "
 PACKAGE_BEFORE_PN = "${PN}-compiler"
 
 RDEPENDS:${PN}-compiler = "${PN}"
-RDEPENDS:${PN}-dev:class_native += "${PN}-compiler"
+RDEPENDS:${PN}-dev:append:class-native = " ${PN}-compiler"
 # Configuration above allows to cross-compile gRPC applications
 # In order to compile applications on the target, use the dependency below
 # Both dependencies are mutually exclusive
@@ -45,7 +45,6 @@ EXTRA_OECMAKE = " \
     "
 
 PACKAGECONFIG ??= "cpp shared"
-PACKAGECONFIG_class-target ?= "shared"
 PACKAGECONFIG[cpp] = "-DgRPC_BUILD_GRPC_CPP_PLUGIN=ON,-DgRPC_BUILD_GRPC_CPP_PLUGIN=OFF"
 PACKAGECONFIG[csharp] = "-DgRPC_BUILD_GRPC_CSHARP_PLUGIN=ON,-DgRPC_BUILD_GRPC_CSHARP_PLUGIN=OFF"
 PACKAGECONFIG[node] = "-DgRPC_BUILD_GRPC_NODE_PLUGIN=ON,-DgRPC_BUILD_GRPC_NODE_PLUGIN=OFF"
-- 
2.35.1


