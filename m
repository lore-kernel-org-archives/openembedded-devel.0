Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38605C83F1B
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 13:16:18 +0000 (UTC)
Received: from esa2.hc324-48.eu.iphmx.com (esa2.hc324-48.eu.iphmx.com [207.54.68.120])
 by mx.groups.io with SMTP id smtpd.web11.13549.1752239768736884570
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jul 2025 06:16:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=KH2Et0VR;
 spf=pass (domain: bmw.de, ip: 207.54.68.120, mailfrom: prvs=28004f72d=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1752239768; x=1783775768;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=srg+awlyiydEzGgGutDTIvioAFhpwBMdFvi45hRRKEM=;
  b=KH2Et0VRqk8tFhxnwozLWF6/3GPFFJvbChAT+vCjpX/DnfsbztAnfgu5
   NPUD/5yWSNA51JYSI05EwrDEcY5YVSdkWoAJZu2J9Htd1XE57RT/C5ttS
   1WEB16jZb0kxSOWKi5kXTypSGEsJ9LPPdfuSOQdX1xEr1u6V71h+VHAc5
   U=;
X-CSE-ConnectionGUID: uOWVnXFqTviA2G5iQQeyHw==
X-CSE-MsgGUID: HE1JmS+WTpyXuR98jp6jMw==
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa2.hc324-48.eu.iphmx.com with ESMTP/TLS; 11 Jul 2025 15:16:06 +0200
Received: from unknown (HELO esabb2.muc) ([10.31.187.133]) by esagw1.muc with
 ESMTP/TLS; 11 Jul 2025 15:16:06 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb2.muc with ESMTP/TLS; 11 Jul 2025 15:16:07 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.207) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Fri, 11 Jul 2025 15:16:06 +0200
X-CSE-ConnectionGUID: Wz/en6DLSkutOdRAYKyQSQ==
X-CSE-MsgGUID: WwzoR85xSK+waK2MPqoy8A==
X-CSE-ConnectionGUID: /nmWoRzERba03tXZBO7kjA==
X-CSE-MsgGUID: lvRCPjPdR+ea3D1xGOvuCg==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [meta-oe][PATCH] jsonrpc: Allow to build with CMake 4+
Date: Fri, 11 Jul 2025 15:15:52 +0200
Message-ID: <20250711131552.303728-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp18a.europe.bmw.corp (2a03:1e80:a15:58f::1:50) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 13:16:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118450

Upstream is inactive, so use the 'minimum policy version' override. An
additional patch is required to remove usage of an outdated policy that only
affects MacOS however, so we should we fine.

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 ...-usage-of-obsolete-MacOS-only-policy.patch | 38 +++++++++++++++++++
 .../recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb |  5 ++-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-cmake-Remove-usage-of-obsolete-MacOS-only-policy.patch

diff --git a/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-cmake-Remove-usage-of-obsolete-MacOS-only-policy.patch b/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-cmake-Remove-usage-of-obsolete-MacOS-only-policy.patch
new file mode 100644
index 0000000000..ef0c12722f
--- /dev/null
+++ b/meta-oe/recipes-devtools/jsonrpc/jsonrpc/0001-cmake-Remove-usage-of-obsolete-MacOS-only-policy.patch
@@ -0,0 +1,38 @@
+From 7cc415c5b2406b16adcccdce3fc8bf5223a1bdb1 Mon Sep 17 00:00:00 2001
+From: Moritz Haase <Moritz.Haase@bmw.de>
+Date: Fri, 11 Jul 2025 12:31:49 +0200
+Subject: [PATCH] cmake: Remove usage of obsolete MacOS-only policy
+
+Workaround an error reported by CMake 4 that only affects MacOS.
+
+CMake Error at CMakeLists.txt:21 (cmake_policy):
+  Policy CMP0042 may not be set to OLD behavior because this version of CMake
+  no longer supports it.  The policy was introduced in CMake version 3.0.0,
+  and use of NEW behavior is now required.
+
+  Please either update your CMakeLists.txt files to conform to the new
+  behavior or use an older version of CMake that still supports the old
+  behavior.  Run cmake --help-policy CMP0042 for more information.
+
+Upstream-Status: Inactive-Upstream [2022-01-12]
+Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
+---
+ CMakeLists.txt | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 961e55a..909610b 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -16,11 +16,6 @@ project(libjson-rpc-cpp)
+ cmake_policy(SET CMP0007 NEW)
+ cmake_policy(SET CMP0012 NEW)
+ 
+-if (${CMAKE_MAJOR_VERSION} GREATER 2)
+-    # old policy do not use MACOSX_RPATH
+-    cmake_policy(SET CMP0042 OLD)
+-endif()
+-
+ set(MAJOR_VERSION 1)
+ set(MINOR_VERSION 4)
+ set(PATCH_VERSION 1)
diff --git a/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb b/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb
index ae86e20a4a..18a8904015 100644
--- a/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb
+++ b/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.4.1.bb
@@ -9,7 +9,9 @@ SECTION = "libs"
 
 DEPENDS = "curl jsoncpp libmicrohttpd hiredis"
 
-SRC_URI = "git://github.com/cinemast/libjson-rpc-cpp;branch=master;protocol=https"
+SRC_URI = "git://github.com/cinemast/libjson-rpc-cpp;branch=master;protocol=https \
+           file://0001-cmake-Remove-usage-of-obsolete-MacOS-only-policy.patch \
+           "
 
 SRCREV = "ec5ce12fc9c0299e1454cc002c70218b5a6f005b"
 
@@ -22,6 +24,7 @@ inherit cmake
 EXTRA_OECMAKE += "-DCOMPILE_TESTS=NO -DCOMPILE_STUBGEN=NO -DCOMPILE_EXAMPLES=NO \
                   -DBUILD_SHARED_LIBS=YES -DBUILD_STATIC_LIBS=YES \
                   -DCMAKE_LIBRARY_PATH=${libdir} \
+                  -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
 "
 
 do_install:append() {

