Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.3444.1631682158414421465
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Sep 2021 22:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tanous-net.20150623.gappssmtp.com header.s=20150623 header.b=JgDgg0fR;
 spf=none, err=permanent DNS error (domain: tanous.net, ip: 209.85.214.176, mailfrom: ed@tanous.net)
Received: by mail-pl1-f176.google.com with SMTP id v2so880231plp.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Sep 2021 22:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tanous-net.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gfmlfkFTdqBkhlV522UHqVco9XZ7JqP5jh36S4juBrE=;
        b=JgDgg0fRJFQu/U+TsYBQqyu9UC0DaJjfG0ahgyjAQyqLy03HWeilqlerH65U6wVuYB
         lzYWOeXzwJf0mwBbVlA0r0AhM01OxUrSIrpCtSwIoE57Ji218vg+CGOw7W5dflKzYLf/
         4aq4YeaW2tV1qhku/LZ8+oOnoBLOWSU4dlamXJvS6ILaqzwqvUJMc7yZ/WU0PLvxnsve
         p5EQKJQF71MT+WX8qqhcDV+4j/D4N+qoP2efZtN6hZt9A8pvMR9qquwBeIFoMBWpJeEE
         lp2hhlczd7Fr94OKIoMmkrc+Afoi3mpcJhintoFO3flYMGAKKUcD2XwxB4VPHiaB10VV
         TVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gfmlfkFTdqBkhlV522UHqVco9XZ7JqP5jh36S4juBrE=;
        b=cwi+K84Gz6krAdxIfFa4hxKP3dNSl614/3fPnZzFqK2RUkW8Dz39MhK+UaJG3BNFRD
         kepum4Vk7Xa8pIO/TXlCm2dunp8h7ZDc1SQPM0hbrqbeizHpc6PZtISKen0gsvmGvSE7
         O2MmlQI2/IOQAvTJgvlb41Jq36julPYkmOzn5QrJ5jkck1cYdafew0Ve3ZdOVjQrobCG
         jJhoT5v1gWy2j7hio1ywhxE+lwn0VhInZP4cb7EoevCSUVgUtafMYTMjmiZctZpPHYc6
         +knyp/O72njJcdT0zaPTQ13b20dDpt0uaIZHsje0pOnHe09BKQo9Svvi+dvaFF6ICTrj
         vD1w==
X-Gm-Message-State: AOAM5304U7t1Z5FV1Du2lityVAvRbyVTsGdWgD3GOMqNIlxXjF61M1EZ
	3DJf2i7A16B2fcgaqoxtyuDtbr+p0dk85Q==
X-Google-Smtp-Source: ABdhPJwkXXDOu0sz2i3RvvirnyM8RXrS5eVYwPZVhqlrjIQwA+jjxy4iaG7ij7mLC/F7mgKljjeOqQ==
X-Received: by 2002:a17:902:7b88:b0:138:7c09:1165 with SMTP id w8-20020a1709027b8800b001387c091165mr18050369pll.32.1631682157233;
        Tue, 14 Sep 2021 22:02:37 -0700 (PDT)
Return-Path: <ed@tanous.net>
Received: from edtanous.svl.corp.google.com ([2620:15c:2c5:13:89e1:c404:1565:3f11])
        by smtp.gmail.com with ESMTPSA id w67sm10473888pfb.99.2021.09.14.22.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 22:02:36 -0700 (PDT)
From: "Ed Tanous" <ed@tanous.net>
To: openembedded-devel@lists.openembedded.org
Cc: Ed Tanous <ed@tanous.net>
Subject: [meta-oe][PATCH] Boost-url Move to latest version
Date: Tue, 14 Sep 2021 22:02:32 -0700
Message-Id: <20210915050232.3655567-1-ed@tanous.net>
X-Mailer: git-send-email 2.33.0.464.g1972c5931b-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ed Tanous <ed@tanous.net>

This commit aims to update the version of boost-url to latest, and to
make compatibility changes to make the latest version build.

As of 0b96da0e4727c692c48cc95a32d82634cb41aaaf on the boost url repo,
the standalone build type has been removed, which breaks this recipe.  A
quick discussion with the maintainers [1] shows that the cmake was never
really intended to be used for installation, even if it worked in the
past, and in the future only intended for use within the boost
superproject.  They recommended that since this is a header only
library, that a simple copy would be a better way to stay up to date
with this library.  As such, this commit removes the cmake bbclass, and
replaces it with a simple do_install that is a simply copy into the
include directories.

At the same time, the previous patch to add GNUInstallDirs support to
the cmake no longer applies, and is no longer needed, so it is removed
at the same time.

The SHA1 is also updated to the latest available.

[1] https://cpplang.slack.com/archives/C01JR6C9C4U/p1631654296241200

Signed-off-by: Ed Tanous <ed@tanous.net>
---
 ...rs-instead-of-hard-wiring-install-di.patch | 57 -------------------
 .../boost-url/boost-url_git.bb                | 13 +++--
 2 files changed, 7 insertions(+), 63 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/boost-url/boost-url/0001-Use-GNUInstallDirs-instead-of-hard-wiring-install-di.patch

diff --git a/meta-oe/recipes-devtools/boost-url/boost-url/0001-Use-GNUInstallDirs-instead-of-hard-wiring-install-di.patch b/meta-oe/recipes-devtools/boost-url/boost-url/0001-Use-GNUInstallDirs-instead-of-hard-wiring-install-di.patch
deleted file mode 100644
index 4c996656c..000000000
--- a/meta-oe/recipes-devtools/boost-url/boost-url/0001-Use-GNUInstallDirs-instead-of-hard-wiring-install-di.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 329e27c8ad30e76ab50c7949cc95ba8eb0efabd2 Mon Sep 17 00:00:00 2001
-From: Anton Blanchard <anton@ozlabs.org>
-Date: Tue, 17 Aug 2021 09:53:41 +1000
-Subject: [PATCH] Use GNUInstallDirs instead of hard wiring install directories
-
-On a multilib setup cmake files should go into lib64.
-
-Upstream-Status: Submitted [https://github.com/CPPAlliance/url/pull/38]
----
- CMakeLists.txt | 10 ++++++----
- 1 file changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 5b53f31..ebb7346 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -109,20 +109,22 @@ else()
- endif()
- 
- if(CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR AND NOT BOOST_URL_IN_BOOST_TREE)
-+    include(GNUInstallDirs)
-+
-     set_target_properties(boost_url PROPERTIES EXPORT_NAME url)
-     install(TARGETS boost_url EXPORT boost_url_targets)
- 
-     install(EXPORT boost_url_targets
-         FILE boost_url-targets.cmake
-         NAMESPACE Boost::
--        DESTINATION lib/cmake/boost_url
-+        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/boost_url
-     )
- 
-     include(CMakePackageConfigHelpers)
- 
-     configure_package_config_file(cmake/config.cmake.in
-         ${CMAKE_CURRENT_BINARY_DIR}/boost_url-config.cmake
--        INSTALL_DESTINATION lib/cmake/boost_url
-+        INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/boost_url
-     )
- 
-     write_basic_package_version_file(${CMAKE_CURRENT_BINARY_DIR}/boost_url-config-version.cmake
-@@ -132,10 +134,10 @@ if(CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR AND NOT BOOST_URL_IN_BOOST
-     install(FILES
-         ${CMAKE_CURRENT_BINARY_DIR}/boost_url-config.cmake
-         ${CMAKE_CURRENT_BINARY_DIR}/boost_url-config-version.cmake
--        DESTINATION lib/cmake/boost_url
-+        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/boost_url
-     )
- 
--    install(DIRECTORY include/ DESTINATION include)
-+    install(DIRECTORY include/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
- endif()
- 
- if(BOOST_URL_BUILD_TESTS)
--- 
-2.31.1
-
diff --git a/meta-oe/recipes-devtools/boost-url/boost-url_git.bb b/meta-oe/recipes-devtools/boost-url/boost-url_git.bb
index cb3664fe3..9f759100b 100644
--- a/meta-oe/recipes-devtools/boost-url/boost-url_git.bb
+++ b/meta-oe/recipes-devtools/boost-url/boost-url_git.bb
@@ -4,16 +4,17 @@ SECTION = "libs"
 LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
-SRC_URI = "git://github.com/CPPAlliance/url.git;branch=develop \
-           file://0001-Use-GNUInstallDirs-instead-of-hard-wiring-install-di.patch \
-           "
+SRC_URI = "git://github.com/CPPAlliance/url.git;branch=develop"
 
-SRCREV = "2c867fbe284ae532f1329b87a86ad3f8cd382867"
+SRCREV = "4f712ed69a04a344957d22efa5dc111b415b3aff"
 
 S = "${WORKDIR}/git"
 
-inherit cmake
-
 DEPENDS = "boost"
 
 BBCLASSEXTEND = "native nativesdk"
+
+do_install() {
+    mkdir -p ${D}/${includedir}
+    cp -r ${S}/include/** ${D}/${includedir}/
+}
-- 
2.33.0.464.g1972c5931b-goog

