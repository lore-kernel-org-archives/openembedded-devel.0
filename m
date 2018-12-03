Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 36C536B5AA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Dec 2018 20:13:02 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id e5so7022917plb.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2018 12:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YwmpYYnCZLWl0zIvbR8a6zp5JwtDKijT5XYfP+FE6bs=;
	b=WRVGzB3tJOKWvf46nOp7jtlvRfZnFkAygI2xQ5JBkR2jT8fiFLs7+IONNisZ/4x6jZ
	nIhbvpbVMKkiSGTMICT5jZMVQ/kq32hWrawxctS4Cp2xKJXtGIz08DaOcD4q2jAbWaJV
	pvSds68LS9p8Haq03UufB86djEq24Vn96FBqM45Qwv4Jc3v6aNQWZqDYW1Aq+AJkSDve
	seMxXzfwJMhid5UmKwDClSpW8fhY+jr5owRnX6+laf+y1UcwCOFi8Sj7jEpG9wc+xSTb
	92HGmIcn99x43sZbuiRr+dyOqVmkjhOX1bw4DcQwKSF+fvAgQukok7ha/NkOO8qbl1m/
	oYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YwmpYYnCZLWl0zIvbR8a6zp5JwtDKijT5XYfP+FE6bs=;
	b=AgrqrnbHVCz6y/bmQVA8gAzFR/DhzgWu2WrcxZ6SjRAgOhJqahTALAigLMoL9SAhG3
	JGZI/0MZhDdIx4pzsVhh0VV1hJyTjLjh68ZQryHAIl9mlK/bgEROH3cgL7g/FVCN+9xa
	YITTzGwNwekZpFNTHiFxXTK4ItVoYKVW/2KmJ9n4KWzd/6joapTNrRwcV0Zl3AfMDdAA
	yliZ3OKjo6KiDUFvBv8UoyEITkLSnpM5tb1jaH1dQTiMMHQmJcS3vFn2kByUSiWlOGHF
	o8OBHbWiLf9bUnZISrCXPCRUIPUDkYQXi4DSYGGbcK9snbrTA8O/k3TlY9oRlDeWxmx0
	3LUg==
X-Gm-Message-State: AA+aEWZvXOxgLVBGOPwWjH9cJM3HSGQask3Kw3sPVEzp4+Vqlc5gN0ZD
	6S/ynxBcGS7uoT3cISGi+g3htih4PLc=
X-Google-Smtp-Source: AFSGD/XTAFPAcRQ9NYQGA1jcxkYiBJw3d0ZBOawe6hHlXCFPGXD+8Kjwmo4/fvmwYMybgpoxVPJltQ==
X-Received: by 2002:a17:902:ba8b:: with SMTP id
	k11mr17180422pls.177.1543867982544; 
	Mon, 03 Dec 2018 12:13:02 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::5f84])
	by smtp.gmail.com with ESMTPSA id
	z191sm16769677pgd.74.2018.12.03.12.13.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Dec 2018 12:13:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Dec 2018 12:12:49 -0800
Message-Id: <20181203201250.23144-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] freerdp: Update to 2.0.0-rc4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Dec 2018 20:13:02 -0000
Content-Transfer-Encoding: 8bit

Drop backports which are now upstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-gstreamer-1.0-detection.patch    | 27 -------------------
 ...pr-makecert-Build-with-install-RPATH.patch | 13 ++++-----
 .../recipes-support/freerdp/freerdp_git.bb    |  4 +--
 3 files changed, 7 insertions(+), 37 deletions(-)
 delete mode 100644 meta-oe/recipes-support/freerdp/freerdp/0001-Fix-gstreamer-1.0-detection.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-gstreamer-1.0-detection.patch b/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-gstreamer-1.0-detection.patch
deleted file mode 100644
index a567cba925..0000000000
--- a/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-gstreamer-1.0-detection.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 368989526c32cdf9d680a397fede3cb773fa2609 Mon Sep 17 00:00:00 2001
-From: Mike Gilbert <floppym@gentoo.org>
-Date: Fri, 28 Jul 2017 16:31:41 -0400
-Subject: [PATCH] Fix gstreamer-1.0 detection
-
-Upstream State: Backport
-
----
- cmake/FindGStreamer_1_0.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cmake/FindGStreamer_1_0.cmake b/cmake/FindGStreamer_1_0.cmake
-index 3aa8fc6..6fbc0ec 100644
---- a/cmake/FindGStreamer_1_0.cmake
-+++ b/cmake/FindGStreamer_1_0.cmake
-@@ -59,7 +59,7 @@ macro(FIND_GSTREAMER_COMPONENT _component_prefix _pkgconfig_name _library)
- 
-     string(REGEX MATCH "(.*)>=(.*)" _dummy "${_pkgconfig_name}")
-     if ("${CMAKE_MATCH_2}" STREQUAL "")
--        pkg_check_modules(PC_${_component_prefix} "${_pkgconfig_name} >= ${GStreamer_FIND_VERSION}")
-+        pkg_check_modules(PC_${_component_prefix} "${_pkgconfig_name} >= ${GSTREAMER_1_0_MINIMUM_VERSION}")
-     else ()
-         pkg_check_modules(PC_${_component_prefix} ${_pkgconfig_name})
-     endif ()
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-support/freerdp/freerdp/winpr-makecert-Build-with-install-RPATH.patch b/meta-oe/recipes-support/freerdp/freerdp/winpr-makecert-Build-with-install-RPATH.patch
index 0d7dcc28d7..0f6f575d02 100644
--- a/meta-oe/recipes-support/freerdp/freerdp/winpr-makecert-Build-with-install-RPATH.patch
+++ b/meta-oe/recipes-support/freerdp/freerdp/winpr-makecert-Build-with-install-RPATH.patch
@@ -12,13 +12,13 @@ Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
  winpr/tools/makecert-cli/CMakeLists.txt | 3 +++
  1 file changed, 3 insertions(+)
 
-diff --git a/winpr/tools/makecert-cli/CMakeLists.txt b/winpr/tools/makecert-cli/CMakeLists.txt
-index 74afa09..8d00ef1 100644
---- a/winpr/tools/makecert-cli/CMakeLists.txt
-+++ b/winpr/tools/makecert-cli/CMakeLists.txt
+Index: git/winpr/tools/makecert-cli/CMakeLists.txt
+===================================================================
+--- git.orig/winpr/tools/makecert-cli/CMakeLists.txt
++++ git/winpr/tools/makecert-cli/CMakeLists.txt
 @@ -44,6 +44,9 @@ set(${MODULE_PREFIX}_LIBS winpr-tools)
  
- target_link_libraries(${MODULE_NAME} ${${MODULE_PREFIX}_LIBS})
+ target_link_libraries(${MODULE_NAME} ${${MODULE_PREFIX}_LIBS} winpr)
  
 +set_target_properties(${MODULE_NAME} PROPERTIES
 +       BUILD_WITH_INSTALL_RPATH 1)
@@ -26,6 +26,3 @@ index 74afa09..8d00ef1 100644
  set_property(TARGET ${MODULE_NAME} PROPERTY FOLDER "WinPR/Tools")
  
  install(TARGETS ${MODULE_NAME} DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT tools EXPORT WinPRTargets)
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/recipes-support/freerdp/freerdp_git.bb
index 88aec9c415..373c4979fd 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
@@ -13,10 +13,10 @@ inherit pkgconfig cmake gitpkgv
 PV = "2.0.0+gitr${SRCPV}"
 PKGV = "${GITPKGVTAG}"
 
-SRCREV = "1648deb435ad52206f7aa2afe4b4dff71d9329bc"
+# 2.0.0-rc4
+SRCREV = "e21b72c95f857817b4b32b5ef5406355c005a9e8"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git \
     file://winpr-makecert-Build-with-install-RPATH.patch \
-    file://0001-Fix-gstreamer-1.0-detection.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.19.2


