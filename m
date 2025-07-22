Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C7FC87FCD
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 03:13:10 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.4284.1753153986928343744
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jul 2025 20:13:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RYEBsqWS;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753153987; x=1784689987;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lcmXeJ/yHCS6FmktU1TpQPwHCC3p0dRjqaDF2WQT2rQ=;
  b=RYEBsqWSCf3pUUDOH06cADwHj2yUs+mmznb+6/Q13fAPvyubDrjrLRWG
   cS8aeM46+hMiHRtWnFSaOg03b+OTJx22qc/D52H/cmnaaLpQ0zj7XVULh
   2HcZNXZ/krkAUl/kPkaniiikt0Q+gvFKYCcyQUKBdCu0lMgSvoF50f2q+
   bEhZzUHOVVOJBL/bzPA5GVuuhGb88bDpwchzjlOz6TQOKuqp5dKIjkPML
   y2SCUDtb3CS6jgh5CfTUC78L9c16qG3m4GyOUyxUpEU4Iac/yB31c6f/c
   iyEw8CS07WPmYuJo1biVReiltTbgy2jKm5+e4E4jLy8VqRCxoNnYJPPO5
   A==;
X-CSE-ConnectionGUID: JACXaH7sQZ2+dtGJfSdtVA==
X-CSE-MsgGUID: 4B9V6dsERi24JnrxA33t6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="206977133"
X-IronPort-AV: E=Sophos;i="6.16,330,1744038000"; 
   d="scan'208";a="206977133"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 12:13:05 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 3C3DA1C02135
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:05 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 5D3688D65D6
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:04 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 54C8E1A0096;
	Tue, 22 Jul 2025 11:13:01 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [meta-python] [PATCH 08/21] python3-grpcio: upgrade 1.72.1 -> 1.73.1
Date: Tue, 22 Jul 2025 11:12:16 +0800
Message-ID: <20250722031245.884-8-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
References: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118672

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...-python-enable-unbundled-cross-compilation.patch |  4 ++--
 .../python/python3-grpcio/abseil-ppc-fixes.patch    | 13 +++++--------
 ...n3-grpcio_1.72.1.bb => python3-grpcio_1.73.1.bb} |  2 +-
 3 files changed, 8 insertions(+), 11 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.72.1.bb => python3-grpcio_1.73.1.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-python-enable-unbundled-cross-compilation.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-python-enable-unbundled-cross-compilation.patch
index b2b2713559..bfc471f3fe 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/0001-python-enable-unbundled-cross-compilation.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-python-enable-unbundled-cross-compilation.patch
@@ -1,4 +1,4 @@
-From ed9f268774838d279e23b4ae9fb95ca7650942b2 Mon Sep 17 00:00:00 2001
+From 55405c161ec71068229d13ef19d2f01ff59c2b77 Mon Sep 17 00:00:00 2001
 From: Peter Marko <peter.marko@siemens.com>
 Date: Wed, 5 Feb 2025 21:06:50 +0100
 Subject: [PATCH] python: enable unbundled cross compilation
@@ -13,7 +13,7 @@ Signed-off-by: Peter Marko <peter.marko@siemens.com>
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index 4d13d87..f002ab2 100644
+index 39ca17e..bffa9fb 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -318,25 +318,25 @@ if BUILD_WITH_SYSTEM_OPENSSL:
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch b/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch
index 69e06a7918..946e36f53f 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch
@@ -1,5 +1,5 @@
-From a2ec96a96ff7ba016e800212a942b9f29f255415 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com> 
+From 42b215f964b2c13db4adb0ee72f024607f74e6d1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 13 Mar 2021 10:26:25 -0800
 Subject: [PATCH] An all-in-one patch that fixes several issues:
 
@@ -22,7 +22,7 @@ Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
  4 files changed, 12 insertions(+), 5 deletions(-)
 
 diff --git a/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc b/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc
-index a0bf3a6..103b4f6 100644
+index 68f9273..5dbfaab 100644
 --- a/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc
 +++ b/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc
 @@ -20,7 +20,7 @@
@@ -85,10 +85,10 @@ index 3dd6ba1..9f0601c 100644
      return reinterpret_cast<void*>(context->uc_mcontext.__gregs[REG_PC]);
  #elif defined(__s390__) && !defined(__s390x__)
 diff --git a/third_party/abseil-cpp/absl/debugging/internal/stacktrace_config.h b/third_party/abseil-cpp/absl/debugging/internal/stacktrace_config.h
-index 3929b1b..23d5e50 100644
+index 88949fe..4e26a6b 100644
 --- a/third_party/abseil-cpp/absl/debugging/internal/stacktrace_config.h
 +++ b/third_party/abseil-cpp/absl/debugging/internal/stacktrace_config.h
-@@ -60,7 +60,7 @@
+@@ -67,7 +67,7 @@
  #elif defined(__i386__) || defined(__x86_64__)
  #define ABSL_STACKTRACE_INL_HEADER \
    "absl/debugging/internal/stacktrace_x86-inl.inc"
@@ -97,6 +97,3 @@ index 3929b1b..23d5e50 100644
  #define ABSL_STACKTRACE_INL_HEADER \
    "absl/debugging/internal/stacktrace_powerpc-inl.inc"
  #elif defined(__aarch64__)
--- 
-2.43.0
-
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.72.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.73.1.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.72.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.73.1.bb
index 79059a33cf..0edfab3101 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.72.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.73.1.bb
@@ -13,7 +13,7 @@ DEPENDS += "c-ares openssl python3-protobuf re2 zlib"
 SRC_URI += "file://0001-python-enable-unbundled-cross-compilation.patch \
            file://abseil-ppc-fixes.patch \
            "
-SRC_URI[sha256sum] = "87f62c94a40947cec1a0f91f95f5ba0aa8f799f23a1d42ae5be667b6b27b959c"
+SRC_URI[sha256sum] = "7fce2cd1c0c1116cf3850564ebfc3264fba75d3c74a7414373f1238ea365ef87"
 
 RDEPENDS:${PN} = "python3-protobuf"
 
-- 
2.43.0


