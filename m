Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD0DBEB28C6
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 05:10:09 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5155.1770354601376269518
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Feb 2026 21:10:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sbYYp+UO;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770354599; x=1801890599;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sHzBX7w8HdlrIoDNvAHoX+mLR2W9tFvkFWZVbxqol88=;
  b=sbYYp+UO3insLXlsnqZRVb0SiCjTd3h5jf8S6Dyu3UNp1bSxbbiuHsZE
   VlqHxc8hvVNlNd2QPOsXIR6pic9z1fiy2AhJmFVqqG0wn4oN4NdDRGbgl
   tpIoFgDTlJ6jcdGysDbusZ5SqKIA8U2LjEeHhU7QgOSqNlk5Q5Y5CQiqn
   a9soWJ5BerIKR7VPf/jz45Bp9jdpGeW2FwDbuI+u/9XkVDAD0Tw6ZBFzF
   6dElwH5yZQRJ+sNh324XF+y4/BCjc3DxZadRkmZy3TLyCzgXcQeTJxmIS
   DDiG4KjcU2oLp4mRuFVciztsVpSP1pDRgSz8H8e8dIawRSqHSKMRLU3Nf
   Q==;
X-CSE-ConnectionGUID: zUcVUyGISmiS96S98qYuwA==
X-CSE-MsgGUID: zImm216mTNeAcRNJLVmCEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="207726036"
X-IronPort-AV: E=Sophos;i="6.21,275,1763391600"; 
   d="scan'208";a="207726036"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 14:09:59 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.fujitsu.com (Postfix) with ESMTPS id 8FC1C100037C
	for <openembedded-devel@lists.openembedded.org>; Fri,  6 Feb 2026 05:09:59 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 421BA18019AF
	for <openembedded-devel@lists.openembedded.org>; Fri,  6 Feb 2026 05:09:59 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 02EDF1800D77
	for <openembedded-devel@lists.openembedded.org>; Fri,  6 Feb 2026 05:09:56 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] transmission: upgrade 4.0.6 -> 4.1.0
Date: Fri,  6 Feb 2026 13:09:52 +0800
Message-ID: <20260206050952.5280-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Feb 2026 05:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124225

1.ChangeLog
  https://github.com/transmission/transmission/releases/tag/4.1.0

2. Remove following patches as they were merged upstream
  0001-build-bump-CMake-version-to-3.10-4.patch
  0001-miniupnpc-bump-CMake-version-to-3.14.patch
  0001-build-set-minimum-required-CMake-to-3.5.patch

3. Change LICENSE Checksum as Copyright year has changed.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...1-build-bump-CMake-version-to-3.10-4.patch | 26 ----------------
 ...ld-set-minimum-required-CMake-to-3.5.patch | 31 -------------------
 ...miniupnpc-bump-CMake-version-to-3.14.patch | 21 -------------
 ...mission_4.0.6.bb => transmission_4.1.0.bb} | 15 ++++-----
 4 files changed, 6 insertions(+), 87 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/transmission/files/0001-build-bump-CMake-version-to-3.10-4.patch
 delete mode 100644 meta-oe/recipes-connectivity/transmission/files/0001-build-set-minimum-required-CMake-to-3.5.patch
 delete mode 100644 meta-oe/recipes-connectivity/transmission/files/0001-miniupnpc-bump-CMake-version-to-3.14.patch
 rename meta-oe/recipes-connectivity/transmission/{transmission_4.0.6.bb => transmission_4.1.0.bb} (80%)

diff --git a/meta-oe/recipes-connectivity/transmission/files/0001-build-bump-CMake-version-to-3.10-4.patch b/meta-oe/recipes-connectivity/transmission/files/0001-build-bump-CMake-version-to-3.10-4.patch
deleted file mode 100644
index a08366a36d..0000000000
--- a/meta-oe/recipes-connectivity/transmission/files/0001-build-bump-CMake-version-to-3.10-4.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From a18ae078a32e08a7193d0bae20190060bd1e8b85 Mon Sep 17 00:00:00 2001
-From: Yat Ho <lagoho7@gmail.com>
-Date: Thu, 1 May 2025 09:14:19 +0800
-Subject: [PATCH] build: bump CMake version to 3.10 (#4)
-
-CMake < 3.5 compatibility has been removed from CMake 4.0 and CMake < 3.10 compatibility has been deprecated in CMake 3.31.
-
-https://cmake.org/cmake/help/latest/release/4.0.html
-https://cmake.org/cmake/help/latest/release/3.31.html
-
-Upstream-Status: Backport [https://github.com/transmission/dht/commit/38c9f261d9b58b76b9eaf85f84ec1b35151a1eac]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 6d4aa99..596dbfb 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 2.8)
-+cmake_minimum_required(VERSION 3.10)
- project(dht C)
- 
- add_library(${PROJECT_NAME} STATIC
diff --git a/meta-oe/recipes-connectivity/transmission/files/0001-build-set-minimum-required-CMake-to-3.5.patch b/meta-oe/recipes-connectivity/transmission/files/0001-build-set-minimum-required-CMake-to-3.5.patch
deleted file mode 100644
index 887bc21114..0000000000
--- a/meta-oe/recipes-connectivity/transmission/files/0001-build-set-minimum-required-CMake-to-3.5.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 9c5ed3204bdb722b5624f6b9dbfba240a50b336c Mon Sep 17 00:00:00 2001
-From: fanquake <fanquake@gmail.com>
-Date: Fri, 12 Jan 2024 10:25:27 +0000
-Subject: [PATCH] build: set minimum required CMake to 3.5
-
-Avoids:
-```bash
-CMake Deprecation Warning at CMakeLists.txt:1 (cmake_minimum_required):
-  Compatibility with CMake < 3.5 will be removed from a future version of
-  CMake.
-
-  Update the VERSION argument <min> value or use a ...<max> suffix to tell
-  CMake that the project does not need compatibility with older versions.
-```
-
-Upstream-Status: Backport [https://github.com/miniupnp/libnatpmp/pull/43]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 3034df8..e7cffe5 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 2.8)
-+cmake_minimum_required(VERSION 3.5)
- project(natpmp C)
- 
- add_definitions(-DNATPMP_STATICLIB -DENABLE_STRNATPMPERR)
diff --git a/meta-oe/recipes-connectivity/transmission/files/0001-miniupnpc-bump-CMake-version-to-3.14.patch b/meta-oe/recipes-connectivity/transmission/files/0001-miniupnpc-bump-CMake-version-to-3.14.patch
deleted file mode 100644
index 1714ad1b99..0000000000
--- a/meta-oe/recipes-connectivity/transmission/files/0001-miniupnpc-bump-CMake-version-to-3.14.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-From aa19cb131c953e4520be5284d86964f371ee059f Mon Sep 17 00:00:00 2001
-From: Yat Ho <lagoho7@gmail.com>
-Date: Mon, 13 May 2024 16:21:28 +0800
-Subject: [PATCH] miniupnpc: bump CMake version to 3.14
-
-Upstream-Status: Backport [https://github.com/transmission/miniupnpc/commit/e7b0fa83c313c50a66da76ad6fb446e5bfdb482f]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 0a53e27..2c713b5 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required (VERSION 2.6)
-+cmake_minimum_required (VERSION 3.14)
- 
- project (miniupnpc C)
- set (MINIUPNPC_VERSION 2.0)
diff --git a/meta-oe/recipes-connectivity/transmission/transmission_4.0.6.bb b/meta-oe/recipes-connectivity/transmission/transmission_4.1.0.bb
similarity index 80%
rename from meta-oe/recipes-connectivity/transmission/transmission_4.0.6.bb
rename to meta-oe/recipes-connectivity/transmission/transmission_4.1.0.bb
index 518f8653ca..aed1e2e32a 100644
--- a/meta-oe/recipes-connectivity/transmission/transmission_4.0.6.bb
+++ b/meta-oe/recipes-connectivity/transmission/transmission_4.1.0.bb
@@ -2,23 +2,20 @@ DESCRIPTION = "Transmission is a fast, easy, and free BitTorrent client"
 SECTION = "network"
 HOMEPAGE = "https://transmissionbt.com/"
 LICENSE = "MIT & GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ba8199e739948e198310093de27175fa"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d54f298b276b8cc5f20168e43a0e8103"
 
 DEPENDS = "curl libevent libpsl gnutls openssl libtool intltool-native glib-2.0-native"
 RDEPENDS:${PN}-web = "${PN}"
 
 SRC_URI = " \
-	gitsm://github.com/transmission/transmission;branch=4.0.x;protocol=https \
-	file://0001-build-bump-CMake-version-to-3.10-4.patch;patchdir=third-party/dht \
+	gitsm://github.com/transmission/transmission;branch=4.1.x;protocol=https;tag=${PV} \
 	file://0001-bump-cmake-to-3.10.patch;patchdir=third-party/libb64 \
 	file://0001-Increase-minimum-CMake-version-to-3.10.patch;patchdir=third-party/libdeflate \
-	file://0001-miniupnpc-bump-CMake-version-to-3.14.patch;patchdir=third-party/miniupnpc \
-	file://0001-build-set-minimum-required-CMake-to-3.5.patch;patchdir=third-party/libnatpmp \
 	file://transmission-daemon \
 "
 
-# Transmission release 4.0.6
-SRCREV = "38c164933e9f77c110b48fe745861c3b98e3d83e"
+# Transmission release 4.1.0
+SRCREV = "272401184f0736e6063f9da90be7d037e907508a"
 
 
 inherit cmake gettext update-rc.d pkgconfig systemd mime-xdg
@@ -45,9 +42,9 @@ do_install:append() {
 	fi
 
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-		sed -i '/User=/c\User=${TRANSMISSION_USER}' ${S}/daemon/transmission-daemon.service
+		sed -i '/User=/c\User=${TRANSMISSION_USER}' ${B}/daemon/transmission-daemon.service
 		install -d ${D}${systemd_unitdir}/system
-		install -m 0644 ${S}/daemon/transmission-daemon.service ${D}${systemd_unitdir}/system
+		install -m 0644 ${B}/daemon/transmission-daemon.service ${D}${systemd_unitdir}/system
 	fi
 }
 
-- 
2.43.0


