Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF8F4C83F22
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 18:34:47 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.41858.1752345278703102766
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Jul 2025 11:34:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E2GD5rRz;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7481600130eso3694375b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 11:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752345278; x=1752950078; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kc1xnv2ef7C5TMlTc2ZL5FRhbvwVyP5SzXvpq/9oQ8M=;
        b=E2GD5rRzmjFRcctG71Y0FzokVBWAJC48mhMpIm3ibIEzgWfEDtcLxfgMzQO2qJ4dvB
         W4TKNNu2fXApOUxoJRFDz/QdeXehnvNT3VxheoMYHnqN3DpJiz78TNQjpl3fqh88u2Fc
         yAj2scbjrxn/kU2MoW96TuQwxITSx21GVHkdpddfL0visq3x9DoBvQQI6bpvSmRSrv4L
         U3RLUG9/tQcgGmtpns2lzko2ZVjE8OoVcFMC0bqEbe9docOiGm9rHfBL4j76evvFZqBm
         +g805mSSYLFYi4TqriMI6PMf7PNGOje1NYbNSsLOpvy5k7mNAaUEW3lBFsOYLqF4wjZT
         R3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752345278; x=1752950078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kc1xnv2ef7C5TMlTc2ZL5FRhbvwVyP5SzXvpq/9oQ8M=;
        b=JEdfkG8+CH0ik/2NWCciJaMmTyYWGxM2SdGWuOhI0/xGZ3i3HMqyx9pe9iOt/Ms5uO
         qwKFH8j/WbFirKkEYgmmbtY7+D9C0jPkTOz7VJKWHI4GO8Kjz4fGhtdwspZtuKNZkXNY
         pbURNqntlhAqmFJKxItIYykHxcWrkJmzLMciLV8KtB/Vwtc2DZhdL4Gzt8IuiS/DKsbB
         g/bHhZjNvLahDpsa9XBbTfh0nTxSsmXyqTMQgwhFOeyvjygoFLo0BcP4R5C9NulOQpRr
         zrXMdQdKCZ+EAN2P1b5DqguMTJS9mNfGqyiBVflT+TLRACc5UvL2nymrYSBjPk8LQOsN
         zrDQ==
X-Gm-Message-State: AOJu0YwP9pU9p5mv1giQbox0l/YJNExigmsZglFL/E5OwYfOLaZniO40
	kRVtFZ0C28zKdEwreb/3s6Dbxg0f5NPg2+4NV4AACaK3XaPJUjdGH/2KzLaCKrd8
X-Gm-Gg: ASbGncvAC/IP/2UoIf1aTC22R8lqRmuFJvaYAzbgps9VZJ/oCuKY3rHudBoWSjw0gpy
	+kg4a2D9GsToOI7dPsjuDT/K2nAuUXr0C4vks3f2HOncdkkK3K/PnB1tBbpew59PV5bUxTF9eiI
	LK7sB1DaXwJs6XLQ2mBnymkE2o7NCTg1AvnW4ikP1KRN2pnsH0idP+7ZPwnc49tWm31RUSxdG5m
	tCmmpUOefWUbynC5ahPcITaIYpb2lgcyno4BwTklfapu1Ltr1MVAmJKoPWJqo5ro/ZBr0Ie4MTT
	UvCMU1324qq4+A8gqac5SGMGvRVp30QSzFl1Q7RPiOeLvTv+P90uGYqDmm0W7YiuUjqsAsdDnMG
	5V/eNZFi4Hzc/PQ==
X-Google-Smtp-Source: AGHT+IFe82GOpctC0sc5FrgGlcfOPOPhoaI+oPOrozCteGchlfpQMRQ/ahEAd2ZoLAmRlUwrcMuJRQ==
X-Received: by 2002:a05:6a00:2ea7:b0:746:3200:620 with SMTP id d2e1a72fcca58-74ee09ae685mr10116178b3a.9.1752345277566;
        Sat, 12 Jul 2025 11:34:37 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9e06883sm8058303b3a.63.2025.07.12.11.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 11:34:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] wxwidget: Upgrade to 3.2.8
Date: Sat, 12 Jul 2025 11:34:34 -0700
Message-ID: <20250712183435.4123243-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 18:34:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118485

Forward port patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0002-fix-libdir-for-multilib.patch        | 32 +++----------------
 ...{wxwidgets_3.2.6.bb => wxwidgets_3.2.8.bb} |  3 +-
 2 files changed, 5 insertions(+), 30 deletions(-)
 rename meta-oe/recipes-extended/wxwidgets/{wxwidgets_3.2.6.bb => wxwidgets_3.2.8.bb} (98%)

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0002-fix-libdir-for-multilib.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0002-fix-libdir-for-multilib.patch
index b599f38871..fe65dd2836 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0002-fix-libdir-for-multilib.patch
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0002-fix-libdir-for-multilib.patch
@@ -22,11 +22,9 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  build/cmake/install.cmake   | 12 ++++++------
  4 files changed, 10 insertions(+), 10 deletions(-)
 
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index f6ae7f6210..2a13e448db 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -45,7 +45,7 @@ include(build/cmake/policies.cmake NO_POLICY_SCOPE)
+@@ -43,7 +43,7 @@ include(build/cmake/policies.cmake NO_PO
  # Initialize variables for quick access to wx root dir in sub dirs
  set(wxSOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR})
  set(wxBINARY_DIR ${CMAKE_CURRENT_BINARY_DIR})
@@ -35,8 +33,6 @@ index f6ae7f6210..2a13e448db 100644
  
  # parse the version number from wx/version.h and include in wxMAJOR_VERSION and wxMINOR_VERSION
  file(READ "${wxSOURCE_DIR}/include/wx/version.h" WX_VERSION_H_CONTENTS)
-diff --git a/build/cmake/config.cmake b/build/cmake/config.cmake
-index addd8d6b81..9ec677534b 100644
 --- a/build/cmake/config.cmake
 +++ b/build/cmake/config.cmake
 @@ -100,7 +100,7 @@ function(wx_write_config_inplace)
@@ -48,26 +44,9 @@ index addd8d6b81..9ec677534b 100644
          "${wxBINARY_DIR}/wx-config"
          )
  endfunction()
-diff --git a/build/cmake/functions.cmake b/build/cmake/functions.cmake
-index 72a34f0b4f..81ede7d8ae 100644
---- a/build/cmake/functions.cmake
-+++ b/build/cmake/functions.cmake
-@@ -462,8 +462,8 @@ macro(wx_add_library name)
-         endif()
-         wx_install(TARGETS ${name}
-             EXPORT wxWidgetsTargets
--            LIBRARY DESTINATION "lib${GEN_EXPR_DIR}${wxPLATFORM_LIB_DIR}"
--            ARCHIVE DESTINATION "lib${GEN_EXPR_DIR}${wxPLATFORM_LIB_DIR}"
-+            LIBRARY DESTINATION "lib${LIB_SUFFIX}${GEN_EXPR_DIR}${wxPLATFORM_LIB_DIR}"
-+            ARCHIVE DESTINATION "lib${LIB_SUFFIX}${GEN_EXPR_DIR}${wxPLATFORM_LIB_DIR}"
-             RUNTIME DESTINATION "${runtime_dir}${GEN_EXPR_DIR}${wxPLATFORM_LIB_DIR}"
-             BUNDLE DESTINATION Applications/wxWidgets
-             )
-diff --git a/build/cmake/install.cmake b/build/cmake/install.cmake
-index 384c6837b8..d3303faabb 100644
 --- a/build/cmake/install.cmake
 +++ b/build/cmake/install.cmake
-@@ -29,11 +29,11 @@ if(WIN32_MSVC_NAMING)
+@@ -44,11 +44,11 @@ if(WIN32_MSVC_NAMING)
  else()
      install(
          DIRECTORY "${wxSETUP_HEADER_PATH}"
@@ -81,7 +60,7 @@ index 384c6837b8..d3303faabb 100644
          PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ
                      GROUP_EXECUTE GROUP_READ
                      WORLD_EXECUTE WORLD_READ
-@@ -42,13 +42,13 @@ else()
+@@ -57,13 +57,13 @@ else()
      install(DIRECTORY DESTINATION "bin")
      install(CODE "execute_process( \
          COMMAND ${CMAKE_COMMAND} -E create_symlink \
@@ -97,7 +76,7 @@ index 384c6837b8..d3303faabb 100644
  
  # find_package config file
  include(CMakePackageConfigHelpers)
-@@ -71,11 +71,11 @@ write_basic_package_version_file(
+@@ -86,11 +86,11 @@ write_basic_package_version_file(
  configure_package_config_file(
      "${wxSOURCE_DIR}/build/cmake/wxWidgetsConfig.cmake.in"
      "${projectConfig}"
@@ -111,6 +90,3 @@ index 384c6837b8..d3303faabb 100644
  )
  
  # uninstall target
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb
similarity index 98%
rename from meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb
rename to meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb
index 2cd154cab6..bfbb49d226 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb
@@ -18,7 +18,7 @@ DEPENDS += " \
     tiff \
 "
 
-SRC_URI = "gitsm://github.com/wxWidgets/wxWidgets.git;branch=3.2;protocol=https \
+SRC_URI = "gitsm://github.com/wxWidgets/wxWidgets.git;branch=3.2;protocol=https;tag=v${PV} \
            file://0001-wx-config.in-Disable-cross-magic-it-does-not-work-fo.patch \
            file://0002-fix-libdir-for-multilib.patch \
            file://0003-create-links-with-relative-path.patch \
@@ -27,7 +27,6 @@ SRC_URI = "gitsm://github.com/wxWidgets/wxWidgets.git;branch=3.2;protocol=https
            file://0006-Fix-locale-on-musl.patch \
            file://0007-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch \
            "
-SRCREV = "5ff25322553c1870cf20a2e1ba6f20ed50d9fe9a"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 

