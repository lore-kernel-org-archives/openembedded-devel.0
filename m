Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C24EC433FE
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 21:37:13 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web08.3371.1664833024117244861
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Oct 2022 14:37:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k5Hu7Ltd;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-132555b7121so5492318fac.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Oct 2022 14:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=gzVD+h2B6cb+FTl+wXp9RFTA037wjyapluk5LVr4XRk=;
        b=k5Hu7LtdMemmKgTjTA3BJt+dFBt+nBMmP+fOn/926HJB3pA+w69r8ZfUOAnyafMKgG
         SNcajghn+TfO+YP21jD9EnRj/hYYDEwiLz3snYEv0qQhFgrh+t+50QbyEbrS9ZFO9QlE
         mqCpTmmWWc7GDcoUxxfd5/BjYzj8aVCqS+JouzBDtNW7CoubscC7AZ3f7NJv1es6d0rZ
         6R8DaMd9ZiPUV82JuuroYouoKgQHu+9XrSpvxHTtMESvUAjFkj6QaoZY1uoujTw4A9fP
         JJDYMLvjAqcgxvs/+a4mA6F3ueNjMFRwaJt1RfJUT2o785jEvBL+ADMPQFLvq2mhNZc5
         fIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=gzVD+h2B6cb+FTl+wXp9RFTA037wjyapluk5LVr4XRk=;
        b=HjIK/BSFI4S6RM4+NVx40oJ7YQGQqp8+RynlmOCy2iQiD2WOhXbNvUkaAB8zBf7gCM
         DzJK23f2b61+Oo42xAf2WSc7ZD/9Pi3qfisH5WG8t5Z5G2MNmjjBfSgYvcv7TbCfXjq0
         qDWQse8Gk4kx9uMzLcu6mYLWKMAfKpTJH82xLSezErQrG8zSOEd4XHlatXJB/YeCPoyi
         /zzXX7+EQDOnD8kmwn5nakPYbDjxhkipk0Em6Dklv6PmCgwPdjmJmTERUpvccOaw+jPb
         I+r8K4XulIovwPLUfeK7gVfJLlQvmpRSSrVU5fTSd9mFRyNHdAEWCxB/yubG10Fn+9Xi
         R35A==
X-Gm-Message-State: ACrzQf0tdrI7Y2OSTIjJbYsxdcVhNHJsp8Knz7OvsRot4U7pndfEzuyy
	YVxZVwZGLXHUa3eK9TXZynp9gprWoTanGdArqmJLNmwVCSnWWQ==
X-Google-Smtp-Source: 
 AMsMyM4Zmk6Ie3/5tNX4f2CZ/SiruGtjOpJdych+T5vvQEGO0gYhzujgJRKgcX+9HO/Lj1vuwjxGW8Eb3vlAxMV6m3M=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr6125439oae.262.1664833023375; Mon, 03
 Oct 2022 14:37:03 -0700 (PDT)
MIME-Version: 1.0
References: <20221003170623.26207-1-alex.kiernan@gmail.com>
In-Reply-To: <20221003170623.26207-1-alex.kiernan@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Oct 2022 14:36:37 -0700
Message-ID: 
 <CAMKF1sqHAaDkmf1BqvXPNgwHzuW3_tt5hJg7WLt6gOgefOj7gg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/3] jansson: Honour multilib paths
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Oct 2022 21:37:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99045

Should it be using GNUInstallDirs cmake module I wonder

On Mon, Oct 3, 2022 at 10:06 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> When multilib is enabled, builds fail during package_qa:
>
> ERROR: jansson-2.14-r0 do_package: QA Issue: jansson: Files/directories were installed but not shipped in any package:
>   /usr/lib
>   /usr/lib/libjansson.a
>   /usr/lib/pkgconfig
>   /usr/lib/cmake
>   /usr/lib/pkgconfig/jansson.pc
>   /usr/lib/cmake/jansson
>   /usr/lib/cmake/jansson/janssonTargets-noconfig.cmake
>   /usr/lib/cmake/jansson/janssonConfig.cmake
>   /usr/lib/cmake/jansson/janssonConfigVersion.cmake
>   /usr/lib/cmake/jansson/janssonTargets.cmake
> Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
> jansson: 10 installed and not shipped files. [installed-vs-shipped]
> ERROR: jansson-2.14-r0 do_package: Fatal QA errors were found, failing task.
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>  .../jansson/0001-Honour-multilib-paths.patch  | 63 +++++++++++++++++++
>  .../recipes-extended/jansson/jansson_2.14.bb  |  4 +-
>  2 files changed, 66 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-extended/jansson/jansson/0001-Honour-multilib-paths.patch
>
> diff --git a/meta-oe/recipes-extended/jansson/jansson/0001-Honour-multilib-paths.patch b/meta-oe/recipes-extended/jansson/jansson/0001-Honour-multilib-paths.patch
> new file mode 100644
> index 000000000000..513d1094593a
> --- /dev/null
> +++ b/meta-oe/recipes-extended/jansson/jansson/0001-Honour-multilib-paths.patch
> @@ -0,0 +1,63 @@
> +From e66885e66a2ce7fd916933b12d1ba523a25141e4 Mon Sep 17 00:00:00 2001
> +From: Alex Kiernan <alex.kiernan@gmail.com>
> +Date: Mon, 3 Oct 2022 13:25:05 +0100
> +Subject: [PATCH] Honour multilib paths
> +
> +Upstream-Status: Pending
> +Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> +---
> + CMakeLists.txt | 14 +++++++-------
> + 1 file changed, 7 insertions(+), 7 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 39b9ad365f78..bf297e936a72 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -20,8 +20,8 @@ endif ()
> +
> + # Set some nicer output dirs.
> + set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)
> +-set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
> +-set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
> ++set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/${CMAKE_INSTALL_LIBDIR})
> ++set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/${CMAKE_INSTALL_LIBDIR})
> + set(JANSSON_TEMP_DIR ${CMAKE_CURRENT_BINARY_DIR}/tmp)
> +
> + # Give the debug version a different postfix for windows,
> +@@ -573,14 +573,14 @@ endif ()
> + #
> +
> + # Allow the user to override installation directories.
> +-set(JANSSON_INSTALL_LIB_DIR       lib CACHE PATH "Installation directory for libraries")
> ++set(JANSSON_INSTALL_LIB_DIR       ${CMAKE_INSTALL_LIBDIR} CACHE PATH "Installation directory for libraries")
> + set(JANSSON_INSTALL_BIN_DIR       bin CACHE PATH "Installation directory for executables")
> + set(JANSSON_INSTALL_INCLUDE_DIR   include CACHE PATH "Installation directory for header files")
> +
> + if(WIN32 AND NOT CYGWIN)
> +   set(DEF_INSTALL_CMAKE_DIR cmake)
> + else()
> +-  set(DEF_INSTALL_CMAKE_DIR lib/cmake/jansson)
> ++  set(DEF_INSTALL_CMAKE_DIR ${CMAKE_INSTALL_LIBDIR}/cmake/jansson)
> + endif()
> +
> + set(JANSSON_INSTALL_CMAKE_DIR ${DEF_INSTALL_CMAKE_DIR} CACHE PATH "Installation directory for CMake files")
> +@@ -633,8 +633,8 @@ option(JANSSON_INSTALL "Generate installation target" ON)
> + if (JANSSON_INSTALL)
> +   install(TARGETS jansson
> +           EXPORT janssonTargets
> +-          LIBRARY DESTINATION "lib"
> +-          ARCHIVE DESTINATION "lib"
> ++          LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}"
> ++          ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
> +           RUNTIME DESTINATION "bin"
> +           INCLUDES DESTINATION "include")
> +
> +@@ -644,7 +644,7 @@ if (JANSSON_INSTALL)
> +   # Install the pkg-config.
> +   install(FILES
> +           ${CMAKE_CURRENT_BINARY_DIR}/jansson.pc
> +-          DESTINATION lib/pkgconfig)
> ++          DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
> +
> +   # Install the configs.
> +   install(FILES
> diff --git a/meta-oe/recipes-extended/jansson/jansson_2.14.bb b/meta-oe/recipes-extended/jansson/jansson_2.14.bb
> index 94bb99ab71a9..68e24c890726 100644
> --- a/meta-oe/recipes-extended/jansson/jansson_2.14.bb
> +++ b/meta-oe/recipes-extended/jansson/jansson_2.14.bb
> @@ -4,7 +4,9 @@ BUGTRACKER = "https://github.com/akheron/jansson/issues"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=afd92c4cfc08f4896003251b878cc0bf"
>
> -SRC_URI = "https://github.com/akheron/${BPN}/releases/download/v${PV}/${BP}.tar.bz2"
> +SRC_URI = "https://github.com/akheron/${BPN}/releases/download/v${PV}/${BP}.tar.bz2 \
> +           file://0001-Honour-multilib-paths.patch \
> +           "
>  SRC_URI[sha256sum] = "fba956f27c6ae56ce6dfd52fbf9d20254aad42821f74fa52f83957625294afb9"
>
>  UPSTREAM_CHECK_URI = "https://github.com/akheron/${BPN}/releases"
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99040): https://lists.openembedded.org/g/openembedded-devel/message/99040
> Mute This Topic: https://lists.openembedded.org/mt/94095620/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

