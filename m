Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 711BCD10377
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 03:29:22 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5221.1764127760865014565
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 19:29:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NeTkDidI;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764127760; x=1795663760;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RUcMXg0kiAhCoFUCJdOiQ5dny5dPbT9ubLCS30sISnk=;
  b=NeTkDidIMIVOfr4QnRc6wBZd+1OnuGUo68RuiDlMGpjj4FDBNki+WWly
   /UrMubj1vnefDLvokV6E6vwU0zOhM4ZM+F8HA/GREn8Se6yYneCnjwy8K
   IQn2pF1I5oJkF6bZAB++G0n2Rqm3jVeLt7QDD9K/7duItvPBPMQAO2Vi6
   /9MuL3x2ynpU2qXvMG7skoiACz0KYgFbRcCeOODui0tN/G3PJUmEDg6I/
   Bt6kIHDtKfB0deQXGARC5iYnNqtPkZVE6lpgCIxaSxvhs6sy4T+XxSkKN
   2OJLowZZWwL69HcwEVioEzclP+o8s2mUgO015GBwzpu1sOm/zJhzSmBgE
   Q==;
X-CSE-ConnectionGUID: Z8+nMhjwTIK25JT8OQzEpA==
X-CSE-MsgGUID: qZjlzdsHTBuV8rrlT/n6EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="221042708"
X-IronPort-AV: E=Sophos;i="6.20,227,1758553200"; 
   d="scan'208";a="221042708"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 12:29:19 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 1E6B5C00545
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 03:29:19 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id CB72314003E1
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 03:29:18 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id A91AE829F37
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 03:29:16 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] wxwidgets: upgrade 3.2.8 -> 3.3.1
Date: Wed, 26 Nov 2025 11:29:05 +0800
Message-ID: <20251126032906.4282-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 03:29:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122068

1.Changelog:
 https://github.com/wxWidgets/wxWidgets/releases/tag/v3.3.1

2.Update following patches for 3.3.1
 0002-fix-libdir-for-multilib.patch
 0003-create-links-with-relative-path.patch

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../0002-fix-libdir-for-multilib.patch        | 25 +++++++++++--------
 ...0003-create-links-with-relative-path.patch | 15 ++++++-----
 ...{wxwidgets_3.2.8.bb => wxwidgets_3.3.1.bb} |  6 ++---
 3 files changed, 26 insertions(+), 20 deletions(-)
 rename meta-oe/recipes-extended/wxwidgets/{wxwidgets_3.2.8.bb => wxwidgets_3.3.1.bb} (96%)

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0002-fix-libdir-for-multilib.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0002-fix-libdir-for-multilib.patch
index cd0417612f..bc6c4e6f54 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0002-fix-libdir-for-multilib.patch
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0002-fix-libdir-for-multilib.patch
@@ -15,6 +15,9 @@ Rebase for wxWidgets 3.2.1. Replace wxPLATFORM_LIB_DIR with LIB_SUFFIX
 in this patch that LIB_SUFFIX has been passed to cmake in cmake.bbclass.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+Update for 3.3.1
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
 ---
  CMakeLists.txt                         |  2 +-
  build/cmake/config.cmake               |  2 +-
@@ -23,7 +26,7 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  4 files changed, 9 insertions(+), 9 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index d6a4b49..9e86b87 100644
+index 6112fb7fac..42c0430598 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -43,7 +43,7 @@ include(build/cmake/policies.cmake NO_POLICY_SCOPE)
@@ -36,7 +39,7 @@ index d6a4b49..9e86b87 100644
  # parse the version number from wx/version.h and include in wxMAJOR_VERSION and wxMINOR_VERSION
  file(READ "${wxSOURCE_DIR}/include/wx/version.h" WX_VERSION_H_CONTENTS)
 diff --git a/build/cmake/config.cmake b/build/cmake/config.cmake
-index addd8d6..9ec6775 100644
+index fe6c0f84c7..6845aacbe0 100644
 --- a/build/cmake/config.cmake
 +++ b/build/cmake/config.cmake
 @@ -100,7 +100,7 @@ function(wx_write_config_inplace)
@@ -49,10 +52,10 @@ index addd8d6..9ec6775 100644
          )
  endfunction()
 diff --git a/build/cmake/install.cmake b/build/cmake/install.cmake
-index 202d054..e255e0b 100644
+index a373983043..225a112ca5 100644
 --- a/build/cmake/install.cmake
 +++ b/build/cmake/install.cmake
-@@ -44,11 +44,11 @@ if(WIN32_MSVC_NAMING)
+@@ -51,11 +51,11 @@ if(WIN32_MSVC_NAMING)
  else()
      install(
          DIRECTORY "${wxSETUP_HEADER_PATH}"
@@ -66,12 +69,12 @@ index 202d054..e255e0b 100644
          PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ
                      GROUP_EXECUTE GROUP_READ
                      WORLD_EXECUTE WORLD_READ
-@@ -57,13 +57,13 @@ else()
+@@ -64,13 +64,13 @@ else()
      install(DIRECTORY DESTINATION "bin")
      install(CODE "execute_process( \
          COMMAND ${CMAKE_COMMAND} -E create_symlink \
--        \"${CMAKE_INSTALL_PREFIX}/lib/wx/config/${wxBUILD_FILE_ID}\" \
-+        \"${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX}/wx/config/${wxBUILD_FILE_ID}\" \
+-        \"\$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/wx/config/${wxBUILD_FILE_ID}\" \
++        \"\$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX}/wx/config/${wxBUILD_FILE_ID}\" \
          \"\$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/wx-config\" \
          )"
      )
@@ -82,7 +85,7 @@ index 202d054..e255e0b 100644
  
  # find_package config file
  include(CMakePackageConfigHelpers)
-@@ -86,11 +86,11 @@ write_basic_package_version_file(
+@@ -93,11 +93,11 @@ write_basic_package_version_file(
  configure_package_config_file(
      "${wxSOURCE_DIR}/build/cmake/wxWidgetsConfig.cmake.in"
      "${projectConfig}"
@@ -97,10 +100,10 @@ index 202d054..e255e0b 100644
  
  # uninstall target
 diff --git a/build/cmake/lib/webview/CMakeLists.txt b/build/cmake/lib/webview/CMakeLists.txt
-index 2cb35e7..7977a84 100644
+index 84ba0351d7..e68ab16d1b 100644
 --- a/build/cmake/lib/webview/CMakeLists.txt
 +++ b/build/cmake/lib/webview/CMakeLists.txt
-@@ -146,7 +146,7 @@ if(WXGTK AND wxUSE_WEBVIEW_WEBKIT2)
+@@ -153,7 +153,7 @@ if(WXGTK AND wxUSE_WEBVIEW_WEBKIT2)
          ${WEBKIT2_LIBRARIES}
          )
  
@@ -110,5 +113,5 @@ index 2cb35e7..7977a84 100644
      wx_add_dependencies(wxwebview wxwebkit2_ext)
  endif()
 -- 
-2.49.0
+2.43.0
 
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0003-create-links-with-relative-path.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0003-create-links-with-relative-path.patch
index dbede0304f..f0d22ec56d 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0003-create-links-with-relative-path.patch
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0003-create-links-with-relative-path.patch
@@ -24,37 +24,40 @@ Create symlink with relative path to fix the issues.
 Upstream-Status: Pending
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+Update for 3.3.1.
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
 ---
  build/cmake/install.cmake        | 2 +-
  build/cmake/utils/CMakeLists.txt | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/build/cmake/install.cmake b/build/cmake/install.cmake
-index d3303faabb..c79e187f37 100644
+index 5a54fcb895..1dcd1b2886 100644
 --- a/build/cmake/install.cmake
 +++ b/build/cmake/install.cmake
-@@ -42,7 +42,7 @@ else()
+@@ -64,7 +64,7 @@ else()
      install(DIRECTORY DESTINATION "bin")
      install(CODE "execute_process( \
          COMMAND ${CMAKE_COMMAND} -E create_symlink \
--        \"${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX}/wx/config/${wxBUILD_FILE_ID}\" \
+-        \"\$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX}/wx/config/${wxBUILD_FILE_ID}\" \
 +        \"../lib${LIB_SUFFIX}/wx/config/${wxBUILD_FILE_ID}\" \
          \"\$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/wx-config\" \
          )"
      )
 diff --git a/build/cmake/utils/CMakeLists.txt b/build/cmake/utils/CMakeLists.txt
-index dbed8cc9b3..1dbc3261d3 100644
+index 15f4339ef9..1dbc3261d3 100644
 --- a/build/cmake/utils/CMakeLists.txt
 +++ b/build/cmake/utils/CMakeLists.txt
 @@ -40,7 +40,7 @@ if(wxUSE_XRC)
          # Don't use wx_install() here to preserve escaping.
          install(CODE "execute_process( \
              COMMAND ${CMAKE_COMMAND} -E create_symlink \
--            \"${CMAKE_INSTALL_PREFIX}/bin/${wxrc_output_name}${EXE_SUFFIX}\" \
+-            \"\$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/${wxrc_output_name}${EXE_SUFFIX}\" \
 +            \"./${wxrc_output_name}${EXE_SUFFIX}\" \
              \"\$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/wxrc${EXE_SUFFIX}\" \
              )"
          )
 -- 
-2.25.1
+2.43.0
 
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.3.1.bb
similarity index 96%
rename from meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb
rename to meta-oe/recipes-extended/wxwidgets/wxwidgets_3.3.1.bb
index fcb30b41b0..8e5c3e60c6 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.3.1.bb
@@ -18,7 +18,7 @@ DEPENDS += " \
     tiff \
 "
 
-SRC_URI = "gitsm://github.com/wxWidgets/wxWidgets.git;branch=3.2;protocol=https;tag=v${PV} \
+SRC_URI = "gitsm://github.com/wxWidgets/wxWidgets.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-wx-config.in-Disable-cross-magic-it-does-not-work-fo.patch \
            file://0002-fix-libdir-for-multilib.patch \
            file://0003-create-links-with-relative-path.patch \
@@ -27,7 +27,7 @@ SRC_URI = "gitsm://github.com/wxWidgets/wxWidgets.git;branch=3.2;protocol=https;
            file://0006-Fix-locale-on-musl.patch \
            file://0007-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch \
            "
-SRCREV = "8aef5f40b93958719771331ca03866b7b6fff6bf"
+SRCREV = "49c6810948f40c457e3d0848b9111627b5b61de5"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
@@ -110,7 +110,7 @@ do_install:append() {
     # fix host contamination
     sed -i -e "s#${STAGING_DIR_NATIVE}##g" \
            -e "s#${STAGING_DIR_TARGET}##g" \
-           ${D}${libdir}/wx/config/*-unicode-3.2 \
+           ${D}${libdir}/wx/config/*-unicode-3.3 \
            ${D}${libdir}/cmake/wxWidgets/wxWidgetsTargets.cmake
 }
 
-- 
2.43.0


