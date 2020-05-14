Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
 by mx.groups.io with SMTP id smtpd.web11.6126.1589428615778568858
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 May 2020 20:56:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=MthTrnwE;
 spf=pass (domain: flex--wak.bounces.google.com, ip: 209.85.219.202, mailfrom: 3hsg8xgmkapcvzjfnnfkd.bnl@flex--wak.bounces.google.com)
Received: by mail-yb1-f202.google.com with SMTP id q16so1311024ybg.18
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2020 20:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=4Nwtd8I3+XWMBK7xRoZVopBmU+ujFFa+yoofH58e768=;
        b=MthTrnwEWNRU6acZeNRoaiQoM3SQY/2SWMpmeEfWd9DvIo7+a6rJWCMokMybsjESh9
         9iX8Tfkt3ZijU3wvajUbx7j+GhI41mOL8UAbZ1rakGaloJC2lHG7q0IwRfx9KjN1JWHq
         MNZXzpE6EqR+zj/xBBL0a8YUu3aFnCgSk1bFI0xpyIGFLhtdn+sLxHBQd6oBM/TEXWcj
         Or/q2wVd6MdgPtw7IdMJgvM14tB6NKaHFek8PxH4Tdkor1szVzi/AASl3YispHDTngxW
         oCoTpDuTPkInSVzTyaFspPMncH/zPWkr2VGuLpd1zrqNem6bc6Ei7cMmnloqhlQyb9Dc
         iZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=4Nwtd8I3+XWMBK7xRoZVopBmU+ujFFa+yoofH58e768=;
        b=sh0L1cunTu80cuStHg0GLs8t9cMceJbT2OeLZw2IFB1YmOtk628pqUk+Od2tiKuvj6
         pCeoylqH0SihH5KindhNDNClsLtzyEFkk7PG5/yOg0YRHGzHfEcpjNRF8HZEnApbr0Wd
         xW4Yt7dQKuQHuz6Hgh1B3uVkVOxbqqFkqqF9b6xzgHbt7fOIdI0KPtf1FnBHC941/nZh
         N9G21U0T2apY4ABkSm1Lh7b/ti6iWQWKUOJZ/HhynuvUejJI9qylTqddSMHfO/SXkot8
         nFsTFBJa5Q9MkKp3C8tcSGU6p5Ej742mFYICKEaT+Fb92UgHVmMffqkbFvabE24yBBKh
         GoEQ==
X-Gm-Message-State: AOAM530fZkJCOO63OZ4J4cQagqaEFjYGjoigXsFNmGOig1LReJW6BBig
	duWiwFAXRWzfRLbJtrsR5sF6dw3b8Dow7I5z9PuWIZRtELWTyQGsqddaGVJMD6+ZHtE9ykg1XhK
	3FOkVpXRihQFiRwBZK5HKzGTEhvIzEEfOWQlWElXtD8NlGbffZN+QRPUnVu4HGjN2iMZwqPv/B8
	DDk0M=
X-Google-Smtp-Source: ABdhPJxF2Hch3nOg1O9LQlPeOpMALKS0GdX9h/b1fIBk6t26szmYpxHN3v2AMJHJTtH9th0FES8lkC0=
X-Received: by 2002:a25:1484:: with SMTP id 126mr3651846ybu.380.1589428614769;
 Wed, 13 May 2020 20:56:54 -0700 (PDT)
Date: Wed, 13 May 2020 20:56:48 -0700
Message-Id: <20200514035648.85149-1-wak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
Subject: [meta-oe][PATCH] cli11: upgrade 1.8.0 -> 1.9.0
From: "William A. Kennington III" <wak@google.com>
To: openembedded-devel@lists.openembedded.org
Cc: "William A. Kennington III" <wak@google.com>
Content-Type: text/plain; charset="UTF-8"

Variants of the patches are now included upstream so the local patching
can be removed.

Signed-off-by: William A. Kennington III <wak@google.com>
---
 .../cli11/{cli11_1.8.0.bb => cli11_1.9.0.bb}  |  8 +---
 .../files/0001-Add-CLANG_TIDY-check.patch     | 25 ------------
 ...stallDirs-instead-of-hard-coded-path.patch | 39 -------------------
 3 files changed, 1 insertion(+), 71 deletions(-)
 rename meta-oe/recipes-support/cli11/{cli11_1.8.0.bb => cli11_1.9.0.bb} (68%)
 delete mode 100644 meta-oe/recipes-support/cli11/files/0001-Add-CLANG_TIDY-check.patch
 delete mode 100644 meta-oe/recipes-support/cli11/files/0001-Use-GNUInstallDirs-instead-of-hard-coded-path.patch

diff --git a/meta-oe/recipes-support/cli11/cli11_1.8.0.bb b/meta-oe/recipes-support/cli11/cli11_1.9.0.bb
similarity index 68%
rename from meta-oe/recipes-support/cli11/cli11_1.8.0.bb
rename to meta-oe/recipes-support/cli11/cli11_1.9.0.bb
index dd129cbec..151653b22 100644
--- a/meta-oe/recipes-support/cli11/cli11_1.8.0.bb
+++ b/meta-oe/recipes-support/cli11/cli11_1.9.0.bb
@@ -6,18 +6,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b73927b18d5c6cd8d2ed28a6ad539733"
 SRCREV = "13becaddb657eacd090537719a669d66d393b8b2"
 PV .= "+git${SRCPV}"
 
-SRC_URI += "gitsm://github.com/CLIUtils/CLI11 \
-            file://0001-Add-CLANG_TIDY-check.patch \
-            file://0001-Use-GNUInstallDirs-instead-of-hard-coded-path.patch \
-           "
+SRC_URI += "gitsm://github.com/CLIUtils/CLI11"
 
 S = "${WORKDIR}/git"
 
 inherit cmake
 inherit ptest
 
-EXTRA_OECMAKE += "-DCLANG_TIDY=OFF"
-DEPENDS += "boost"
-
 # cli11 is a header only C++ library, so the main package will be empty.
 RDEPENDS_${PN}-dev = ""
diff --git a/meta-oe/recipes-support/cli11/files/0001-Add-CLANG_TIDY-check.patch b/meta-oe/recipes-support/cli11/files/0001-Add-CLANG_TIDY-check.patch
deleted file mode 100644
index 02b3c9bd7..000000000
--- a/meta-oe/recipes-support/cli11/files/0001-Add-CLANG_TIDY-check.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 902b251fd8d6408ee6623e7a92692948cf90187d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 12 Feb 2019 13:22:21 -0800
-Subject: [PATCH] Add CLANG_TIDY check
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7073a0b..2dd2c02 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -60,7 +60,7 @@ if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
-         endif()
-     endif()
- 
--    if(CMAKE_VERSION VERSION_GREATER 3.6)
-+    if(CMAKE_VERSION VERSION_GREATER 3.6 AND CLANG_TIDY)
-         # Add clang-tidy if available
-         option(CLANG_TIDY_FIX "Perform fixes for Clang-Tidy" OFF)
-         find_program(
diff --git a/meta-oe/recipes-support/cli11/files/0001-Use-GNUInstallDirs-instead-of-hard-coded-path.patch b/meta-oe/recipes-support/cli11/files/0001-Use-GNUInstallDirs-instead-of-hard-coded-path.patch
deleted file mode 100644
index 4541cd929..000000000
--- a/meta-oe/recipes-support/cli11/files/0001-Use-GNUInstallDirs-instead-of-hard-coded-path.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 8c51221f748bca1483fe1141e584867d2ff34a07 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 19 Dec 2019 16:26:39 -0800
-Subject: [PATCH] Use GNUInstallDirs instead of hard-coded path
-
-Upstream-Status: Submitted [https://github.com/CLIUtils/CLI11/pull/373]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- CMakeLists.txt | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7073a0b..5236fd2 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -120,17 +120,18 @@ endif()
- configure_file("${CMAKE_CURRENT_SOURCE_DIR}/cmake/CLI11ConfigVersion.cmake.in"
-   "${CMAKE_CURRENT_BINARY_DIR}/CLI11ConfigVersion.cmake" @ONLY)
- 
-+include(GNUInstallDirs)
- # These installs only make sense for a local project
- if(CUR_PROJ)
-     # Make version available in the install
-     install(FILES "${CMAKE_CURRENT_BINARY_DIR}/CLI11ConfigVersion.cmake"
--            DESTINATION lib/cmake/CLI11)
-+            DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/CLI11)
- 
-     # Install the export target as a file
-     install(EXPORT CLI11Targets
-             FILE CLI11Config.cmake
-             NAMESPACE CLI11::
--            DESTINATION lib/cmake/CLI11)
-+            DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/CLI11)
- 
-     # Use find_package on the installed package
-     export(TARGETS CLI11
--- 
-2.24.1
-
-- 
2.26.2.645.ge9eca65c58-goog

