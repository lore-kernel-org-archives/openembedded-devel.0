Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BABDAECAAA1
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 01:37:31 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web12.2791.1662514642151597383
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Sep 2022 18:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=i1ScEO7x;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662514640; i=@fujitsu.com;
	bh=kSYatWAP6Xtmk+yBTMbGFRgx+p2fYq8q0b/uWGG5FZU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=i1ScEO7x59HvQT2ERbdPJ19i6kTh5X1kROU0DeSpjF4OVwpORpT1TJsASFjTpGCbT
	 B/2RsuAss/gfGVwWMggav6SINNq2aqzRazZpez/Z4a7ZbCB+VJFQF1QP0N+ByjL09r
	 87+7l8ZgTPDfs3+C1wfmP34097QFXd0mJBVP6eMUY3eiW9YHjClqEv4l5V2zRTiXUm
	 TvGDDkjzYp4M3/m4JPWgJ5wteBsIsqxfGLIy89E/RBfVHHSzoDi7pC+JjR3eds5Saj
	 k0U7XuOEg2HuKjaJTYYwElN+tSRZXl3D9+Kr3DG6A41L4zM9AovQfpFk6KgS7DdtmV
	 bOyBbBywCLpMA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8OxWff8V/F
  kg0fN1hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bKBzdYCi6qVPRO/cncwHhfoYuRk0NI4CGj
  xLx10V2MXED2ZSaJ3huTmSGc3YwSL99NZAWpYhNQk5h+6waYLSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBB4nfjSzCbBSj+9dRhMJtXwEniwrztYL0SAgoSUx6+Z4aIC0qcnPmEBWKOhMTBFy+YIW
  oUJWZfbmaBsCskGqcfYoKw1SSuntvEPIGRfxaS9llI2hcwMq1itEoqykzPKMlNzMzRNTQw0DU
  0NNU11DUyNNdLrNJN1Est1S1PLS7RNdRLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMypRixps7GFv7
  fuodYpTkYFIS5VW9IZ4sxJeUn1KZkVicEV9UmpNafIhRhoNDSYI35AlQTrAoNT21Ii0zBxghM
  GkJDh4lEd6br4HSvMUFibnFmekQqVOM9hxXr1zZy8wxdfa//cwcy8HkzK9tB5iFWPLy81KlxH
  k5vgC1CYC0ZZTmwQ2FRfQlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8hz8CTeHJzCuB2/0
  K6CwmoLO2BoKdVZKIkJJqYNrTtFkpZ3Vnjq6x7PNJS9pkJXQa/v5X06zJW79V6+udr49OHS6f
  PeN6l8Wz54sfNr09wiEsXndZ6dUS3lWf/z/fYFvIqVeal7sj437krKTSmYoVLnKLZvBnZXa6n
  sj8YLngjOeqNxxrV/I+2rRw7jOGPYfE2028Gxd+vWeae7gz6/5vUa3lBes0/wiuO3Huec3h9p
  Nb50aGbT6x/I554OJUjrUncv761yY8bJy2PMwpL256zp4a9uW7/38LPK1+NOylak/MnKj/8za
  Hn/U9uzgxUuR1MldD05Fz/y5XhEwOWvWoNX1Oe+AC9cnrp7JNrU6vbJ/H7OGedqkwbH/d/QL2
  S+zH8w7uj1TfIsIW3sqtxFKckWioxVxUnAgA8/HtFmMDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-587.messagelabs.com!1662514639!293876!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32606 invoked from network); 7 Sep 2022 01:37:19 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-17.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Sep 2022 01:37:19 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 95485150
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  7 Sep 2022 02:37:19 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 8897C73
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  7 Sep 2022 02:37:19 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 7 Sep 2022 02:37:17 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v2] cli11: upgrade 1.9.1 -> 2.2.0
Date: Wed, 7 Sep 2022 09:37:01 +0800
Message-ID: <1662514621-14399-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Sep 2022 01:37:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98679

License-Update: Copyright year updated to 2022.

0001-Do-not-download-the-catch-framework-during-configure.patch
added to download the catch framework before configure.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...the-catch-framework-during-configure.patch | 41 +++++++++++++++++++
 meta-oe/recipes-support/cli11/cli11_1.9.1.bb  | 17 --------
 meta-oe/recipes-support/cli11/cli11_2.2.0.bb  | 25 +++++++++++
 3 files changed, 66 insertions(+), 17 deletions(-)
 create mode 100644 meta-oe/recipes-support/cli11/cli11/0001-Do-not-download-the-catch-framework-during-configure.patch
 delete mode 100644 meta-oe/recipes-support/cli11/cli11_1.9.1.bb
 create mode 100644 meta-oe/recipes-support/cli11/cli11_2.2.0.bb

diff --git a/meta-oe/recipes-support/cli11/cli11/0001-Do-not-download-the-catch-framework-during-configure.patch b/meta-oe/recipes-support/cli11/cli11/0001-Do-not-download-the-catch-framework-during-configure.patch
new file mode 100644
index 0000000000..7e6611b6a8
--- /dev/null
+++ b/meta-oe/recipes-support/cli11/cli11/0001-Do-not-download-the-catch-framework-during-configure.patch
@@ -0,0 +1,41 @@
+From 93557d5c5acf9ebb2c0fa708658e1d36621dd23a Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Wed, 7 Sep 2022 10:05:15 +0900
+Subject: [PATCH] Do not download the catch framework during configure.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ tests/CMakeLists.txt | 15 ---------------
+ 1 file changed, 15 deletions(-)
+
+diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
+index 80c4f6a..ae210db 100644
+--- a/tests/CMakeLists.txt
++++ b/tests/CMakeLists.txt
+@@ -74,21 +74,6 @@ if(Catch2_FOUND)
+   endif()
+   message(STATUS "Found Catch2")
+   target_link_libraries(catch_main PUBLIC Catch2::Catch2)
+-else()
+-  message(STATUS "Downloading Catch2")
+-
+-  # FetchContent would be better, but requires newer CMake.
+-  file(MAKE_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/catch2")
+-  set(url https://github.com/philsquared/Catch/releases/download/v2.13.7/catch.hpp)
+-  file(
+-    DOWNLOAD ${url} "${CMAKE_CURRENT_BINARY_DIR}/catch2/catch.hpp"
+-    STATUS status
+-    EXPECTED_HASH SHA256=ea379c4a3cb5799027b1eb451163dff065a3d641aaba23bf4e24ee6b536bd9bc)
+-  list(GET status 0 error)
+-  if(error)
+-    message(FATAL_ERROR "Could not download ${url}, and Catch2 not found on your system.")
+-  endif()
+-  target_include_directories(catch_main PUBLIC "${CMAKE_CURRENT_BINARY_DIR}")
+ endif()
+ 
+ # Target must already exist
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/cli11/cli11_1.9.1.bb b/meta-oe/recipes-support/cli11/cli11_1.9.1.bb
deleted file mode 100644
index 7de3335abd..0000000000
--- a/meta-oe/recipes-support/cli11/cli11_1.9.1.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "C++11 command line parser"
-DESCRIPTION = "A command line parser for C++11 and beyond that provides a rich feature set with a simple and intuitive interface."
-HOMEPAGE = "https://github.com/CLIUtils/CLI11"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b73927b18d5c6cd8d2ed28a6ad539733"
-SRCREV = "5cb3efabce007c3a0230e4cc2e27da491c646b6c"
-PV .= "+git${SRCPV}"
-
-SRC_URI += "gitsm://github.com/CLIUtils/CLI11;branch=v1;protocol=https"
-
-S = "${WORKDIR}/git"
-
-inherit cmake
-inherit ptest
-
-# cli11 is a header only C++ library, so the main package will be empty.
-RDEPENDS:${PN}-dev = ""
diff --git a/meta-oe/recipes-support/cli11/cli11_2.2.0.bb b/meta-oe/recipes-support/cli11/cli11_2.2.0.bb
new file mode 100644
index 0000000000..53a57489fe
--- /dev/null
+++ b/meta-oe/recipes-support/cli11/cli11_2.2.0.bb
@@ -0,0 +1,25 @@
+SUMMARY = "C++11 command line parser"
+DESCRIPTION = "A command line parser for C++11 and beyond that provides a rich feature set with a simple and intuitive interface."
+HOMEPAGE = "https://github.com/CLIUtils/CLI11"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9ad746b5f49c0fd53c08ca1faff1922c"
+SRCREV = "b9be5b9444772324459989177108a6a65b8b2769"
+PV .= "+git${SRCPV}"
+
+SRC_URI += "gitsm://github.com/CLIUtils/CLI11;branch=main;protocol=https \
+            https://github.com/philsquared/Catch/releases/download/v2.13.7/catch.hpp \
+            file://0001-Do-not-download-the-catch-framework-during-configure.patch"
+
+SRC_URI[sha256sum] = "ea379c4a3cb5799027b1eb451163dff065a3d641aaba23bf4e24ee6b536bd9bc"
+S = "${WORKDIR}/git"
+
+do_configure:prepend() {
+    mkdir -p ${S}/tests/catch2
+    cp ${DL_DIR}/catch.hpp ${S}/tests/catch2/catch.hpp 
+}
+
+inherit cmake
+inherit ptest
+
+# cli11 is a header only C++ library, so the main package will be empty.
+RDEPENDS:${PN}-dev = ""
-- 
2.25.1


