Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E829BC83F17
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 21:40:10 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.6874.1752615604919993677
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 14:40:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZGpSaJ5b;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5562838ce68so5322696e87.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 14:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752615603; x=1753220403; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FXIjS26D2h8J07/osohtBG4Medatyn1iNkYOnKk0Igk=;
        b=ZGpSaJ5bIvyYT7g+z/UEtRys+7kQr5UBvfMTmST7eWnSrAQTDGohAk6K/DJZUkJC+C
         EI7ww0jjFRmdVvIASXAxy/FlWBh5DFRVOi+JR0RosJ0P5KfF30PEdih+Oby5uwRpYp00
         bQj7viokHxqT8/alWcmnIdw1eyHIEENF6uabKUCF1rYLm0HBkclgOf4q9QyYW3W9jPf1
         hCy8iKfSpg3NCCeUoJaC/fuU9ZYP7tIdEYSCs2vZvxETHhACfYvEjSEbblHtORlKXSP5
         RO9W/Yf/tTEH/eFvFDED3Z71PncCFh3rL/D/5zTyIZPWOSqIi/TgSLMQP+yHPQ2kElN2
         Q9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752615603; x=1753220403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FXIjS26D2h8J07/osohtBG4Medatyn1iNkYOnKk0Igk=;
        b=KuKspuubJXR0DIcQQRjdgtR34GWGTAl/sFl5eJtoDXSRWSrl2FnHd8RW6RrpaFUqRY
         IKmnd4KLMsG2N75LA5EKcNVvnIJ+h5R4vDdeSBbhUYrtqQWMfKh75+SRT+p+IA8oEzAK
         61nbzurI6G1aFFZqY9V2dDHrNukSY6flT8ZQWG9iXhzD9daiqe7MldFA/MxEGSa5gXkz
         2xuVA8LhFeOqk6cE8fxKmkz20HNeEvwY6N19XOj4/zzSz1PPZl/ugOtmyBWzQfwJXoDL
         9AhFhKiN4DE8X4WdPZamOIZ+oDX9FdKv0a6bilPlUDDjOwpeOsTbD2lUDQJ9eozDvQEP
         LHTA==
X-Gm-Message-State: AOJu0Ywkt2xKQ1wAMd13sAjfs4H+bJYf7IR1cnJvCDF/w4l9rG3leLCz
	KEyd3MxolF8mkaE56j29VaQN74fSGMyJ25XgWna78rQTLOoxVSZZ6AaNhG4RnLstb3/YdJywg+F
	HjN8b8GFZFx6zl+8shyBNQza+rrL+7QA=
X-Gm-Gg: ASbGncvaVomdx1bc5qvgxixzWSxvzSwgxkJLJ1d9p99xFisEI7yoxfAGbP4ghnr+cuy
	pZIJ9YpiXOK/o47ahwaQoqizwog/jy5RAmk8fZ8UJ5OHoD6fkKReI2x8eQboU71kOb3UARp3V+d
	ddFi3u5g8pgI3ukD9owVRbzvugWSbai19DRn5pcsPwLfsrtgRv1BHjE29w/cwc27RLmH59Qqsco
	G6XrIjoZA==
X-Google-Smtp-Source: AGHT+IEkGOJkEzwv/XZke8Ju3cNaIy6wJuQhSLO75dstzwWV27ZDpJzQyuGPfqmBBwIJN4rQR3U4pUF5Cb5r9G1mbVs=
X-Received: by 2002:a05:6512:3f16:b0:553:ce07:de8e with SMTP id
 2adb3069b0e04-55a23f619e0mr125496e87.42.1752615602233; Tue, 15 Jul 2025
 14:40:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250707225407.1558421-1-alperyasinak1@gmail.com> <20250707225407.1558421-2-alperyasinak1@gmail.com>
In-Reply-To: <20250707225407.1558421-2-alperyasinak1@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 15 Jul 2025 23:39:49 +0200
X-Gm-Features: Ac12FXy2eA1Jfy9EeWKgBMAJolIUgbJRUlY8mi4bRGiL-RIS4sklKZUSN1AU5y4
Message-ID: <CA+chaQeGmgS5p8tDghq2Ugpyv4YPQ4GtE7O94mhH=YW-EnqcAQ@mail.gmail.com>
Subject: Re: [oe] [meta-openembedded][PATCH 2/9] avro-c++: Upgrade 1.11.3 ->
 1.12 to allow CMake 4+ compatibility
To: alperyasinak1@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 21:40:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118567

This new version seems to fail to build for 32bit MACHINEs

lib32-avro-c++/1.12/sources/avro-c++-1.12/lang/c++/impl/parsing/Symbol.cc:9=
1:27:
error: useless cast to type 'int' [-Werror=3Duseless-cast]
   91 |             adj.push_back(static_cast<int>(it - rs.begin()));
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1plus: all warnings being treated as errors

lib32-avro-c++/1.12/sources/avro-c++-1.12/lang/c++/impl/FileStream.cc:208:4=
1:
error: conversion from 'int64_t' {aka 'long long int'} to 'size_t'
{aka 'unsigned int'} may change value [-Werror=3Dconversion]
  208 |         in_->seek(position - byteCount_ - available_);
      |                   ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
lib32-avro-c++/1.12/sources/avro-c++-1.12/lang/c++/impl/FileStream.cc:209:2=
2:
error: conversion from 'int64_t' {aka 'long long int'} to 'size_t'
{aka 'unsigned int'} may change value [-Werror=3Dconversion]
  209 |         byteCount_ =3D position;
      |                      ^~~~~~~~
cc1plus: all warnings being treated as errors

On Tue, Jul 8, 2025 at 12:54=E2=80=AFAM Alper Ak via lists.openembedded.org
<alperyasinak1=3Dgmail.com@lists.openembedded.org> wrote:
>
> - Drop workaround flag for dangling reference
> - Refresh patches and drop 0003-Update-CXX-standard-to-CXX14.patch becaus=
e already assigned to C++17
> - Drop xz and zlib because they aren't shown as build dependency and with=
out them the build completes without errors
> - Fetch the fmt in SRC_URI and put it in the right place so the CMake doe=
sn't need to run FetchContent
> - The LICENSE file has changed so updated LIC_FILES_CHKSUM to match the n=
ew md5sum
>
> Changelog: https://github.com/apache/avro/releases/tag/release-1.12.0
>
> Fix:
>
> | CMake Error at CMakeLists.txt:19 (cmake_minimum_required):
> |   Compatibility with CMake < 3.5 has been removed from CMake.
> |
> |   Update the VERSION argument <min> value.  Or, use the <min>...<max> s=
yntax
> |   to tell CMake that the project requires at least <min> but has been u=
pdated
> |   to work with policies introduced by <max> or earlier.
> |
> |   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3D3.5 to try configuring anywa=
y.
>
> ----
>
> | CMake Warning at /opt/yocto-masternext-contribute/sources/build/tmp/wor=
k/core2-64-poky-linux/avro-c++/1.12/recipe-sysroot-native/usr/share/cmake-4=
.0/Modules/FetchContent.cmake:2111 (message):
> |   FETCHCONTENT_FULLY_DISCONNECTED is set to true, which requires the so=
urce
> |   directory for dependency fmt to already be populated.  This generally=
 means
> |   it must not be set to true the first time CMake is run in a build
> |   directory.  The following source directory should already be populate=
d, but
> |   it doesn't exist:
> |
> |     /opt/yocto-masternext-contribute/sources/build/tmp/work/core2-64-po=
ky-linux/avro-c++/1.12/build/_deps/fmt-src
> |
> |   Policy CMP0170 controls enforcement of this requirement.
> | Call Stack (most recent call first):
> |   /opt/yocto-masternext-contribute/sources/build/tmp/work/core2-64-poky=
-linux/avro-c++/1.12/recipe-sysroot-native/usr/share/cmake-4.0/Modules/Fetc=
hContent.cmake:2384 (__FetchContent_Populate)
> |   CMakeLists.txt:93 (FetchContent_MakeAvailable)
> |
> |
> | -- Could NOT find Snappy (missing: SNAPPY_LIBRARIES SNAPPY_INCLUDE_DIR)
> | Disabled snappy codec. libsnappy not found.
> | -- Configuring done (0.4s)
> | CMake Error at CMakeLists.txt:149 (target_link_libraries):
> |   Target "avrocpp" links to:
> |
> |     fmt::fmt-header-only
> |
> |   but the target was not found.  Possible reasons include:
> |
> |     * There is a typo in the target name.
> |     * A find_package call is missing for an IMPORTED target.
> |     * An ALIAS target is missing.
> |
> |
> |
> | CMake Error at CMakeLists.txt:138 (target_link_libraries):
> |   Target "avrocpp_s" links to:
> |
> |     fmt::fmt-header-only
> |
> |   but the target was not found.  Possible reasons include:
> |
> |     * There is a typo in the target name.
> |     * A find_package call is missing for an IMPORTED target.
> |     * An ALIAS target is missing.
>
> Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> ---
>  ...0001-Remove-cpp-unittest-compilation.patch | 35 +++++++++++++------
>  ...0002-Add-package-configuration-files.patch | 32 ++++++++++-------
>  .../0003-Update-CXX-standard-to-CXX14.patch   | 24 -------------
>  .../recipes-support/avro/avro-c++_1.11.3.bb   | 27 --------------
>  meta-oe/recipes-support/avro/avro-c++_1.12.bb | 29 +++++++++++++++
>  5 files changed, 72 insertions(+), 75 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/avro/avro-c++/0003-Update-CXX=
-standard-to-CXX14.patch
>  delete mode 100644 meta-oe/recipes-support/avro/avro-c++_1.11.3.bb
>  create mode 100644 meta-oe/recipes-support/avro/avro-c++_1.12.bb
>
> diff --git a/meta-oe/recipes-support/avro/avro-c++/0001-Remove-cpp-unitte=
st-compilation.patch b/meta-oe/recipes-support/avro/avro-c++/0001-Remove-cp=
p-unittest-compilation.patch
> index bcfafdda55..f33c653069 100644
> --- a/meta-oe/recipes-support/avro/avro-c++/0001-Remove-cpp-unittest-comp=
ilation.patch
> +++ b/meta-oe/recipes-support/avro/avro-c++/0001-Remove-cpp-unittest-comp=
ilation.patch
> @@ -1,32 +1,34 @@
> -From 6be1c45e1f7ee78499bdca76c25ec23a61317134 Mon Sep 17 00:00:00 2001
> +From d75f0c5e7a51c9874edad0ea60957e006fb6def5 Mon Sep 17 00:00:00 2001
>  From: Rui Costa <rui.ms.costa@ctw.bmwgroup.com>
> -Date: Wed, 20 Mar 2024 14:58:27 +0000
> +Date: Mon, 7 Jul 2025 16:58:30 +0300
>  Subject: [PATCH] Remove cpp unittest compilation
>
>  Upstream-Status: Inappropriate [oe-specific]
>
> +Signed-off-by: Rui Costa <rui.ms.costa@ctw.bmwgroup.com>
> +Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
>  ---
> - lang/c++/CMakeLists.txt | 61 -----------------------------------------
> - 1 file changed, 61 deletions(-)
> + lang/c++/CMakeLists.txt | 65 -----------------------------------------
> + 1 file changed, 65 deletions(-)
>
>  diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 4a3793152..d94ba42d3 100644
> +index 19059a41b..1f5f98c83 100644
>  --- a/CMakeLists.txt
>  +++ b/CMakeLists.txt
> -@@ -131,70 +131,9 @@ set_target_properties (avrocpp_s PROPERTIES
> - target_link_libraries (avrocpp ${Boost_LIBRARIES} ${SNAPPY_LIBRARIES})
> +@@ -149,39 +149,6 @@ set_target_properties (avrocpp_s PROPERTIES
> + target_link_libraries (avrocpp ${Boost_LIBRARIES} ${SNAPPY_LIBRARIES} f=
mt::fmt-header-only)
>   target_include_directories(avrocpp PRIVATE ${SNAPPY_INCLUDE_DIR})
>
>  -add_executable (precompile test/precompile.cc)
>  -
> --target_link_libraries (precompile avrocpp_s ${Boost_LIBRARIES} ${SNAPPY=
_LIBRARIES})
> +-target_link_libraries (precompile avrocpp_s)
>  -
>  -macro (gen file ns)
>  -    add_custom_command (OUTPUT ${file}.hh
>  -        COMMAND avrogencpp
>  -            -p -
>  -            -i ${CMAKE_CURRENT_SOURCE_DIR}/jsonschemas/${file}
> --            -o ${file}.hh -n ${ns} -U
> +-            -o ${file}.hh -n ${ns}
>  -        DEPENDS avrogencpp ${CMAKE_CURRENT_SOURCE_DIR}/jsonschemas/${fi=
le})
>  -    add_custom_target (${file}_hh DEPENDS ${file}.hh)
>  -endmacro (gen)
> @@ -39,6 +41,7 @@ index 4a3793152..d94ba42d3 100644
>  -gen (union_array_union uau)
>  -gen (union_map_union umu)
>  -gen (union_conflict uc)
> +-gen (union_empty_record uer)
>  -gen (recursive rec)
>  -gen (reuse ru)
>  -gen (circulardep cd)
> @@ -47,9 +50,14 @@ index 4a3793152..d94ba42d3 100644
>  -gen (crossref cr)
>  -gen (primitivetypes pt)
>  -gen (cpp_reserved_words cppres)
> +-gen (cpp_reserved_words_union_typedef cppres_union)
>  -
>   add_executable (avrogencpp impl/avrogencpp.cc)
> - target_link_libraries (avrogencpp avrocpp_s ${Boost_LIBRARIES} ${SNAPPY=
_LIBRARIES})
> + target_link_libraries (avrogencpp avrocpp_s)
> +
> +@@ -194,38 +161,6 @@ target_include_directories(avrocpp PUBLIC
> +   $<INSTALL_INTERFACE:include>
> + )
>
>  -enable_testing()
>  -
> @@ -72,6 +80,7 @@ index 4a3793152..d94ba42d3 100644
>  -unittest (AvrogencppTests)
>  -unittest (CompilerTests)
>  -unittest (AvrogencppTestReservedWords)
> +-unittest (CommonsSchemasTests)
>  -
>  -add_dependencies (AvrogencppTestReservedWords cpp_reserved_words_hh)
>  -
> @@ -79,8 +88,12 @@ index 4a3793152..d94ba42d3 100644
>  -    tweet_hh
>  -    union_array_union_hh union_map_union_hh union_conflict_hh
>  -    recursive_hh reuse_hh circulardep_hh tree1_hh tree2_hh crossref_hh
> --    primitivetypes_hh empty_record_hh)
> +-    primitivetypes_hh empty_record_hh cpp_reserved_words_union_typedef_=
hh
> +-    union_empty_record_hh)
>  -
>   include (InstallRequiredSystemLibraries)
>
>   set (CPACK_PACKAGE_FILE_NAME "avrocpp-${AVRO_VERSION_MAJOR}")
> +--
> +2.43.0
> +
> diff --git a/meta-oe/recipes-support/avro/avro-c++/0002-Add-package-confi=
guration-files.patch b/meta-oe/recipes-support/avro/avro-c++/0002-Add-packa=
ge-configuration-files.patch
> index 437a3fa138..982e37d5b8 100644
> --- a/meta-oe/recipes-support/avro/avro-c++/0002-Add-package-configuratio=
n-files.patch
> +++ b/meta-oe/recipes-support/avro/avro-c++/0002-Add-package-configuratio=
n-files.patch
> @@ -1,21 +1,23 @@
> -From 86aa3f2333a9b8e6f1c631e6d5cb7296b6e8380b Mon Sep 17 00:00:00 2001
> +From 01a29c294c898cf6e13fb500b8514e9982982e1f Mon Sep 17 00:00:00 2001
>  From: Rui Costa <rui.ms.costa@ctw.bmwgroup.com>
> -Date: Fri, 22 Mar 2024 13:27:38 +0000
> +Date: Mon, 7 Jul 2025 18:16:35 +0300
>  Subject: [PATCH] Add package configuration files
>
>  Upstream-Status: Pending
>
> +Signed-off-by: Rui Costa <rui.ms.costa@ctw.bmwgroup.com>
> +Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
>  ---
> - lang/c++/CMakeLists.txt            | 45 ++++++++++++++++++++++++------
> + lang/c++/CMakeLists.txt            | 46 ++++++++++++++++++++++++------
>   lang/c++/cmake/AvroCppConfig.cmake |  5 ++++
> - 2 files changed, 42 insertions(+), 8 deletions(-)
> + 2 files changed, 43 insertions(+), 8 deletions(-)
>   create mode 100644 lang/c++/cmake/AvroCppConfig.cmake
>
>  diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index d94ba42d3..4748b111d 100644
> +index 1f5f98c83..73596a6cf 100644
>  --- a/CMakeLists.txt
>  +++ b/CMakeLists.txt
> -@@ -140,14 +140,18 @@ set (CPACK_PACKAGE_FILE_NAME "avrocpp-${AVRO_VERSI=
ON_MAJOR}")
> +@@ -167,18 +167,48 @@ set (CPACK_PACKAGE_FILE_NAME "avrocpp-${AVRO_VERSI=
ON_MAJOR}")
>
>   include (CPack)
>
> @@ -26,23 +28,24 @@ index d94ba42d3..4748b111d 100644
>  -
>  -install (TARGETS avrogencpp RUNTIME DESTINATION bin)
>  -
> --install (DIRECTORY api/ DESTINATION include/avro
> -+install (TARGETS avrocpp
> +-install (DIRECTORY include/avro DESTINATION include
> ++install(TARGETS avrocpp
>  +    EXPORT AvroCppTargets
>  +    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
>  +    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
>  +    RUNTIME DESTINATION ${CMAKE_INSTALL_LIBDIR}
> -+    INCLUDES DESTINATION include)
> ++    INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
>  +
> -+install (TARGETS avrogencpp
> ++install(TARGETS avrogencpp
>  +    EXPORT AvroCppTargets
>  +    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
>  +
> -+install (DIRECTORY api/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/avro
> ++install(DIRECTORY include/avro DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
>       FILES_MATCHING PATTERN *.hh)
>
> ++
>   if (NOT CMAKE_BUILD_TYPE)
> -@@ -155,3 +159,28 @@ if (NOT CMAKE_BUILD_TYPE)
> +     set (CMAKE_BUILD_TYPE Release CACHE STRING
>         "Choose the type of build, options are: None Debug Release RelWit=
hDebInfo MinSizeRel."
>         FORCE)
>   endif (NOT CMAKE_BUILD_TYPE)
> @@ -71,7 +74,7 @@ index d94ba42d3..4748b111d 100644
>  +    "${CMAKE_CURRENT_BINARY_DIR}/AvroCppConfigVersion.cmake"
>  +    DESTINATION ${ConfigPackageLocation}
>  +    COMPONENT Devel)
> -diff --git a/cmake/AvroCppConfig.cmake b/cmake/AvroCppConfig.cmake
> +diff --git a/lang/c++/cmake/AvroCppConfig.cmake b/lang/c++/cmake/AvroCpp=
Config.cmake
>  new file mode 100644
>  index 000000000..deb8aaa31
>  --- /dev/null
> @@ -82,3 +85,6 @@ index 000000000..deb8aaa31
>  +    COMPONENTS filesystem iostreams program_options regex system)
>  +
>  +include("${CMAKE_CURRENT_LIST_DIR}/AvroCppTargets.cmake")
> +--
> +2.43.0
> +
> diff --git a/meta-oe/recipes-support/avro/avro-c++/0003-Update-CXX-standa=
rd-to-CXX14.patch b/meta-oe/recipes-support/avro/avro-c++/0003-Update-CXX-s=
tandard-to-CXX14.patch
> deleted file mode 100644
> index 3e65cb7a72..0000000000
> --- a/meta-oe/recipes-support/avro/avro-c++/0003-Update-CXX-standard-to-C=
XX14.patch
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -From 66c08ade24e4472b5af5dca48097ed9a2ec035ec Mon Sep 17 00:00:00 2001
> -From: Rui Costa <rui.ms.costa@ctw.bmwgroup.com>
> -Date: Fri, 5 Apr 2024 11:33:51 +0000
> -Subject: [PATCH] Update CXX standard to CXX14
> -
> -Upstream-Status: Inappropriate [oe-specific]
> -
> ----
> - lang/c++/CMakeLists.txt | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 4748b111d..1e45c13d5 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -21,7 +21,7 @@ cmake_minimum_required (VERSION 3.1)
> - set (CMAKE_LEGACY_CYGWIN_WIN32 0)
> -
> - if (NOT DEFINED CMAKE_CXX_STANDARD)
> --    set(CMAKE_CXX_STANDARD 11)
> -+    set(CMAKE_CXX_STANDARD 14)
> - endif()
> -
> - set(CMAKE_CXX_STANDARD_REQUIRED ON)
> diff --git a/meta-oe/recipes-support/avro/avro-c++_1.11.3.bb b/meta-oe/re=
cipes-support/avro/avro-c++_1.11.3.bb
> deleted file mode 100644
> index c1e8863fb3..0000000000
> --- a/meta-oe/recipes-support/avro/avro-c++_1.11.3.bb
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -SUMMARY =3D "Apache Avro data serialization system."
> -HOMEPAGE =3D "https://avro.apache.org/"
> -SECTION =3D "libs"
> -
> -LICENSE =3D "Apache-2.0"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D43abf34d8b9908494f83c55d213a7=
f89"
> -
> -DEPENDS =3D "boost zlib xz"
> -
> -BRANCH =3D "branch-1.11"
> -SRCREV =3D "35ff8b997738e4d983871902d47bfb67b3250734"
> -SRC_URI =3D "git://github.com/apache/avro;branch=3D${BRANCH};protocol=3D=
https \
> -           file://0001-Remove-cpp-unittest-compilation.patch \
> -           file://0002-Add-package-configuration-files.patch \
> -           file://0003-Update-CXX-standard-to-CXX14.patch \
> -          "
> -
> -S =3D "${UNPACKDIR}/${BP}/lang/c++"
> -
> -inherit cmake pkgconfig
> -
> -BBCLASSEXTEND =3D "native nativesdk"
> -
> -# http://errors.yoctoproject.org/Errors/Details/766913/
> -# avro-c++/1.11.3/git/lang/c++/impl/Compiler.cc:304:18: error: possibly =
dangling reference to a temporary [-Werror=3Ddangling-reference]
> -# avro-c++/1.11.3/git/lang/c++/impl/Compiler.cc:370:18: error: possibly =
dangling reference to a temporary [-Werror=3Ddangling-reference]
> -CXXFLAGS +=3D "-Wno-error=3Ddangling-reference"
> diff --git a/meta-oe/recipes-support/avro/avro-c++_1.12.bb b/meta-oe/reci=
pes-support/avro/avro-c++_1.12.bb
> new file mode 100644
> index 0000000000..726a861bc9
> --- /dev/null
> +++ b/meta-oe/recipes-support/avro/avro-c++_1.12.bb
> @@ -0,0 +1,29 @@
> +SUMMARY =3D "Apache Avro data serialization system."
> +HOMEPAGE =3D "https://avro.apache.org/"
> +SECTION =3D "libs"
> +
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D34cb96edab958a981837bf6f44bf6=
54d"
> +
> +DEPENDS =3D "boost"
> +
> +SRC_URI =3D "git://github.com/apache/avro.git;branch=3Dbranch-1.12;proto=
col=3Dhttps;name=3Davro-c++ \
> +        git://github.com/fmtlib/fmt.git;branch=3D10.x;protocol=3Dhttps;n=
ame=3Dfmt;destsuffix=3D_deps/fmt-src \
> +        file://0001-Remove-cpp-unittest-compilation.patch \
> +        file://0002-Add-package-configuration-files.patch"
> +
> +SRCREV_FORMAT =3D "avro-c++ fmt"
> +SRCREV_avro-c++ =3D "8c27801dc8d42ccc00997f25c0b8f45f8d4a233e"
> +# Tag 10.2.1
> +SRCREV_fmt =3D "e69e5f977d458f2650bb346dadf2ad30c5320281"
> +
> +S =3D "${UNPACKDIR}/${BP}/lang/c++"
> +
> +inherit cmake pkgconfig
> +
> +do_configure:prepend() {
> +        install -d ${B}/_deps
> +        cp -r ${UNPACKDIR}/_deps/fmt-src ${B}/_deps/
> +}
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118290): https://lists.openembedded.org/g/openembedde=
d-devel/message/118290
> Mute This Topic: https://lists.openembedded.org/mt/114037732/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

