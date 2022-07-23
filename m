Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3ED7C43334
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 03:33:10 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.2573.1658806386220551023
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jul 2022 20:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UbF/LEil;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658806384; i=@fujitsu.com;
	bh=dHHrh75EtCwoE1c68+sJDbfnU40h3diwa09Z4rnZWYw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=UbF/LEil+crLHRhRXWf+V8HXYfGaRx10NfnHO8j+/xykFES0I0tAu3N73ihtsGbIo
	 7rrjN/Znm0sqUbXNbktHBjnBTZ/SsT2r/Q0RMhu4nAc82jmba+CGGSbom4hFmicABf
	 UJHh97xH0+VFojF4XDQexSgkxu2NUTTKERPPWD5sjEuRxmcvEpfaav+0Dpr1tohBkO
	 8JNr5r8WgwJ4+AycwlC5wyXalJ0RxK/uvXxfcQuZzTo5QUgCs0eZib0ucHWx85I7zM
	 GWiSuMnz43qchE96GV0FvxMLwjsKaJZQo2O9sBMmb3uXUSe5AacYtJnfv0WfsjomgO
	 w/TvtbgHcBi0A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8MxSbcg4X6
  SQd93fouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPK8sUsBbtkKw6ePc7awLhQqouRi0NI4Amj
  xIx7Z5khnOtMEv2PmqCcPYwSVza+ZO9i5ORgE1CTmH7rBiuILSKgL7F09h5mEJtZQEXixe8es
  BphAXeJj7O7GUFsFgFViQ37trGB2LwCjhIXj/8Bq5EQUJCY8vA9M0RcUOLkzCcsEHMkJA6+eM
  EMUaMoMftyMwuEXSExYwbEHAmgG66e28Q8gZF/FpL2WUjaFzAyrWK0SirKTM8oyU3MzNE1NDD
  QNTQ01TW21LUw0kus0k3USy3VLU8tLtEFcsuL9VKLi/WKK3OTc1L08lJLNjECwzKlWD1oB+O3
  FT/1DjFKcjApifJu6byXJMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mC93Xc/SQhwaLU9NSKtMwcY
  IzApCU4eJREeEtjgNK8xQWJucWZ6RCpU4z2HFNn/9vPzLEcTM782naAmWPTvq4DzEIsefl5qV
  LivCtApgqAtGWU5sENhcX0JUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvKnxQFN4MvNK4Ha
  /AjqLCeisT9p3QM4qSURISTUwZT9d5HNvqsmVzykr93Hm7NAvPmRk1fqlZmOCk2+JzJ5d2Xu7
  y1e8Wy+wvv6l9rr5Df9sZ9eeDd37NaTtW/e3R2t5NTmUs/zyrB/uFtvlYdYqtlB38jbDXP/UO
  q4LJyeohkVtaV/lcuz0v6IjhVPEOI4t+rWi/Aa3/tKT3h//scVNP2UTXvhxbn+lqlJkWUbs/r
  u/216WpUpP4uG32hZxIEiOubx8k8Zdl6Ip+90efVnsHDvt1owmgRlTe5ufLqm66Of4zmLyhta
  Nxw9VfP4tqx5lHsUgI8X6pObMzlIjH5++eYd473/3PMdTcmXNm7iYVObAPw9czwZ+0jv102rn
  /sSwh7MScnzuzUhhM+DUVWIpzkg01GIuKk4EAJ2gInJkAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-565.messagelabs.com!1658806384!107865!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11396 invoked from network); 26 Jul 2022 03:33:04 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-18.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Jul 2022 03:33:04 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id EF819100078
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 04:33:03 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id E30E7100077
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 04:33:03 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 26 Jul 2022 04:33:02 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] redis-plus-plus: upgrade 1.3.3 -> 1.3.5
Date: Sat, 23 Jul 2022 13:38:19 +0800
Message-ID: <1658554703-9317-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Jul 2022 03:33:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97978

0001-cmake-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallDirs.patch
removed since it's included in 1.3.5

Changelog:
==========
  Ensure running async callback when error happens.
  Add sentinel support for coroutine interface.
  Add publish command for async interface.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...E_INSTALL_LIBDIR-from-GNUInstallDirs.patch | 45 -------------------
 ...plus_1.3.3.bb => redis-plus-plus_1.3.5.bb} |  6 +--
 2 files changed, 2 insertions(+), 49 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus/0001-cmake-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallDirs.patch
 rename meta-oe/recipes-extended/redis-plus-plus/{redis-plus-plus_1.3.3.bb => redis-plus-plus_1.3.5.bb} (74%)

diff --git a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus/0001-cmake-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallDirs.patch b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus/0001-cmake-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallDirs.patch
deleted file mode 100644
index 9ce39f3f77..0000000000
--- a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus/0001-cmake-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallDirs.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From fbb13cdb0b3591616c3f77b6bc76e75af8906cda Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 19 Mar 2022 22:59:58 -0700
-Subject: [PATCH] cmake: Use CMAKE_INSTALL_LIBDIR from GNUInstallDirs
-
-makes it portable across platforms e.g. ppc64/linux uses usr/lib64 for
-system libs
-
-Upstream-Status: Submitted [https://github.com/sewenew/redis-plus-plus/pull/344]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- CMakeLists.txt | 8 +++++---
- 1 file changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 4f28ee4..8150f5c 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -239,10 +239,12 @@ if(REDIS_PLUS_PLUS_BUILD_TEST)
-     add_subdirectory(test)
- endif()
- 
-+include(GNUInstallDirs)
-+
- install(TARGETS ${REDIS_PLUS_PLUS_TARGETS}
-         EXPORT redis++-targets
--        LIBRARY DESTINATION lib
--        ARCHIVE DESTINATION lib
-+        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
-+        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
-         RUNTIME DESTINATION bin
-         INCLUDES DESTINATION include)
- 
-@@ -284,7 +286,7 @@ configure_file("${CMAKE_CURRENT_SOURCE_DIR}/cmake/redis++.pc.in"
-         "${CMAKE_CURRENT_BINARY_DIR}/cmake/redis++.pc" @ONLY)
- 
- install(FILES "${CMAKE_CURRENT_BINARY_DIR}/cmake/redis++.pc"
--        DESTINATION "lib/pkgconfig")
-+        DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
- 
- # All the Debian-specific cpack defines.
- if(${CMAKE_VERSION} VERSION_GREATER 3.6)
--- 
-2.35.1
-
diff --git a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.3.bb b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.5.bb
similarity index 74%
rename from meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.3.bb
rename to meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.5.bb
index 575443f0e5..de19dca387 100644
--- a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.3.bb
+++ b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.5.bb
@@ -4,10 +4,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI = "git://github.com/sewenew/redis-plus-plus;branch=master;protocol=https \
-           file://0001-cmake-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallDirs.patch \
-          "
-SRCREV = "389ffdf9e72035ea2096b03cda7f4a6809ae6363"
+SRC_URI = "git://github.com/sewenew/redis-plus-plus;branch=master;protocol=https"
+SRCREV = "58084931ed1a056d91fe96da7b9ea81fa023560a"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


