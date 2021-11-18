Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70961C433F5
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 16:37:54 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.4010.1637253473169941469
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:37:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RI1YQ29R;
 spf=pass (domain: gmail.com, ip: 209.85.216.52,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id
 gf14-20020a17090ac7ce00b001a7a2a0b5c3so8656518pjb.5
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=1vxye8M2FRlEpbzX7BXfQ4ZTHcCfM9QGkRhc4UN4nCM=;
        b=RI1YQ29RgfSjYZSXukAby0s0VodHIGxA+X4G0Eq/GHE+sQ3fDnxhs0ammR74e+nwuY
         60Ni7Wv24hLlrNoAi1LOSHV2/pFyoQH38q5z+6o82O2cSXA1fnpqvJiLR7a3FDMY4dWj
         oOMtekUqez4yM8FdBGNoANr0oHJaAHJUvMiZcS5MHsden6gi6mpzOWLcD2jOlYtmId4T
         3HdXo0hdKgZiKuTxH4anpjzZ+L1y+/DJ0rYxet/0OTSRfTD38K8E9yhuYn86H1ocmkfd
         lvAJdRkDT3bGn1nyXlSJjdVp3kBakthC5wrtN8Y8mFUmJDyCiBSuGu8kcH/2GZlazpjO
         pk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=1vxye8M2FRlEpbzX7BXfQ4ZTHcCfM9QGkRhc4UN4nCM=;
        b=5ubK/kzlZeAYfwxZIAqvSwK6IukOxqOBNz7ieRuWYPt74OjwKfSUgv4wlWF9US93EV
         xEYCb5FmiWj8nnH9YT3fueSpeWbz1qVxtuOeQ//9F0a8LyDYuvz6yVEoWuq6zKeNxqAh
         j43MS1q7F9sZ8oVZMDJsZo1l2KoYxiPOeoUm05apXdqbTeQK585SwWSOLhu9HzyOGqlZ
         q0FDRCA9CRdbxbh6WRnJQiYCfXfqzZurMCrBOWjO/67AFfr/vfOH6oNtCjvTTSHowAPi
         sSzWiZAo8SLt3bzzh287OlkWu1ZPA8lLg6YjN4K1Xo/GEfbu3aR/fkp1lc/0EAdCo/U3
         GrZQ==
X-Gm-Message-State: AOAM530OX69hL2J/DcckywcM0ocE26yH1RnNhNFKyTRk48geKDPIV8ed
	4n4teVoplY/dBnvcFB6dH+DxcYTsfJk=
X-Google-Smtp-Source: 
 ABdhPJwxaOLEtxbHzti3vq/NsnC6JkVeEZtJ12ISrgaDprhw/ycCH9Pt2JqRRYLnA9OkR9qpDj1kMQ==
X-Received: by 2002:a17:90b:4d8c:: with SMTP id
 oj12mr12067121pjb.100.1637253472239;
        Thu, 18 Nov 2021 08:37:52 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:3c8f:55bf:8865:29aa?
 ([2601:202:4180:a5c0:3c8f:55bf:8865:29aa])
        by smtp.gmail.com with ESMTPSA id
 t31sm154278pgl.47.2021.11.18.08.37.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 08:37:51 -0800 (PST)
Subject: Re: [oe] [dunfell][PATCH] sdbus-c++: don't fetch googletest during
 do_configure
To: Martin Jansa <Martin.Jansa@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20211118113219.15145-1-Martin.Jansa@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <2da597d8-aad0-0d6b-c565-d6e1ef11405b@gmail.com>
Date: Thu, 18 Nov 2021 08:37:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211118113219.15145-1-Martin.Jansa@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Nov 2021 16:37:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94046



On 11/18/21 3:32 AM, Martin Jansa wrote:
> * with PTEST_ENABLED it enables with-tests PACKAGECONFIG which
>   instead of using system googletest gmock, tries to fetch googletest
>   from github and fails because branch was recently renamed from master to main
>
> | -- Found PkgConfig: /OE/tmp-glibc/work/qemux86-oe-linux/sdbus-c++/0.8.3-r0/recipe-sysroot-native/usr/bin/pkg-config (found version "0.29.2")
> | -- Checking for module 'libsystemd>=236'
> | --   Found libsystemd, version 249
> | -- Building with tests
> | Fetching googletest...
> | [1/9] Creating directories for 'googletest-populate'
> | [1/9] Performing download step (git clone) for 'googletest-populate'
> | Cloning into 'googletest-src'...
> | fatal: invalid reference: master
> | CMake Error at googletest-subbuild/googletest-populate-prefix/tmp/googletest-populate-gitclone.cmake:40 (message):
> |   Failed to checkout tag: 'master'

thanks,

I noticed this failing in my staging builds yesterday.

-armin
> |
> | FAILED: googletest-populate-prefix/src/googletest-populate-stamp/googletest-populate-download
> | cd /OE/tmp-glibc/work/qemux86-oe-linux/sdbus-c++/0.8.3-r0/build/_deps && /OE/tmp-glibc/work/qemux86-oe-linux/sdbus-c++/0.8.3-r0/recipe-sysroot-native/usr/bin/cmake -P /OE/tmp-glibc/work/qemux86-oe-linux/sdbus-c++/0.8.3-r0/build/_deps/googletest-subbuild/googletest-populate-prefix/tmp/googletest-populate-gitclone.cmake && /OE/tmp-glibc/work/qemux86-oe-linux/sdbus-c++/0.8.3-r0/recipe-sysroot-native/usr/bin/cmake -E touch /OE/tmp-glibc/work/qemux86-oe-linux/sdbus-c++/0.8.3-r0/build/_deps/googletest-subbuild/googletest-populate-prefix/src/googletest-populate-stamp/googletest-populate-download
> | ninja: build stopped: subcommand failed.
> |
> | CMake Error at /OE/tmp-glibc/work/qemux86-oe-linux/sdbus-c++/0.8.3-r0/recipe-sysroot-native/usr/share/cmake-3.19/Modules/FetchContent.cmake:989 (message):
> |   Build step for googletest failed: 1
> | Call Stack (most recent call first):
> |   /OE/tmp-glibc/work/qemux86-oe-linux/sdbus-c++/0.8.3-r0/recipe-sysroot-native/usr/share/cmake-3.19/Modules/FetchContent.cmake:1118:EVAL:2 (__FetchContent_directPopulate)
> |   /OE/tmp-glibc/work/qemux86-oe-linux/sdbus-c++/0.8.3-r0/recipe-sysroot-native/usr/share/cmake-3.19/Modules/FetchContent.cmake:1118 (cmake_language)
> |   tests/CMakeLists.txt:17 (FetchContent_Populate)
> |
> |
> | -- Configuring incomplete, errors occurred!
>
> * unfortunately this backported patch fixes the fetching failure, because
>   it uses release-${GOOGLETEST_VERSION} tag instead of now non-existent
>   master branch, but is not enough to prevent fetching from github during
>   do_configure:
>
>   -- Building with tests
>   -- Could NOT find GTest (missing: GTest_DIR)
>   -- Checking for module 'gmock>=1.10.0'
>   --   No package 'gmock' found
>   Fetching googletest...
>
>   we also need to add googletest dependency to with-tests PACKAGECONFIG was fixed in meta-oe/master with the upgrade to 1.0.0:
>   https://github.com/openembedded/meta-openembedded/commit/b26b66e5da92718b4e99a57fbfaaef9e751c3cfe#diff-48a847e7323703994fd2ce0fcb731ff860fa955a77cdfe39d71a9cc84a042c06L15
>
>   then it's ok and not fetching:
>
>   -- Building with tests
>   -- Looking for pthread.h
>   -- Looking for pthread.h - found
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ...d-googletest-in-the-system-before-do.patch | 96 +++++++++++++++++++
>  .../recipes-core/sdbus-c++/sdbus-c++_0.8.1.bb |  9 +-
>  2 files changed, 102 insertions(+), 3 deletions(-)
>  create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.1/0001-Try-to-first-find-googletest-in-the-system-before-do.patch
>
> diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.1/0001-Try-to-first-find-googletest-in-the-system-before-do.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.1/0001-Try-to-first-find-googletest-in-the-system-before-do.patch
> new file mode 100644
> index 0000000000..89cb593e60
> --- /dev/null
> +++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.1/0001-Try-to-first-find-googletest-in-the-system-before-do.patch
> @@ -0,0 +1,96 @@
> +From b073e1c2b9a8138da83300f598b9a56fc9762b4b Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Stanislav=20Angelovi=C4=8D?= <angelovic.s@gmail.com>
> +Date: Mon, 16 Nov 2020 17:05:36 +0100
> +Subject: [PATCH] Try to first find googletest in the system before downloading
> + it (#125)
> +
> +Upstream-Status: Backport [d6fdaca]
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +
> +---
> + tests/CMakeLists.txt | 62 ++++++++++++++++++++++++++++----------------
> + 1 file changed, 40 insertions(+), 22 deletions(-)
> +
> +diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
> +index 97f7c1a..7ecc327 100644
> +--- a/tests/CMakeLists.txt
> ++++ b/tests/CMakeLists.txt
> +@@ -2,26 +2,44 @@
> + # DOWNLOAD AND BUILD OF GOOGLETEST
> + #-------------------------------
> + 
> +-include(FetchContent)
> +-
> +-message("Fetching googletest...")
> +-FetchContent_Declare(googletest
> +-                     GIT_REPOSITORY https://github.com/google/googletest.git
> +-                     GIT_TAG        master
> +-                     GIT_SHALLOW    1
> +-                     UPDATE_COMMAND "")
> +-
> +-#FetchContent_MakeAvailable(googletest) # Not available in CMake 3.13 :-( Let's do it manually:
> +-FetchContent_GetProperties(googletest)
> +-if(NOT googletest_POPULATED)
> +-    FetchContent_Populate(googletest)
> +-    set(gtest_force_shared_crt ON CACHE INTERNAL "" FORCE)
> +-    set(BUILD_GMOCK ON CACHE INTERNAL "" FORCE)
> +-    set(INSTALL_GTEST OFF CACHE INTERNAL "" FORCE)
> +-    set(BUILD_SHARED_LIBS_BAK ${BUILD_SHARED_LIBS})
> +-    set(BUILD_SHARED_LIBS OFF)
> +-    add_subdirectory(${googletest_SOURCE_DIR} ${googletest_BINARY_DIR})
> +-    set(BUILD_SHARED_LIBS ${BUILD_SHARED_LIBS_BAK})
> ++set(GOOGLETEST_VERSION 1.10.0 CACHE STRING "Version of gmock to use")
> ++set(GOOGLETEST_GIT_REPO "https://github.com/google/googletest.git" CACHE STRING "A git repo to clone and build googletest from if gmock is not found in the system")
> ++
> ++find_package(GTest ${GOOGLETEST_VERSION} CONFIG)
> ++if (NOT TARGET GTest::gmock)
> ++    # Try pkg-config if GTest was not found through CMake config
> ++    find_package(PkgConfig)
> ++    if (PkgConfig_FOUND)
> ++        pkg_check_modules(GMock IMPORTED_TARGET GLOBAL gmock>=${GOOGLETEST_VERSION})
> ++        if(TARGET PkgConfig::GMock)
> ++            add_library(GTest::gmock ALIAS PkgConfig::GMock)
> ++        endif()
> ++    endif()
> ++    # GTest was not found in the system, build it on our own
> ++    if (NOT TARGET GTest::gmock)
> ++        include(FetchContent)
> ++
> ++        message("Fetching googletest...")
> ++        FetchContent_Declare(googletest
> ++                            GIT_REPOSITORY ${GOOGLETEST_GIT_REPO}
> ++                            GIT_TAG        release-${GOOGLETEST_VERSION}
> ++                            GIT_SHALLOW    1
> ++                            UPDATE_COMMAND "")
> ++
> ++        #FetchContent_MakeAvailable(googletest) # Not available in CMake 3.13 :-( Let's do it manually:
> ++        FetchContent_GetProperties(googletest)
> ++        if(NOT googletest_POPULATED)
> ++            FetchContent_Populate(googletest)
> ++            set(gtest_force_shared_crt ON CACHE INTERNAL "" FORCE)
> ++            set(BUILD_GMOCK ON CACHE INTERNAL "" FORCE)
> ++            set(INSTALL_GTEST OFF CACHE INTERNAL "" FORCE)
> ++            set(BUILD_SHARED_LIBS_BAK ${BUILD_SHARED_LIBS})
> ++            set(BUILD_SHARED_LIBS OFF)
> ++            add_subdirectory(${googletest_SOURCE_DIR} ${googletest_BINARY_DIR})
> ++            set(BUILD_SHARED_LIBS ${BUILD_SHARED_LIBS_BAK})
> ++            add_library(GTest::gmock ALIAS gmock)
> ++        endif()
> ++    endif()
> + endif()
> + 
> + #-------------------------------
> +@@ -87,11 +105,11 @@ include_directories(${CMAKE_CURRENT_SOURCE_DIR})
> + 
> + add_executable(sdbus-c++-unit-tests ${UNITTESTS_SRCS})
> + target_compile_definitions(sdbus-c++-unit-tests PRIVATE LIBSYSTEMD_VERSION=${LIBSYSTEMD_VERSION})
> +-target_link_libraries(sdbus-c++-unit-tests sdbus-c++-objlib gmock gmock_main)
> ++target_link_libraries(sdbus-c++-unit-tests sdbus-c++-objlib GTest::gmock)
> + 
> + add_executable(sdbus-c++-integration-tests ${INTEGRATIONTESTS_SRCS})
> + target_compile_definitions(sdbus-c++-integration-tests PRIVATE LIBSYSTEMD_VERSION=${LIBSYSTEMD_VERSION})
> +-target_link_libraries(sdbus-c++-integration-tests sdbus-c++ gmock gmock_main)
> ++target_link_libraries(sdbus-c++-integration-tests sdbus-c++ GTest::gmock)
> + 
> + # Manual performance and stress tests
> + option(ENABLE_PERF_TESTS "Build and install manual performance tests (default OFF)" OFF)
> diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.1.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.1.bb
> index c4d63fd272..a94fb8deff 100644
> --- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.1.bb
> +++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.1.bb
> @@ -12,13 +12,16 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'with-exte
>                     ${@bb.utils.contains('PTEST_ENABLED', '1', 'with-tests', '', d)}"
>  PACKAGECONFIG[with-builtin-libsystemd] = ",,sdbus-c++-libsystemd,libcap"
>  PACKAGECONFIG[with-external-libsystemd] = ",,systemd,libsystemd"
> -PACKAGECONFIG[with-tests] = "-DBUILD_TESTS=ON -DTESTS_INSTALL_PATH=${libdir}/${BPN}/tests,-DBUILD_TESTS=OFF"
> +PACKAGECONFIG[with-tests] = "-DBUILD_TESTS=ON -DTESTS_INSTALL_PATH=${libdir}/${BPN}/tests,-DBUILD_TESTS=OFF,googletest gmock"
>  
>  DEPENDS += "expat"
>  
>  SRCREV = "3a4f343fb924650e7639660efa5f143961162044"
> -SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=master"
> -SRC_URI += "file://run-ptest"
> +
> +SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=master \
> +    file://0001-Try-to-first-find-googletest-in-the-system-before-do.patch \
> +    file://run-ptest \
> +"
>  
>  EXTRA_OECMAKE = "-DBUILD_CODE_GEN=ON \
>                   -DBUILD_DOC=ON \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94022): https://lists.openembedded.org/g/openembedded-devel/message/94022
> Mute This Topic: https://lists.openembedded.org/mt/87140904/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


