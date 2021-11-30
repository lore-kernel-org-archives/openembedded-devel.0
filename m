Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52787C43217
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 22:57:04 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web09.84608.1638313023312985304
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Nov 2021 14:57:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h9XH1ArF;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id l190so21461272pge.7
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Nov 2021 14:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=YP78CEfWzsb0nbJ7fnrYC+7tki+q8bCu4KgvUHimG7M=;
        b=h9XH1ArFuLXZ2HRaiAOZJyrCZmd298vQ488eXOse2mC0ZCifibOaTCpK24bfJyDFZD
         WKRG4iHBOdapUj4tFhtM/Oc2To4UJngb9OxBl7jPJKGdpk/1Hojp9n5rDOjUHke1VSIs
         RL1xj8/2d9Df6FVqYP44CF6RA00R8gNha7jjczyfYcin8OVSRNy262YCnX/qxFN+kX6/
         lrK4UinbReceHW+YMVQ/kBo9zJGIeRR9k/WOyAEacGhTb82axlqU/u8fyQUMp4fSydRc
         9mr4gLTEOWQ1S+JaZlzR0MA8AZdRMjzuoK6Q3qTBl5OcSdvQ2WqiPTgQxQiGKUQZ7Na2
         O9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YP78CEfWzsb0nbJ7fnrYC+7tki+q8bCu4KgvUHimG7M=;
        b=Y1b4WOZvW6o5xYLBTAm/+X6ejVkyU9tR2fRuYrEoKIG+3TIm8C4rLpS2TMoAX1Cpxu
         5ae7TwXVyD7O4nztixWfWA2msP8ATzrax0Wdw3jFRBShwRKK0xVQFHg1HG1kGXAdbjSi
         aY5T9oa9kGJfrTXxkioFoDN+xeOlSt3KSwiyDScPz7KwHF3Uw04Gt4p/xfiTe91jDBYV
         c0oN6YNht/tRrM01ZBkgVdlB9f4GNEKnRmmaKF+x1V0e4C8sePj3ZiEWp+IfglYtY4m+
         74JI+prawOms2SADjBdGUysqU/UsBk5+qreCinn/FmYZiR0tXLiRtpP/o2k4e52Rqxp9
         KkuQ==
X-Gm-Message-State: AOAM531MxbWYuytSpQxSg9p0JJlKwWCQB86hAUcjIlGFW0rBL2CGw+qt
	/18MzTPDi4HN7XZC+5Rmyk5Fws3fW2A=
X-Google-Smtp-Source: 
 ABdhPJx6/5hquP91E8xLrRzB1LLU3+sczt/JzcOOz8s82IF3S5Zsy2GvSTVPuHp/2C6ztivLOMHxJw==
X-Received: by 2002:aa7:93ce:0:b0:4a8:19fc:f024 with SMTP id
 y14-20020aa793ce000000b004a819fcf024mr2131609pff.10.1638313022568;
        Tue, 30 Nov 2021 14:57:02 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7839:c9c5:3df1:81ad])
        by smtp.gmail.com with ESMTPSA id
 p16sm23373028pfh.97.2021.11.30.14.57.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 14:57:02 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 5/6] sdbus-c++: don't fetch googletest during do_configure
Date: Tue, 30 Nov 2021 14:56:54 -0800
Message-Id: 
 <42d05b0f38f9b454df522fbe415217b42a47a816.1638312940.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638312940.git.akuster808@gmail.com>
References: <cover.1638312940.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Nov 2021 22:57:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94159

From: Martin Jansa <Martin.Jansa@gmail.com>

* with PTEST_ENABLED it enables with-tests PACKAGECONFIG which
  instead of using system googletest gmock, tries to fetch googletest
  from github and fails because branch was recently renamed from master to main

| -- Found PkgConfig: /OE/tmp-glibc/work/qemux86-oe-linux/sdbus-c++/0.8.3-r0/recipe-sysroot-native/usr/bin/pkg-config (found version "0.29.2")
| -- Checking for module 'libsystemd>=236'
| --   Found libsystemd, version 249
| -- Building with tests
| Fetching googletest...
| [1/9] Creating directories for 'googletest-populate'
| [1/9] Performing download step (git clone) for 'googletest-populate'
| Cloning into 'googletest-src'...
| fatal: invalid reference: master
| CMake Error at googletest-subbuild/googletest-populate-prefix/tmp/googletest-populate-gitclone.cmake:40 (message):
|   Failed to checkout tag: 'master'
|
|
| FAILED: googletest-populate-prefix/src/googletest-populate-stamp/googletest-populate-download
| cd /OE/tmp-glibc/work/qemux86-oe-linux/sdbus-c++/0.8.3-r0/build/_deps && /OE/tmp-glibc/work/qemux86-oe-linux/sdbus-c++/0.8.3-r0/recipe-sysroot-native/usr/bin/cmake -P /OE/tmp-glibc/work/qemux86-oe-linux/sdbus-c++/0.8.3-r0/build/_deps/googletest-subbuild/googletest-populate-prefix/tmp/googletest-populate-gitclone.cmake && /OE/tmp-glibc/work/qemux86-oe-linux/sdbus-c++/0.8.3-r0/recipe-sysroot-native/usr/bin/cmake -E touch /OE/tmp-glibc/work/qemux86-oe-linux/sdbus-c++/0.8.3-r0/build/_deps/googletest-subbuild/googletest-populate-prefix/src/googletest-populate-stamp/googletest-populate-download
| ninja: build stopped: subcommand failed.
|
| CMake Error at /OE/tmp-glibc/work/qemux86-oe-linux/sdbus-c++/0.8.3-r0/recipe-sysroot-native/usr/share/cmake-3.19/Modules/FetchContent.cmake:989 (message):
|   Build step for googletest failed: 1
| Call Stack (most recent call first):
|   /OE/tmp-glibc/work/qemux86-oe-linux/sdbus-c++/0.8.3-r0/recipe-sysroot-native/usr/share/cmake-3.19/Modules/FetchContent.cmake:1118:EVAL:2 (__FetchContent_directPopulate)
|   /OE/tmp-glibc/work/qemux86-oe-linux/sdbus-c++/0.8.3-r0/recipe-sysroot-native/usr/share/cmake-3.19/Modules/FetchContent.cmake:1118 (cmake_language)
|   tests/CMakeLists.txt:17 (FetchContent_Populate)
|
|
| -- Configuring incomplete, errors occurred!

* unfortunately this backported patch fixes the fetching failure, because
  it uses release-${GOOGLETEST_VERSION} tag instead of now non-existent
  master branch, but is not enough to prevent fetching from github during
  do_configure:

  -- Building with tests
  -- Could NOT find GTest (missing: GTest_DIR)
  -- Checking for module 'gmock>=1.10.0'
  --   No package 'gmock' found
  Fetching googletest...

  we also need to add googletest dependency to with-tests PACKAGECONFIG was fixed in meta-oe/master with the upgrade to 1.0.0:
  https://github.com/openembedded/meta-openembedded/commit/b26b66e5da92718b4e99a57fbfaaef9e751c3cfe#diff-48a847e7323703994fd2ce0fcb731ff860fa955a77cdfe39d71a9cc84a042c06L15

  then it's ok and not fetching:

  -- Building with tests
  -- Looking for pthread.h
  -- Looking for pthread.h - found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...d-googletest-in-the-system-before-do.patch | 96 +++++++++++++++++++
 .../recipes-core/sdbus-c++/sdbus-c++_0.8.3.bb |  9 +-
 2 files changed, 102 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.3/0001-Try-to-first-find-googletest-in-the-system-before-do.patch

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.3/0001-Try-to-first-find-googletest-in-the-system-before-do.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.3/0001-Try-to-first-find-googletest-in-the-system-before-do.patch
new file mode 100644
index 0000000000..89cb593e60
--- /dev/null
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.3/0001-Try-to-first-find-googletest-in-the-system-before-do.patch
@@ -0,0 +1,96 @@
+From b073e1c2b9a8138da83300f598b9a56fc9762b4b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Stanislav=20Angelovi=C4=8D?= <angelovic.s@gmail.com>
+Date: Mon, 16 Nov 2020 17:05:36 +0100
+Subject: [PATCH] Try to first find googletest in the system before downloading
+ it (#125)
+
+Upstream-Status: Backport [d6fdaca]
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+---
+ tests/CMakeLists.txt | 62 ++++++++++++++++++++++++++++----------------
+ 1 file changed, 40 insertions(+), 22 deletions(-)
+
+diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
+index 97f7c1a..7ecc327 100644
+--- a/tests/CMakeLists.txt
++++ b/tests/CMakeLists.txt
+@@ -2,26 +2,44 @@
+ # DOWNLOAD AND BUILD OF GOOGLETEST
+ #-------------------------------
+ 
+-include(FetchContent)
+-
+-message("Fetching googletest...")
+-FetchContent_Declare(googletest
+-                     GIT_REPOSITORY https://github.com/google/googletest.git
+-                     GIT_TAG        master
+-                     GIT_SHALLOW    1
+-                     UPDATE_COMMAND "")
+-
+-#FetchContent_MakeAvailable(googletest) # Not available in CMake 3.13 :-( Let's do it manually:
+-FetchContent_GetProperties(googletest)
+-if(NOT googletest_POPULATED)
+-    FetchContent_Populate(googletest)
+-    set(gtest_force_shared_crt ON CACHE INTERNAL "" FORCE)
+-    set(BUILD_GMOCK ON CACHE INTERNAL "" FORCE)
+-    set(INSTALL_GTEST OFF CACHE INTERNAL "" FORCE)
+-    set(BUILD_SHARED_LIBS_BAK ${BUILD_SHARED_LIBS})
+-    set(BUILD_SHARED_LIBS OFF)
+-    add_subdirectory(${googletest_SOURCE_DIR} ${googletest_BINARY_DIR})
+-    set(BUILD_SHARED_LIBS ${BUILD_SHARED_LIBS_BAK})
++set(GOOGLETEST_VERSION 1.10.0 CACHE STRING "Version of gmock to use")
++set(GOOGLETEST_GIT_REPO "https://github.com/google/googletest.git" CACHE STRING "A git repo to clone and build googletest from if gmock is not found in the system")
++
++find_package(GTest ${GOOGLETEST_VERSION} CONFIG)
++if (NOT TARGET GTest::gmock)
++    # Try pkg-config if GTest was not found through CMake config
++    find_package(PkgConfig)
++    if (PkgConfig_FOUND)
++        pkg_check_modules(GMock IMPORTED_TARGET GLOBAL gmock>=${GOOGLETEST_VERSION})
++        if(TARGET PkgConfig::GMock)
++            add_library(GTest::gmock ALIAS PkgConfig::GMock)
++        endif()
++    endif()
++    # GTest was not found in the system, build it on our own
++    if (NOT TARGET GTest::gmock)
++        include(FetchContent)
++
++        message("Fetching googletest...")
++        FetchContent_Declare(googletest
++                            GIT_REPOSITORY ${GOOGLETEST_GIT_REPO}
++                            GIT_TAG        release-${GOOGLETEST_VERSION}
++                            GIT_SHALLOW    1
++                            UPDATE_COMMAND "")
++
++        #FetchContent_MakeAvailable(googletest) # Not available in CMake 3.13 :-( Let's do it manually:
++        FetchContent_GetProperties(googletest)
++        if(NOT googletest_POPULATED)
++            FetchContent_Populate(googletest)
++            set(gtest_force_shared_crt ON CACHE INTERNAL "" FORCE)
++            set(BUILD_GMOCK ON CACHE INTERNAL "" FORCE)
++            set(INSTALL_GTEST OFF CACHE INTERNAL "" FORCE)
++            set(BUILD_SHARED_LIBS_BAK ${BUILD_SHARED_LIBS})
++            set(BUILD_SHARED_LIBS OFF)
++            add_subdirectory(${googletest_SOURCE_DIR} ${googletest_BINARY_DIR})
++            set(BUILD_SHARED_LIBS ${BUILD_SHARED_LIBS_BAK})
++            add_library(GTest::gmock ALIAS gmock)
++        endif()
++    endif()
+ endif()
+ 
+ #-------------------------------
+@@ -87,11 +105,11 @@ include_directories(${CMAKE_CURRENT_SOURCE_DIR})
+ 
+ add_executable(sdbus-c++-unit-tests ${UNITTESTS_SRCS})
+ target_compile_definitions(sdbus-c++-unit-tests PRIVATE LIBSYSTEMD_VERSION=${LIBSYSTEMD_VERSION})
+-target_link_libraries(sdbus-c++-unit-tests sdbus-c++-objlib gmock gmock_main)
++target_link_libraries(sdbus-c++-unit-tests sdbus-c++-objlib GTest::gmock)
+ 
+ add_executable(sdbus-c++-integration-tests ${INTEGRATIONTESTS_SRCS})
+ target_compile_definitions(sdbus-c++-integration-tests PRIVATE LIBSYSTEMD_VERSION=${LIBSYSTEMD_VERSION})
+-target_link_libraries(sdbus-c++-integration-tests sdbus-c++ gmock gmock_main)
++target_link_libraries(sdbus-c++-integration-tests sdbus-c++ GTest::gmock)
+ 
+ # Manual performance and stress tests
+ option(ENABLE_PERF_TESTS "Build and install manual performance tests (default OFF)" OFF)
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.3.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.3.bb
index 98829765c2..a8bf43c874 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.3.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.3.bb
@@ -12,13 +12,16 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'with-exte
                    ${@bb.utils.contains('PTEST_ENABLED', '1', 'with-tests', '', d)}"
 PACKAGECONFIG[with-builtin-libsystemd] = ",,sdbus-c++-libsystemd,libcap"
 PACKAGECONFIG[with-external-libsystemd] = ",,systemd,libsystemd"
-PACKAGECONFIG[with-tests] = "-DBUILD_TESTS=ON -DTESTS_INSTALL_PATH=${libdir}/${BPN}/tests,-DBUILD_TESTS=OFF"
+PACKAGECONFIG[with-tests] = "-DBUILD_TESTS=ON -DTESTS_INSTALL_PATH=${libdir}/${BPN}/tests,-DBUILD_TESTS=OFF,googletest gmock"
 
 DEPENDS += "expat"
 
 SRCREV = "6e8e5aadb674cccea5bdd55141db5dad887fbacd"
-SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=master"
-SRC_URI += "file://run-ptest"
+
+SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=master \
+    file://0001-Try-to-first-find-googletest-in-the-system-before-do.patch \
+    file://run-ptest \
+"
 
 EXTRA_OECMAKE = "-DBUILD_CODE_GEN=ON \
                  -DBUILD_DOC=ON \
-- 
2.25.1


