Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D8BCA0FEC
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 08:40:10 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.15247.1755679196640782156
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Aug 2025 01:40:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Z8cqzI/V;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755679201; x=1787215201;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KPktzkTfAy8RrcOyktFxwI4VQz3ykcZT9IWmqgkzKq0=;
  b=Z8cqzI/V/H9yur1WtrPq4RzHibHUv7/K/MY0DRfStOljn5XNWTt+WDNs
   c5uNnQ4kdv51wAGB4orzFLg/YL0ni/ElWzjtbU3k2HFsonI7J/YXgp69p
   82rdxe7U3YlBtFZQNgoUX8SKuG3IAxIR/jWrn3S9av3X6oI047DW/QeIO
   dhUsAGJixISsvZo0G1ep9TSWqLlWSwwl6K8nplgQ7J8jbiYLP2dUssb7G
   uiie4FJea4cqwDMxPPVsl6zhfendbctX3mDiLtc5sUzbRu+2b2vw381wx
   1OSFBIwCxOtYRtOLWH7xWLx01ciG6uX0IeC5G0HYx8qka+cjq4KmUa4bP
   w==;
X-CSE-ConnectionGUID: dbUa4S8xTfKLX2EHnL2hUg==
X-CSE-MsgGUID: vZ8D6tMQR1uCMIhsBgUa8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="213396781"
X-IronPort-AV: E=Sophos;i="6.17,302,1747666800"; 
   d="scan'208";a="213396781"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 17:40:00 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 2975D1C1C710
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:00 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id D33F78D65E9
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:39:59 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id B4B4E1803FB9
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:39:57 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AE2601A0074;
	Wed, 20 Aug 2025 16:39:54 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/26] highway: upgrade 1.2.0 -> 1.3.0
Date: Wed, 20 Aug 2025 16:39:24 +0800
Message-ID: <20250820083945.802-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250820083945.802-1-wangmy@fujitsu.com>
References: <20250820083945.802-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119018

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Add-cmake-check-for-deducing-32bit-or-64bit-RISCV.patch
refreshed for 1.3.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ck-for-deducing-32bit-or-64bit-RISCV.patch | 34 +++++--------------
 .../{highway_1.2.0.bb => highway_1.3.0.bb}    |  2 +-
 2 files changed, 9 insertions(+), 27 deletions(-)
 rename meta-oe/recipes-extended/highway/{highway_1.2.0.bb => highway_1.3.0.bb} (92%)

diff --git a/meta-oe/recipes-extended/highway/highway/0001-Add-cmake-check-for-deducing-32bit-or-64bit-RISCV.patch b/meta-oe/recipes-extended/highway/highway/0001-Add-cmake-check-for-deducing-32bit-or-64bit-RISCV.patch
index ecc9c441c5..1ab31e5eec 100644
--- a/meta-oe/recipes-extended/highway/highway/0001-Add-cmake-check-for-deducing-32bit-or-64bit-RISCV.patch
+++ b/meta-oe/recipes-extended/highway/highway/0001-Add-cmake-check-for-deducing-32bit-or-64bit-RISCV.patch
@@ -9,10 +9,13 @@ RVV as well
 
 Upstream-Status: Submitted [https://github.com/google/highway/pull/2330]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
- CMakeLists.txt | 38 +++++++++++++++++++++++++++++++++++---
- 1 file changed, 35 insertions(+), 3 deletions(-)
+ CMakeLists.txt | 27 +++++++++++++++++++++++++++
+ 1 file changed, 27 insertions(+)
 
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 795408c5..9ddd92cd 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -59,6 +59,33 @@ if(CHECK_PIE_SUPPORTED)
@@ -49,27 +52,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  include(GNUInstallDirs)
  
  if (NOT CMAKE_BUILD_TYPE)
-@@ -72,7 +99,7 @@ set(HWY_CMAKE_ARM7 OFF CACHE BOOL "Set c
- # skipped. For GCC 13.1+, you can also build with -fexcess-precision=standard.
- set(HWY_CMAKE_SSE2 OFF CACHE BOOL "Set SSE2 as baseline for 32-bit x86?")
- 
--# Currently this will compile the entire codebase with `-march=rv64gcv1p0`:
-+# Currently this will compile the entire codebase with `-march=rv<XLEN>gcv1p0`:
- set(HWY_CMAKE_RVV ON CACHE BOOL "Set copts for RISCV with RVV?")
- 
- # Unconditionally adding -Werror risks breaking the build when new warnings
-@@ -378,7 +405,13 @@ else()
-     # we add the gcv compiler flag, which then requires the CPU (now when using
-     # either compiler) to support V.
-     if(HWY_CMAKE_RVV)
--      list(APPEND HWY_FLAGS -march=rv64gcv1p0)
-+      if(RISCV_XLEN EQUAL 64)
-+        list(APPEND HWY_FLAGS -march=rv64gcv1p0)
-+        add_link_options(-march=rv64gcv1p0)
-+      elseif(RISCV_XLEN EQUAL 32)
-+        list(APPEND HWY_FLAGS -march=rv32gcv1p0)
-+        add_link_options(-march=rv32gcv1p0)
-+      endif()
-       if(${CMAKE_CXX_COMPILER_ID} MATCHES "Clang")
-         list(APPEND HWY_FLAGS -menable-experimental-extensions)
-       endif()
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-extended/highway/highway_1.2.0.bb b/meta-oe/recipes-extended/highway/highway_1.3.0.bb
similarity index 92%
rename from meta-oe/recipes-extended/highway/highway_1.2.0.bb
rename to meta-oe/recipes-extended/highway/highway_1.3.0.bb
index ea38310398..81b71b1f21 100644
--- a/meta-oe/recipes-extended/highway/highway_1.2.0.bb
+++ b/meta-oe/recipes-extended/highway/highway_1.3.0.bb
@@ -9,7 +9,7 @@ inherit cmake
 SRC_URI = "git://github.com/google/highway.git;protocol=https;branch=master \
            file://0001-Add-cmake-check-for-deducing-32bit-or-64bit-RISCV.patch"
 
-SRCREV = "457c891775a7397bdb0376bb1031e6e027af1c48"
+SRCREV = "ac0d5d297b13ab1b89f48484fc7911082d76a93f"
 
 EXTRA_OECMAKE = "-DBUILD_TESTING=0 -DCMAKE_BUILD_TYPE=Release"
 
-- 
2.43.0


