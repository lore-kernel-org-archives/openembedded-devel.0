Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A45C83F1D
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 10:01:36 +0000 (UTC)
Received: from esa14.hc324-48.eu.iphmx.com (esa14.hc324-48.eu.iphmx.com [207.54.69.24])
 by mx.groups.io with SMTP id smtpd.web11.10145.1752228086364171799
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jul 2025 03:01:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=O6BxGPP8;
 spf=pass (domain: bmw.de, ip: 207.54.69.24, mailfrom: prvs=28004f72d=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1752228086; x=1783764086;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m0YXc3tXkqNHIxO2LcBZuSYFm0fBGCngNd1MtvTFg3k=;
  b=O6BxGPP8ISC0xIm2RdMJmxF3Po40htZ/6DoaOOL71B/r0iueK9B+l1dP
   /+RwxB8+CXwUKSwWAS90Fq9l48CGsAuo8S0hj+4+GM0jVkngM3yq4Czmg
   83CEusBu71YqCELEWjssz1Ox7rPlY2plpiikpreplc68U2BGsMctCzO0E
   s=;
X-CSE-ConnectionGUID: 60qjpYQOSTODvxEjuKEWsg==
X-CSE-MsgGUID: JCJKpPCbSnOxmb08bvD8oA==
Received: from 160.46.252.34.spf.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa14.hc324-48.eu.iphmx.com with ESMTP/TLS; 11 Jul 2025 12:01:23 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw1.muc with ESMTP/TLS;
 11 Jul 2025 12:01:24 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb1.muc with ESMTP/TLS; 11 Jul 2025 12:01:24 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.215) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Fri, 11 Jul 2025 12:01:23 +0200
X-CSE-ConnectionGUID: QsUmZNE/SpaXEkizcM1H2g==
X-CSE-MsgGUID: HJ1vzTMfSVGQ2BbHDlFQjw==
X-CSE-ConnectionGUID: mPZ95d/sTy2YxF+oquQKnA==
X-CSE-MsgGUID: rchRxX4zRrCX5tbSmKkCSA==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [meta-oe][PATCH 01/10] zeromq: Backport patches to support builds with CMake 4+
Date: Fri, 11 Jul 2025 12:00:18 +0200
Message-ID: <20250711100052.255467-2-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711100052.255467-1-Moritz.Haase@bmw.de>
References: <20250711100052.255467-1-Moritz.Haase@bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SMUCMP12E.europe.bmw.corp (2a03:1e80:a15:58f::1:320) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 10:01:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118435

There hasn't been a new upstream release yet that ships the required changes.

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 ...make_minimum_required-before-project.patch | 41 ++++++++++++++
 ...pper-bound-in-cmake_minimum_required.patch | 56 +++++++++++++++++++
 .../zeromq/zeromq_4.3.5.bb                    |  2 +
 3 files changed, 99 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/zeromq/files/0002-cmake_minimum_required-before-project.patch
 create mode 100644 meta-oe/recipes-connectivity/zeromq/files/0003-set-upper-bound-in-cmake_minimum_required.patch

diff --git a/meta-oe/recipes-connectivity/zeromq/files/0002-cmake_minimum_required-before-project.patch b/meta-oe/recipes-connectivity/zeromq/files/0002-cmake_minimum_required-before-project.patch
new file mode 100644
index 0000000000..9c854c63dd
--- /dev/null
+++ b/meta-oe/recipes-connectivity/zeromq/files/0002-cmake_minimum_required-before-project.patch
@@ -0,0 +1,41 @@
+From 34f7fa22022bed9e0e390ed3580a1c83ac4a2834 Mon Sep 17 00:00:00 2001
+From: rp42 <rp42@users.noreply.github.com>
+Date: Mon, 30 Dec 2024 11:01:39 +0000
+Subject: [PATCH] cmake_minimum_required() before project()
+
+ * Without this CMAKE_MSVC_RUNTIME_LIBRARY=MultiThreaded (MT) Windows builds still produced incompatible MultiThreadedDLL (MD) output.
+
+ * Resolves following warning:
+
+CMake Warning (dev) at CMakeLists.txt:2 (project):
+  cmake_minimum_required() should be called prior to this top-level project()
+  call.
+
+ * Use ${CMAKE_HOST_SYSTEM_NAME} as ${CMAKE_SYSTEM_NAME} not set before project().
+
+Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
+Upstream-Status: Backport [34f7fa22022bed9e0e390ed3580a1c83ac4a2834]
+---
+ CMakeLists.txt | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 861164ad..e4ce8a3d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,12 +1,13 @@
+ # CMake build script for ZeroMQ
+-project(ZeroMQ)
+ 
+-if(${CMAKE_SYSTEM_NAME} STREQUAL Darwin)
++if(${CMAKE_HOST_SYSTEM_NAME} STREQUAL Darwin)
+   cmake_minimum_required(VERSION 3.0.2)
+ else()
+   cmake_minimum_required(VERSION 2.8.12)
+ endif()
+ 
++project(ZeroMQ)
++
+ include(CheckIncludeFiles)
+ include(CheckCCompilerFlag)
+ include(CheckCXXCompilerFlag)
diff --git a/meta-oe/recipes-connectivity/zeromq/files/0003-set-upper-bound-in-cmake_minimum_required.patch b/meta-oe/recipes-connectivity/zeromq/files/0003-set-upper-bound-in-cmake_minimum_required.patch
new file mode 100644
index 0000000000..ecc218d51e
--- /dev/null
+++ b/meta-oe/recipes-connectivity/zeromq/files/0003-set-upper-bound-in-cmake_minimum_required.patch
@@ -0,0 +1,56 @@
+From b91a6201307b72beb522300366aad763d19b1456 Mon Sep 17 00:00:00 2001
+From: Min RK <benjaminrk@gmail.com>
+Date: Thu, 20 Mar 2025 14:51:18 +0100
+Subject: [PATCH] set upper bound in cmake_minimum_required
+
+setting an upper bound improves forward-compatibility as legacy version support is dropped
+
+- 3.5 compat is deprecated in 3.27 (2023), removed in 4.0 (2025)
+- 3.10 compat is deprecated in 3.31 (2024)
+
+Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
+Upstream-Status: Backport [b91a6201307b72beb522300366aad763d19b1456]
+---
+ CMakeLists.txt           | 4 ++--
+ tests/CMakeLists.txt     | 2 +-
+ unittests/CMakeLists.txt | 2 +-
+ 3 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e4ce8a3d..3ab2259e 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,9 +1,9 @@
+ # CMake build script for ZeroMQ
+ 
+ if(${CMAKE_HOST_SYSTEM_NAME} STREQUAL Darwin)
+-  cmake_minimum_required(VERSION 3.0.2)
++  cmake_minimum_required(VERSION 3.0.2...3.31)
+ else()
+-  cmake_minimum_required(VERSION 2.8.12)
++  cmake_minimum_required(VERSION 2.8.12...3.31)
+ endif()
+ 
+ project(ZeroMQ)
+diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
+index a8dfa8f2..eb59de29 100644
+--- a/tests/CMakeLists.txt
++++ b/tests/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ # CMake build script for ZeroMQ tests
+-cmake_minimum_required(VERSION "2.8.1")
++cmake_minimum_required(VERSION 2.8.1...3.31)
+ 
+ # On Windows: solution file will be called tests.sln
+ project(tests)
+diff --git a/unittests/CMakeLists.txt b/unittests/CMakeLists.txt
+index 64198eeb..58ea875b 100644
+--- a/unittests/CMakeLists.txt
++++ b/unittests/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ # CMake build script for ZeroMQ unit tests
+-cmake_minimum_required(VERSION "2.8.1")
++cmake_minimum_required(VERSION 2.8.1...3.31)
+ 
+ set(unittests
+     unittest_ypipe
diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.5.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.5.bb
index eb4ee2f4fc..5aa2013219 100644
--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.5.bb
+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.5.bb
@@ -8,6 +8,8 @@ PACKAGECONFIG[libsodium] = "-DWITH_LIBSODIUM=ON,-DWITH_LIBSODIUM=OFF, libsodium"
 
 SRC_URI = "http://github.com/zeromq/libzmq/releases/download/v${PV}/zeromq-${PV}.tar.gz \
     file://0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch \
+    file://0002-cmake_minimum_required-before-project.patch \
+    file://0003-set-upper-bound-in-cmake_minimum_required.patch \
     file://run-ptest \
 "
 SRC_URI[sha256sum] = "6653ef5910f17954861fe72332e68b03ca6e4d9c7160eb3a8de5a5a913bfab43"

