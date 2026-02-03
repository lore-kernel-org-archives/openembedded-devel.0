Return-Path: <yogesh.tyagi@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53C21E8304F
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 04:13:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9666.1770091990797740076
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 20:13:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=ELfPg/lf;
 spf=pass (domain: intel.com, ip: 192.198.163.7, mailfrom: yogesh.tyagi@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770091991; x=1801627991;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=O8BgV6mTFmFXR9645BIpn1tMUFymEhISyDdAS+kEqa8=;
  b=ELfPg/lflEo8fr0t0Pn6aZI5NmR7rNs0/AaSmbxy5fblBpChQ4Br5S+R
   0xt/diM5DxNznF5hQFomK/KxdIIqnt7GyNDvsmfaobRjdhWouqWjhIzOB
   JMAspQFpF7rqCwTP0YCeNT3weMQH27PQowH9U0YFH2imDo2VfESQ7MZvr
   HcwQGF3kG70sCh9BHO2MmwJwdE/YYnrRHhf/315Kr7gR2dYF/nI2JK7ao
   w3z+UyKFhUnh+PxFmK7m3NGKlrTQDrBkPNA9N5FD0gWLmu685ur/OFX+W
   xCUnptHAz+cpjUlJLBCNV1FsStbofFIL/XOJSeQCPVYCYmkZGf/zzTo/X
   Q==;
X-CSE-ConnectionGUID: O23BVrp7Qmyi34IHjlIpBw==
X-CSE-MsgGUID: kY1MROgKQhubtjQKBQzHcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="96712478"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="96712478"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 20:13:10 -0800
X-CSE-ConnectionGUID: r+/g6cWfSIauWDsaYFbPAQ==
X-CSE-MsgGUID: gb9/QRHuSTivVsbV8rHUYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="213832159"
Received: from ytyagi-desk.iind.intel.com ([10.49.15.7])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 20:13:09 -0800
From: yogesh.tyagi@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [whinlatter][PATCH] abseil-cpp: Set CMAKE_CXX_STANDARD to 17
Date: Tue,  3 Feb 2026 09:42:50 +0530
Message-ID: <20260203041250.2332880-1-yogesh.tyagi@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 04:13:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124092

From: Yogesh Tyagi <yogesh.tyagi@intel.com>

The compiler defaults to C++ < 17 which causes build failures.
Abseil requires C++17 or higher, so explicitly set CMAKE_CXX_STANDARD=17
to ensure the build uses the correct C++ standard.

Error:
CMake Error at CMake/AbseilDll.cmake:745 (message):
  The compiler defaults to or is configured for C++ < 17.  C++ >= 17 is
  required and Abseil and all libraries that use Abseil must use the same C++
  language standard
---
 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250814.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250814.1.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250814.1.bb
index 0394f36cdb..3ab4fa1cde 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250814.1.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250814.1.bb
@@ -21,6 +21,7 @@ inherit cmake
 EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON \
                  -DBUILD_TESTING=OFF    \
                  -DABSL_ENABLE_INSTALL=ON \
+                 -DCMAKE_CXX_STANDARD=17 \
                 "
 #  riscv32-yoe-linux-ld.lld: error: undefined reference: __atomic_store_8
 #  >>> referenced by <recipe-sysroot>/usr/lib/libabsl_flags_internal.so.2505.0.0 (disallowed by --no-allow-shlib-undefined)
-- 
2.43.0


