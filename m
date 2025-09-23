Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77517CAC5B4
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:57:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.web11.15019.1758628660267361449
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=d4kAYyE3;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758628671; x=1790164671;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ZAQ19IfrklOWPEclMIVY73M9XWF12zfXFyHKYYU3E78=;
  b=d4kAYyE33UUU8zpCzZYTm9bF+3nWtbxfHs4BBra9BRO+29cXJPzrDO+9
   HMEzgQJbFfVuvZLnn+FXI9B/Sobe11B5evXfFy4bxcbQfapC7W8P2hjez
   81MZ9leZAWGz2cwj50HVgU77In05L5LltYKE5RXE6G7fieQpLfdQWPBcg
   ii3P+4KAM+34G+bAKWjvypgj77g10wZDGiVD/ZltDp35ZIw5HsI8iJCPT
   bi8iiEQY1gei8XORD+DiRNzNnUinyO3ezgLL0DBBYlXV2Nur/CiC5c426
   grmAx5T7/dkA0DClhsg0rdllam0/JvcyeuNXS3PRWXHLUGEXNAh9bPo2e
   A==;
X-CSE-ConnectionGUID: MM4MEmwuRAGDXyBqLmx0oQ==
X-CSE-MsgGUID: RRRjt7zmRNGT8jOb2zm7NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60821781"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60821781"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:57:50 -0700
X-CSE-ConnectionGUID: y+aUSZC1QsyaYu34o1odyQ==
X-CSE-MsgGUID: qVAaPk9HRAGIiC1rbnPBAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="175875134"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO anmitta2-mobl4.intel.com) ([10.247.118.223])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:57:49 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][PATCH 06/24] wxwidgets: upgrade 3.2.1 -> 3.2.6
Date: Tue, 23 Sep 2025 19:57:09 +0800
Message-ID: <8bdec6baaa76c0b38260947ccc453000aeb02f31.1758626365.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758626365.git.anuj.mittal@intel.com>
References: <cover.1758626365.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:57:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119695

From: Yi Zhao <yi.zhao@windriver.com>

ChangeLog:
https://raw.githubusercontent.com/wxWidgets/wxWidgets/v3.2.6/docs/changes.txt

* Drop 0001-locale-Avoid-using-glibc-specific-defines-on-musl.patch as
  it has been merged upstream
* Refresh patches
* Add UPSTREAM_CHECK_GITTAGREGEX

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>

(master rev: 903ed68669550ccae20bcd0c18c26d0c336da810)
Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...using-glibc-specific-defines-on-musl.patch | 26 --------------
 ...able-cross-magic-it-does-not-work-fo.patch |  8 ++---
 ...tch => 0002-fix-libdir-for-multilib.patch} | 35 ++++++++++++-------
 ...003-create-links-with-relative-path.patch} | 22 ++++++++----
 ...-not-append-system-name-to-lib-name.patch} | 12 +++++--
 ...5-wx-config-fix-libdir-for-multilib.patch} | 29 +++++++++------
 ...-l.patch => 0006-Fix-locale-on-musl.patch} | 18 ++++++++--
 ...E_LARGEFILE_SUPPORT-to-1-explicitly.patch} |  9 ++---
 ...{wxwidgets_3.2.1.bb => wxwidgets_3.2.6.bb} | 17 ++++-----
 9 files changed, 100 insertions(+), 76 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-locale-Avoid-using-glibc-specific-defines-on-musl.patch
 rename meta-oe/recipes-extended/wxwidgets/wxwidgets/{fix-libdir-for-multilib.patch => 0002-fix-libdir-for-multilib.patch} (82%)
 rename meta-oe/recipes-extended/wxwidgets/wxwidgets/{create-links-with-relative-path.patch => 0003-create-links-with-relative-path.patch} (72%)
 rename meta-oe/recipes-extended/wxwidgets/wxwidgets/{not-append-system-name-to-lib-name.patch => 0004-don-not-append-system-name-to-lib-name.patch} (73%)
 rename meta-oe/recipes-extended/wxwidgets/wxwidgets/{wx-config-fix-libdir-for-multilib.patch => 0005-wx-config-fix-libdir-for-multilib.patch} (74%)
 rename meta-oe/recipes-extended/wxwidgets/wxwidgets/{musl-locale-l.patch => 0006-Fix-locale-on-musl.patch} (70%)
 rename meta-oe/recipes-extended/wxwidgets/wxwidgets/{0001-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch => 0007-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch} (83%)
 rename meta-oe/recipes-extended/wxwidgets/{wxwidgets_3.2.1.bb => wxwidgets_3.2.6.bb} (90%)

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-locale-Avoid-using-glibc-specific-defines-on-musl.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-locale-Avoid-using-glibc-specific-defines-on-musl.patch
deleted file mode 100644
index 52f4449339..0000000000
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-locale-Avoid-using-glibc-specific-defines-on-musl.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 72c3b7324f00047e6dc5d8380ed2f6ff2494a6f9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 18 Dec 2022 14:51:34 -0800
-Subject: [PATCH] locale: Avoid using glibc specific defines on musl
-
-musl does not provide some glibc-only enum members e.g. _NL_ADDRESS_LANG_NAME
-
-Upstream-Status: Submitted [https://github.com/wxWidgets/wxWidgets/pull/23050]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/unix/uilocale.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/unix/uilocale.cpp b/src/unix/uilocale.cpp
-index 57773e17f5..86816ba896 100644
---- a/src/unix/uilocale.cpp
-+++ b/src/unix/uilocale.cpp
-@@ -619,7 +619,7 @@ wxString
- wxUILocaleImplUnix::GetLocalizedName(wxLocaleName name, wxLocaleForm form) const
- {
-     wxString str;
--#if defined(HAVE_LANGINFO_H) && defined(__LINUX__)
-+#if defined(HAVE_LANGINFO_H) && defined(__LINUX__) && defined(__GLIBC__)
-     switch (name)
-     {
-         case wxLOCALE_NAME_LOCALE:
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-wx-config.in-Disable-cross-magic-it-does-not-work-fo.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-wx-config.in-Disable-cross-magic-it-does-not-work-fo.patch
index b3b9e79c53..a3b8d0c0ee 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-wx-config.in-Disable-cross-magic-it-does-not-work-fo.patch
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-wx-config.in-Disable-cross-magic-it-does-not-work-fo.patch
@@ -1,4 +1,4 @@
-From a071243763f4b06fc7e71f541c49cecf380b6f27 Mon Sep 17 00:00:00 2001
+From 8f582c0ea40ccdb2d439b7614459d752f3606e15 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
 Date: Sun, 11 Oct 2020 22:16:55 +0200
 Subject: [PATCH] wx-config.in: Disable cross magic - it does not work for us
@@ -18,10 +18,10 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/wx-config.in b/wx-config.in
-index d132e3182f..d0d162e8a3 100755
+index 4df8571d28..1173d89685 100755
 --- a/wx-config.in
 +++ b/wx-config.in
-@@ -396,7 +396,7 @@ get_mask()
+@@ -394,7 +394,7 @@ get_mask()
  }
  
  # Returns true if this script is for a cross compiled config.
@@ -31,5 +31,5 @@ index d132e3182f..d0d162e8a3 100755
  
  # Determine the base directories we require.
 -- 
-2.26.2
+2.25.1
 
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/fix-libdir-for-multilib.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0002-fix-libdir-for-multilib.patch
similarity index 82%
rename from meta-oe/recipes-extended/wxwidgets/wxwidgets/fix-libdir-for-multilib.patch
rename to meta-oe/recipes-extended/wxwidgets/wxwidgets/0002-fix-libdir-for-multilib.patch
index ea204ed3b1..b599f38871 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/fix-libdir-for-multilib.patch
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0002-fix-libdir-for-multilib.patch
@@ -1,12 +1,18 @@
-wxWidgets hardcodes libdir with 'lib' and does not support multilib which will
-change it. Respect variable wxPLATFORM_LIB_DIR to support libdir be configurable.
+From 9487fe5cd271a4bee96ab590509ef38f6972887a Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Sat, 12 Oct 2024 18:43:25 +0800
+Subject: [PATCH] fix libdir for multilib
+
+wxWidgets hardcodes libdir with 'lib' and does not support multilib
+which will change it. Respect variable wxPLATFORM_LIB_DIR to support
+libdir be configurable.
 
 Upstream-Status: Pending
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 
-Rebase for wxWidgets 3.2.1. Replace wxPLATFORM_LIB_DIR with LIB_SUFFIX in this
-patch that LIB_SUFFIX has been passed to cmake in cmake.bbclass.
+Rebase for wxWidgets 3.2.1. Replace wxPLATFORM_LIB_DIR with LIB_SUFFIX
+in this patch that LIB_SUFFIX has been passed to cmake in cmake.bbclass.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
@@ -17,36 +23,36 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  4 files changed, 10 insertions(+), 10 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index a49ecd3883..d469471f38 100644
+index f6ae7f6210..2a13e448db 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -45,7 +45,7 @@ include(build/cmake/policies.cmake NO_POLICY_SCOPE)
  # Initialize variables for quick access to wx root dir in sub dirs
  set(wxSOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR})
- set(wxBINARY_DIR ${CMAKE_BINARY_DIR})
+ set(wxBINARY_DIR ${CMAKE_CURRENT_BINARY_DIR})
 -set(wxOUTPUT_DIR ${wxBINARY_DIR}/lib)
 +set(wxOUTPUT_DIR ${wxBINARY_DIR}/lib${LIB_SUFFIX})
  
  # parse the version number from wx/version.h and include in wxMAJOR_VERSION and wxMINOR_VERSION
  file(READ "${wxSOURCE_DIR}/include/wx/version.h" WX_VERSION_H_CONTENTS)
 diff --git a/build/cmake/config.cmake b/build/cmake/config.cmake
-index b359560bc0..c59ea60923 100644
+index addd8d6b81..9ec677534b 100644
 --- a/build/cmake/config.cmake
 +++ b/build/cmake/config.cmake
-@@ -76,7 +76,7 @@ function(wx_write_config_inplace)
+@@ -100,7 +100,7 @@ function(wx_write_config_inplace)
      execute_process(
          COMMAND
          "${CMAKE_COMMAND}" -E ${COPY_CMD}
--        "${CMAKE_CURRENT_BINARY_DIR}/lib/wx/config/inplace-${TOOLCHAIN_FULLNAME}"
-+        "${CMAKE_CURRENT_BINARY_DIR}/lib${LIB_SUFFIX}/wx/config/inplace-${TOOLCHAIN_FULLNAME}"
-         "${CMAKE_CURRENT_BINARY_DIR}/wx-config"
+-        "${wxBINARY_DIR}/lib/wx/config/inplace-${TOOLCHAIN_FULLNAME}"
++        "${wxBINARY_DIR}/lib${LIB_SUFFIX}/wx/config/inplace-${TOOLCHAIN_FULLNAME}"
+         "${wxBINARY_DIR}/wx-config"
          )
  endfunction()
 diff --git a/build/cmake/functions.cmake b/build/cmake/functions.cmake
-index 7182364e5e..55fbebc7ee 100644
+index 72a34f0b4f..81ede7d8ae 100644
 --- a/build/cmake/functions.cmake
 +++ b/build/cmake/functions.cmake
-@@ -435,8 +435,8 @@ macro(wx_add_library name)
+@@ -462,8 +462,8 @@ macro(wx_add_library name)
          endif()
          wx_install(TARGETS ${name}
              EXPORT wxWidgetsTargets
@@ -105,3 +111,6 @@ index 384c6837b8..d3303faabb 100644
  )
  
  # uninstall target
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/create-links-with-relative-path.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0003-create-links-with-relative-path.patch
similarity index 72%
rename from meta-oe/recipes-extended/wxwidgets/wxwidgets/create-links-with-relative-path.patch
rename to meta-oe/recipes-extended/wxwidgets/wxwidgets/0003-create-links-with-relative-path.patch
index 6eef0b6790..dbede0304f 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/create-links-with-relative-path.patch
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0003-create-links-with-relative-path.patch
@@ -1,18 +1,23 @@
+From b86806ef34d4c9171165c1533064bf34ad822e20 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Sat, 12 Oct 2024 18:43:25 +0800
+Subject: [PATCH] create links with relative path
+
 It fails to build python3-wxgtk4 which depends on wxwidgets:
 
 | ERROR: wxwidgets-native-3.2.1-r0 do_populate_sysroot: sstate found an
     absolute path symlink /path/to/build/tmp-glibc/work/x86_64-linux
-	/wxwidgets-native/3.2.1-r0/sysroot-destdir/path/to/build/tmp-glibc/work
-	/x86_64-linux/wxwidgets-native/3.2.1-r0/recipe-sysroot-native/usr/bin/wx-config
+    /wxwidgets-native/3.2.1-r0/sysroot-destdir/path/to/build/tmp-glibc/work
+    /x86_64-linux/wxwidgets-native/3.2.1-r0/recipe-sysroot-native/usr/bin/wx-config
     pointing at /path/to/build/tmp-glibc/work/x86_64-linux/wxwidgets-native/3.2.1-r0
-	/recipe-sysroot-native/usr/lib/wx/config/gtk3-unicode-3.2.
+    /recipe-sysroot-native/usr/lib/wx/config/gtk3-unicode-3.2.
   Please replace this with a relative link.
 | ERROR: wxwidgets-native-3.2.1-r0 do_populate_sysroot: sstate found an
     absolute path symlink /path/to/build/tmp-glibc/work/x86_64-linux/wxwidgets-native
-	/3.2.1-r0/sysroot-destdir/path/to/build/tmp-glibc/work/x86_64-linux/wxwidgets-native
-	/3.2.1-r0/recipe-sysroot-native/usr/bin/wxrc pointing at /path/to/build/tmp-glibc
-	/work/x86_64-linux/wxwidgets-native/3.2.1-r0/recipe-sysroot-native/usr/bin/wxrc-3.2.
-  Please replace this with a relative link.
+    /3.2.1-r0/sysroot-destdir/path/to/build/tmp-glibc/work/x86_64-linux/wxwidgets-native
+    /3.2.1-r0/recipe-sysroot-native/usr/bin/wxrc pointing at /path/to/build/tmp-glibc
+    /work/x86_64-linux/wxwidgets-native/3.2.1-r0/recipe-sysroot-native/usr/bin/wxrc-3.2.
+   Please replace this with a relative link.
 
 Create symlink with relative path to fix the issues.
 
@@ -50,3 +55,6 @@ index dbed8cc9b3..1dbc3261d3 100644
              \"\$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/wxrc${EXE_SUFFIX}\" \
              )"
          )
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/not-append-system-name-to-lib-name.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0004-don-not-append-system-name-to-lib-name.patch
similarity index 73%
rename from meta-oe/recipes-extended/wxwidgets/wxwidgets/not-append-system-name-to-lib-name.patch
rename to meta-oe/recipes-extended/wxwidgets/wxwidgets/0004-don-not-append-system-name-to-lib-name.patch
index 6329256b0c..e3463ba170 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/not-append-system-name-to-lib-name.patch
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0004-don-not-append-system-name-to-lib-name.patch
@@ -1,3 +1,8 @@
+From 5e9725c1151e2b029066d61ef5dccf1f3e6cb323 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Sat, 12 Oct 2024 18:43:25 +0800
+Subject: [PATCH] don not append system name to lib name
+
 It appends system name to library names for cross compile. For example, the
 library name is libwx_baseu-3.1-Linux.so rather than libwx_baseu-3.1.so. It is
 not appropriate for oe.
@@ -14,10 +19,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/build/cmake/functions.cmake b/build/cmake/functions.cmake
-index e374d9a273..c6b1908bd6 100644
+index 81ede7d8ae..23eebeb914 100644
 --- a/build/cmake/functions.cmake
 +++ b/build/cmake/functions.cmake
-@@ -219,9 +219,9 @@ function(wx_set_target_properties target_name)
+@@ -243,9 +243,9 @@ function(wx_set_target_properties target_name)
      endif()
  
      set(cross_target)
@@ -30,3 +35,6 @@ index e374d9a273..c6b1908bd6 100644
  
      set(lib_prefix "lib")
      if(MSVC OR (WIN32 AND wxBUILD_SHARED))
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/wx-config-fix-libdir-for-multilib.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0005-wx-config-fix-libdir-for-multilib.patch
similarity index 74%
rename from meta-oe/recipes-extended/wxwidgets/wxwidgets/wx-config-fix-libdir-for-multilib.patch
rename to meta-oe/recipes-extended/wxwidgets/wxwidgets/0005-wx-config-fix-libdir-for-multilib.patch
index 628f8dee56..b650c50386 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/wx-config-fix-libdir-for-multilib.patch
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0005-wx-config-fix-libdir-for-multilib.patch
@@ -1,8 +1,14 @@
-It sets 'libdir' with path element 'lib' directly which is not suitable for
-multilib. Add an option '--baselib' for wx-config to support multilib when
-cross compile. And set default value of baselib with "lib${wxPLATFORM_LIB_DIR}".
+From 4230cd84f156f9eb5c9b80ffbc69dd55fa7c7ca7 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Sat, 12 Oct 2024 18:43:25 +0800
+Subject: [PATCH] wx-config: fix libdir for multilib
 
-Upstream-Status: Pending [oe specific]
+It sets 'libdir' with path element 'lib' directly which is not suitable
+for multilib. Add an option '--baselib' for wx-config to support
+multilib when cross compile. And set default value of baselib with
+"lib${wxPLATFORM_LIB_DIR}".
+
+Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 
@@ -15,10 +21,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  2 files changed, 5 insertions(+), 3 deletions(-)
 
 diff --git a/build/cmake/config.cmake b/build/cmake/config.cmake
-index 52ae69d3f6..28aa733eb0 100644
+index 9ec677534b..ee61cf7572 100644
 --- a/build/cmake/config.cmake
 +++ b/build/cmake/config.cmake
-@@ -86,7 +86,7 @@ function(wx_write_config)
+@@ -110,7 +110,7 @@ function(wx_write_config)
      set(prefix ${CMAKE_INSTALL_PREFIX})
      set(exec_prefix "\${prefix}")
      set(includedir "\${prefix}/include")
@@ -26,9 +32,9 @@ index 52ae69d3f6..28aa733eb0 100644
 +    set(libdir "\${exec_prefix}/\${baselib}")
      set(bindir "\${exec_prefix}/bin")
  
-     find_program(EGREP egrep)
+     if(wxBUILD_MONOLITHIC)
 diff --git a/wx-config.in b/wx-config.in
-index e3f7d115bb..0e78af03c7 100755
+index 1173d89685..8364a33e9d 100755
 --- a/wx-config.in
 +++ b/wx-config.in
 @@ -42,7 +42,8 @@ usage()
@@ -41,7 +47,7 @@ index e3f7d115bb..0e78af03c7 100755
             [--list] [--selected-config] [--host=HOST] [--toolkit=TOOLKIT]
             [--universal[=yes|no]] [--unicode[=yes|no]] [--static[=yes|no]]
             [--debug[=yes|no]] [--version[=VERSION]] [--flavour=FLAVOUR]
-@@ -137,7 +138,7 @@ wxconfig_output_options="prefix exec_prefix
+@@ -133,7 +134,7 @@ wxconfig_output_options="prefix exec_prefix
  
  # Options that permit the user to supply hints that may affect the output.
  # These options all accept arbitrary values, to interpret as they please.
@@ -50,7 +56,7 @@ index e3f7d115bb..0e78af03c7 100755
  
  # Input options that accept only a yes or no argument.
  #
-@@ -404,6 +405,7 @@ is_cross()  { [ "x@cross_compiling@" = "xyes" ]; }
+@@ -400,6 +401,7 @@ is_cross()  { [ "xno" = "xyes" ]; }
  # Determine the base directories we require.
  prefix=${input_option_prefix-${this_prefix:-@prefix@}}
  exec_prefix=${input_option_exec_prefix-${input_option_prefix-${this_exec_prefix:-@exec_prefix@}}}
@@ -58,3 +64,6 @@ index e3f7d115bb..0e78af03c7 100755
  wxconfdir="@libdir@/wx/config"
  
  installed_configs=`cd "$wxconfdir" 2> /dev/null && ls | grep -v "^inplace-"`
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/musl-locale-l.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0006-Fix-locale-on-musl.patch
similarity index 70%
rename from meta-oe/recipes-extended/wxwidgets/wxwidgets/musl-locale-l.patch
rename to meta-oe/recipes-extended/wxwidgets/wxwidgets/0006-Fix-locale-on-musl.patch
index e4ca6579f8..37d61dcb3f 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/musl-locale-l.patch
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0006-Fix-locale-on-musl.patch
@@ -1,8 +1,19 @@
-Upstream-Status: Pending
+From 64d5d7f68cde208c6f8a5e0b71da93f98e4720f7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 12 Oct 2024 20:30:16 +0800
+Subject: [PATCH] Fix locale on musl
 
 these macro'd away functions don't exist in musl (yet)
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/wx/xlocale.h | 20 ++++++++++++++++++++
+ 1 file changed, 20 insertions(+)
+
 diff --git a/include/wx/xlocale.h b/include/wx/xlocale.h
-index c433d25..3ab9d84 100644
+index c433d25d05..794cf0b66b 100644
 --- a/include/wx/xlocale.h
 +++ b/include/wx/xlocale.h
 @@ -33,6 +33,26 @@
@@ -32,3 +43,6 @@ index c433d25..3ab9d84 100644
  // The platform-specific locale type
  // If wxXLocale_t is not defined, then only "C" locale support is provided
  #ifdef wxHAS_XLOCALE_SUPPORT
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0007-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch
similarity index 83%
rename from meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch
rename to meta-oe/recipes-extended/wxwidgets/wxwidgets/0007-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch
index 5160f2e1fe..ef94e3551b 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0007-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch
@@ -1,4 +1,4 @@
-From e108aff9d6dae613f486c1b1681f4a3cdf17b845 Mon Sep 17 00:00:00 2001
+From 22f70d5bd039b20bfdad522341412ca001c639db Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 19 Dec 2022 15:07:55 -0800
 Subject: [PATCH] Set HAVE_LARGEFILE_SUPPORT to 1 explicitly
@@ -6,16 +6,17 @@ Subject: [PATCH] Set HAVE_LARGEFILE_SUPPORT to 1 explicitly
 nothing sets this to 0, but for some reason it gets undef'd
 
 Upstream-Status: Pending
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  build/cmake/setup.h.in | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/build/cmake/setup.h.in b/build/cmake/setup.h.in
-index bce33a73f3..22afb4cfa0 100644
+index fcc282980d..767adbf658 100644
 --- a/build/cmake/setup.h.in
 +++ b/build/cmake/setup.h.in
-@@ -869,8 +869,7 @@
+@@ -867,8 +867,7 @@
  /*
   * Define if large (64 bit file offsets) files are supported.
   */
@@ -26,5 +27,5 @@ index bce33a73f3..22afb4cfa0 100644
   * Use OpenGL
   */
 -- 
-2.39.0
+2.25.1
 
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb
similarity index 90%
rename from meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
rename to meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb
index 91653e2852..71e2a60e0c 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb
@@ -20,17 +20,18 @@ DEPENDS += " \
 
 SRC_URI = "gitsm://github.com/wxWidgets/wxWidgets.git;branch=3.2;protocol=https \
            file://0001-wx-config.in-Disable-cross-magic-it-does-not-work-fo.patch \
-           file://fix-libdir-for-multilib.patch \
-           file://create-links-with-relative-path.patch \
-           file://not-append-system-name-to-lib-name.patch \
-           file://wx-config-fix-libdir-for-multilib.patch \
-           file://0001-locale-Avoid-using-glibc-specific-defines-on-musl.patch \
-           file://musl-locale-l.patch \
-           file://0001-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch \
+           file://0002-fix-libdir-for-multilib.patch \
+           file://0003-create-links-with-relative-path.patch \
+           file://0004-don-not-append-system-name-to-lib-name.patch \
+           file://0005-wx-config-fix-libdir-for-multilib.patch \
+           file://0006-Fix-locale-on-musl.patch \
+           file://0007-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch \
            "
-SRCREV= "97e99707c5d2271a70cb686720b48dbf34ced496"
+SRCREV = "5ff25322553c1870cf20a2e1ba6f20ed50d9fe9a"
 S = "${WORKDIR}/git"
 
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
+
 # These can be either 'builtin' or 'sys' and builtin means cloned soures are
 # build. So these cannot be PACKAGECONFIGs and let's use libs where we can (see
 # DEPENDS)

