Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 560C6C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 08:43:18 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.32967.1699864992630228338
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 00:43:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qml2lVep;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: samuli.piippo@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-507973f3b65so5912294e87.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 00:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699864990; x=1700469790; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QGwp01/5mrcDXgg6aQGnXk7GHsDr+UaSsEunDuKwSp4=;
        b=Qml2lVepuWgCzEbdkc2iH56hRbE2RWICPM1z+y1V+lI8ApRInxxsCfWUMQAVtku8Nz
         hl6j5Ch97cDA6mVbqsC9y1dPKLEo/bqU09afdcxRZbm/DMSet+2S8nbCxfL//hCsjfe0
         zD6MxXpPGFUGVSbIvGBNrJz59latIHbmylSfw6xtA+Y1+yt4DSDNpJY6tbxKQN6L4iwN
         zjdN9IYB8KidR+8rdwuyUFYyeeikEJmze5O06sww8a3RxIf+fvfjSD2aN78hZpndzhNA
         4a7YD4+rDOHBGPYpUE0iaaa6lhhahyxWU2EPmVTIRhGdXL6wCYFBMw3OBc43ynUj9eNU
         KUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699864990; x=1700469790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QGwp01/5mrcDXgg6aQGnXk7GHsDr+UaSsEunDuKwSp4=;
        b=ekesghRARmlc0qJRN3XH2zimSAM4qUoRUiHQIr1HpsU/v8CJorcoP/rGyhlpWy9fb6
         0GUrLsrzpi4QrMq0ZQc+29RzwZnJliVIc/5McSVIk5aQG8HYG835NXDKQwlwlFMdPvA7
         fP2xgBaoxAGfS4eVeAO3LYxLd5Fh749osYYo+LreAN/WnO0Odh210QIt5eqOuh+pQH6X
         SulhlMhubW7+aQwVKBlosIGF4gG9lFpNf3Eil2H9AIUGphnVTVE+YYbjo2eANBS741kN
         n9OXin1LtjxWDPR1HbRs42e8dqljRREaBQYBVIzn5z/8GiYd+Kocqq+r7fWCPS8WIhWl
         8QoA==
X-Gm-Message-State: AOJu0Ywk3TJeEfC6XsITWVAsiCSLT76V9eTJ29kyAKZoNz8llRhlEXhj
	Bi3k7B/ONNdTCB7vSQGzAJu/3ZASuIo=
X-Google-Smtp-Source: AGHT+IFICCdsZCjyFyMPoNu708N7SYswMUswkZMFfoy4mAzzPGM5GlvfNUBhrTZxrVysX3k3BpURgw==
X-Received: by 2002:ac2:55ac:0:b0:507:c7cc:12c4 with SMTP id y12-20020ac255ac000000b00507c7cc12c4mr3539671lfg.57.1699864989733;
        Mon, 13 Nov 2023 00:43:09 -0800 (PST)
Received: from dcbuildsrv.ci.qt.io ([192.89.120.62])
        by smtp.gmail.com with ESMTPSA id dw24-20020a0565122c9800b00507a3b8b008sm742696lfb.112.2023.11.13.00.43.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 00:43:09 -0800 (PST)
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] protobuf: stage protoc binary to sysroot
Date: Mon, 13 Nov 2023 08:42:45 +0000
Message-Id: <20231113084245.96832-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <920b4ed2-386e-49e9-9d8f-15dfa98cfa59@gmail.com>
References: <920b4ed2-386e-49e9-9d8f-15dfa98cfa59@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 08:43:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106634

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
---
 meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb
index 1edc21cdf..7d37ee3d2 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb
@@ -101,6 +101,9 @@ PACKAGE_BEFORE_PN = "${PN}-compiler ${PN}-lite"
 FILES:${PN}-compiler = "${bindir} ${libdir}/libprotoc${SOLIBS}"
 FILES:${PN}-lite = "${libdir}/libprotobuf-lite${SOLIBS}"
 
+# CMake requires protoc binary to exist in sysroot, even if it has wrong architecture.
+SYSROOT_DIRS += "${bindir}"
+
 RDEPENDS:${PN}-compiler = "${PN}"
 RDEPENDS:${PN}-dev += "${PN}-compiler"
 RDEPENDS:${PN}-ptest = "bash ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-protobuf', '', d)}"
-- 
2.25.1


