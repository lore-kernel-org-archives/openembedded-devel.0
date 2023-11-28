Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E90C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 08:23:44 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.28304.1701159818430602475
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 00:23:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="129234715"
X-IronPort-AV: E=Sophos;i="6.04,233,1695654000"; 
   d="scan'208";a="129234715"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 17:23:35 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C7391E8BEE
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:23:33 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id EFB0ED9471
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:23:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id E30232FC80DE;
	Tue, 28 Nov 2023 17:23:31 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] paho-mqtt-cpp: upgrade 1.2.0 -> 1.3.1
Date: Tue, 28 Nov 2023 16:21:32 +0800
Message-Id: <1701159692-27917-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28024.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28024.006
X-TMASE-Result: 10--10.763800-10.000000
X-TMASE-MatchedRID: 242WXRytjV6jz0nOeth/yTo39wOA02LhlEDhvi2wR879wRnyxuPjhFYM
	JR3dIrh2bSL9AN4UjlsW8e1/0climC6FE0YAA+W+aDCzqDR7DPabOwnwKxlhTiS30GKAkBxWbC9
	dOQZ1jaenTuBLUfGG3PYwTPd2UAm4sEBAuoaUqK+5x7uAXGEprdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpi9UJGBT182BtxonXTOXZ8C6Bw6BKdk7MxuOJ1fSR6quNZB3H9yZgJpKm7P
	pyf7RSRVGYobNhHtFJf6ouP2TOvj+eKNmNNd29X3IFFT9wqfr0ejl8XURi8fKQ8WkCQarTjkWNC
	cn0XQOJnxLctFp+qhS5rYfHE0OO95UcZtwNsCroURSScn+QSXgGlEJORGTlJ+gtHj7OwNO2+Ijs
	EEOIzYoU5J2sJKfC/3W8YeHXPOgrPpGvq8bqnvtNrhpVn7Uv+
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 08:23:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107075

From: Wang Mingyu <wangmy@fujitsu.com>

0001-cmake-Use-CMAKE_INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch
refreshed for 1.3.1

License-Update: Updated license to EPL-v2.0

Changelog:
============
-#462 Fix version string for version v1.3.x
-Fixed building and using library as DLL on Windows with MSVC
-Updated License to Eclipse Public License v2.0
-Updated create and connect options to better deal with MQTT protocol version
-Defaulting connect version to v5 if specified in create options.
-Added a topic_filter class to match a single filter to specific topics.
-Added a topic_matcher class to create a collection of items in a trie structure
 that can contain items tied to topic filters. (Useful for queues or callbacks
 per-subscription topic).
-Minor tweaks to prepare for C++20
-Support for Catch2 v3.x for unit tests (v2.x also still supported).
-Changed the sample apps to use the newer "mqtt://" schemas.
-Connect option initializers for v5 and WebSockets.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch | 26 ++++++++++++-------
 ...tt-cpp_1.2.0.bb => paho-mqtt-cpp_1.3.1.bb} |  8 +++---
 2 files changed, 21 insertions(+), 13 deletions(-)
 rename meta-oe/recipes-connectivity/paho-mqtt-cpp/{paho-mqtt-cpp_1.2.0.bb => paho-mqtt-cpp_1.3.1.bb} (73%)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp/0001-cmake-Use-CMAKE_INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp/0001-cmake-Use-CMAKE_INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch
index 2436b36f2..fba9a8767 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp/0001-cmake-Use-CMAKE_INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch
+++ b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp/0001-cmake-Use-CMAKE_INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch
@@ -8,7 +8,7 @@ This ensures the install paths are not hardcoded.
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
 Upstream-Status: Pending
-
+---
  cmake/CMakeLists.txt       | 4 ++--
  src/samples/CMakeLists.txt | 4 ++--
  2 files changed, 4 insertions(+), 4 deletions(-)
@@ -33,19 +33,27 @@ index a9f8908..7eadc60 100644
 -    DESTINATION lib/cmake/${package_name})
 +    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${package_name})
 diff --git a/src/samples/CMakeLists.txt b/src/samples/CMakeLists.txt
-index 953f5dc..d26729a 100644
+index 3ca0a75..c915cd5 100644
 --- a/src/samples/CMakeLists.txt
 +++ b/src/samples/CMakeLists.txt
-@@ -103,7 +103,7 @@ endif()
+@@ -71,7 +71,7 @@ endforeach()
  
  ## install binaries
- install(TARGETS ${INSTALL_TARGETS} EXPORT PahoMqttCppSamples
--	RUNTIME DESTINATION bin
--	LIBRARY DESTINATION lib
-+	RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
-+	LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
+ install(TARGETS ${EXECUTABLES} EXPORT PahoMqttCppSamples
+-  RUNTIME DESTINATION bin
++  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  )
  
+ ## Build the SSL/TLS samples, if selected
+@@ -89,7 +89,7 @@ if(PAHO_WITH_SSL)
+   endforeach()
+ 
+   install(TARGETS ${SSL_EXECUTABLES} EXPORT PahoMqttCppSamples
+-    RUNTIME DESTINATION bin
++    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
+   )
+ endif()
+ 
 -- 
-2.35.1
+2.34.1
 
diff --git a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.2.0.bb b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.3.1.bb
similarity index 73%
rename from meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.2.0.bb
rename to meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.3.1.bb
index bb5aa6907..1e1e92339 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.2.0.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.3.1.bb
@@ -2,18 +2,18 @@ SUMMARY = "Paho MQTT - C++ libraries for the MQTT and MQTT-SN protocols"
 DESCRIPTION = "Client implementation of open and standard messaging protocols for Machine-to-Machine (M2M) and Internet of Things (IoT)."
 HOMEPAGE = "http://www.eclipse.org/paho/"
 SECTION = "console/network"
-LICENSE = "EPL-1.0 | EDL-1.0"
+LICENSE = "EPL-2.0 | EDL-1.0"
 
 LIC_FILES_CHKSUM = " \
-    file://src/mqtt/message.h;beginline=9;endline=18;md5=5eec304e6066523386c222963ceeb6ff \
+    file://src/mqtt/message.h;beginline=9;endline=18;md5=c5ceecf5ab99d44dcfaaabdce289071b \
     file://edl-v10;md5=3adfcc70f5aeb7a44f3f9b495aa1fbf3 \
-    file://epl-v10;md5=659c8e92a40b6df1d9e3dccf5ae45a08 \
+    file://epl-v20;md5=d9fc0efef5228704e7f5b37f27192723 \
 "
 
 SRC_URI = "git://github.com/eclipse/paho.mqtt.cpp;protocol=https;branch=master \
            file://0001-cmake-Use-CMAKE_INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch \
 "
-SRCREV = "33921c8b68b351828650c36816e7ecf936764379"
+SRCREV = "4691652479bb4b398c7b81bde639482b164ae6d6"
 
 DEPENDS = "openssl paho-mqtt-c"
 
-- 
2.34.1


