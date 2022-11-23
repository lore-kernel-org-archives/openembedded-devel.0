Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC7C9C4332F
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 03:13:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11594.1669173210724157805
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Nov 2022 19:13:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=lZBIgUKU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=83266acff9=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AN3DUQx008277
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Nov 2022 19:13:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=Rlm4EeaZmE/M9Y5OFsOScd0P2N6kTjphtClHpv80+LE=;
 b=lZBIgUKUUKVkv0NWfQ/iGV+T0G9UNPxQ2OQV/MGvZNGMfiIVi3I+DhvIE1+1Rbh7hp6/
 zc2y0gcUpfTs4X4dNJ9XD56IINPjrE2pTN5nvZnXxkhkdsUtQaHJSMX7rzxZh2dhaH9m
 8KbwBEYvqqWVwgCy5MHvSSQkuMaOy9WHWLxghD39WP17d52KPeJ+49CmzGkUOjdryBN8
 8uTm3on5x0gH5nyPIDoPW92gUK35e/9EIlRc7kKAXCiLMfpsDysFulus0OIcXIkumlgw
 y5CcqI/lfJr+Ty8kLmKuvp+66QeGqtiLobXtXX9g7rd08koxtJm79J6C8oLsfBlkgzyD yw== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxua6ayp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Nov 2022 19:13:30 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 22 Nov 2022 19:13:29 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 22 Nov 2022 19:13:28 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/3] wxwidgets: 3.1.5 -> 3.2.1
Date: Wed, 23 Nov 2022 11:13:24 +0800
Message-ID: <20221123031326.11169-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: wcbl8uykUgbC_S49ro2JBg8ZIO9fq3Y5
X-Proofpoint-GUID: wcbl8uykUgbC_S49ro2JBg8ZIO9fq3Y5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_13,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211230022
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 03:13:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99689

From: Kai Kang <kai.kang@windriver.com>

Upgrade wxwidgets from 3.1.5 to 3.2.1.

* rename respect-DESTDIR-when-create-link.patch that DESTDIR has
  considerred by upstream and only create symlink with relative path
* rebase patches to replace wxPLATFORM_LIB_DIR with LIB_SUFFIX
* split .so files to -dev package to fix [dev-so] qa error
* fix host contamination

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../create-links-with-relative-path.patch     |  52 +++++++++
 .../wxwidgets/fix-libdir-for-multilib.patch   | 100 +++++++++++-------
 .../not-append-system-name-to-lib-name.patch  |  30 +++---
 .../respect-DESTDIR-when-create-link.patch    |  55 ----------
 .../wx-config-fix-libdir-for-multilib.patch   |   6 +-
 ...{wxwidgets_3.1.5.bb => wxwidgets_3.2.1.bb} |  17 +--
 6 files changed, 145 insertions(+), 115 deletions(-)
 create mode 100644 meta-oe/recipes-extended/wxwidgets/wxwidgets/create-links-with-relative-path.patch
 delete mode 100644 meta-oe/recipes-extended/wxwidgets/wxwidgets/respect-DESTDIR-when-create-link.patch
 rename meta-oe/recipes-extended/wxwidgets/{wxwidgets_3.1.5.bb => wxwidgets_3.2.1.bb} (91%)

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/create-links-with-relative-path.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/create-links-with-relative-path.patch
new file mode 100644
index 000000000..6eef0b679
--- /dev/null
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/create-links-with-relative-path.patch
@@ -0,0 +1,52 @@
+It fails to build python3-wxgtk4 which depends on wxwidgets:
+
+| ERROR: wxwidgets-native-3.2.1-r0 do_populate_sysroot: sstate found an
+    absolute path symlink /path/to/build/tmp-glibc/work/x86_64-linux
+	/wxwidgets-native/3.2.1-r0/sysroot-destdir/path/to/build/tmp-glibc/work
+	/x86_64-linux/wxwidgets-native/3.2.1-r0/recipe-sysroot-native/usr/bin/wx-config
+    pointing at /path/to/build/tmp-glibc/work/x86_64-linux/wxwidgets-native/3.2.1-r0
+	/recipe-sysroot-native/usr/lib/wx/config/gtk3-unicode-3.2.
+  Please replace this with a relative link.
+| ERROR: wxwidgets-native-3.2.1-r0 do_populate_sysroot: sstate found an
+    absolute path symlink /path/to/build/tmp-glibc/work/x86_64-linux/wxwidgets-native
+	/3.2.1-r0/sysroot-destdir/path/to/build/tmp-glibc/work/x86_64-linux/wxwidgets-native
+	/3.2.1-r0/recipe-sysroot-native/usr/bin/wxrc pointing at /path/to/build/tmp-glibc
+	/work/x86_64-linux/wxwidgets-native/3.2.1-r0/recipe-sysroot-native/usr/bin/wxrc-3.2.
+  Please replace this with a relative link.
+
+Create symlink with relative path to fix the issues.
+
+Upstream-Status: Pending
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ build/cmake/install.cmake        | 2 +-
+ build/cmake/utils/CMakeLists.txt | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/build/cmake/install.cmake b/build/cmake/install.cmake
+index d3303faabb..c79e187f37 100644
+--- a/build/cmake/install.cmake
++++ b/build/cmake/install.cmake
+@@ -42,7 +42,7 @@ else()
+     install(DIRECTORY DESTINATION "bin")
+     install(CODE "execute_process( \
+         COMMAND ${CMAKE_COMMAND} -E create_symlink \
+-        \"${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX}/wx/config/${wxBUILD_FILE_ID}\" \
++        \"../lib${LIB_SUFFIX}/wx/config/${wxBUILD_FILE_ID}\" \
+         \"\$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/wx-config\" \
+         )"
+     )
+diff --git a/build/cmake/utils/CMakeLists.txt b/build/cmake/utils/CMakeLists.txt
+index dbed8cc9b3..1dbc3261d3 100644
+--- a/build/cmake/utils/CMakeLists.txt
++++ b/build/cmake/utils/CMakeLists.txt
+@@ -40,7 +40,7 @@ if(wxUSE_XRC)
+         # Don't use wx_install() here to preserve escaping.
+         install(CODE "execute_process( \
+             COMMAND ${CMAKE_COMMAND} -E create_symlink \
+-            \"${CMAKE_INSTALL_PREFIX}/bin/${wxrc_output_name}${EXE_SUFFIX}\" \
++            \"./${wxrc_output_name}${EXE_SUFFIX}\" \
+             \"\$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/wxrc${EXE_SUFFIX}\" \
+             )"
+         )
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/fix-libdir-for-multilib.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/fix-libdir-for-multilib.patch
index 555ed47ad..ea204ed3b 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/fix-libdir-for-multilib.patch
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/fix-libdir-for-multilib.patch
@@ -3,81 +3,105 @@ change it. Respect variable wxPLATFORM_LIB_DIR to support libdir be configurable
 
 Upstream-Status: Pending
 
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+Rebase for wxWidgets 3.2.1. Replace wxPLATFORM_LIB_DIR with LIB_SUFFIX in this
+patch that LIB_SUFFIX has been passed to cmake in cmake.bbclass.
+
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
- CMakeLists.txt              | 2 +-
- build/cmake/config.cmake    | 2 +-
- build/cmake/functions.cmake | 6 +++---
- build/cmake/install.cmake   | 6 +++---
- 4 files changed, 8 insertions(+), 8 deletions(-)
+ CMakeLists.txt              |  2 +-
+ build/cmake/config.cmake    |  2 +-
+ build/cmake/functions.cmake |  4 ++--
+ build/cmake/install.cmake   | 12 ++++++------
+ 4 files changed, 10 insertions(+), 10 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 4063020552..253d415210 100644
+index a49ecd3883..d469471f38 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -43,7 +43,7 @@ include(build/cmake/policies.cmake NO_POLICY_SCOPE)
+@@ -45,7 +45,7 @@ include(build/cmake/policies.cmake NO_POLICY_SCOPE)
  # Initialize variables for quick access to wx root dir in sub dirs
  set(wxSOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR})
  set(wxBINARY_DIR ${CMAKE_BINARY_DIR})
 -set(wxOUTPUT_DIR ${wxBINARY_DIR}/lib)
-+set(wxOUTPUT_DIR ${wxBINARY_DIR}/lib${wxPLATFORM_LIB_DIR})
++set(wxOUTPUT_DIR ${wxBINARY_DIR}/lib${LIB_SUFFIX})
  
  # parse the version number from wx/version.h and include in wxMAJOR_VERSION and wxMINOR_VERSION
- file(READ include/wx/version.h WX_VERSION_H_CONTENTS)
+ file(READ "${wxSOURCE_DIR}/include/wx/version.h" WX_VERSION_H_CONTENTS)
 diff --git a/build/cmake/config.cmake b/build/cmake/config.cmake
-index 91d11acba2..f361d50a27 100644
+index b359560bc0..c59ea60923 100644
 --- a/build/cmake/config.cmake
 +++ b/build/cmake/config.cmake
-@@ -57,7 +57,7 @@ function(wx_write_config_inplace)
+@@ -76,7 +76,7 @@ function(wx_write_config_inplace)
      execute_process(
          COMMAND
-         ${CMAKE_COMMAND} -E create_symlink
--        "lib/wx/config/inplace-${TOOLCHAIN_FULLNAME}"
-+        "lib${wxPLATFORM_LIB_DIR}/wx/config/inplace-${TOOLCHAIN_FULLNAME}"
+         "${CMAKE_COMMAND}" -E ${COPY_CMD}
+-        "${CMAKE_CURRENT_BINARY_DIR}/lib/wx/config/inplace-${TOOLCHAIN_FULLNAME}"
++        "${CMAKE_CURRENT_BINARY_DIR}/lib${LIB_SUFFIX}/wx/config/inplace-${TOOLCHAIN_FULLNAME}"
          "${CMAKE_CURRENT_BINARY_DIR}/wx-config"
          )
  endfunction()
 diff --git a/build/cmake/functions.cmake b/build/cmake/functions.cmake
-index c33dd3946c..51e47e05b3 100644
+index 7182364e5e..55fbebc7ee 100644
 --- a/build/cmake/functions.cmake
 +++ b/build/cmake/functions.cmake
-@@ -78,9 +78,9 @@ function(wx_set_common_target_properties target_name)
-     cmake_parse_arguments(wxCOMMON_TARGET_PROPS "DEFAULT_WARNINGS" "" "" ${ARGN})
- 
-     set_target_properties(${target_name} PROPERTIES
--        LIBRARY_OUTPUT_DIRECTORY "${wxOUTPUT_DIR}${wxPLATFORM_LIB_DIR}"
--        ARCHIVE_OUTPUT_DIRECTORY "${wxOUTPUT_DIR}${wxPLATFORM_LIB_DIR}"
--        RUNTIME_OUTPUT_DIRECTORY "${wxOUTPUT_DIR}${wxPLATFORM_LIB_DIR}"
-+        LIBRARY_OUTPUT_DIRECTORY "${wxOUTPUT_DIR}"
-+        ARCHIVE_OUTPUT_DIRECTORY "${wxOUTPUT_DIR}"
-+        RUNTIME_OUTPUT_DIRECTORY "${wxOUTPUT_DIR}"
-         )
- 
-     if(wxBUILD_PIC)
+@@ -435,8 +435,8 @@ macro(wx_add_library name)
+         endif()
+         wx_install(TARGETS ${name}
+             EXPORT wxWidgetsTargets
+-            LIBRARY DESTINATION "lib${GEN_EXPR_DIR}${wxPLATFORM_LIB_DIR}"
+-            ARCHIVE DESTINATION "lib${GEN_EXPR_DIR}${wxPLATFORM_LIB_DIR}"
++            LIBRARY DESTINATION "lib${LIB_SUFFIX}${GEN_EXPR_DIR}${wxPLATFORM_LIB_DIR}"
++            ARCHIVE DESTINATION "lib${LIB_SUFFIX}${GEN_EXPR_DIR}${wxPLATFORM_LIB_DIR}"
+             RUNTIME DESTINATION "${runtime_dir}${GEN_EXPR_DIR}${wxPLATFORM_LIB_DIR}"
+             BUNDLE DESTINATION Applications/wxWidgets
+             )
 diff --git a/build/cmake/install.cmake b/build/cmake/install.cmake
-index 968dff859e..c850c51844 100644
+index 384c6837b8..d3303faabb 100644
 --- a/build/cmake/install.cmake
 +++ b/build/cmake/install.cmake
-@@ -33,11 +33,11 @@ if(MSVC)
+@@ -29,11 +29,11 @@ if(WIN32_MSVC_NAMING)
  else()
-     wx_install(
+     install(
          DIRECTORY "${wxSETUP_HEADER_PATH}"
 -        DESTINATION "lib/wx/include")
-+        DESTINATION "lib${wxPLATFORM_LIB_DIR}/wx/include")
++        DESTINATION "lib${LIB_SUFFIX}/wx/include")
  
-     wx_install(
+     install(
          FILES "${wxOUTPUT_DIR}/wx/config/${wxBUILD_FILE_ID}"
 -        DESTINATION "lib/wx/config"
-+        DESTINATION "lib${wxPLATFORM_LIB_DIR}/wx/config"
++        DESTINATION "lib${LIB_SUFFIX}/wx/config"
          PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ
                      GROUP_EXECUTE GROUP_READ
                      WORLD_EXECUTE WORLD_READ
-@@ -46,7 +46,7 @@ else()
+@@ -42,13 +42,13 @@ else()
      install(DIRECTORY DESTINATION "bin")
      install(CODE "execute_process( \
          COMMAND ${CMAKE_COMMAND} -E create_symlink \
--        ${CMAKE_INSTALL_PREFIX}/lib/wx/config/${wxBUILD_FILE_ID} \
-+        ${CMAKE_INSTALL_PREFIX}/lib${wxPLATFORM_LIB_DIR}/wx/config/${wxBUILD_FILE_ID} \
-         ${CMAKE_INSTALL_PREFIX}/bin/wx-config \
+-        \"${CMAKE_INSTALL_PREFIX}/lib/wx/config/${wxBUILD_FILE_ID}\" \
++        \"${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX}/wx/config/${wxBUILD_FILE_ID}\" \
+         \"\$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/wx-config\" \
          )"
      )
+ endif()
+ 
+-install(EXPORT wxWidgetsTargets NAMESPACE wx:: DESTINATION "lib/cmake/wxWidgets/${wxPLATFORM_LIB_DIR}")
++install(EXPORT wxWidgetsTargets NAMESPACE wx:: DESTINATION "lib${LIB_SUFFIX}/cmake/wxWidgets/${wxPLATFORM_LIB_DIR}")
+ 
+ # find_package config file
+ include(CMakePackageConfigHelpers)
+@@ -71,11 +71,11 @@ write_basic_package_version_file(
+ configure_package_config_file(
+     "${wxSOURCE_DIR}/build/cmake/wxWidgetsConfig.cmake.in"
+     "${projectConfig}"
+-    INSTALL_DESTINATION "lib/cmake/wxWidgets"
++    INSTALL_DESTINATION "lib${LIB_SUFFIX}/cmake/wxWidgets"
+ )
+ install(
+     FILES "${projectConfig}" "${versionConfig}"
+-    DESTINATION "lib/cmake/wxWidgets"
++    DESTINATION "lib${LIB_SUFFIX}/cmake/wxWidgets"
+ )
+ 
+ # uninstall target
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/not-append-system-name-to-lib-name.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/not-append-system-name-to-lib-name.patch
index 0f78cc134..6329256b0 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/not-append-system-name-to-lib-name.patch
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/not-append-system-name-to-lib-name.patch
@@ -4,25 +4,29 @@ not appropriate for oe.
 
 Upstream-Status: Pending [oe specific]
 
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+Rebase for wxWidgets 3.2.1.
+
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
  build/cmake/functions.cmake | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/build/cmake/functions.cmake b/build/cmake/functions.cmake
-index 53cd6a1ace..95efa17fe4 100644
+index e374d9a273..c6b1908bd6 100644
 --- a/build/cmake/functions.cmake
 +++ b/build/cmake/functions.cmake
-@@ -211,9 +211,9 @@ function(wx_set_target_properties target_name is_base)
-         endif()
-     else()
-         set(cross_target "")
--        if (CMAKE_CROSSCOMPILING)
--            set(cross_target "-${CMAKE_SYSTEM_NAME}")
--        endif ()
-+        #if (CMAKE_CROSSCOMPILING)
-+        #    set(cross_target "-${CMAKE_SYSTEM_NAME}")
-+        #endif ()
+@@ -219,9 +219,9 @@ function(wx_set_target_properties target_name)
+     endif()
+ 
+     set(cross_target)
+-    if (CMAKE_CROSSCOMPILING)
+-        set(cross_target "-${CMAKE_SYSTEM_NAME}")
+-    endif()
++    #if (CMAKE_CROSSCOMPILING)
++    #    set(cross_target "-${CMAKE_SYSTEM_NAME}")
++    #endif()
  
-         set_target_properties(${target_name}
-             PROPERTIES
+     set(lib_prefix "lib")
+     if(MSVC OR (WIN32 AND wxBUILD_SHARED))
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/respect-DESTDIR-when-create-link.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/respect-DESTDIR-when-create-link.patch
deleted file mode 100644
index 69be32928..000000000
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/respect-DESTDIR-when-create-link.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-There are errors during do install. So link files 'wx-config' and 'wxrc' are
-not created, and rename failed either:
-
-| CMake Error: failed to create symbolic link '/usr/bin/wx-config': Permission denied
-| Error renaming from "/usr/bin/wxrc" to "/usr/bin/wxrc-3.1": No such file or directory
-| CMake Error: failed to create symbolic link '/usr/bin/wxrc': Permission denied
-
-Respect variable 'DESTDIR' to make it work as expect.
-
-Upstream-Status: Pending
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- build/cmake/install.cmake        | 4 ++--
- build/cmake/utils/CMakeLists.txt | 8 ++++----
- 2 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/build/cmake/install.cmake b/build/cmake/install.cmake
-index c850c51844..5cbc67daa1 100644
---- a/build/cmake/install.cmake
-+++ b/build/cmake/install.cmake
-@@ -46,8 +46,8 @@ else()
-     install(DIRECTORY DESTINATION "bin")
-     install(CODE "execute_process( \
-         COMMAND ${CMAKE_COMMAND} -E create_symlink \
--        ${CMAKE_INSTALL_PREFIX}/lib${wxPLATFORM_LIB_DIR}/wx/config/${wxBUILD_FILE_ID} \
--        ${CMAKE_INSTALL_PREFIX}/bin/wx-config \
-+        ../lib${wxPLATFORM_LIB_DIR}/wx/config/${wxBUILD_FILE_ID} \
-+        \$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/wx-config \
-         )"
-     )
- endif()
-diff --git a/build/cmake/utils/CMakeLists.txt b/build/cmake/utils/CMakeLists.txt
-index 4108d6a723..fbac6bb533 100644
---- a/build/cmake/utils/CMakeLists.txt
-+++ b/build/cmake/utils/CMakeLists.txt
-@@ -34,14 +34,14 @@ if(wxUSE_XRC)
-     if(NOT MSVC)
-         install(CODE "execute_process( \
-             COMMAND ${CMAKE_COMMAND} -E rename \
--            ${CMAKE_INSTALL_PREFIX}/bin/wxrc${EXE_SUFFIX} \
--            ${CMAKE_INSTALL_PREFIX}/bin/wxrc-${wxMAJOR_VERSION}.${wxMINOR_VERSION}${EXE_SUFFIX} \
-+            \$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/wxrc${EXE_SUFFIX} \
-+            \$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/wxrc-${wxMAJOR_VERSION}.${wxMINOR_VERSION}${EXE_SUFFIX} \
-             )"
-         )
-         install(CODE "execute_process( \
-             COMMAND ${CMAKE_COMMAND} -E create_symlink \
--            ${CMAKE_INSTALL_PREFIX}/bin/wxrc-${wxMAJOR_VERSION}.${wxMINOR_VERSION}${EXE_SUFFIX} \
--            ${CMAKE_INSTALL_PREFIX}/bin/wxrc${EXE_SUFFIX} \
-+            wxrc-${wxMAJOR_VERSION}.${wxMINOR_VERSION}${EXE_SUFFIX} \
-+            \$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/wxrc${EXE_SUFFIX} \
-             )"
-         )
-     endif()
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/wx-config-fix-libdir-for-multilib.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/wx-config-fix-libdir-for-multilib.patch
index 7ce206d26..628f8dee5 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/wx-config-fix-libdir-for-multilib.patch
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/wx-config-fix-libdir-for-multilib.patch
@@ -4,6 +4,10 @@ cross compile. And set default value of baselib with "lib${wxPLATFORM_LIB_DIR}".
 
 Upstream-Status: Pending [oe specific]
 
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+Rebase for wxWidgets 3.2.1. Replace wxPLATFORM_LIB_DIR with variable LIB_SUFFIX.
+
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
  build/cmake/config.cmake | 2 +-
@@ -50,7 +54,7 @@ index e3f7d115bb..0e78af03c7 100755
  # Determine the base directories we require.
  prefix=${input_option_prefix-${this_prefix:-@prefix@}}
  exec_prefix=${input_option_exec_prefix-${input_option_prefix-${this_exec_prefix:-@exec_prefix@}}}
-+baselib=${input_option_baselib:-lib@wxPLATFORM_LIB_DIR@}
++baselib=${input_option_baselib:-lib${LIB_SUFFIX}}
  wxconfdir="@libdir@/wx/config"
  
  installed_configs=`cd "$wxconfdir" 2> /dev/null && ls | grep -v "^inplace-"`
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
similarity index 91%
rename from meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
rename to meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
index 5565a289f..4bb07fda0 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
@@ -19,14 +19,14 @@ DEPENDS += " \
 "
 
 SRC_URI = " \
-    gitsm://github.com/wxWidgets/wxWidgets.git;branch=master;protocol=https \
+    gitsm://github.com/wxWidgets/wxWidgets.git;branch=3.2;protocol=https \
     file://0001-wx-config.in-Disable-cross-magic-it-does-not-work-fo.patch \
     file://fix-libdir-for-multilib.patch \
-    file://respect-DESTDIR-when-create-link.patch \
+    file://create-links-with-relative-path.patch \
     file://not-append-system-name-to-lib-name.patch \
     file://wx-config-fix-libdir-for-multilib.patch \
 "
-SRCREV= "9c0a8be1dc32063d91ed1901fd5fcd54f4f955a1"
+SRCREV= "97e99707c5d2271a70cb686720b48dbf34ced496"
 S = "${WORKDIR}/git"
 
 # These can be either 'builtin' or 'sys' and builtin means cloned soures are
@@ -38,7 +38,6 @@ EXTRA_OECMAKE += " \
     -DwxUSE_LIBPNG=sys \
     -DwxUSE_LIBTIFF=sys \
     -DwxUSE_REGEX=builtin \
-    -DwxPLATFORM_LIB_DIR=${@d.getVar('baselib').replace('lib', '')} \
 "
 EXTRA_OECMAKE:append:libc-musl = " \
     -DHAVE_LOCALE_T=OFF \
@@ -100,13 +99,15 @@ do_compile:append() {
 do_install:append() {
     # do not ship bindir if empty
     rmdir --ignore-fail-on-non-empty ${D}${bindir}
-}
 
-# lib names are not canonical
-FILES_SOLIBSDEV = ""
+    # fix host contamination
+    sed -i -e "s#${STAGING_DIR_NATIVE}##g" \
+           -e "s#${STAGING_DIR_TARGET}##g" \
+           ${D}${libdir}/wx/config/gtk3-unicode-3.2 \
+           ${D}${libdir}/cmake/wxWidgets/wxWidgetsTargets.cmake
+}
 
 FILES:${PN} += " \
-    ${libdir}/libwx_*.so \
     ${libdir}/wx/ \
 "
 
-- 
2.17.1


