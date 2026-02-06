Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B03ECD9B8
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 01:44:38 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1829.1770342269839088198
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Feb 2026 17:44:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iLCA+lsC;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770342270; x=1801878270;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GLPnAL/GVj0Lt/w7uFCiXh6GfdMWjYXU+ebjMCmdilA=;
  b=iLCA+lsC0gUDzLQhZIj+XGshw82JojFA9LZi6jHqNG6u4pfRbE9dQ80p
   YTjqPv9x68IXiCZC2TTtXKg6FkvMqmLhev5O7ql2fo1IA7SGnhSYf7aCW
   lVokQAox+og84R1QNjVOjJH6AnzAo5zOMwIt1DDIGZar0ChZQxUiM9rXL
   ZGhdy+4tWyu8AJz3CgVgy/52lI/Yogt4qLbDlZmtzPNep0++iQQTxz+U4
   u4bveaZA8r8QMR5xXuXV2LY4M4WEv0c4SDqrig26DXL/ZHeSKAVbd3caj
   WRld0cZYVha95b2tUZkq94/F2/K6T9Aa1fIOW5eHYy0NQogN0uL6Sukef
   g==;
X-CSE-ConnectionGUID: 7fy01LqORSOFG45KuhCpsg==
X-CSE-MsgGUID: JRKC5fQVRi+z4fPyDC6fFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="216135516"
X-IronPort-AV: E=Sophos;i="6.21,275,1763391600"; 
   d="scan'208";a="216135516"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 10:44:28 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.fujitsu.com (Postfix) with ESMTPS id 244EA1000349
	for <openembedded-devel@lists.openembedded.org>; Fri,  6 Feb 2026 01:44:28 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id C64151C17294
	for <openembedded-devel@lists.openembedded.org>; Fri,  6 Feb 2026 01:44:27 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 817E514022F0
	for <openembedded-devel@lists.openembedded.org>; Fri,  6 Feb 2026 01:44:25 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] ettercap: 0.8.3.1-> 0.8.4
Date: Fri,  6 Feb 2026 09:44:20 +0800
Message-ID: <20260206014420.4687-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Feb 2026 01:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124222

1. Changelog
   https://github.com/Ettercap/ettercap/releases/tag/v0.8.4

2. Remove following patches as they were merged upstream
   0001-sslstrip-Enhance-the-libcurl-version-check-to-consid.patch
   0002-allow-build-with-cmake-4.patch

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...-the-libcurl-version-check-to-consid.patch | 38 -------------
 .../0002-allow-build-with-cmake-4.patch       | 54 -------------------
 ...{ettercap_0.8.3.1.bb => ettercap_0.8.4.bb} |  7 ++-
 3 files changed, 3 insertions(+), 96 deletions(-)
 delete mode 100644 meta-networking/recipes-support/ettercap/ettercap/0001-sslstrip-Enhance-the-libcurl-version-check-to-consid.patch
 delete mode 100644 meta-networking/recipes-support/ettercap/ettercap/0002-allow-build-with-cmake-4.patch
 rename meta-networking/recipes-support/ettercap/{ettercap_0.8.3.1.bb => ettercap_0.8.4.bb} (85%)

diff --git a/meta-networking/recipes-support/ettercap/ettercap/0001-sslstrip-Enhance-the-libcurl-version-check-to-consid.patch b/meta-networking/recipes-support/ettercap/ettercap/0001-sslstrip-Enhance-the-libcurl-version-check-to-consid.patch
deleted file mode 100644
index 592ea52f2e..0000000000
--- a/meta-networking/recipes-support/ettercap/ettercap/0001-sslstrip-Enhance-the-libcurl-version-check-to-consid.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 40534662043b7d831d1f6c70448afa9d374a9b63 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 23 Mar 2023 10:23:14 -0700
-Subject: [PATCH] sslstrip: Enhance the libcurl version check to consider
- version 8+
-
-Lately curl has released version 8 and hence LIBCURL_VERSION_MAJOR is
-reset to 0, current check assumes major version to be 7 at max and hence
-on systems with libcurl 8+ this check breaks and build fails
-
-Fixes
-
-TOPDIR/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/ettercap/0.8.3.1-r0/git/plug-ins/sslstrip/sslstrip.c:57:2: error: libcurl 7.26.0 or up is needed
- ^
-1 error generated.
-
-Upstream-Status: Backport [https://github.com/Ettercap/ettercap/commit/40534662043b7d831d1f6c70448afa9d374a9b63]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- plug-ins/sslstrip/sslstrip.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/plug-ins/sslstrip/sslstrip.c b/plug-ins/sslstrip/sslstrip.c
-index 327bf58a..d9b67c8b 100644
---- a/plug-ins/sslstrip/sslstrip.c
-+++ b/plug-ins/sslstrip/sslstrip.c
-@@ -51,7 +51,7 @@
- 
- #include <curl/curl.h>
- 
--#if (LIBCURL_VERSION_MAJOR < 7) || (LIBCURL_VERSION_MINOR < 26)
-+#if (LIBCURL_VERSION_MAJOR < 7) || (LIBCURL_VERSION_MAJOR == 7 && LIBCURL_VERSION_MINOR < 26)
- #error libcurl 7.26.0 or up is needed
- #endif
- 
--- 
-2.40.0
-
diff --git a/meta-networking/recipes-support/ettercap/ettercap/0002-allow-build-with-cmake-4.patch b/meta-networking/recipes-support/ettercap/ettercap/0002-allow-build-with-cmake-4.patch
deleted file mode 100644
index 70e48f7d9e..0000000000
--- a/meta-networking/recipes-support/ettercap/ettercap/0002-allow-build-with-cmake-4.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 337e790d4fc8fed00a4f62047de1bc702f06105e Mon Sep 17 00:00:00 2001
-From: Alper Ak <alperyasinak1@gmail.com>
-Date: Wed, 9 Jul 2025 14:15:32 +0300
-Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
- compatibility
-
-Fix:
-
-| CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
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
-Upstream-Status: Submitted [https://github.com/Ettercap/ettercap/pull/1279]
-
-Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
----
- CMakeLists.txt               | 2 +-
- cmake/Modules/FindGTK3.cmake | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 1c08875a..600bd9f4 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 2.8)
-+cmake_minimum_required(VERSION 3.5)
- project(ettercap C)
- 
- set(VERSION "0.8.3.1")
-diff --git a/cmake/Modules/FindGTK3.cmake b/cmake/Modules/FindGTK3.cmake
-index e07a4e90..f37fee1c 100644
---- a/cmake/Modules/FindGTK3.cmake
-+++ b/cmake/Modules/FindGTK3.cmake
-@@ -351,7 +351,7 @@ endif()
- #
- if(GTK3_FIND_VERSION)
-   if(NOT DEFINED CMAKE_MINIMUM_REQUIRED_VERSION)
--    cmake_minimum_required(VERSION 2.6.2)
-+    cmake_minimum_required(VERSION 3.5)
-   endif()
-   set(GTK3_FAILED_VERSION_CHECK true)
-   if(GTK3_DEBUG)
--- 
-2.43.0
-
diff --git a/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb b/meta-networking/recipes-support/ettercap/ettercap_0.8.4.bb
similarity index 85%
rename from meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
rename to meta-networking/recipes-support/ettercap/ettercap_0.8.4.bb
index 027b6dd190..3784d12b85 100644
--- a/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
+++ b/meta-networking/recipes-support/ettercap/ettercap_0.8.4.bb
@@ -7,6 +7,7 @@ inherit cmake
 
 DEPENDS += "ethtool \
             geoip \
+            libmaxminddb \
             librepo \
             libnet \
             libpcap \
@@ -20,11 +21,9 @@ DEPENDS += "ethtool \
 
 RDEPENDS:${PN} += "bash ethtool libgcc"
 
-SRC_URI = "gitsm://github.com/Ettercap/ettercap;branch=master;protocol=https \
-           file://0001-sslstrip-Enhance-the-libcurl-version-check-to-consid.patch \
-           file://0002-allow-build-with-cmake-4.patch"
+SRC_URI = "gitsm://github.com/Ettercap/ettercap;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "7281fbddb7da7478beb1d21e3cb105fff3778b31"
+SRCREV = "41da65f4026a9e4cea928e61941b976d9279f508"
 
 EXTRA_OECMAKE = " \
     -DCMAKE_SKIP_RPATH=TRUE \
-- 
2.43.0


