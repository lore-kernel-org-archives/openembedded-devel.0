Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49943D1CDC6
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 05:54:49 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.840.1765259680893152073
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Dec 2025 21:54:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Lg9F20fZ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765259681; x=1796795681;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=x3dYIhO27A4/WiSJnDKqUTAYVIm3Ooxrs2sKJDNI28E=;
  b=Lg9F20fZPEceRP07Zr53lebgoQkg5/8axzBuWcktkgV7x/TNhY7TNEFz
   KPRdbHahp7ZHUomqSxlH1Wca+Us4OwTvzftW3TsHhN0xyrkbpmPaRiU10
   ZXB2igORAIsHZdXQDwpV8FqnzPbjxRJiHKujgC2hxGuRoIBIbVJqdp7c6
   vPvqtfsRf0MP/sWRbrun71tVShmZSIi4jxRBT3K3Zr4AIfux4r8vDnahK
   xmVlvwbZYyspvePk/mysmHWUyE9FNcY5GNDQoJralXdR2kMsErSAHb+eq
   zg6p+gkX8a8rck/RjIjNS4LTAZQeFOPZRPAnuvNLf60qa9xW1IiOoR1k4
   g==;
X-CSE-ConnectionGUID: FbWdKHQAQyGxLRqEZVGyMg==
X-CSE-MsgGUID: t/xJsn97RRGOQV12ojl30g==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="221954179"
X-IronPort-AV: E=Sophos;i="6.20,260,1758553200"; 
   d="scan'208";a="221954179"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 14:54:39 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 035FE142D
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 05:54:39 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id A0EBC1C0014F
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 05:54:38 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 659671000610
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 05:54:36 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 1/5] gflags: upgrade 2.2.2 -> 2.3.0
Date: Tue,  9 Dec 2025 13:54:28 +0800
Message-ID: <20251209055428.22306-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 05:54:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122394

1.Change log:
  https://github.com/gflags/gflags/releases/tag/v2.3.0

2. Drop 0001-allow-build-with-cmake-4.patch as it was mergerd upstream.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../0001-allow-build-with-cmake-4.patch       | 69 -------------------
 .../{gflags_2.2.2.bb => gflags_2.3.0.bb}      |  5 +-
 2 files changed, 2 insertions(+), 72 deletions(-)
 delete mode 100644 meta-oe/recipes-support/gflags/gflags/0001-allow-build-with-cmake-4.patch
 rename meta-oe/recipes-support/gflags/{gflags_2.2.2.bb => gflags_2.3.0.bb} (79%)

diff --git a/meta-oe/recipes-support/gflags/gflags/0001-allow-build-with-cmake-4.patch b/meta-oe/recipes-support/gflags/gflags/0001-allow-build-with-cmake-4.patch
deleted file mode 100644
index bc3ca94de8..0000000000
--- a/meta-oe/recipes-support/gflags/gflags/0001-allow-build-with-cmake-4.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From b533cf275db99b1d37ba20d96497cafcedc9ace0 Mon Sep 17 00:00:00 2001
-From: Alper Ak <alperyasinak1@gmail.com>
-Date: Tue, 8 Jul 2025 18:57:26 +0300
-Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
- compatibility
-
-Fix:
-
-| CMake Error at CMakeLists.txt:73 (cmake_minimum_required):
-|   Compatibility with CMake < 3.5 has been removed from CMake.
-|
-|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
-|   to tell CMake that the project requires at least <min> but has been updated
-|   to work with policies introduced by <max> or earlier.
-|
-|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
-|
-|
-| -- Configuring incomplete, errors occurred!
-
-Upstream-Status: Backport [https://github.com/gflags/gflags/commit/70c01a642f08734b7bddc9687884844ca117e080]
-
-Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
----
- CMakeLists.txt             | 2 +-
- test/config/CMakeLists.txt | 2 +-
- test/nc/CMakeLists.txt     | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 657a1f4..a5440bb 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -70,7 +70,7 @@
- ## - GFLAGS_INSTALL_SHARED_LIBS
- ## - GFLAGS_INSTALL_STATIC_LIBS
- 
--cmake_minimum_required (VERSION 3.0.2 FATAL_ERROR)
-+cmake_minimum_required (VERSION 3.5 FATAL_ERROR)
- 
- if (POLICY CMP0042)
-   cmake_policy (SET CMP0042 NEW)
-diff --git a/test/config/CMakeLists.txt b/test/config/CMakeLists.txt
-index 6190b25..205121e 100644
---- a/test/config/CMakeLists.txt
-+++ b/test/config/CMakeLists.txt
-@@ -1,6 +1,6 @@
- ## gflags package configuration tests
- 
--cmake_minimum_required (VERSION 2.8.12 FATAL_ERROR)
-+cmake_minimum_required (VERSION 3.5 FATAL_ERROR)
- 
- project (gflags_${TEST_NAME})
- 
-diff --git a/test/nc/CMakeLists.txt b/test/nc/CMakeLists.txt
-index d00b07d..1b4d511 100644
---- a/test/nc/CMakeLists.txt
-+++ b/test/nc/CMakeLists.txt
-@@ -1,6 +1,6 @@
- ## gflags negative compilation tests
- 
--cmake_minimum_required (VERSION 2.8.12 FATAL_ERROR)
-+cmake_minimum_required (VERSION 3.5 FATAL_ERROR)
- 
- if (NOT TEST_NAME)
-   message (FATAL_ERROR "Missing TEST_NAME CMake flag")
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-support/gflags/gflags_2.2.2.bb b/meta-oe/recipes-support/gflags/gflags_2.3.0.bb
similarity index 79%
rename from meta-oe/recipes-support/gflags/gflags_2.2.2.bb
rename to meta-oe/recipes-support/gflags/gflags_2.3.0.bb
index 925aa6d6e6..0e510bb59a 100644
--- a/meta-oe/recipes-support/gflags/gflags_2.2.2.bb
+++ b/meta-oe/recipes-support/gflags/gflags_2.3.0.bb
@@ -3,9 +3,8 @@ HOMEPAGE = "https://github.com/gflags/gflags"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=c80d1a3b623f72bb85a4c75b556551df"
 
-SRC_URI = "git://github.com/gflags/gflags.git;branch=master;protocol=https \
-        file://0001-allow-build-with-cmake-4.patch"
-SRCREV = "e171aa2d15ed9eb17054558e0b3a6a413bb01067"
+SRC_URI = "git://github.com/gflags/gflags.git;branch=main;protocol=https"
+SRCREV = "33bb3461e10864b5406353d3a1fb7ff34c2314b8"
 
 inherit cmake
 
-- 
2.43.0


