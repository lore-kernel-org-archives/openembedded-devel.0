Return-Path: <yogesh.tyagi@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E2AFE63C8C
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 19:16:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61577.1770059791266064337
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 11:16:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=dka4lEAb;
 spf=pass (domain: intel.com, ip: 198.175.65.19, mailfrom: yogesh.tyagi@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770059792; x=1801595792;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=boq8QdAC0syona48uqSlqf3puXLq1TGT+6F9ST1FgeQ=;
  b=dka4lEAbfTn8ChkkQOxeuvGBllUR1ExUq5f8Z6PHl/6iR9D57N2+jlWj
   yf+6UYHPTAjlsn3OfZSb+QTJ6EQonl0Prhi5k5JSM12AbMkTjwVVgvyY2
   NXYWZ19pGQM1mkIStemeLB2aA+RmG20JgQRMgvf0FWCuukwlsq5LHuPMd
   UlOxZnZ7IB4apAld3J6C+CrpHMxPKJx1cYmLwKkq54sc5Ai22bMyQvnhG
   lUMzUiIfvmvYgtQLAvORnOMTcSPLrHtdZXdbFpsRRLghoKKq0FUoj/L5e
   FErjMzDkhr2aqiUud6Ot7UXzwGdwg2bLeoLI2WU6ZPBP9evNjNyb5ktJI
   Q==;
X-CSE-ConnectionGUID: 3MZQTc4lQTy8KoygNejLKg==
X-CSE-MsgGUID: l3QqMtiSTVGnrHOBPrn62Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71125648"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="71125648"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 11:16:31 -0800
X-CSE-ConnectionGUID: ZtkpwMNFRaCi6pcx/XbUWQ==
X-CSE-MsgGUID: yq0sqHYhRvavgqRVjDfSUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="214573435"
Received: from malaysia-workstation.png.intel.com ([10.107.249.125])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 11:16:29 -0800
From: Yogesh Tyagi <yogesh.tyagi@intel.com>
To: openembedded-devel@lists.openembedded.org
Cc: yogesh.tyagi@intel.com
Subject: [meta-oe][PATCH] abseil-cpp: Set CMAKE_CXX_STANDARD to 17
Date: Tue,  3 Feb 2026 03:20:55 +0800
Message-Id: <20260202192055.1588477-1-yogesh.tyagi@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 19:16:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124071

The compiler defaults to C++ < 17 which causes build failures.
Abseil requires C++17 or higher, so explicitly set CMAKE_CXX_STANDARD=17
to ensure the build uses the correct C++ standard.

Error:
CMake Error at CMake/AbseilDll.cmake:745 (message):
  The compiler defaults to or is configured for C++ < 17.  C++ >= 17 is
  required and Abseil and all libraries that use Abseil must use the same C++
  language standard

Signed-off-by: Yogesh Tyagi <yogesh.tyagi@intel.com>
---
 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.0.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.0.bb
index e2bce0be11..d4475ee73a 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.0.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.0.bb
@@ -21,6 +21,7 @@ inherit cmake
 EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON \
                  -DBUILD_TESTING=OFF    \
                  -DABSL_ENABLE_INSTALL=ON \
+                 -DCMAKE_CXX_STANDARD=17 \
                 "
 #  riscv32-yoe-linux-ld.lld: error: undefined reference: __atomic_store_8
 #  >>> referenced by <recipe-sysroot>/usr/lib/libabsl_flags_internal.so.2505.0.0 (disallowed by --no-allow-shlib-undefined)
-- 
2.34.1


