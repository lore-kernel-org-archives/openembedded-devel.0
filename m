Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44555C4332F
	for <webhook@archiver.kernel.org>; Sun,  5 Nov 2023 11:34:22 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.28417.1699184055133348506
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Nov 2023 03:34:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=FYj+n2Xd;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20231105113412e680464051156db789-_p_owm@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20231105113412e680464051156db789
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 05 Nov 2023 12:34:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=50bIzAba1dBi62cKtZA0DRQCQ/elhQ/GDcY3bkY4N/w=;
 b=FYj+n2Xdqty23BTouj/pe1f9iDbAlYmZ9+Uby8m5DFyY68vDTlN5sF3k7DI/E/tuMf+YeZ
 HMmuiPQbm6pLkgjDHAWfpUb1ni6khPlQDrPMun73JdVG66w6VgRtTevE81upXAxpX7zHDHpK
 7BI7kKO7ZV/B/UVOePU/9lL+dPOIE=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] grpc: Upgrade 1.56.2 -> 1.59.2
Date: Sun,  5 Nov 2023 12:33:33 +0100
Message-Id: <20231105113333.936206-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Nov 2023 11:34:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106383

From: Peter Marko <peter.marko@siemens.com>

CVE: CVE-2023-44487

Patch updated by devtool to resolve patch fuzz.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...0001-cmake-Link-with-libatomic-on-rv32-rv64.patch | 12 +++++-------
 .../grpc/{grpc_1.56.2.bb => grpc_1.59.2.bb}          |  4 ++--
 2 files changed, 7 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-devtools/grpc/{grpc_1.56.2.bb => grpc_1.59.2.bb} (97%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-Link-with-libatomic-on-rv32-rv64.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-Link-with-libatomic-on-rv32-rv64.patch
index c2afd4a92e..fbdf06d692 100644
--- a/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-Link-with-libatomic-on-rv32-rv64.patch
+++ b/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-Link-with-libatomic-on-rv32-rv64.patch
@@ -1,4 +1,4 @@
-From 592a4aaba20818bcff9a1448c34b09aff9e0d2e9 Mon Sep 17 00:00:00 2001
+From c321f19ff1cd1251c19d20b17a2d86c4237ce506 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 19 Apr 2022 16:07:19 -0700
 Subject: [PATCH] cmake: Link with libatomic on rv32/rv64
@@ -9,15 +9,16 @@ riscv64-yoe-linux-musl/12.0.1/ld: libgrpc.so.23.0.0: undefined reference to `__a
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  CMakeLists.txt | 3 +++
  1 file changed, 3 insertions(+)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index a8fd3bf37b3..9f5b242683d 100644
+index b272816685..e1fe1102c4 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -303,6 +303,9 @@ if(UNIX)
+@@ -303,6 +303,9 @@ if(UNIX AND NOT HAIKU)
    if(_gRPC_PLATFORM_LINUX OR _gRPC_PLATFORM_POSIX)
      set(_gRPC_ALLTARGETS_LIBRARIES ${_gRPC_ALLTARGETS_LIBRARIES} rt)
    endif()
@@ -26,7 +27,4 @@ index a8fd3bf37b3..9f5b242683d 100644
 +  endif()
  endif()
  
- # configure ccache if requested
--- 
-2.36.0
-
+ include(CheckCXXSourceCompiles)
diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.56.2.bb b/meta-oe/recipes-devtools/grpc/grpc_1.59.2.bb
similarity index 97%
rename from meta-oe/recipes-devtools/grpc/grpc_1.56.2.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.59.2.bb
index c4dd6b9857..c30e52263d 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.56.2.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.59.2.bb
@@ -20,8 +20,8 @@ RDEPENDS:${PN}-dev:append:class-native = " ${PN}-compiler"
 # RDEPENDS:${PN}-dev += "${PN}-compiler"
 
 S = "${WORKDIR}/git"
-SRCREV_grpc = "c0d1c393d9365664d47df41746e992ae97b651ef"
-BRANCH = "v1.56.x"
+SRCREV_grpc = "883e5f76976b86afee87415dc67bde58d9b295a4"
+BRANCH = "v1.59.x"
 SRC_URI = "gitsm://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
            file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
            "
-- 
2.30.2


