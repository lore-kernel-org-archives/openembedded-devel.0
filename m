Return-Path: <naveen.kumar.saini@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C815C46CA0
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 05:39:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.66183.1701322788877841745
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Nov 2023 21:39:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=G+6vtQES;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: naveen.kumar.saini@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701322788; x=1732858788;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9abALeH1cyJIoYrRTz1m9BL4Uvd7YW6b67eCQ30YB6M=;
  b=G+6vtQESiu0Qa1Mmxn67DcpwDKiz0VpvBjKI7J0yAJPhWUcEfoOjKbht
   0GRJDSRS7GlzjbWBfPLD2SovNJLP4Qf4EWTaNiF1jZAJccKbzuZmCsNSV
   B6IAkuwiw7xOzEC/417V8qwJSEONG4skBYBYNGeIyelpcm7Tyd6q81XEf
   HXjNoV3igfMnZwSyH9Lsqq0m5xg+pxQr0We76hvR7O75z9hHPB5MswAHw
   oN+eKOsnVdqPgKGK963KrsAakAMAlr7nvclZxj4/08eivl2/5MfIjSuuC
   NCKdfLI0wiQ0n0XMcS/lpTCm+Fz/B5MfNe16TYI3IRS5GnBru6T/gpDY6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="459764569"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="459764569"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 21:39:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="745510322"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="745510322"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga006.jf.intel.com with ESMTP; 29 Nov 2023 21:39:47 -0800
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] tbb: upgrade 2021.9.0 -> 2021.11.0
Date: Thu, 30 Nov 2023 13:20:06 +0800
Message-Id: <20231130052007.2573333-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 05:39:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107163

riscv arch support enabled in this release, so patching
for riscv* not required anymore. Drop patch.

Release note:
https://github.com/oneapi-src/oneTBB/releases/tag/v2021.11.0

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 ...akeLists.txt-exclude-riscv64-riscv32.patch | 35 -------------------
 .../tbb/{tbb_2021.9.0.bb => tbb_2021.11.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 37 deletions(-)
 delete mode 100644 meta-oe/recipes-support/tbb/tbb/0001-CMakeLists.txt-exclude-riscv64-riscv32.patch
 rename meta-oe/recipes-support/tbb/{tbb_2021.9.0.bb => tbb_2021.11.0.bb} (95%)

diff --git a/meta-oe/recipes-support/tbb/tbb/0001-CMakeLists.txt-exclude-riscv64-riscv32.patch b/meta-oe/recipes-support/tbb/tbb/0001-CMakeLists.txt-exclude-riscv64-riscv32.patch
deleted file mode 100644
index b34762710..000000000
--- a/meta-oe/recipes-support/tbb/tbb/0001-CMakeLists.txt-exclude-riscv64-riscv32.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From cb9e9b5b1ad05dd9de07a65ee7147cdb3433746a Mon Sep 17 00:00:00 2001
-From: Naveen Saini <naveen.kumar.saini@intel.com>
-Date: Fri, 9 Apr 2021 15:41:35 +0800
-Subject: [PATCH] CMakeLists.txt: exclude riscv64 & riscv32
-
-Upstream-Status: Pending
-
-Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
----
- src/tbb/CMakeLists.txt       | 2 +-
- src/tbbmalloc/CMakeLists.txt | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
---- a/src/tbb/CMakeLists.txt
-+++ b/src/tbb/CMakeLists.txt
-@@ -58,7 +58,7 @@ target_compile_definitions(tbb
-                            $<$<NOT:$<BOOL:${BUILD_SHARED_LIBS}>>:__TBB_DYNAMIC_LOAD_ENABLED=0>
-                            $<$<NOT:$<BOOL:${BUILD_SHARED_LIBS}>>:__TBB_SOURCE_DIRECTLY_INCLUDED=1>)
- 
--if (NOT ("${CMAKE_SYSTEM_PROCESSOR}" MATCHES "(armv7-a|aarch64|mips|arm64)" OR
-+if (NOT ("${CMAKE_SYSTEM_PROCESSOR}" MATCHES "(armv7-a|aarch64|mips|arm64|riscv64|riscv32)" OR
-          "${CMAKE_OSX_ARCHITECTURES}" MATCHES "arm64" OR
-          WINDOWS_STORE OR
-          TBB_WINDOWS_DRIVER))
---- a/src/tbbmalloc/CMakeLists.txt
-+++ b/src/tbbmalloc/CMakeLists.txt
-@@ -30,7 +30,7 @@ target_compile_definitions(tbbmalloc
-                            $<$<NOT:$<BOOL:${BUILD_SHARED_LIBS}>>:__TBB_DYNAMIC_LOAD_ENABLED=0>
-                            $<$<NOT:$<BOOL:${BUILD_SHARED_LIBS}>>:__TBB_SOURCE_DIRECTLY_INCLUDED=1>)
- 
--if (NOT ("${CMAKE_SYSTEM_PROCESSOR}" MATCHES "(armv7-a|aarch64|mips|arm64)" OR
-+if (NOT ("${CMAKE_SYSTEM_PROCESSOR}" MATCHES "(armv7-a|aarch64|mips|arm64|riscv64|riscv32)" OR
-          "${CMAKE_OSX_ARCHITECTURES}" MATCHES "arm64" OR
-          WINDOWS_STORE OR
-          TBB_WINDOWS_DRIVER OR
diff --git a/meta-oe/recipes-support/tbb/tbb_2021.9.0.bb b/meta-oe/recipes-support/tbb/tbb_2021.11.0.bb
similarity index 95%
rename from meta-oe/recipes-support/tbb/tbb_2021.9.0.bb
rename to meta-oe/recipes-support/tbb/tbb_2021.11.0.bb
index 028291c96..1a1d9988b 100644
--- a/meta-oe/recipes-support/tbb/tbb_2021.9.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2021.11.0.bb
@@ -12,9 +12,8 @@ DEPENDS:append:libc-musl = " libucontext"
 PE = "1"
 
 BRANCH = "onetbb_2021"
-SRCREV = "a00cc3b8b5fb4d8115e9de56bf713157073ed68c"
+SRCREV = "8b829acc65569019edb896c5150d427f288e8aba"
 SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH} \
-            file://0001-CMakeLists.txt-exclude-riscv64-riscv32.patch \
 "
 S = "${WORKDIR}/git"
 
-- 
2.37.3


