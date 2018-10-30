Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id EBE2B745AD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 13:30:15 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id w9UDUFhX019036
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 14:30:15 +0100
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.76.154])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id w9UDUFvw008130;
	Tue, 30 Oct 2018 14:30:15 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 3420610D47AD;
	Tue, 30 Oct 2018 14:30:15 +0100 (CET)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Oct 2018 14:29:56 +0100
Message-Id: <20181030132957.32537-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH 1/2] libyui: make resulting cmake config relocatable
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
X-List-Received-Date: Tue, 30 Oct 2018 13:30:16 -0000

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 ...0001-Use-relative-install-paths-for-CMake.patch | 130 +++++++++++++++++++++
 meta-oe/recipes-graphics/libyui/libyui_git.bb      |   1 +
 2 files changed, 131 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libyui/libyui/0001-Use-relative-install-paths-for-CMake.patch

diff --git a/meta-oe/recipes-graphics/libyui/libyui/0001-Use-relative-install-paths-for-CMake.patch b/meta-oe/recipes-graphics/libyui/libyui/0001-Use-relative-install-paths-for-CMake.patch
new file mode 100644
index 000000000..11a1678a4
--- /dev/null
+++ b/meta-oe/recipes-graphics/libyui/libyui/0001-Use-relative-install-paths-for-CMake.patch
@@ -0,0 +1,130 @@
+From d24c2516ae25d0ee180c1020e52114ea32230585 Mon Sep 17 00:00:00 2001
+From: Pascal Bach <pascal.bach@siemens.com>
+Date: Mon, 29 Oct 2018 18:03:43 +0100
+Subject: [PATCH] Use relative install paths for CMake
+
+Files are installed via a special _PREFIX variant of the INSTALL_???_DIR
+variable which is an absolute path.
+
+This not only is redundant if CMAKE_INTALL_PREFIX is set but it even causes
+the resulting Config.cmake to be non relocatable. This means it contains absolute
+paths to the build host. This is a problem for cross compilation in Yocto.
+
+This change gets rid of the absolute path and removes the no longer needed
+_PREFIX variants.
+
+Upstream-Status: Submitted [https://github.com/libyui/libyui/pull/140]
+Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
+---
+ buildtools/LibyuiCommon.cmake | 35 ++++++++++++++---------------------
+ 1 file changed, 14 insertions(+), 21 deletions(-)
+
+diff --git a/buildtools/LibyuiCommon.cmake b/buildtools/LibyuiCommon.cmake
+index e6fbefd..5e2fc0d 100644
+--- a/buildtools/LibyuiCommon.cmake
++++ b/buildtools/LibyuiCommon.cmake
+@@ -258,13 +258,6 @@ MACRO( SET_ENVIRONMENT )	# setup the environment vars
+ 
+   SET( INSTALL_DOC_DIR "${DOC_DIR}" )
+ 
+-  FOREACH( p "DOC" LIB INCLUDE CMAKE PKGCONFIG BUILDTOOLS )
+-    SET( var "INSTALL_${p}_DIR" )
+-    IF( NOT IS_ABSOLUTE "${${var}}" )
+-      SET( ${var}_PREFIX "${YPREFIX}/${${var}}" )
+-    ENDIF( NOT IS_ABSOLUTE "${${var}}" )
+-  ENDFOREACH()
+-
+ ENDMACRO( SET_ENVIRONMENT )
+ 
+ MACRO( SET_SONAME )
+@@ -359,7 +352,7 @@ MACRO( SET_AUTODOCS )		# looks for doxygen, dot and latex and setup autodocs acc
+       IF( INSTALL_DOCS OR DOCS_ONLY )
+         INSTALL(
+           FILES "${CMAKE_BINARY_DIR}/doc/latex/refman.pdf"
+-          DESTINATION "${INSTALL_DOC_DIR_PREFIX}"
++          DESTINATION "${INSTALL_DOC_DIR}"
+         )
+       ENDIF( INSTALL_DOCS OR DOCS_ONLY )
+ 
+@@ -379,7 +372,7 @@ MACRO( SET_AUTODOCS )		# looks for doxygen, dot and latex and setup autodocs acc
+       FOREACH( p css gif html jpg js png tag )
+         INSTALL(
+           DIRECTORY "${CMAKE_BINARY_DIR}/doc/html"
+-          DESTINATION "${INSTALL_DOC_DIR_PREFIX}"
++          DESTINATION "${INSTALL_DOC_DIR}"
+           FILES_MATCHING PATTERN "*.${p}"
+         )
+       ENDFOREACH()
+@@ -638,32 +631,32 @@ MACRO( SET_INSTALL_TARGET )
+ 
+ INSTALL(
+   EXPORT ${PROJECTNAME_UC}LibraryDepends
+-  DESTINATION "${INSTALL_CMAKE_DIR_PREFIX}"
++  DESTINATION "${INSTALL_CMAKE_DIR}"
+   COMPONENT dev
+ )
+ 
+ FOREACH( p Config.cmake ConfigVersion.cmake )
+   INSTALL(
+     FILES "${CMAKE_BINARY_DIR}/${PROJECTNAME_UC}${p}"
+-    DESTINATION "${INSTALL_CMAKE_DIR_PREFIX}"
++    DESTINATION "${INSTALL_CMAKE_DIR}"
+ )
+ ENDFOREACH( p Config.cmake ConfigVersion.cmake )
+ 
+ INSTALL(
+   FILES "${CMAKE_BINARY_DIR}/${PROJECTNAME}.pc"
+-  DESTINATION "${INSTALL_PKGCONFIG_DIR_PREFIX}"
++  DESTINATION "${INSTALL_PKGCONFIG_DIR}"
+ )
+ 
+ IF( NOT PLUGINNAME AND NOT EXTENSIONNAME )
+   INSTALL(
+     DIRECTORY "${BUILDTOOLS_DIR}"
+-    DESTINATION "${INSTALL_BUILDTOOLS_DIR_PREFIX}"
++    DESTINATION "${INSTALL_BUILDTOOLS_DIR}"
+   )
+ ENDIF( NOT PLUGINNAME AND NOT EXTENSIONNAME )
+ 
+ INSTALL(
+   FILES ${BUILDTOOLS_LIST}
+-  DESTINATION "${INSTALL_BUILDTOOLS_DIR_PREFIX}"
++  DESTINATION "${INSTALL_BUILDTOOLS_DIR}"
+ )
+ 
+ ENDMACRO( SET_INSTALL_TARGET )
+@@ -724,9 +717,9 @@ MACRO( PROCESS_SOURCES )
+   INSTALL(
+     TARGETS ${TARGETLIB}
+     EXPORT ${PROJECTNAME_UC}LibraryDepends
+-    LIBRARY DESTINATION "${INSTALL_LIB_DIR_PREFIX}"
+-    ARCHIVE DESTINATION "${INSTALL_LIB_DIR_PREFIX}"
+-    PUBLIC_HEADER DESTINATION "${INSTALL_INCLUDE_DIR_PREFIX}"
++    LIBRARY DESTINATION "${INSTALL_LIB_DIR}"
++    ARCHIVE DESTINATION "${INSTALL_LIB_DIR}"
++    PUBLIC_HEADER DESTINATION "${INSTALL_INCLUDE_DIR}"
+     COMPONENT dev
+   )
+ 
+@@ -746,9 +739,9 @@ MACRO( PROCESS_SOURCES )
+     INSTALL(
+       TARGETS ${TARGETLIB}_static
+       EXPORT ${PROJECTNAME_UC}LibraryDepends
+-      LIBRARY DESTINATION "${INSTALL_LIB_DIR_PREFIX}"
+-      ARCHIVE DESTINATION "${INSTALL_LIB_DIR_PREFIX}"
+-      PUBLIC_HEADER DESTINATION "${INSTALL_INCLUDE_DIR_PREFIX}"
++      LIBRARY DESTINATION "${INSTALL_LIB_DIR}"
++      ARCHIVE DESTINATION "${INSTALL_LIB_DIR}"
++      PUBLIC_HEADER DESTINATION "${INSTALL_INCLUDE_DIR}"
+       COMPONENT dev
+      )
+ 
+@@ -776,7 +769,7 @@ MACRO( PROCESS_EXAMPLES )
+ 
+   INSTALL(
+     FILES ${EXAMPLES_LIST}
+-    DESTINATION "${INSTALL_DOC_DIR_PREFIX}/examples"
++    DESTINATION "${INSTALL_DOC_DIR}/examples"
+   )
+ 
+ ENDMACRO( PROCESS_EXAMPLES )
diff --git a/meta-oe/recipes-graphics/libyui/libyui_git.bb b/meta-oe/recipes-graphics/libyui/libyui_git.bb
index 2826652cb..d313fb02d 100644
--- a/meta-oe/recipes-graphics/libyui/libyui_git.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui_git.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING.gpl-3;md5=d32239bcb673463ab874e80d47fae504 \
 SRC_URI = "git://github.com/libyui/libyui.git \
            file://0001-Fix-build-with-clang.patch \
            file://0001-Use-curly-braces-for-MAKE-variable.patch \
+           file://0001-Use-relative-install-paths-for-CMake.patch \
            "
 
 PV = "3.3.3+git"
-- 
2.11.0


