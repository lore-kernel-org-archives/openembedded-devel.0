Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A811C433FE
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 17:31:22 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web09.15.1666114281875986326
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Oct 2022 10:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jHa7UZuZ;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id bh13so13911830pgb.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 10:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OCIBeyG+MxiNOjb/5f5vF9mHGSyBVHGnS6OXc23rENI=;
        b=jHa7UZuZxD2DWRGCEl4p6pQZAfCobGuUDIrbaQKM1OQlWmN461RpaUcfko2fJp5GnB
         ldpRmSsULHSRgkttnQENw5gs+jcTuRRypmOtoWArCobJX4pSFut+jcbA1vPl4QbemHUB
         mQDJO2m1MKdDAq9idHUue5ydPCVjGMh1slYDpkRt03n/o0walQPCH6kNY8nkwpx9xNfd
         X9HBKmIcwYb0cf0awQPnVw8bUVFPmjs7oGT3tRq4mMRPOz+l4NIeyZ4cuQZE/7eJAGfq
         edxy1cigAuttW8eFMXnyX2jq/LT+C41h37OKhdYYGDHSvbAgorHAbxHH//ZTgW6Dn0TZ
         MAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OCIBeyG+MxiNOjb/5f5vF9mHGSyBVHGnS6OXc23rENI=;
        b=S2Y3bk2PwdoafB9IowYwMwXOG3lJid1RNCG++PfKCEh8xvXzdEFVXxIELJhi99mtdQ
         cv0vmLqtXei4rsqueV+W97EhQelm6FFjTfli8SfSjDFzljXlgcEw68TqcmNsIdYZULLW
         M8KGgbTAg5IPeTynLWO6TE/rAlUqoF/UQavCe4g5sVzahPnZ+GHII/Na5JqwZ/oWMBGP
         nyHcOKBJY4dhcitzV1OJBBZT/gG14LI/4/mrDlxp+TJYgnrWRVOSpPOQIrfM84AK9ulR
         DCHg+AGm/xsXSnYLA03Swb7cVlAXXdC1rcKWuZuw9cs57C1mJljmMlppTgeP1qM+VHaI
         YmSw==
X-Gm-Message-State: ACrzQf31J7vhqG6mMJpHZsfHS4v41paqfyq+hLX04tpmpUokt+AmsT5w
	UGoG3BFYt767+U3g94M29Pu9qHNNmOQ=
X-Google-Smtp-Source: AMsMyM7M3lS+xrKsdU43YnLPcgv20SMLpILRyd3ynTR8szq71Q1vLBg0o+2f5KBCeyLCC6MWkqES5w==
X-Received: by 2002:a63:4c5f:0:b0:439:49b4:809f with SMTP id m31-20020a634c5f000000b0043949b4809fmr3453379pgl.382.1666114280932;
        Tue, 18 Oct 2022 10:31:20 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::751e])
        by smtp.gmail.com with ESMTPSA id e15-20020a17090301cf00b00185507b5ef8sm5046494plh.50.2022.10.18.10.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 10:31:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] grpc: Update to 1.50.x release
Date: Tue, 18 Oct 2022 10:31:18 -0700
Message-Id: <20221018173118.784429-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 17:31:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99241

License-update: Include MPL-2.0 [1]

Add missing BSD 3-clause and MPL-2.0 to license field

Switch to git submodules since its using locked versions of some
components like opencensus-proto

[1] https://github.com/grpc/grpc/commit/05fcd826f477ef1a024a2defa5e4b3d78f5e6eb4
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../grpc/{grpc_1.45.2.bb => grpc_1.50.0.bb}            | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-devtools/grpc/{grpc_1.45.2.bb => grpc_1.50.0.bb} (90%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.45.2.bb b/meta-oe/recipes-devtools/grpc/grpc_1.50.0.bb
similarity index 90%
rename from meta-oe/recipes-devtools/grpc/grpc_1.45.2.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.50.0.bb
index c2f952fc64..8efd9321ca 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.45.2.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.50.0.bb
@@ -3,8 +3,8 @@ Provides gRPC libraries for multiple languages written on top of shared C core l
 (C++, Node.js, Python, Ruby, Objective-C, PHP, C#)"
 HOMEPAGE = "https://github.com/grpc/grpc"
 SECTION = "libs"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6e4cf218112648d22420a84281b68b88"
+LICENSE = "Apache-2.0 && BSD-3-Clause && MPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=731e401b36f8077ae0c134b59be5c906"
 
 DEPENDS = "c-ares protobuf protobuf-native protobuf-c protobuf-c-native openssl libnsl2 abseil-cpp re2"
 DEPENDS:append:class-target = " googletest grpc-native "
@@ -20,9 +20,9 @@ RDEPENDS:${PN}-dev:append:class-native = " ${PN}-compiler"
 # RDEPENDS:${PN}-dev += "${PN}-compiler"
 
 S = "${WORKDIR}/git"
-SRCREV_grpc = "b39ffcc425ea990a537f98ec6fe6a1dcb90470d7"
-BRANCH = "v1.45.x"
-SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
+SRCREV_grpc = "91091e3668144de9c6aa392f496bb7639f7025a7"
+BRANCH = "v1.50.x"
+SRC_URI = "gitsm://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
            file://0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch \
            file://0001-cmake-add-separate-export-for-plugin-targets.patch \
            file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
-- 
2.38.0


