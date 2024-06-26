Return-Path: <yogesh.tyagi@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759ACC27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 11:24:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by mx.groups.io with SMTP id smtpd.web10.23742.1719401075329477115
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jun 2024 04:24:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=PSQ8paME;
 spf=pass (domain: intel.com, ip: 192.198.163.14, mailfrom: yogesh.tyagi@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719401075; x=1750937075;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=icvjaDWkQSC5C1HjDdQCJEhGjw1LPTpqNbgCNkImjPY=;
  b=PSQ8paMEDXYNuwceetBHXKcVWN6RzWpWSe4Heq7PpOdbO0NRw6hmyJHn
   Yz4WvFBzPqpR+dj3URbCl1reWOjVifHf4lZ9uao24f3akN6eGxvjsjZue
   FSHrqhPwnHKuTIbMC3cHyUD5l5xl90/XD3p9kiEChJ9Hfn/20oM28Q/aL
   Zbq4Ude7BkdORfEteDFiq3J3aTpvF+CzGHrZjsajCAixBAvnabBHtVuhQ
   +p2L5PoUZRQesGrgUWc3juA1kiPSoOeuMU6DkqVdjTj6+HgSHlbBEDIhR
   tRA+8B+/bLK7JSFWVKoPHsOzdPwSyyjrwI0l1uAOwUXVlX3+53sox5vKH
   Q==;
X-CSE-ConnectionGUID: XnPtf2bWSrG/pLUluEH/aQ==
X-CSE-MsgGUID: Qi2dqjR5SNKyiD7DsvNR3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16691110"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="16691110"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 04:24:35 -0700
X-CSE-ConnectionGUID: 3FCvbWVYTVSi5eayVuKdQg==
X-CSE-MsgGUID: VVsKNEPATg2TQrjaf3Pesw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="49139941"
Received: from ytyagi-desk.iind.intel.com ([10.49.15.7])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 04:24:34 -0700
From: Yogesh Tyagi <yogesh.tyagi@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-pybind11 : upgrade 2.11.1 -> 2.12.0
Date: Wed, 26 Jun 2024 16:54:24 +0530
Message-Id: <20240626112424.1852361-1-yogesh.tyagi@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 11:24:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111092

- Drop the patch already merged

Signed-off-by: Yogesh Tyagi <yogesh.tyagi@intel.com>
---
 .../0001-Do-not-strip-binaries.patch          | 54 -------------------
 ...1_2.11.1.bb => python3-pybind11_2.12.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 56 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch
 rename meta-python/recipes-devtools/python/{python3-pybind11_2.11.1.bb => python3-pybind11_2.12.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch b/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch
deleted file mode 100644
index 91575d271..000000000
--- a/meta-python/recipes-devtools/python/python3-pybind11/0001-Do-not-strip-binaries.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From debd676cd94f92a30b3be45f1245aa13d8c398c0 Mon Sep 17 00:00:00 2001
-From: Philip Balister <philip@balister.org>
-Date: Wed, 8 Jul 2020 09:41:43 -0400
-Subject: [PATCH] Do not strip binaries.
-
- * OpenEmbedded strips them after creating debug packages.
-
-Signed-off-by: Philip Balister <philip@balister.org>
-Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
-
-Upstream-Status: Pending
----
- tools/pybind11NewTools.cmake | 7 -------
- tools/pybind11Tools.cmake    | 6 ------
- 2 files changed, 13 deletions(-)
-
-diff --git a/tools/pybind11NewTools.cmake b/tools/pybind11NewTools.cmake
-index 7d7424a7..accd90c4 100644
---- a/tools/pybind11NewTools.cmake
-+++ b/tools/pybind11NewTools.cmake
-@@ -233,13 +233,6 @@ function(pybind11_add_module target_name)
-     endif()
-   endif()
- 
--  # Use case-insensitive comparison to match the result of $<CONFIG:cfgs>
--  string(TOUPPER "${CMAKE_BUILD_TYPE}" uppercase_CMAKE_BUILD_TYPE)
--  if(NOT MSVC AND NOT "${uppercase_CMAKE_BUILD_TYPE}" MATCHES DEBUG|RELWITHDEBINFO)
--    # Strip unnecessary sections of the binary on Linux/macOS
--    pybind11_strip(${target_name})
--  endif()
--
-   if(MSVC)
-     target_link_libraries(${target_name} PRIVATE pybind11::windows_extras)
-   endif()
-diff --git a/tools/pybind11Tools.cmake b/tools/pybind11Tools.cmake
-index 66ad00a4..855ede41 100644
---- a/tools/pybind11Tools.cmake
-+++ b/tools/pybind11Tools.cmake
-@@ -212,12 +212,6 @@ function(pybind11_add_module target_name)
-     endif()
-   endif()
- 
--  # Use case-insensitive comparison to match the result of $<CONFIG:cfgs>
--  string(TOUPPER "${CMAKE_BUILD_TYPE}" uppercase_CMAKE_BUILD_TYPE)
--  if(NOT MSVC AND NOT "${uppercase_CMAKE_BUILD_TYPE}" MATCHES DEBUG|RELWITHDEBINFO)
--    pybind11_strip(${target_name})
--  endif()
--
-   if(MSVC)
-     target_link_libraries(${target_name} PRIVATE pybind11::windows_extras)
-   endif()
--- 
-2.39.2
-
diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.12.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb
rename to meta-python/recipes-devtools/python/python3-pybind11_2.12.0.bb
index 78662fe3c..0403e406a 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.12.0.bb
@@ -7,10 +7,9 @@ DEPENDS = "\
     python3-ninja-native \
 "
 
-SRCREV = "8a099e44b3d5f85b20f05828d919d2332a8de841"
+SRCREV = "3e9dfa2866941655c56877882565e7577de6fc7b"
 SRC_URI = "\
     git://github.com/pybind/pybind11.git;branch=stable;protocol=https \
-    file://0001-Do-not-strip-binaries.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.34.1


