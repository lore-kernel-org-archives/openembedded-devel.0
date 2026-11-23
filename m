Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48557.1795411907143214021
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=lyv/2Ezt;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-385c497bf94so1285772eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411906; x=1796016706; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qBIsBNlRVoW5alJOHL2SHu9l+XZecnZ1SJxg/xVajRo=;
        b=lyv/2Eztq/wyPReRwmepNFKnhVgHOgPa69ukzAs5hEtvEG2xXSKiqhorZ+8vh2ylrJ
         aHZ9AXDhEfUqyGfzWjd5sK2mNZByEjEcJvWejFAO2EcDKEsYK4cioXeH/ibWigcl7IdL
         q1FCRSq7pvaEoAPNqmecYLkd5MzgNg3t6COdvdkMbtRRUyB52GgoWtH8cYzlzVLhqFBa
         ruf8z1wtqXt4N8/AbqvCLWtHjYQIjy4g83J/DAoMVbdql7JJoK/unPgRjxAKXv1Q4A73
         83PeGY0FWoyIFxu8BnRTNAh6wyBKpe3+ReSLsctke/TNV7TX1fUhbBLou7ktU6SviJ0v
         q1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411906; x=1796016706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qBIsBNlRVoW5alJOHL2SHu9l+XZecnZ1SJxg/xVajRo=;
        b=h3vBAS6O1feqNnCXLGv9fYdBU82E6aZ2MVAykL1X6fqWfIUICzAT4/4GKbgHaEmaLs
         Gk1WTqp3LdEEeqEn3kxbl1pThvvWNnrTy10w2mF/eeAJQsg7M1CaSyypiZ8Y1t/cb1Gc
         bE+lvJd3NJnD1jrdNfm8N0++u4tiQX1f0+rAgbESx9RrkY31hiNKOLBmjkLhkr0D7R0O
         bXAIjH7Dbkf7xIwy8lyRxOfKPnJCPSlfzOaHpQSGaWqdfm+WE3b94dMeE423VTl7/p9L
         GpBJd4bytrWtCEuNq0hmnRMVYEiL28GPFtJ+95vbBeMyoj01vwDZftTCBnsm7tEjPMnZ
         JMwA==
X-Gm-Message-State: APuU4Z9alytgnCx+xAl7pvXqLUdDZj6H/zWJWJxsPRLT+YgXF5Bsfu5m
	NhwMPdqXGE2mEbj+NtHuOwX7zObT8cCYMWWa+ceDma+HjEhmLM2NARnRP24JKLKJUtA=
X-Gm-Gg: AZFdTZfaAe4oOhUJbmFd68zTgcHtw8jHUShZZGTqyHGUv7fFNG+mGWBTxkZWHBDj1bz
	cTcLplkYn+RdeFqaxplUWbgyYAdDpLtflgoR4ur+ZHr1MQOcIwfdQclVLx4IYBUTbpAXrtkj6qp
	EtG00iFAIpln8fPZ/o+4sdGr4uHTUQkUKekE5XMXvW9rHJK1tYl4CbOig/cDbWnyRKQX1cvq5aB
	TaHmusS2hCazlZD5tu8ZdlG/N+SonFdm3kUlhrkmKUad9NzRryEjZoTzPa7KHoZGDibD4/1QoVW
	/yyapRpK9kcpeZEiMDazPyeYyZe5AqcOUDxD/+uT39iIv4przsGl3CZLnHL/HYT32kvwjmA4Fze
	lP2qJr6stc5sKBV6hiTReALwIy2PMr2aKMCykV96G9ibtrZnqiiE741OccUpwzI//+TIMXCZl33
	2DF9VDgfftu7qJxX1nSp+HSBOSEmXOOZPLKKcR/nAn383nFvWTYTDkjXnswuJLeG70WiHSl+O25
	8cd+OagTc/9nKbeWgaY9m/iVrMtgyWkL/buYxS2XaFR/bKCaDFdpABmf2rBEE8GsrbfxEA7S5lZ
	cmMZgjzHOxx5kGIRM+jZxKvwhLBw/8FaIsE7XqIRBjFP8KtGoM89n83qknXDAWXszm2yjGV7ci4
	xvk8+zSdAgmuN2204aep9J2K2IHTufO7Di7GiI0GvKeDrofwrt0wgtjuKSzrOsHfT/MzPwVoRdC
	2IOOHW4w8tCFjIuv5aY7eVZLwUFaGN9IV3FkQ0pIjkygxjDn26JUziLE4NO5p+A+kXSctpUIKs3
	tL33MQJMMroLuatZzYVKdV1gPzHijPQCnZAoXbRt78oS726WH5ItzdTZBkPs2h7yX0uC7aEtiGa
	aD4Pbs+4bpBCJCojeNxD4H1r4A==
X-Received: by 2002:a05:7301:f02:b0:384:ce59:5e21 with SMTP id 5a478bee46e88-3856f6503d8mr11146471eec.32.1795411906460;
        Sun, 22 Nov 2026 21:31:46 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 16/16] python3-pybind11-json: upgrade 0.2.15 -> 0.3.0
Date: Sun, 22 Nov 2026 21:29:46 -0800
Message-ID: <20261123052953.3658549-90-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132877
Content-Type: text/plain; charset="utf-8"

Port to pybind11 3.1, install a pkg-config file, allow newer CMake
versions (fixes use with CMake that dropped < 3.5 support) and add
gtest as a test dependency.

Drop the pkg-config patch; it is merged in 0.3.0.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...d4df929bc9d0882298fc1f85ecf589456ff6.patch | 59 -------------------
 ...2.15.bb => python3-pybind11-json_0.3.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 61 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pybind11-json/d72ad4df929bc9d0882298fc1f85ecf589456ff6.patch
 rename meta-python/recipes-devtools/python/{python3-pybind11-json_0.2.15.bb => python3-pybind11-json_0.3.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11-json/d72ad4df929bc9d0882298fc1f85ecf589456ff6.patch b/meta-python/recipes-devtools/python/python3-pybind11-json/d72ad4df929bc9d0882298fc1f85ecf589456ff6.patch
deleted file mode 100644
index c216ce66cb..0000000000
--- a/meta-python/recipes-devtools/python/python3-pybind11-json/d72ad4df929bc9d0882298fc1f85ecf589456ff6.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From d72ad4df929bc9d0882298fc1f85ecf589456ff6 Mon Sep 17 00:00:00 2001
-From: Daniel Lundberg Pedersen <dlp@qtec.com>
-Date: Thu, 23 Jan 2025 11:48:16 +0100
-Subject: [PATCH] CMakeLists.txt: Add support for pkg-config
-
-Create and install pkg-config (.pc) file for dependency detection.
-Upstream-Status: Submitted [https://github.com/pybind/pybind11_json/pull/75]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- CMakeLists.txt      | 24 ++++++++++++++++++++++++
- pybind11_json.pc.in |  7 +++++++
- 2 files changed, 31 insertions(+)
- create mode 100644 pybind11_json.pc.in
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index c0ef675..a92240a 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -133,3 +133,27 @@ install(FILES ${CMAKE_CURRENT_BINARY_DIR}/CMakeFiles/${PROJECT_NAME}Config.cmake
- install(EXPORT ${PROJECT_NAME}-targets
-         FILE ${PROJECT_NAME}Targets.cmake
-         DESTINATION ${PYBIND11_JSON_CMAKECONFIG_INSTALL_DIR})
-+
-+# pkg-config support
-+if(NOT prefix_for_pc_file)
-+if(IS_ABSOLUTE "${CMAKE_INSTALL_DATAROOTDIR}")
-+  set(prefix_for_pc_file "${CMAKE_INSTALL_PREFIX}")
-+else()
-+  set(pc_datarootdir "${CMAKE_INSTALL_DATAROOTDIR}")
-+  if(CMAKE_VERSION VERSION_LESS 3.20)
-+    set(prefix_for_pc_file "\${pcfiledir}/..")
-+    while(pc_datarootdir)
-+      get_filename_component(pc_datarootdir "${pc_datarootdir}" DIRECTORY)
-+      string(APPEND prefix_for_pc_file "/..")
-+    endwhile()
-+  else()
-+    cmake_path(RELATIVE_PATH CMAKE_INSTALL_PREFIX BASE_DIRECTORY CMAKE_INSTALL_DATAROOTDIR
-+               OUTPUT_VARIABLE prefix_for_pc_file)
-+  endif()
-+endif()
-+endif()
-+set(includedir_for_pc_file "\${prefix}/${CMAKE_INSTALL_INCLUDEDIR}")
-+configure_file("${CMAKE_CURRENT_SOURCE_DIR}/pybind11_json.pc.in"
-+             "${CMAKE_CURRENT_BINARY_DIR}/pybind11_json.pc" @ONLY)
-+install(FILES "${CMAKE_CURRENT_BINARY_DIR}/pybind11_json.pc"
-+      DESTINATION "${CMAKE_INSTALL_DATAROOTDIR}/pkgconfig/")
-diff --git a/pybind11_json.pc.in b/pybind11_json.pc.in
-new file mode 100644
-index 0000000..da5bfde
---- /dev/null
-+++ b/pybind11_json.pc.in
-@@ -0,0 +1,7 @@
-+prefix=@prefix_for_pc_file@
-+includedir=@includedir_for_pc_file@
-+
-+Name: @PROJECT_NAME@
-+Description: Using nlohmann::json with pybind11
-+Version: @PROJECT_VERSION@
-+Cflags: -I${includedir}
diff --git a/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.15.bb b/meta-python/recipes-devtools/python/python3-pybind11-json_0.3.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-pybind11-json_0.2.15.bb
rename to meta-python/recipes-devtools/python/python3-pybind11-json_0.3.0.bb
index 2a030af988..c1ca598008 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.15.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11-json_0.3.0.bb
@@ -2,9 +2,8 @@ SUMMARY = "Using nlohmann::json with pybind11"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0e25ff0ec476d06d366439e1120cce98"
 
-SRCREV = "32043f433ed987b2c2ce99d689ec337bcbd4ba95"
+SRCREV = "94ae3ad9693cc572c673938d84044dfd6fe22532"
 SRC_URI = "git://github.com/pybind/pybind11_json;branch=master;protocol=https \
-           file://d72ad4df929bc9d0882298fc1f85ecf589456ff6.patch \
            file://0001-CMakeLists-drop-PYTHON_INCLUDE_DIRS-from-interface.patch"
 
 DEPENDS += "nlohmann-json python3-pybind11"
