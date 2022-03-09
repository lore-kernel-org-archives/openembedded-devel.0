Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB65BC433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 23:29:01 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.3682.1646868540733361089
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Mar 2022 15:29:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 229NSt3a007065
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 9 Mar 2022 15:28:55 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 229NSs5R008187
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 9 Mar 2022 15:28:55 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 9 Mar 2022 15:28:54 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 9 Mar 2022 15:28:54 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 9 Mar 2022 15:28:53 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/2] wxwidgets: fix libdir for multilib
Date: Thu, 10 Mar 2022 07:28:50 +0800
Message-ID: <20220309232851.14147-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Mar 2022 23:29:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95916

From: Kai Kang <kai.kang@windriver.com>

wxWidgets hardcodes libdir with 'lib' and does not support multilib
which will change it. Respect variable wxPLATFORM_LIB_DIR to support
libdir be configurable.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../wxwidgets/fix-libdir-for-multilib.patch   | 83 +++++++++++++++++++
 .../wxwidgets/wxwidgets_git.bb                |  2 +
 2 files changed, 85 insertions(+)
 create mode 100644 meta-oe/recipes-extended/wxwidgets/wxwidgets/fix-libdir-for-multilib.patch

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/fix-libdir-for-multilib.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/fix-libdir-for-multilib.patch
new file mode 100644
index 000000000..637e54b2b
--- /dev/null
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/fix-libdir-for-multilib.patch
@@ -0,0 +1,83 @@
+wxWidgets hardcodes libdir with 'lib' and does not support multilib which will
+change it. Respect variable wxPLATFORM_LIB_DIR to support libdir be configurable.
+
+Upstream-Status: Pending
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ CMakeLists.txt              | 2 +-
+ build/cmake/config.cmake    | 2 +-
+ build/cmake/functions.cmake | 6 +++---
+ build/cmake/install.cmake   | 6 +++---
+ 4 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e30d3db934..8f93c57108 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -37,7 +37,7 @@ include(build/cmake/policies.cmake NO_POLICY_SCOPE)
+ # Initialize variables for quick access to wx root dir in sub dirs
+ set(wxSOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR})
+ set(wxBINARY_DIR ${CMAKE_BINARY_DIR})
+-set(wxOUTPUT_DIR ${wxBINARY_DIR}/lib)
++set(wxOUTPUT_DIR ${wxBINARY_DIR}/lib${wxPLATFORM_LIB_DIR})
+ 
+ # parse the version number from wx/version.h and include in wxMAJOR_VERSION and wxMINOR_VERSION
+ file(READ include/wx/version.h WX_VERSION_H_CONTENTS)
+diff --git a/build/cmake/config.cmake b/build/cmake/config.cmake
+index 6978cc2725..ed16ee5635 100644
+--- a/build/cmake/config.cmake
++++ b/build/cmake/config.cmake
+@@ -52,7 +52,7 @@ function(wx_write_config_inplace)
+     execute_process(
+         COMMAND
+         ${CMAKE_COMMAND} -E create_symlink
+-        "lib/wx/config/inplace-${TOOLCHAIN_FULLNAME}"
++        "lib${wxPLATFORM_LIB_DIR}/wx/config/inplace-${TOOLCHAIN_FULLNAME}"
+         "${CMAKE_CURRENT_BINARY_DIR}/wx-config"
+         )
+ endfunction()
+diff --git a/build/cmake/functions.cmake b/build/cmake/functions.cmake
+index c33dd3946c..51e47e05b3 100644
+--- a/build/cmake/functions.cmake
++++ b/build/cmake/functions.cmake
+@@ -78,9 +78,9 @@ function(wx_set_common_target_properties target_name)
+     cmake_parse_arguments(wxCOMMON_TARGET_PROPS "DEFAULT_WARNINGS" "" "" ${ARGN})
+ 
+     set_target_properties(${target_name} PROPERTIES
+-        LIBRARY_OUTPUT_DIRECTORY "${wxOUTPUT_DIR}${wxPLATFORM_LIB_DIR}"
+-        ARCHIVE_OUTPUT_DIRECTORY "${wxOUTPUT_DIR}${wxPLATFORM_LIB_DIR}"
+-        RUNTIME_OUTPUT_DIRECTORY "${wxOUTPUT_DIR}${wxPLATFORM_LIB_DIR}"
++        LIBRARY_OUTPUT_DIRECTORY "${wxOUTPUT_DIR}"
++        ARCHIVE_OUTPUT_DIRECTORY "${wxOUTPUT_DIR}"
++        RUNTIME_OUTPUT_DIRECTORY "${wxOUTPUT_DIR}"
+         )
+ 
+     if(MSVC)
+diff --git a/build/cmake/install.cmake b/build/cmake/install.cmake
+index 968dff859e..c850c51844 100644
+--- a/build/cmake/install.cmake
++++ b/build/cmake/install.cmake
+@@ -33,11 +33,11 @@ if(MSVC)
+ else()
+     wx_install(
+         DIRECTORY "${wxSETUP_HEADER_PATH}"
+-        DESTINATION "lib/wx/include")
++        DESTINATION "lib${wxPLATFORM_LIB_DIR}/wx/include")
+ 
+     wx_install(
+         FILES "${wxOUTPUT_DIR}/wx/config/${wxBUILD_FILE_ID}"
+-        DESTINATION "lib/wx/config"
++        DESTINATION "lib${wxPLATFORM_LIB_DIR}/wx/config"
+         PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ
+                     GROUP_EXECUTE GROUP_READ
+                     WORLD_EXECUTE WORLD_READ
+@@ -46,7 +46,7 @@ else()
+     install(DIRECTORY DESTINATION "bin")
+     install(CODE "execute_process( \
+         COMMAND ${CMAKE_COMMAND} -E create_symlink \
+-        ${CMAKE_INSTALL_PREFIX}/lib/wx/config/${wxBUILD_FILE_ID} \
++        ${CMAKE_INSTALL_PREFIX}/lib${wxPLATFORM_LIB_DIR}/wx/config/${wxBUILD_FILE_ID} \
+         ${CMAKE_INSTALL_PREFIX}/bin/wx-config \
+         )"
+     )
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb
index 404ab2605..724bc0084 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb
@@ -24,6 +24,7 @@ DEPENDS += " \
 SRC_URI = " \
     git://github.com/wxWidgets/wxWidgets.git;branch=master;protocol=https \
     file://0001-wx-config.in-Disable-cross-magic-it-does-not-work-fo.patch \
+    file://fix-libdir-for-multilib.patch \
 "
 PV = "3.1.4"
 SRCREV= "6cdaedd42ba59331b3dc4ead50e0bac76ae14c19"
@@ -37,6 +38,7 @@ EXTRA_OECMAKE += " \
     -DwxUSE_LIBPNG=sys \
     -DwxUSE_LIBTIFF=sys \
     -DwxUSE_REGEX=builtin \
+    -DwxPLATFORM_LIB_DIR=${@d.getVar('baselib').replace('lib', '')} \
 "
 EXTRA_OECMAKE:append:libc-musl = " \
     -DHAVE_LOCALE_T=OFF \
-- 
2.17.1


