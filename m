Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2105DC47073
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 17:04:19 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.153373.1703869456639566662
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Dec 2023 09:04:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gbeljHq7;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3bbb4806f67so2955274b6e.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 09:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703869456; x=1704474256; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaC+yB2ZXcIH6eUWTLfRz0G4aV9YmtAC9Ze2EQ9pdfU=;
        b=gbeljHq7SAPK1o5nY/S2nj3Dx/ZHwUvueUZtnfxe3W8pUgFPxfMJdjmT56nwRlnuup
         x/pwkbJgAvHUPz1Mw4pw5DOl2fgFEX7BtIgLM8vvofZPvcvmrFL7rbaAICNOA/Z9PvQC
         VEw+Lj532n96YTxkCE4WLDVu/xvAqdupM0fnnz5eJaOp3jPkOZN06LG2kmzOCNP+ojPQ
         7B4awUcyYsdGVb+ExOzJsBxvHRzh1n/2Rw+sqjZjeEsI3i/F3jTvjTfJ3PUERARm3QYt
         2/pAjxKk5YeELjGDScfqFwVgek+1a4lW4bMeegRU5jpvFUm7IcLjsUlURLGmwdDqh6Ri
         JBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703869456; x=1704474256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EaC+yB2ZXcIH6eUWTLfRz0G4aV9YmtAC9Ze2EQ9pdfU=;
        b=UQyiOOSdqWsT9/d4WctvNZKE2owcDiRw4kDNcnzJ5BWE6d7Q6JgbdYdXvSBtE7F+b4
         px/oyOn1ddPrh77Q14AgWGGwNlon4QRDOtVbOlWBPKPK/w8icC/yFmb8xH1IMFte+lLd
         Etg++UOOyDFjAkELeeeoEQZqQc46sejDr8b3Mgha599VMy5kFxxj/jp8OCpgtlwKk5cA
         TEn+aQD8KcObPNmvo0PF4D+XiBE3HLv50MKLjETdltuvaYMgHTKKgnXfhRTNcYZhFCrh
         T55qzP736nw+vETLyDjPjhyeEjaS2srxDUU6F3+KZ0ZiyTKGIIJ06689x42d4S2rmicP
         vsbw==
X-Gm-Message-State: AOJu0YwKr7qXY9Qe6DZDcfiQfdjX0FiGFAuu2cWVkGK80VGAudqzXVY5
	6fEDOd/+hkBlZzNeuJNbYj7MF6tXJ7vdFRghvOdORMNSlMc=
X-Google-Smtp-Source: AGHT+IHlyws53HFplmQlGSGwGMRdRAoZ/L9qoXeO7UmbwsJxTcdR0whSrqnkXf3MKf2eX2zs0WnZDZMafijMrfrYwgg=
X-Received: by 2002:a05:6871:60e:b0:203:b5ec:ef08 with SMTP id
 w14-20020a056871060e00b00203b5ecef08mr13951746oan.107.1703869455691; Fri, 29
 Dec 2023 09:04:15 -0800 (PST)
MIME-Version: 1.0
References: <20231224135056.3617584-1-yi.zhao@windriver.com>
In-Reply-To: <20231224135056.3617584-1-yi.zhao@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Dec 2023 09:03:49 -0800
Message-ID: <CAMKF1sp57aXRd8TG5=8J2+JR1YE63=gLGeB2xJHjHWMfO58rsQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] vsomeip: upgrade 3.3.8 -> 3.4.10
To: Yi Zhao <yi.zhao@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 17:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107879

This fails to build when distro is using lld linker from llvm project.

https://errors.yoctoproject.org/Errors/Details/748404/

The error it finds are valid, perhaps its using some sort of version
definitions in linker script which
is being detected.

On Sun, Dec 24, 2023 at 5:51=E2=80=AFAM Yi Zhao <yi.zhao@eng.windriver.com>=
 wrote:
>
> ChangeLog:
> https://github.com/COVESA/vsomeip/releases/tag/3.4.10
>
> * Refresh patches
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  .../0001-Fix-pkgconfig-dir-for-multilib.patch |  6 +-
>  ...e-configuration-files-to-etc-vsomeip.patch |  6 +-
>  .../0003-Do-not-build-external-gtest.patch    | 59 ++++++++++++++-----
>  ...4-Do-not-specify-PIE-flag-explicitly.patch |  8 +--
>  .../{vsomeip_3.3.8.bb =3D> vsomeip_3.4.10.bb}   |  4 +-
>  5 files changed, 56 insertions(+), 27 deletions(-)
>  rename meta-networking/recipes-protocols/vsomeip/{vsomeip_3.3.8.bb =3D> =
vsomeip_3.4.10.bb} (93%)
>
> diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0001-Fix-p=
kgconfig-dir-for-multilib.patch b/meta-networking/recipes-protocols/vsomeip=
/vsomeip/0001-Fix-pkgconfig-dir-for-multilib.patch
> index 1c7eb17b2..0ddcb642b 100644
> --- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0001-Fix-pkgconfi=
g-dir-for-multilib.patch
> +++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0001-Fix-pkgconfi=
g-dir-for-multilib.patch
> @@ -1,4 +1,4 @@
> -From e8a1b7a176398c2a9b5969f1b48ae0e1aa30f4ec Mon Sep 17 00:00:00 2001
> +From 2f931baf290477b586309189445bf87e3bc5d5ba Mon Sep 17 00:00:00 2001
>  From: Yi Zhao <yi.zhao@windriver.com>
>  Date: Wed, 2 Mar 2022 14:51:13 +0800
>  Subject: [PATCH] Fix pkgconfig dir for multilib
> @@ -11,10 +11,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index add3edda..fea80b4a 100644
> +index ab399a69..beae6eaf 100644
>  --- a/CMakeLists.txt
>  +++ b/CMakeLists.txt
> -@@ -602,7 +602,7 @@ endif()
> +@@ -637,7 +637,7 @@ endif()
>   # create pkg-config file
>   if(NOT WIN32)
>           configure_file(${VSOMEIP_NAME}.pc.in ${PROJECT_BINARY_DIR}/${VS=
OMEIP_NAME}.pc @ONLY)
> diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0002-Insta=
ll-example-configuration-files-to-etc-vsomeip.patch b/meta-networking/recip=
es-protocols/vsomeip/vsomeip/0002-Install-example-configuration-files-to-et=
c-vsomeip.patch
> index c22ef697b..bdaf34360 100644
> --- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0002-Install-exam=
ple-configuration-files-to-etc-vsomeip.patch
> +++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0002-Install-exam=
ple-configuration-files-to-etc-vsomeip.patch
> @@ -1,4 +1,4 @@
> -From aea4c06ee2a0661d0c7b4773e846276a4f10e2e8 Mon Sep 17 00:00:00 2001
> +From ebaa3206ee125741314272cddafa04fa71bd2d1e Mon Sep 17 00:00:00 2001
>  From: Yi Zhao <yi.zhao@windriver.com>
>  Date: Wed, 9 Mar 2022 11:48:44 +0800
>  Subject: [PATCH] Install example configuration files to /etc/vsomeip
> @@ -11,10 +11,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index fea80b4a..e7a92ec6 100644
> +index beae6eaf..d791c12e 100644
>  --- a/CMakeLists.txt
>  +++ b/CMakeLists.txt
> -@@ -501,7 +501,7 @@ install(FILES ${PROJECT_BINARY_DIR}/vsomeip.pc DESTI=
NATION lib/pkgconfig)
> +@@ -536,7 +536,7 @@ install(FILES ${PROJECT_BINARY_DIR}/vsomeip.pc DESTI=
NATION lib/pkgconfig)
>   endif ()
>
>   install (
> diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0003-Do-no=
t-build-external-gtest.patch b/meta-networking/recipes-protocols/vsomeip/vs=
omeip/0003-Do-not-build-external-gtest.patch
> index 370d8a0fe..09dab9a8b 100644
> --- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0003-Do-not-build=
-external-gtest.patch
> +++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0003-Do-not-build=
-external-gtest.patch
> @@ -1,4 +1,4 @@
> -From e012f91a73af7469ef6f660c3a6a752430a4d649 Mon Sep 17 00:00:00 2001
> +From b1bf398015bc090020459954e5cd1ec3b51b8ac3 Mon Sep 17 00:00:00 2001
>  From: Yi Zhao <yi.zhao@windriver.com>
>  Date: Tue, 11 Jul 2023 16:53:46 +0800
>  Subject: [PATCH] Do not build external gtest
> @@ -10,15 +10,16 @@ Upstream-Status: Inappropriate [embedded specific]
>
>  Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>  ---
> - CMakeLists.txt                    | 30 ++----------
> - test/network_tests/CMakeLists.txt | 80 -------------------------------
> - 2 files changed, 3 insertions(+), 107 deletions(-)
> + CMakeLists.txt                    | 11 ----
> + test/CMakeLists.txt               | 22 +------
> + test/network_tests/CMakeLists.txt | 99 -------------------------------
> + 3 files changed, 3 insertions(+), 129 deletions(-)
>
>  diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index e7a92ec6..f6c680d4 100644
> +index d791c12e..f1bcba27 100644
>  --- a/CMakeLists.txt
>  +++ b/CMakeLists.txt
> -@@ -18,14 +18,6 @@ set (VSOMEIP_VERSION ${VSOMEIP_MAJOR_VERSION}.${VSOME=
IP_MINOR_VERSION}.${VSOMEIP
> +@@ -18,17 +18,6 @@ set (VSOMEIP_VERSION ${VSOMEIP_MAJOR_VERSION}.${VSOME=
IP_MINOR_VERSION}.${VSOMEIP
>   set (PACKAGE_VERSION ${VSOMEIP_VERSION}) # Used in documentation/doxyge=
n.in
>   set (CMAKE_VERBOSE_MAKEFILE off)
>
> @@ -26,16 +27,23 @@ index e7a92ec6..f6c680d4 100644
>  -    if (DEFINED ENV{GTEST_ROOT})
>  -        set(GTEST_ROOT $ENV{GTEST_ROOT})
>  -    else()
> --        set(GTEST_ROOT "n/a" CACHE STRING "Path to root folder of googl=
etest. Must be set for building the tests.")
> +-        include(FetchContent)
> +-        FetchContent_Declare(googletest GIT_REPOSITORY https://github.c=
om/google/googletest.git GIT_TAG v1.14.0)
> +-        FetchContent_Populate(googletest)
> +-        set(GTEST_ROOT ${googletest_SOURCE_DIR})
>  -    endif()
>  -endif()
>  -
>   #######################################################################=
############################
>   # see http://www.cmake.org/Wiki/CMake/Tutorials/How_to_create_a_Project=
Config.cmake_file
>   #######################################################################=
############################
> -@@ -630,27 +622,11 @@ find_package(benchmark)
> - #######################################################################=
#######
> - # google test
> +diff --git a/test/CMakeLists.txt b/test/CMakeLists.txt
> +index f66ac5d3..6f09bf40 100644
> +--- a/test/CMakeLists.txt
> ++++ b/test/CMakeLists.txt
> +@@ -17,27 +17,11 @@ find_package(benchmark)
> + # remove export symbols from the cxx flags
> + string(REPLACE "${EXPORTSYMBOLS}" "" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS=
}")
>
>  -# check for set environment variable
>  -if(${GTEST_ROOT} STREQUAL "n/a")
> @@ -62,13 +70,13 @@ index e7a92ec6..f6c680d4 100644
>  -    set(BUILD_SHARED_LIBS_AUTOMATIC_OFF 0)
>  -endif()
>
> -
> -
> + #######################################################################=
#######
> + # build tests
>  diff --git a/test/network_tests/CMakeLists.txt b/test/network_tests/CMak=
eLists.txt
> -index 6a148604..a501b6a7 100644
> +index 883cc5cf..9a2a4f5e 100644
>  --- a/test/network_tests/CMakeLists.txt
>  +++ b/test/network_tests/CMakeLists.txt
> -@@ -3633,86 +3633,6 @@ if(NOT ${TESTS_BAT})
> +@@ -4116,105 +4116,6 @@ if(NOT ${TESTS_BAT})
>
>   endif()
>
> @@ -97,6 +105,12 @@ index 6a148604..a501b6a7 100644
>  -    add_dependencies(${TEST_CLIENT_ID_UTILITY} gtest)
>  -    add_dependencies(${TEST_DEBOUNCE_CLIENT} gtest)
>  -    add_dependencies(${TEST_DEBOUNCE_SERVICE} gtest)
> +-    add_dependencies(${TEST_DEBOUNCE_FILTER_CLIENT} gtest)
> +-    add_dependencies(${TEST_DEBOUNCE_FILTER_SERVICE} gtest)
> +-    add_dependencies(${TEST_DEBOUNCE_CALLBACK_CLIENT} gtest)
> +-    add_dependencies(${TEST_DEBOUNCE_CALLBACK_SERVICE} gtest)
> +-    add_dependencies(${TEST_DEBOUNCE_FREQUENCY_CLIENT} gtest)
> +-    add_dependencies(${TEST_DEBOUNCE_FREQUENCY_SERVICE} gtest)
>  -    add_dependencies(${TEST_SUBSCRIBE_NOTIFY_SERVICE} gtest)
>  -    add_dependencies(${TEST_SUBSCRIBE_NOTIFY_ONE_EVENT_TWO_EVENTGROUPS_=
SERVICE} gtest)
>  -    add_dependencies(${TEST_SUBSCRIBE_NOTIFY_ONE_EVENT_TWO_EVENTGROUPS_=
CLIENT} gtest)
> @@ -127,8 +141,13 @@ index 6a148604..a501b6a7 100644
>  -    add_dependencies(${TEST_E2E_PROFILE_04_SERVICE} gtest)
>  -    add_dependencies(${TEST_E2E_PROFILE_04_CLIENT} gtest)
>  -    endif()
> +-    if (${TEST_E2E_PROFILE_07})
> +-    add_dependencies(${TEST_E2E_PROFILE_07_SERVICE} gtest)
> +-    add_dependencies(${TEST_E2E_PROFILE_07_CLIENT} gtest)
> +-    endif()
>  -    add_dependencies(${TEST_EVENT_SERVICE} gtest)
>  -    add_dependencies(${TEST_EVENT_CLIENT} gtest)
> +-    if (NOT ${CMAKE_SYSTEM_NAME} MATCHES "QNX")
>  -    add_dependencies(${TEST_NPDU_SERVICE_ONE} gtest)
>  -    add_dependencies(${TEST_NPDU_SERVICE_TWO} gtest)
>  -    add_dependencies(${TEST_NPDU_SERVICE_THREE} gtest)
> @@ -139,6 +158,7 @@ index 6a148604..a501b6a7 100644
>  -    add_dependencies(${TEST_NPDU_CLIENT_FOUR} gtest)
>  -    add_dependencies(${TEST_NPDU_DAEMON_CLIENT} gtest)
>  -    add_dependencies(${TEST_NPDU_DAEMON_SERVICE} gtest)
> +-    endif()
>  -    add_dependencies(${TEST_SOMEIPTP_CLIENT} gtest)
>  -    add_dependencies(${TEST_SOMEIPTP_SERVICE} gtest)
>  -    if(${TEST_SECOND_ADDRESS})
> @@ -148,13 +168,20 @@ index 6a148604..a501b6a7 100644
>  -    add_dependencies(${TEST_SUSPEND_RESUME_CLIENT} gtest)
>  -    add_dependencies(${TEST_SUSPEND_RESUME_SERVICE} gtest)
>  -else()
> +-    add_dependencies(${TEST_APPLICATION} gtest)
> +-    add_dependencies(${TEST_HEADER_FACTORY} gtest)
> +-    add_dependencies(${TEST_HEADER_FACTORY_CLIENT} gtest)
> +-    add_dependencies(${TEST_HEADER_FACTORY_SERVICE} gtest)
> +-    add_dependencies(${TEST_PAYLOAD_SERVICE} gtest)
> +-    add_dependencies(${TEST_PAYLOAD_CLIENT} gtest)
> +-    add_dependencies(${TEST_BIG_PAYLOAD_SERVICE} gtest)
> +-    add_dependencies(${TEST_BIG_PAYLOAD_CLIENT} gtest)
>  -    add_dependencies(${TEST_LOCAL_ROUTING_SERVICE} gtest)
>  -    add_dependencies(${TEST_LOCAL_ROUTING_CLIENT} gtest)
>  -endif()
> --
> +
>   #######################################################################=
#######
>   # Add tests to the target build_network_tests
> - #######################################################################=
#######
>  --
>  2.25.1
>
> diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Do-no=
t-specify-PIE-flag-explicitly.patch b/meta-networking/recipes-protocols/vso=
meip/vsomeip/0004-Do-not-specify-PIE-flag-explicitly.patch
> index 970a37e50..4bb231855 100644
> --- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Do-not-speci=
fy-PIE-flag-explicitly.patch
> +++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Do-not-speci=
fy-PIE-flag-explicitly.patch
> @@ -1,4 +1,4 @@
> -From 69805f9c8973a7a4d29297f8d50c29c88f981bee Mon Sep 17 00:00:00 2001
> +From ec2d36466c9050ee282ea1c3bb1b5f1f61c96ecb Mon Sep 17 00:00:00 2001
>  From: Yi Zhao <yi.zhao@windriver.com>
>  Date: Mon, 17 Jul 2023 14:33:32 +0800
>  Subject: [PATCH] Do not specify PIE flag explicitly
> @@ -24,15 +24,15 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index f6c680d4..dce1e701 100644
> +index f1bcba27..2653a4df 100644
>  --- a/CMakeLists.txt
>  +++ b/CMakeLists.txt
>  @@ -60,12 +60,12 @@ if (${CMAKE_SYSTEM_NAME} MATCHES "Linux")
>   if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
>       # This is only relevant for GCC and causes warnings on Clang
>       set(EXPORTSYMBOLS "-Wl,-export-dynamic -Wl,--version-script=3D${CMA=
KE_CURRENT_SOURCE_DIR}/exportmap.gcc")
> --    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -pie -Wl,-z,relro,-z,now")
> -+    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -Wl,-z,relro,-z,now")
> +-    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -pie -Wno-tsan -Wl,-z,relro,-z,no=
w")
> ++    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -Wno-tsan -Wl,-z,relro,-z,now")
>   endif()
>
>       set(NO_DEPRECATED "")
> diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip_3.3.8.bb b=
/meta-networking/recipes-protocols/vsomeip/vsomeip_3.4.10.bb
> similarity index 93%
> rename from meta-networking/recipes-protocols/vsomeip/vsomeip_3.3.8.bb
> rename to meta-networking/recipes-protocols/vsomeip/vsomeip_3.4.10.bb
> index b45bd2d63..aa1ad9e39 100644
> --- a/meta-networking/recipes-protocols/vsomeip/vsomeip_3.3.8.bb
> +++ b/meta-networking/recipes-protocols/vsomeip/vsomeip_3.4.10.bb
> @@ -14,7 +14,7 @@ SRC_URI =3D "git://github.com/GENIVI/${BPN}.git;branch=
=3Dmaster;protocol=3Dhttps;name=3D
>             file://0004-Do-not-specify-PIE-flag-explicitly.patch \
>            "
>
> -SRCREV =3D "07464840f503670bc75997b8e926b54734ffa410"
> +SRCREV =3D "02c199dff8aba814beebe3ca417fd991058fe90c"
>
>  COMPATIBLE_HOST:mips =3D "null"
>  COMPATIBLE_HOST:mips64 =3D "null"
> @@ -55,6 +55,8 @@ do_install:append() {
>      install -d ${D}/opt/${PN}-test/test/test/common
>      cp -rf ${S}/test/common/examples_policies \
>          ${D}/opt/${PN}-test/test/test/common/
> +    install -m 0755 ${B}/test/common/libvsomeip_utilities.so \
> +        ${D}/opt/${PN}-test/test/test/common/
>
>      for d in unit_tests network_tests; do
>          install -d ${D}/opt/${PN}-test/test/$d
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107780): https://lists.openembedded.org/g/openembedde=
d-devel/message/107780
> Mute This Topic: https://lists.openembedded.org/mt/103347301/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

