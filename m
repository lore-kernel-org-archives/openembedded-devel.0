Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web08.25992.1629734851261974359
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Aug 2021 09:07:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bQSvsovY;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id 7so15784687pfl.10
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Aug 2021 09:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=bNS5o+1nYwrUf/bKUCBBKIs8O5lmZqq1vQXEpECE0JY=;
        b=bQSvsovYFWZ94GHIto7oM2TBAhA3XsZ1jDi9dn3Fl4dPCnBJkR9Z2Ov1OvrgDqjvKh
         5EP1dV7YbFrYIV+dgK46HFjao7fDT6WlT8rdSRTS/H/tawd/qs/ow+X0mrwWJI00UY4F
         WsnJHAV16otw89xG9SVJ6gbHfTzY8X6UwqVvB5hEheuF56UWo/ex1YcShkoHEwnITpyP
         zunlXs9NHMxbugQ7h6vxVG2GdccgFK1lqS7crrm8HEZyitSxG9WZ4gCOPmTbL9hHgOzS
         6bYAUpDawadKlldfJY4hXUraZzLxGIllCbzkvvQQQXOEhd1qfSBEzv+UlX9GQR9dsiVK
         Sa2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=bNS5o+1nYwrUf/bKUCBBKIs8O5lmZqq1vQXEpECE0JY=;
        b=XQRj1wm8qdtYcAriI2OrKO9WWnK2iL6w30qziK55srDs1RaIqDDgRCbfRLPTyI3asJ
         gvZOhwa2t+tDNwsfuuHo0Y9NJSc4EfqyClInbsz+WYd8YRKM3vVmaFvj/NwvvCsSCk4m
         Ii4c9vJz1FPAGvaR+whCN2hsWylblAdyRTc/ZNJ3yRqtU4EiaIiAXuAUExGVPQVmqrXz
         cEdHTSdCKihT6sbMZ+Dd25FbF+LbgQdmPK3imbDXCr6v212AY0ZNZQnqjX0UHNYmE7PI
         ca7xbDknlYPCgHm5gWPOVawpEBbhMIMfgUO/bQV92tH+ehm13MCgP36oOGbKCnu9fS2n
         ficw==
X-Gm-Message-State: AOAM532EYiZhoRhH2FAPDSJIx+OFjlzc7j9iHWJfhJp05tRltUR1UQbG
	teqW4os8h+YcIDGxiMrP0pw=
X-Google-Smtp-Source: ABdhPJxn4PTUFLMA0bnxYpa3WGRy0dl253J4oTEVaufHjRBjrwjnoPWVhTodAOv4vOV2tBygrjLwzA==
X-Received: by 2002:a05:6a00:a94:b029:384:1dc6:7012 with SMTP id b20-20020a056a000a94b02903841dc67012mr34362846pfl.53.1629734850659;
        Mon, 23 Aug 2021 09:07:30 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0:7cf5:888d:b618:582d? ([2601:646:9200:a0f0:7cf5:888d:b618:582d])
        by smtp.gmail.com with UTF8SMTPSA id g3sm19508838pgj.66.2021.08.23.09.07.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Aug 2021 09:07:29 -0700 (PDT)
Message-ID: <bd3585f3-9028-4f40-4177-6f4b45ff1027@gmail.com>
Date: Mon, 23 Aug 2021 09:07:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.0.1
Subject: Re: [oe] [meta-oe][PATCH] c-ares: remove custom patches
To: Sinan Kaya <okaya@kernel.org>, openembedded-devel@lists.openembedded.org
References: <20210823151311.27764-1-okaya@kernel.org>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20210823151311.27764-1-okaya@kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/23/21 8:13 AM, Sinan Kaya wrote:
> Signed-off-by: Sinan Kaya <okaya@kernel.org>
> ---
>   ...ror-mv-libcares.pc.cmakein-to-libcar.patch | 27 -------
>   .../c-ares/cmake-install-libcares.pc.patch    | 77 -------------------
>   .../recipes-support/c-ares/c-ares_1.17.2.bb   |  5 +-
>   3 files changed, 1 insertion(+), 108 deletions(-)
>   delete mode 100644 meta-oe/recipes-support/c-ares/c-ares/0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch
>   delete mode 100644 meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
> 

Its always good to drop some patches we are carrying, however, if you 
could describe the reason why they should be removed, would give a good
idea if they are good to remove or not.

> diff --git a/meta-oe/recipes-support/c-ares/c-ares/0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch b/meta-oe/recipes-support/c-ares/c-ares/0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch
> deleted file mode 100644
> index 8f15f8424c..0000000000
> --- a/meta-oe/recipes-support/c-ares/c-ares/0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From f2f1e134bf5d9d0789942848e03006af8d926cf8 Mon Sep 17 00:00:00 2001
> -From: Wang Mingyu <wangmy@cn.fujitsu.com>
> -Date: Tue, 17 Mar 2020 12:53:35 +0800
> -Subject: [PATCH] fix configure error : mv libcares.pc.cmakein to
> - libcares.pc.cmake
> -
> -Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ----
> - CMakeLists.txt | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 3a5878d..c2e5740 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -563,7 +563,7 @@ IF (CARES_STATIC)
> - ENDIF()
> -
> - # Write ares_config.h configuration file.  This is used only for the build.
> --CONFIGURE_FILE (libcares.pc.cmakein ${PROJECT_BINARY_DIR}/libcares.pc @ONLY)
> -+CONFIGURE_FILE (libcares.pc.cmake ${PROJECT_BINARY_DIR}/libcares.pc @ONLY)
> -
> -
> -
> ---
> -2.17.1
> -
> diff --git a/meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch b/meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
> deleted file mode 100644
> index c6f9c6de61..0000000000
> --- a/meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
> +++ /dev/null
> @@ -1,77 +0,0 @@
> -From 2cc41bee63223cb398ea932aad6ecc94ff5b61dd Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Tue, 24 Jul 2018 13:33:33 +0800
> -Subject: [PATCH] cmake: Install libcares.pc
> -
> -Prepare and install libcares.pc file during cmake build, so libraries
> -using pkg-config to find libcares will not fail.
> -
> -Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
> -
> -update to 1.14.0, fix patch warning
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> -
> ----
> - CMakeLists.txt | 23 +++++++++++++++++------
> - 1 file changed, 17 insertions(+), 6 deletions(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 08c0247..0020d6b 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -214,22 +214,25 @@ ADD_DEFINITIONS(${SYSFLAGS})
> -
> -
> - # Tell C-Ares about libraries to depend on
> -+# Also pass these libraries to pkg-config file
> -+SET(CARES_PRIVATE_LIBS_LIST)
> - IF (HAVE_LIBRESOLV)
> --	LIST (APPEND CARES_DEPENDENT_LIBS resolv)
> -+	LIST (APPEND CARES_PRIVATE_LIBS_LIST "-lresolv")
> - ENDIF ()
> - IF (HAVE_LIBNSL)
> --	LIST (APPEND CARES_DEPENDENT_LIBS nsl)
> -+	LIST (APPEND CARES_PRIVATE_LIBS_LIST "-lnsl")
> - ENDIF ()
> - IF (HAVE_LIBSOCKET)
> --	LIST (APPEND CARES_DEPENDENT_LIBS socket)
> -+	LIST (APPEND CARES_PRIVATE_LIBS_LIST "-lsocket")
> - ENDIF ()
> - IF (HAVE_LIBRT)
> --	LIST (APPEND CARES_DEPENDENT_LIBS rt)
> -+	LIST (APPEND CARES_PRIVATE_LIBS_LIST "-lrt")
> - ENDIF ()
> - IF (WIN32)
> --	LIST (APPEND CARES_DEPENDENT_LIBS ws2_32 Advapi32)
> -+	LIST (APPEND CARES_PRIVATE_LIBS_LIST "-lws2_32")
> - ENDIF ()
> -
> -+string (REPLACE ";" " " CARES_PRIVATE_LIBS "${CARES_PRIVATE_LIBS_LIST}")
> -
> - # When checking for symbols, we need to make sure we set the proper
> - # headers, libraries, and definitions for the detection to work properly
> -@@ -551,6 +554,15 @@ ENDIF()
> - # Record toplevel CMakeLists.txt path
> - set(CARES_TOPLEVEL_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
> -
> -+# Pass required CFLAGS to pkg-config in case of static library
> -+IF (CARES_STATIC)
> -+       SET (CPPFLAG_CARES_STATICLIB "-DCARES_STATICLIB")
> -+ENDIF()
> -+
> -+# Write ares_config.h configuration file.  This is used only for the build.
> -+CONFIGURE_FILE (libcares.pc.cmakein ${PROJECT_BINARY_DIR}/libcares.pc @ONLY)
> -+
> -+
> -
> - # TRANSFORM_MAKEFILE_INC
> - #
> -@@ -624,7 +636,6 @@ IF (CARES_INSTALL)
> - 	INSTALL (FILES "${CMAKE_CURRENT_BINARY_DIR}/libcares.pc" COMPONENT Devel DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
> - ENDIF ()
> -
> --
> - # Legacy chain-building variables (provided for compatibility with old code).
> - # Don't use these, external code should be updated to refer to the aliases directly (e.g., Cares::cares).
> - SET (CARES_FOUND 1 CACHE INTERNAL "CARES LIBRARY FOUND")
> diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb b/meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb
> index 53cc1b68f0..2109d955d0 100644
> --- a/meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb
> +++ b/meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb
> @@ -5,10 +5,7 @@ SECTION = "libs"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb997454c8d62aa6a47f07a8cd48b006"
>   
> -SRC_URI = "git://github.com/c-ares/c-ares.git;branch=main \
> -           file://cmake-install-libcares.pc.patch \
> -           file://0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch \
> -           "
> +SRC_URI = "git://github.com/c-ares/c-ares.git;branch=main"
>   SRCREV = "6654436a307a5a686b008c1d4c93b0085da6e6d8"
>   
>   UPSTREAM_CHECK_GITTAGREGEX = "cares-(?P<pver>\d+_(\d_?)+)"
> 
> 
> 
> 
> 
