Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 517C2C433EF
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 13:19:44 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.6777.1643116780121822201
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 05:19:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=B6NhC/bH;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1643116777; i=@fujitsu.com;
	bh=Dg9uNq11xBeJob78y6HjVcdkQZBV+2ZEY9Orti1TBSE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=B6NhC/bHbIcaW6aD7sVwp8qBeEC6+uwPTLQE26tjO3qXjiED8hcycWBvMIXK1DYrr
	 UU1YLKKZCMnztLio3yLMJ52IlOjwP9nGpcVZm6edKZ2X2Qt0xQOTS5TLZjzCXiTUZ2
	 5lN/Xd0i+9X7RF1nfgs+hwap62k+8+zHol4nQsbbV3Jan8xl4QtRk1fHOzFrpriddV
	 LDbH2Z3bplY5INUnkii7zN/QojcbmAAyqAg8H+RbQ++AXBr3UmRaSEDbpmsOHb9ceA
	 3psiSkpunH/raRboj+zlmynO6hV4ohK2qXxCET+pWZzPn3vNz4U5XoBxIBstIvd4BN
	 5219HpTRZ3g1w==
Received: from [100.115.65.91] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 C8/B8-07811-9E8FFE16; Tue, 25 Jan 2022 13:19:37 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnleJIrShJLcpLzFFi42Kxs+FI1H35432
  iwc+zshYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aRP6+YCzaoV8xYMZWxgfG/UhcjF4eQwBNG
  iQ1T/7FDOBeYJP7tusgK4ZxglHh4YwZbFyMnB5uAmsT0WzdYQWwRAX2JpbP3MIPYzAIqEi9+9
  wB1c3AICzhK9J/SBAmzCKhK7Hn4BqycFyj84OcPsHIJAQWJKQ/fg9mcAk4SSx8+ZQGxhYBq3s
  8+ywxRLyhxcuYTFojxEhIHX7yA6lWUmH25mQXCrpCYNauNCcJWk7h6bhPzBEbBWUjaZyFpX8D
  ItIrRNqkoMz2jJDcxM0fX0MBA19DQVNfMUtfYWC+xSjdRL7VUNzk1r6QoESirl1herJdaXKxX
  XJmbnJOil5dasokRGMopxa6KOxiv9f3UO8QoycGkJMqbuO59ohBfUn5KZUZicUZ8UWlOavEhR
  hkODiUJ3rffgHKCRanpqRVpmTnAuIJJS3DwKInwXgdJ8xYXJOYWZ6ZDpE4xJnO8WbtkETPHWz
  DZdu8ukGwHkzMXHFzNzDELTN5vPwQkH4DJ5knLtzNzvG75uYNZiCUvPy9VSpzX7DvQaAGQ0Rm
  leXCLYenkEqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXjWQKTyZeSVw970COp0J6PTf59+B
  nF6SiJCSamDaI23U8q/vHifrjv4ylZMBe7NN2Ve/E59dkVorJqfEvO13bqMn59FXBn0e8X86z
  +h9+9vRu93c8Ifu5J36+68sF3RbxsQafm+BRLddsduMaaf9T0bKhabMlZx5oSb5S/pWi9ySB+
  vL+VS1d/zSCl30uGSC1ZqVh/d85+ReP23FqzLfy485mZPnu/xpktC9/rOqrfnMbu7G5H0TK5J
  lvh3K86+9rpmmWtEiKij2Qut7REvzuuRsrw0qauqe0TEl281zGF8eX1feKOfa7aO+KGD6Khfl
  2GldmdOmlSrmJ2/2ydvEHV/F67dNv/XA3yXVv3c2NK8qWS70o6R69ibN4F3z1q7+9M2mnb9cR
  0raW4mlOCPRUIu5qDgRAGv17hiiAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-532.messagelabs.com!1643116777!18415!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21139 invoked from network); 25 Jan 2022 13:19:37 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-16.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Jan 2022 13:19:37 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E64AE100198
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 13:19:36 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D9594100184
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 13:19:36 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Tue, 25 Jan 2022 13:19:18 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libcereal: upgrade 1.3.0 -> 1.3.1
Date: Tue, 25 Jan 2022 21:19:03 +0800
Message-ID: <1643116744-7391-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643116744-7391-1-git-send-email-wangmy@fujitsu.com>
References: <1643116744-7391-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jan 2022 13:19:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95063

License-Update: year updated to 2022

0001-Use-GNUInstallDirs-instead-of-hard-wiring-install-di.patch
removed since it is included in 1.3.1

Changelog:
=========
Highlighted fixes and enhancements include:
------------------------------------------
Github actions in place of Travis CI
Doctest updates (and upstream patches!) to support all targeted compilers
Cmake modernization

Bug fixes and minor enhancements:
---------------------------------
Fix typo in docs in #597
Add MSVC 2019 to build, default ctor for static object
Fix json.hpp compilation issue when int32_t is a long
[cpp20] explicitly capture 'this' as copy
Fix rapidjson for Clang 10
Fixes to prevent clang-diagnostic errors
cleanup cmake files to be a little more moderen
CVE-2020-11105: Store a copy of each serialized shared_ptr within the archive to prevent the shared_ptr to be freed to early
add license files for components of cereal
Catch short documents in JSON input
C++17: use inline globals for StaticObjects
Use std::variant::emplace when loading
Use std::optional::emplace() when loading non-empty optional
Fix itsNextName not clearing when not found + style change
Update doctest to 2.4.6 + local fixes slated for upstream
Fixed loading of std::vector
Update license to match BSD template
Update doctest to 2.4.7
Use GNUInstallDirs instead of hard wiring install directories

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...rs-instead-of-hard-wiring-install-di.patch | 37 -------------------
 ...{libcereal_1.3.0.bb => libcereal_1.3.1.bb} |  8 ++--
 2 files changed, 3 insertions(+), 42 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libcereal/libcereal/0001-Use-GNUInstallDirs-instead-of-hard-wiring-install-di.patch
 rename meta-oe/recipes-support/libcereal/{libcereal_1.3.0.bb => libcereal_1.3.1.bb} (79%)

diff --git a/meta-oe/recipes-support/libcereal/libcereal/0001-Use-GNUInstallDirs-instead-of-hard-wiring-install-di.patch b/meta-oe/recipes-support/libcereal/libcereal/0001-Use-GNUInstallDirs-instead-of-hard-wiring-install-di.patch
deleted file mode 100644
index 93114dadd..000000000
--- a/meta-oe/recipes-support/libcereal/libcereal/0001-Use-GNUInstallDirs-instead-of-hard-wiring-install-di.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From c9e60ed064aa2938f71f2cacf79f0bb337812bf8 Mon Sep 17 00:00:00 2001
-From: Anton Blanchard <anton@ozlabs.org>
-Date: Tue, 17 Aug 2021 09:32:43 +1000
-Subject: [PATCH] Use GNUInstallDirs instead of hard wiring install directories
-
-On a multilib setup cmake files should go into lib64.
-
-Upstream-Status: Submitted [https://github.com/USCiLab/cereal/pull/710]
----
- CMakeLists.txt | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index b97c1f59..ad574290 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -70,14 +70,15 @@ endif()
- 
- option(CEREAL_INSTALL "Generate the install target" ${CEREAL_MASTER_PROJECT})
- if(CEREAL_INSTALL)
-+    include(GNUInstallDirs)
-     include(CMakePackageConfigHelpers)
- 
-     install(TARGETS cereal EXPORT ${PROJECT_NAME}Targets)
--    install(DIRECTORY include/cereal DESTINATION include)
-+    install(DIRECTORY include/cereal DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
- 
-     set(configFile ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake)
-     set(versionFile ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake)
--    set(configInstallDestination lib/cmake/${PROJECT_NAME})
-+    set(configInstallDestination ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME})
- 
-     configure_package_config_file(
-         ${CMAKE_CURRENT_SOURCE_DIR}/Config.cmake.in
--- 
-2.31.1
-
diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.3.0.bb b/meta-oe/recipes-support/libcereal/libcereal_1.3.1.bb
similarity index 79%
rename from meta-oe/recipes-support/libcereal/libcereal_1.3.0.bb
rename to meta-oe/recipes-support/libcereal/libcereal_1.3.1.bb
index 0dbd5204d..c905b74d6 100644
--- a/meta-oe/recipes-support/libcereal/libcereal_1.3.0.bb
+++ b/meta-oe/recipes-support/libcereal/libcereal_1.3.1.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 
 LICENSE = "BSD-3-Clause & MIT & BSL-1.0"
 LIC_FILES_CHKSUM = "\
-    file://LICENSE;md5=e612690af2f575dfd02e2e91443cea23 \
+    file://LICENSE;md5=4921372a1fb38469e667c38b17a1c4b3 \
     file://include/cereal/external/rapidxml/license.txt;md5=d63ab70ba21ca0544b03284958324301 \
     file://include/cereal/external/LICENSE;md5=b07578c9df99c0b8b45eb041efd4a645 \
     file://include/cereal/external/rapidjson/LICENSE;md5=e7abb663111d4ac17cf00323698aff08 \
@@ -15,10 +15,8 @@ LIC_FILES_CHKSUM = "\
 PROVIDES += "${PN}-dev"
 
 PV .= "+git${SRCPV}"
-SRCREV = "64f50dbd5cecdaba785217e2b0aeea3a4f1cdfab"
-SRC_URI = "git://github.com/USCiLab/cereal.git;branch=master;protocol=https \
-           file://0001-Use-GNUInstallDirs-instead-of-hard-wiring-install-di.patch \
-           "
+SRCREV = "1de8fe89471d69ea392ea260ce74e079d5f4b415"
+SRC_URI = "git://github.com/USCiLab/cereal.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


