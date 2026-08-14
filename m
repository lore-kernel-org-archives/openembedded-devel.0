Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B76C5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:21 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24403.1786747637435371735
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:47:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DsCdRBHs;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38511175ad3so1506012a91.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747637; x=1787352437; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KxFAPVEAu6Ms3CeeNMa+pHG6p4vKggAd1iNCC32O+/k=;
        b=DsCdRBHs97GuvRBU6FxCMkkZZCYUHJRTyuJXnYiQleFzaczPxpINUHDPwccSe4U964
         mCgrYwkQ4nc97y8iM3DA08msT4sH/rYtoTf1QHKY4n6HBI3YDIrOgT21RJz6ZaVfSeCf
         kpAB1+SOmqm85D1e1V1aRARc4BMju4lnFKV8RCJzoBsZDqpAWx5XNM3TyE/rCe8pSz7H
         oT5+SVpacTZvC/G/2dRXR2Qrskd3tacN8B+9w+DQ9U1i2aoWbhJHqt7O9m6BMQHV/yEN
         n0EBgwvNHiwyMBr12xTi1Tl5yJH+Q8Y5ag0Yg8DO8IhuqgtqNtfIrXbPDWf04D4KAl1J
         Ha0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747637; x=1787352437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KxFAPVEAu6Ms3CeeNMa+pHG6p4vKggAd1iNCC32O+/k=;
        b=Le4bddEyXfJd6OmkyLTKPd1ZVrhncUPu/0nbV9WIF4260Xpj+ROSmNE1Jjs3WKTRl0
         pcFJazm4oMVzhZvI+qecaev6WNeRdCojHB3u/zAA7NdLnOISCvjI8hCp058cvp21YsPq
         ysfoGLe42Ta05W7roH+1HdA3TCxaofgCsa3Quq/ddmAC1xXP3zkX+s+DH+pA0r0j0Uxa
         M4xz5YNxwL2AuSu+Vsuitp86uONNGcq2xqzLprFcifYe5HOvuvtuWDSMSZNxZbsNAtFq
         D79gSSHl0fTI1kEs87o/re5RlJcJrU9kqq4KDA7et4XKsHxslZMnHXhMlpUHGeW4krhc
         tb6A==
X-Gm-Message-State: AOJu0Yy85es8/gRFZCzLQ9Gg1djq6wCmCQ+NcGD2yIfiah7tWUv1AK36
	u0xKvNDFlUwQoC2f9RzxYTbpPQ3D2q0GYCxicX4y4Ctf3lUTENcrIzdpdeRL40EO
X-Gm-Gg: AR+sD13hQEy//ZBuLO3JbEWm2ANV6gJhS2Z39jrtQtfMYrISYWMYSAh1oQ6QHChGVZS
	3Dgoq2LxvhBGo9E60vanQBXBe5QQkPJM9w/NSfIjzes3h+/S9XHMl+T3HgLtuW1L3H0csNTd2tg
	bbs/43BtzOQfa6qOzFK9tvQAI6ontWFTPXzAHq6jH9ra0Eo/pR3Fk3AgkoG2YvbecKuKIfY2i6B
	98D2g1+b0xognCN/WVnD6UMXorLdqbXGxcXdukblNp6KU9zsJVSmGQij+Clm6cXeOc+kmVHqoyw
	QyUpyxL8ll+ZqI5tk/GlQ0mc8SrJem+3zbTksQ5Qy2FxN+ABm5a57F5N5bVVXCfEjPX9pH1Jox0
	E7rY9MKkApv0+vQ8s9L/Dr4HKueJ9WDcLVuiy6rln0FeEbKdPa3xj0JfyYGWZUvFnoWYVmS7DB4
	lojHzZsxuqoTaZOTuEfR5PazNfCoP/awfPzUmmWgjqtlp/zQwCYm33B6lqONSnDg/N8OsFSCykx
	yHi6jwzku+o9wM6TFG9G8jddnX2UK9DR21b/HtiMM+Bi1O5JwZ0tj+qiX8ticZErU/+CSXeabkB
	60evdXw6VUseg7m5J6LkOWW9suAXJjkd/L7gB0OXI+nQWcRxYxwVtdMY1ORuEWz3d592Gbyysmx
	u0AQhOGUGmR27ZGIDjeAxMTKEUjahYSxOZRjK2puKBeW+tg==
X-Received: by 2002:a05:6a21:7316:b0:3c4:de3:816c with SMTP id adf61e73a8af0-3cc71ed56f7mr11054239637.37.1786747636621;
        Fri, 14 Aug 2026 15:47:16 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:47:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 082/109] wxwidgets: upgrade 3.2.8.1 -> 3.2.11
Date: Fri, 14 Aug 2026 15:45:08 -0700
Message-ID: <20260814224539.1523174-82-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129146

Upstream refactored install.cmake/config.cmake/webview's CMakeLists.txt
to derive install paths from a new library_dir variable (=
CMAKE_INSTALL_LIBDIR, from GNUInstallDirs) and a wxCONFIG_DIR helper,
both already multilib-aware on their own:

- Drop 0003-create-links-with-relative-path.patch: wx_install_symlink()
  now does "ln -s --relative" natively.
- Drop 0005-wx-config-fix-libdir-for-multilib.patch: superseded by the
  library_dir/wx_get_install_platform_dir refactor.
- Reduce 0002-fix-libdir-for-multilib.patch to its one remaining hunk
  (wxOUTPUT_DIR in CMakeLists.txt, a build-dir path untouched by the
  refactor).
- Rebase 0004-don-not-append-system-name-to-lib-name.patch (context
  shift only).
- Drop the now-unneeded wxBUILD_INSTALL_{RUNTIME,LIBRARY,PLATFORM_SUBDIR}
  EXTRA_OECMAKE overrides: forcing an absolute libdir into
  wxBUILD_INSTALL_RUNTIME_DIR broke the new install.cmake's wx-config
  symlink construction (double /usr prefix, installed-vs-shipped QA
  failure); GNUInstallDirs-based defaults are multilib-correct without
  them.
- do_install:append: guard the bindir rmdir (bindir no longer created
  at all, not just left empty) and repoint the host-contamination sed
  at the new versioned cmake/wxWidgets-3.2/ install path.

Build-verified for qemux86-64 (do_package_qa green).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0002-fix-libdir-for-multilib.patch        | 95 +++----------------
 ...0003-create-links-with-relative-path.patch | 60 ------------
 ...n-not-append-system-name-to-lib-name.patch | 10 +-
 ...05-wx-config-fix-libdir-for-multilib.patch | 69 --------------
 ...widgets_3.2.8.1.bb => wxwidgets_3.2.11.bb} | 17 ++--
 5 files changed, 24 insertions(+), 227 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/wxwidgets/wxwidgets/0003-create-links-with-relative-path.patch
 delete mode 100644 meta-oe/recipes-extended/wxwidgets/wxwidgets/0005-wx-config-fix-libdir-for-multilib.patch
 rename meta-oe/recipes-extended/wxwidgets/{wxwidgets_3.2.8.1.bb => wxwidgets_3.2.11.bb} (91%)

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0002-fix-libdir-for-multilib.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0002-fix-libdir-for-multilib.patch
index cd0417612f..93d31dc871 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0002-fix-libdir-for-multilib.patch
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0002-fix-libdir-for-multilib.patch
@@ -15,18 +15,22 @@ Rebase for wxWidgets 3.2.1. Replace wxPLATFORM_LIB_DIR with LIB_SUFFIX
 in this patch that LIB_SUFFIX has been passed to cmake in cmake.bbclass.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+Rebased on 3.2.11: upstream refactored install.cmake/config.cmake/
+webview/CMakeLists.txt to derive their install paths from a new
+library_dir variable (= CMAKE_INSTALL_LIBDIR, from GNUInstallDirs) and
+wxCONFIG_DIR (derived from wxOUTPUT_DIR), which are already multilib-aware
+on their own -- dropped those 3 now-redundant hunks. Only wxOUTPUT_DIR
+in CMakeLists.txt (a build-dir path, not an install path, so untouched by
+that refactor) still needs the LIB_SUFFIX fix.
 ---
- CMakeLists.txt                         |  2 +-
- build/cmake/config.cmake               |  2 +-
- build/cmake/install.cmake              | 12 ++++++------
- build/cmake/lib/webview/CMakeLists.txt |  2 +-
- 4 files changed, 9 insertions(+), 9 deletions(-)
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index d6a4b49..9e86b87 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -43,7 +43,7 @@ include(build/cmake/policies.cmake NO_POLICY_SCOPE)
+@@ -48,7 +48,7 @@
  # Initialize variables for quick access to wx root dir in sub dirs
  set(wxSOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR})
  set(wxBINARY_DIR ${CMAKE_CURRENT_BINARY_DIR})
@@ -35,80 +39,5 @@ index d6a4b49..9e86b87 100644
  
  # parse the version number from wx/version.h and include in wxMAJOR_VERSION and wxMINOR_VERSION
  file(READ "${wxSOURCE_DIR}/include/wx/version.h" WX_VERSION_H_CONTENTS)
-diff --git a/build/cmake/config.cmake b/build/cmake/config.cmake
-index addd8d6..9ec6775 100644
---- a/build/cmake/config.cmake
-+++ b/build/cmake/config.cmake
-@@ -100,7 +100,7 @@ function(wx_write_config_inplace)
-     execute_process(
-         COMMAND
-         "${CMAKE_COMMAND}" -E ${COPY_CMD}
--        "${wxBINARY_DIR}/lib/wx/config/inplace-${TOOLCHAIN_FULLNAME}"
-+        "${wxBINARY_DIR}/lib${LIB_SUFFIX}/wx/config/inplace-${TOOLCHAIN_FULLNAME}"
-         "${wxBINARY_DIR}/wx-config"
-         )
- endfunction()
-diff --git a/build/cmake/install.cmake b/build/cmake/install.cmake
-index 202d054..e255e0b 100644
---- a/build/cmake/install.cmake
-+++ b/build/cmake/install.cmake
-@@ -44,11 +44,11 @@ if(WIN32_MSVC_NAMING)
- else()
-     install(
-         DIRECTORY "${wxSETUP_HEADER_PATH}"
--        DESTINATION "lib/wx/include")
-+        DESTINATION "lib${LIB_SUFFIX}/wx/include")
- 
-     install(
-         FILES "${wxOUTPUT_DIR}/wx/config/${wxBUILD_FILE_ID}"
--        DESTINATION "lib/wx/config"
-+        DESTINATION "lib${LIB_SUFFIX}/wx/config"
-         PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ
-                     GROUP_EXECUTE GROUP_READ
-                     WORLD_EXECUTE WORLD_READ
-@@ -57,13 +57,13 @@ else()
-     install(DIRECTORY DESTINATION "bin")
-     install(CODE "execute_process( \
-         COMMAND ${CMAKE_COMMAND} -E create_symlink \
--        \"${CMAKE_INSTALL_PREFIX}/lib/wx/config/${wxBUILD_FILE_ID}\" \
-+        \"${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX}/wx/config/${wxBUILD_FILE_ID}\" \
-         \"\$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/wx-config\" \
-         )"
-     )
- endif()
- 
--install(EXPORT wxWidgetsTargets NAMESPACE wx:: DESTINATION "lib/cmake/wxWidgets/${wxPLATFORM_LIB_DIR}")
-+install(EXPORT wxWidgetsTargets NAMESPACE wx:: DESTINATION "lib${LIB_SUFFIX}/cmake/wxWidgets/${wxPLATFORM_LIB_DIR}")
- 
- # find_package config file
- include(CMakePackageConfigHelpers)
-@@ -86,11 +86,11 @@ write_basic_package_version_file(
- configure_package_config_file(
-     "${wxSOURCE_DIR}/build/cmake/wxWidgetsConfig.cmake.in"
-     "${projectConfig}"
--    INSTALL_DESTINATION "lib/cmake/wxWidgets"
-+    INSTALL_DESTINATION "lib${LIB_SUFFIX}/cmake/wxWidgets"
- )
- install(
-     FILES "${projectConfig}" "${versionConfig}"
--    DESTINATION "lib/cmake/wxWidgets"
-+    DESTINATION "lib${LIB_SUFFIX}/cmake/wxWidgets"
- )
- 
- # uninstall target
-diff --git a/build/cmake/lib/webview/CMakeLists.txt b/build/cmake/lib/webview/CMakeLists.txt
-index 2cb35e7..7977a84 100644
---- a/build/cmake/lib/webview/CMakeLists.txt
-+++ b/build/cmake/lib/webview/CMakeLists.txt
-@@ -146,7 +146,7 @@ if(WXGTK AND wxUSE_WEBVIEW_WEBKIT2)
-         ${WEBKIT2_LIBRARIES}
-         )
- 
--    wx_install(TARGETS wxwebkit2_ext LIBRARY DESTINATION "lib/wx/${WX_WEB_EXT_VERSION}/web-extensions")
-+    wx_install(TARGETS wxwebkit2_ext LIBRARY DESTINATION "lib${LIB_SUFFIX}/wx/${WX_WEB_EXT_VERSION}/web-extensions")
- 
-     wx_add_dependencies(wxwebview wxwebkit2_ext)
- endif()
--- 
+--
 2.49.0
-
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0003-create-links-with-relative-path.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0003-create-links-with-relative-path.patch
deleted file mode 100644
index dbede0304f..0000000000
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0003-create-links-with-relative-path.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From b86806ef34d4c9171165c1533064bf34ad822e20 Mon Sep 17 00:00:00 2001
-From: Kai Kang <kai.kang@windriver.com>
-Date: Sat, 12 Oct 2024 18:43:25 +0800
-Subject: [PATCH] create links with relative path
-
-It fails to build python3-wxgtk4 which depends on wxwidgets:
-
-| ERROR: wxwidgets-native-3.2.1-r0 do_populate_sysroot: sstate found an
-    absolute path symlink /path/to/build/tmp-glibc/work/x86_64-linux
-    /wxwidgets-native/3.2.1-r0/sysroot-destdir/path/to/build/tmp-glibc/work
-    /x86_64-linux/wxwidgets-native/3.2.1-r0/recipe-sysroot-native/usr/bin/wx-config
-    pointing at /path/to/build/tmp-glibc/work/x86_64-linux/wxwidgets-native/3.2.1-r0
-    /recipe-sysroot-native/usr/lib/wx/config/gtk3-unicode-3.2.
-  Please replace this with a relative link.
-| ERROR: wxwidgets-native-3.2.1-r0 do_populate_sysroot: sstate found an
-    absolute path symlink /path/to/build/tmp-glibc/work/x86_64-linux/wxwidgets-native
-    /3.2.1-r0/sysroot-destdir/path/to/build/tmp-glibc/work/x86_64-linux/wxwidgets-native
-    /3.2.1-r0/recipe-sysroot-native/usr/bin/wxrc pointing at /path/to/build/tmp-glibc
-    /work/x86_64-linux/wxwidgets-native/3.2.1-r0/recipe-sysroot-native/usr/bin/wxrc-3.2.
-   Please replace this with a relative link.
-
-Create symlink with relative path to fix the issues.
-
-Upstream-Status: Pending
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- build/cmake/install.cmake        | 2 +-
- build/cmake/utils/CMakeLists.txt | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/build/cmake/install.cmake b/build/cmake/install.cmake
-index d3303faabb..c79e187f37 100644
---- a/build/cmake/install.cmake
-+++ b/build/cmake/install.cmake
-@@ -42,7 +42,7 @@ else()
-     install(DIRECTORY DESTINATION "bin")
-     install(CODE "execute_process( \
-         COMMAND ${CMAKE_COMMAND} -E create_symlink \
--        \"${CMAKE_INSTALL_PREFIX}/lib${LIB_SUFFIX}/wx/config/${wxBUILD_FILE_ID}\" \
-+        \"../lib${LIB_SUFFIX}/wx/config/${wxBUILD_FILE_ID}\" \
-         \"\$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/wx-config\" \
-         )"
-     )
-diff --git a/build/cmake/utils/CMakeLists.txt b/build/cmake/utils/CMakeLists.txt
-index dbed8cc9b3..1dbc3261d3 100644
---- a/build/cmake/utils/CMakeLists.txt
-+++ b/build/cmake/utils/CMakeLists.txt
-@@ -40,7 +40,7 @@ if(wxUSE_XRC)
-         # Don't use wx_install() here to preserve escaping.
-         install(CODE "execute_process( \
-             COMMAND ${CMAKE_COMMAND} -E create_symlink \
--            \"${CMAKE_INSTALL_PREFIX}/bin/${wxrc_output_name}${EXE_SUFFIX}\" \
-+            \"./${wxrc_output_name}${EXE_SUFFIX}\" \
-             \"\$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/wxrc${EXE_SUFFIX}\" \
-             )"
-         )
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0004-don-not-append-system-name-to-lib-name.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0004-don-not-append-system-name-to-lib-name.patch
index e3463ba170..5ef944edfa 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0004-don-not-append-system-name-to-lib-name.patch
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0004-don-not-append-system-name-to-lib-name.patch
@@ -14,15 +14,16 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
 Rebase for wxWidgets 3.2.1.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+Rebased on 3.2.11: context shifted by 109 lines (offset only, same change).
 ---
  build/cmake/functions.cmake | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/build/cmake/functions.cmake b/build/cmake/functions.cmake
-index 81ede7d8ae..23eebeb914 100644
 --- a/build/cmake/functions.cmake
 +++ b/build/cmake/functions.cmake
-@@ -243,9 +243,9 @@ function(wx_set_target_properties target_name)
+@@ -352,9 +352,9 @@
      endif()
  
      set(cross_target)
@@ -34,7 +35,6 @@ index 81ede7d8ae..23eebeb914 100644
 +    #endif()
  
      set(lib_prefix "lib")
-     if(MSVC OR (WIN32 AND wxBUILD_SHARED))
--- 
+     if(WIN32_MSVC_NAMING OR (WIN32 AND wxBUILD_SHARED))
+--
 2.25.1
-
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0005-wx-config-fix-libdir-for-multilib.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0005-wx-config-fix-libdir-for-multilib.patch
deleted file mode 100644
index b650c50386..0000000000
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0005-wx-config-fix-libdir-for-multilib.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 4230cd84f156f9eb5c9b80ffbc69dd55fa7c7ca7 Mon Sep 17 00:00:00 2001
-From: Kai Kang <kai.kang@windriver.com>
-Date: Sat, 12 Oct 2024 18:43:25 +0800
-Subject: [PATCH] wx-config: fix libdir for multilib
-
-It sets 'libdir' with path element 'lib' directly which is not suitable
-for multilib. Add an option '--baselib' for wx-config to support
-multilib when cross compile. And set default value of baselib with
-"lib${wxPLATFORM_LIB_DIR}".
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-Rebase for wxWidgets 3.2.1. Replace wxPLATFORM_LIB_DIR with variable LIB_SUFFIX.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- build/cmake/config.cmake | 2 +-
- wx-config.in             | 6 ++++--
- 2 files changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/build/cmake/config.cmake b/build/cmake/config.cmake
-index 9ec677534b..ee61cf7572 100644
---- a/build/cmake/config.cmake
-+++ b/build/cmake/config.cmake
-@@ -110,7 +110,7 @@ function(wx_write_config)
-     set(prefix ${CMAKE_INSTALL_PREFIX})
-     set(exec_prefix "\${prefix}")
-     set(includedir "\${prefix}/include")
--    set(libdir "\${exec_prefix}/lib")
-+    set(libdir "\${exec_prefix}/\${baselib}")
-     set(bindir "\${exec_prefix}/bin")
- 
-     if(wxBUILD_MONOLITHIC)
-diff --git a/wx-config.in b/wx-config.in
-index 1173d89685..8364a33e9d 100755
---- a/wx-config.in
-+++ b/wx-config.in
-@@ -42,7 +42,8 @@ usage()
- {
-     cat 1>&2 <<EOF
- 
-- wx-config [--prefix[=DIR]] [--exec-prefix[=DIR]] [--release] [--version-full]
-+ wx-config [--prefix[=DIR]] [--exec-prefix[=DIR]][--baselib=DIR]
-+           [--release] [--version-full]
-            [--list] [--selected-config] [--host=HOST] [--toolkit=TOOLKIT]
-            [--universal[=yes|no]] [--unicode[=yes|no]] [--static[=yes|no]]
-            [--debug[=yes|no]] [--version[=VERSION]] [--flavour=FLAVOUR]
-@@ -133,7 +134,7 @@ wxconfig_output_options="prefix exec_prefix
- 
- # Options that permit the user to supply hints that may affect the output.
- # These options all accept arbitrary values, to interpret as they please.
--wxconfig_input_options="prefix exec_prefix utility $wxconfig_schema"
-+wxconfig_input_options="prefix exec_prefix baselib utility $wxconfig_schema"
- 
- # Input options that accept only a yes or no argument.
- #
-@@ -400,6 +401,7 @@ is_cross()  { [ "xno" = "xyes" ]; }
- # Determine the base directories we require.
- prefix=${input_option_prefix-${this_prefix:-@prefix@}}
- exec_prefix=${input_option_exec_prefix-${input_option_prefix-${this_exec_prefix:-@exec_prefix@}}}
-+baselib=${input_option_baselib:-lib${LIB_SUFFIX}}
- wxconfdir="@libdir@/wx/config"
- 
- installed_configs=`cd "$wxconfdir" 2> /dev/null && ls | grep -v "^inplace-"`
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.1.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.11.bb
similarity index 91%
rename from meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.1.bb
rename to meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.11.bb
index f87744b48e..51f3fdb39d 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.1.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.11.bb
@@ -18,16 +18,14 @@ DEPENDS += " \
     tiff \
 "
 
-SRC_URI = "gitsm://github.com/wxWidgets/wxWidgets.git;branch=3.2.8-hotfix;protocol=https;tag=v${PV} \
+SRC_URI = "gitsm://github.com/wxWidgets/wxWidgets.git;branch=3.2;protocol=https;tag=v${PV} \
            file://0001-wx-config.in-Disable-cross-magic-it-does-not-work-fo.patch \
            file://0002-fix-libdir-for-multilib.patch \
-           file://0003-create-links-with-relative-path.patch \
            file://0004-don-not-append-system-name-to-lib-name.patch \
-           file://0005-wx-config-fix-libdir-for-multilib.patch \
            file://0006-Fix-locale-on-musl.patch \
            file://0007-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch \
            "
-SRCREV = "896e4f587615b832ce27b8325357cb504997e1d3"
+SRCREV = "749625e0ea4d70d1f75494aa52231d835531a618"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
@@ -40,9 +38,6 @@ EXTRA_OECMAKE += " \
     -DwxUSE_LIBPNG=sys \
     -DwxUSE_LIBTIFF=sys \
     -DwxUSE_REGEX=builtin \
-    -DwxBUILD_INSTALL_RUNTIME_DIR=${libdir} \
-    -DwxBUILD_INSTALL_LIBRARY_DIR=${libdir} \
-    -DwxBUILD_INSTALL_PLATFORM_SUBDIR=${libdir} \
 "
 EXTRA_OECMAKE:append:class-target = ' -DEGREP="/bin/grep -E"'
 
@@ -110,14 +105,16 @@ do_compile:append() {
 }
 
 do_install:append() {
-    # do not ship bindir if empty
-    rmdir --ignore-fail-on-non-empty ${D}${bindir}
+    # do not ship bindir if empty (may not exist at all)
+    if [ -d ${D}${bindir} ]; then
+        rmdir --ignore-fail-on-non-empty ${D}${bindir}
+    fi
 
     # fix host contamination
     sed -i -e "s#${STAGING_DIR_NATIVE}##g" \
            -e "s#${STAGING_DIR_TARGET}##g" \
            ${D}${libdir}/wx/config/*-unicode-3.2 \
-           ${D}${libdir}/cmake/wxWidgets/wxWidgetsTargets.cmake
+           ${D}${libdir}/cmake/wxWidgets-3.2/wxWidgetsTargets.cmake
 }
 
 FILES:${PN} += " \

