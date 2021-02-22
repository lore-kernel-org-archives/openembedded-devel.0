Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.37524.1614012607050743743
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:50:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r4PQtMe/;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: peron.clem@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id s11so22903268edd.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Feb 2021 08:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7nWw1wNXzjxmMd/LcQRjaoSkC3E8TrvfQkwGKdzeMZ4=;
        b=r4PQtMe/opwv28MCWT3RJyw0tkjhz2ZidV9AAvh+tyuNpGDlymoOAW197FDqt5ueux
         FYuHUR2St+Jue96APuNJ0D9wh+VzxJovWScWg6DbWDXEmAYntQj5TcuiPGZ2D2Afp7gR
         Bd6R6oHesA7ZcUgvhlFdbIfz+ffhNGRdAXqBv3LcZdXc/jaPvM54/R5k9KClKfEn+BaP
         llqSOgOS4DtrobdrCb3jVm9GXW9kY9Ph/1JY28+pRNdAFad2d8w78c2uVCN6n36i6OVA
         qSKh+sfdCGZULBqPIQtjSCQFZewyxZAlqmQD/sZhcEovTHvwu9E2qEHi4PwRWQpCKAyU
         8enQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7nWw1wNXzjxmMd/LcQRjaoSkC3E8TrvfQkwGKdzeMZ4=;
        b=uM2Dtah3bJusMz3X40ThtOJ7npYxgzyUFHRaOHqk4pidbkKXQ9xYkKYKPvg+c5jhGL
         EZkdYAUH16cANAUyz9v+nTJFsn37dGC4EqqcWCseJFP/7h1SuXBp+2iHfx5tx2eWvou9
         heS0C6X1x0CDs4BuSmy4tHWWEx99g0wt0BM9KuKC5wVEfmdXmHqdl9oKugTRYU/3xTo5
         +91fAwC7xaRKCfpBLK8vdrYvZ4KzUORp/OfwdjsRuxe3NtNEkqHv1fx9g6OFtI4b5tVe
         ATPv3uTcGgt1qYypsstYrXE/ivx/tiGHMBYLIaBTjRMGU3nTAgbt/NxtMFchznwz5EaC
         /T6g==
X-Gm-Message-State: AOAM530rEHNSVreBV8A71X9NQe5FIRu1PO17zaNw6xb9+MrglzLDtoT4
	fRvkBLhHqCG/F+30Am1PhevDrYmwIbB1MP2zxug=
X-Google-Smtp-Source: ABdhPJw59bHRryCHDv1MO6ojDyOi8jBIZDcYk9RHRDSEN8cE+aMKe72QnQ1e4D0a5m4mpzrDV9unc+waaTQcmDIvbds=
X-Received: by 2002:aa7:c314:: with SMTP id l20mr11644510edq.148.1614012605424;
 Mon, 22 Feb 2021 08:50:05 -0800 (PST)
MIME-Version: 1.0
References: <20210219123955.26446-1-anbelski@linux.microsoft.com>
In-Reply-To: <20210219123955.26446-1-anbelski@linux.microsoft.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Mon, 22 Feb 2021 17:49:54 +0100
Message-ID: <CAJiuCcexC-KBndWSa=D++zQNFtxu0zYm9oSs_VLzov5QrOtNLA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] grpc: Upgrade 1.24.3 -> 1.35.0
To: Anatol Belski <anbelski@linux.microsoft.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Anatol,


On Fri, 19 Feb 2021 at 13:40, Anatol Belski
<anbelski@linux.microsoft.com> wrote:
>
> This is a really huge jump in versions, but this package has been not
> upgraded for quite some time. The previous patches are not necessary
> anymore, they're integrated upstream.

This version of gRPC generate a new CMake gRPCTargets.cmake
recipe-sysroot/usr/lib/cmake/grpc/gRPCTargets.cmake

This generate an error in my build:
Because this CMake declare a
recipe-sysroot/usr/bin/grpc_cpp_plugin

but this file does not exist.  Possible reasons include:
|
|   * The file was deleted, renamed, or moved to another location.
|
|   * An install or uninstall procedure did not complete successfully.
|
|   * The installation package was faulty and contained

In my project i'm using the CMake example from gRPC
https://github.com/grpc/grpc/blob/master/examples/cpp/cmake/common.cmake#L114

This error is triggered by:
find_package(gRPC 1.35.0 CONFIG REQUIRED)

FYI My recipes depends on grpc and grpc-native
PACKAGECONFIG[grpc] = "-DCONFIG_GRPC=ON,-DCONFIG_GRPC=OFF,grpc grpc-native"

Do you have an example of a gRPC recipe?

Thanks,
Clement

>
> Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
> ---
>  ...ix-grpc_cpp_plugin-path-during-cross.patch |  45 -----
>  ...Fix-libraries-installation-for-Linux.patch | 177 ------------------
>  .../grpc/{grpc_1.24.3.bb => grpc_1.35.0.bb}   |  15 +-
>  3 files changed, 5 insertions(+), 232 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
>  delete mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
>  rename meta-oe/recipes-devtools/grpc/{grpc_1.24.3.bb => grpc_1.35.0.bb} (80%)
>
> diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
> deleted file mode 100644
> index 6cad533964..0000000000
> --- a/meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -From 6d606f1101c1a172fb6d738d6f1865aa61849e68 Mon Sep 17 00:00:00 2001
> -From: Alexey Firago <alexey_firago@mentor.com>
> -Date: Fri, 20 Oct 2017 00:04:19 +0300
> -Subject: [PATCH] CMakeLists.txt: Fix grpc_cpp_plugin path during cross-compiling or native build
> -
> -Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
> -Signed-off-by: Hiram Lew <lew@avast.com>
> -Signed-off-by: Jan Kaisrlik <jan.kaisrlik@avast.com>
> ----
> - CMakeLists.txt                    | 9 ++++++++-
> - templates/CMakeLists.txt.template | 9 ++++++++-
> - 2 files changed, 16 insertions(+), 2 deletions(-)
> -
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -193,6 +193,13 @@ function(protobuf_generate_grpc_cpp)
> -     return()
> -   endif()
> -
> -+  #if cross-compiling or nativesdk, find host plugin
> -+  if(CMAKE_CROSSCOMPILING)
> -+      find_program(gRPC_CPP_PLUGIN grpc_cpp_plugin)
> -+  else()
> -+      set(gRPC_CPP_PLUGIN $<TARGET_FILE:grpc_cpp_plugin>)
> -+  endif()
> -+
> -   set(_protobuf_include_path -I . -I ${_gRPC_PROTOBUF_WELLKNOWN_INCLUDE_DIR})
> -   foreach(FIL ${ARGN})
> -     get_filename_component(ABS_FIL ${FIL} ABSOLUTE)
> ---- a/templates/CMakeLists.txt.template
> -+++ b/templates/CMakeLists.txt.template
> -@@ -233,6 +233,13 @@
> -       return()
> -     endif()
> -
> -+    #if cross-compiling or nativesdk, find host plugin
> -+    if(CMAKE_CROSSCOMPILING)
> -+        find_program(gRPC_CPP_PLUGIN grpc_cpp_plugin)
> -+    else()
> -+        set(gRPC_CPP_PLUGIN $<TARGET_FILE:grpc_cpp_plugin>)
> -+    endif()
> -+
> -     set(_protobuf_include_path -I . -I <%text>${_gRPC_PROTOBUF_WELLKNOWN_INCLUDE_DIR}</%text>)
> -     foreach(FIL <%text>${ARGN}</%text>)
> -       get_filename_component(ABS_FIL <%text>${FIL}</%text> ABSOLUTE)
> diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
> deleted file mode 100644
> index e517355d34..0000000000
> --- a/meta-oe/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
> +++ /dev/null
> @@ -1,177 +0,0 @@
> -From 2279e30be5796e9b185545543ea54fe68633cbdd Mon Sep 17 00:00:00 2001
> -From: Alexey Firago <alexey_firago@mentor.com>
> -Date: Mon, 30 Oct 2017 23:24:49 +0300
> -Subject: [PATCH] CMakeLists.txt: Fix libraries installation for Linux
> -
> -* Set libs versions as in Makefile
> -
> -Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
> -
> ----
> - CMakeLists.txt | 59 ++++++++++++++++++++++++++++++++++++++++++++++++++
> - 1 file changed, 59 insertions(+)
> -
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -30,6 +30,15 @@ set(PACKAGE_TARNAME   "${PACKAGE_NAME}-$
> - set(PACKAGE_BUGREPORT "https://github.com/grpc/grpc/issues/")
> - project(${PACKAGE_NAME} C CXX)
> -
> -+set (CORE_VERSION_MAJOR "6")
> -+set (CORE_VERSION "6.0.0")
> -+
> -+set (CPP_VERSION_MAJOR "1")
> -+set (CPP_VERSION "${PACKAGE_VERSION}")
> -+
> -+set (CSHARP_VERSION_MAJOR "1")
> -+set (CSHARP_VERSION "${PACKAGE_VERSION}")
> -+
> - set(gRPC_INSTALL_BINDIR "bin" CACHE STRING "Installation directory for executables")
> - set(gRPC_INSTALL_LIBDIR "lib" CACHE STRING "Installation directory for libraries")
> - set(gRPC_INSTALL_INCLUDEDIR "include" CACHE STRING "Installation directory for headers")
> -@@ -777,6 +786,10 @@ if(WIN32 AND MSVC)
> -   endif()
> - endif()
> -
> -+if(_gRPC_PLATFORM_LINUX)
> -+  set_property(TARGET address_sorting PROPERTY VERSION ${CORE_VERSION})
> -+  set_property(TARGET address_sorting PROPERTY SOVERSION ${CORE_VERSION_MAJOR})
> -+endif()
> -
> - target_include_directories(address_sorting
> -   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
> -@@ -903,6 +916,10 @@ if(WIN32 AND MSVC)
> -   endif()
> - endif()
> -
> -+if(_gRPC_PLATFORM_LINUX)
> -+  set_property(TARGET gpr PROPERTY VERSION ${CORE_VERSION})
> -+  set_property(TARGET gpr PROPERTY SOVERSION ${CORE_VERSION_MAJOR})
> -+endif()
> -
> - target_include_directories(gpr
> -   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
> -@@ -1367,6 +1384,10 @@ if(WIN32 AND MSVC)
> -   endif()
> - endif()
> -
> -+if(_gRPC_PLATFORM_LINUX)
> -+  set_property(TARGET grpc PROPERTY VERSION ${CORE_VERSION})
> -+  set_property(TARGET grpc PROPERTY SOVERSION ${CORE_VERSION_MAJOR})
> -+endif()
> -
> - target_include_directories(grpc
> -   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
> -@@ -1782,6 +1803,10 @@ if(WIN32 AND MSVC)
> -   endif()
> - endif()
> -
> -+if(_gRPC_PLATFORM_LINUX)
> -+  set_property(TARGET grpc_cronet PROPERTY VERSION ${CORE_VERSION})
> -+  set_property(TARGET grpc_cronet PROPERTY SOVERSION ${CORE_VERSION_MAJOR})
> -+endif()
> -
> - target_include_directories(grpc_cronet
> -   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
> -@@ -2869,6 +2894,10 @@ if(WIN32 AND MSVC)
> -   endif()
> - endif()
> -
> -+if(_gRPC_PLATFORM_LINUX)
> -+  set_property(TARGET grpc_unsecure PROPERTY VERSION ${CORE_VERSION})
> -+  set_property(TARGET grpc_unsecure PROPERTY SOVERSION ${CORE_VERSION_MAJOR})
> -+endif()
> -
> - target_include_directories(grpc_unsecure
> -   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
> -@@ -3206,6 +3235,10 @@ if(WIN32 AND MSVC)
> -   endif()
> - endif()
> -
> -+if(_gRPC_PLATFORM_LINUX)
> -+  set_property(TARGET grpc++ PROPERTY VERSION ${CPP_VERSION})
> -+  set_property(TARGET grpc++ PROPERTY SOVERSION ${CPP_VERSION_MAJOR})
> -+endif()
> -
> - target_include_directories(grpc++
> -   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
> -@@ -3589,6 +3622,11 @@ protobuf_generate_grpc_cpp(
> -   src/proto/grpc/status/status.proto
> - )
> -
> -+if(_gRPC_PLATFORM_LINUX)
> -+  set_property(TARGET grpc++_error_details PROPERTY VERSION ${CPP_VERSION})
> -+  set_property(TARGET grpc++_error_details PROPERTY SOVERSION ${CPP_VERSION_MAJOR})
> -+endif()
> -+
> - target_include_directories(grpc++_error_details
> -   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
> -   PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
> -@@ -3727,6 +3765,11 @@ protobuf_generate_grpc_cpp(
> -   src/proto/grpc/reflection/v1alpha/reflection.proto
> - )
> -
> -+if(_gRPC_PLATFORM_LINUX)
> -+  set_property(TARGET grpc++_reflection PROPERTY VERSION ${CPP_VERSION})
> -+  set_property(TARGET grpc++_reflection PROPERTY SOVERSION ${CPP_VERSION_MAJOR})
> -+endif()
> -+
> - target_include_directories(grpc++_reflection
> -   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
> -   PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
> -@@ -3816,6 +3859,10 @@ target_link_libraries(grpc++_test_config
> -   ${_gRPC_GFLAGS_LIBRARIES}
> - )
> -
> -+if(_gRPC_PLATFORM_LINUX)
> -+  set_property(TARGET grpc++_cronet PROPERTY VERSION ${CPP_VERSION})
> -+  set_property(TARGET grpc++_cronet PROPERTY SOVERSION ${CPP_VERSION_MAJOR})
> -+endif()
> -
> - endif (gRPC_BUILD_TESTS)
> - if (gRPC_BUILD_TESTS)
> -@@ -4307,6 +4354,10 @@ if(WIN32 AND MSVC)
> -   endif()
> - endif()
> -
> -+if(_gRPC_PLATFORM_LINUX)
> -+  set_property(TARGET grpc++_unsecure PROPERTY VERSION ${CPP_VERSION})
> -+  set_property(TARGET grpc++_unsecure PROPERTY SOVERSION ${CPP_VERSION_MAJOR})
> -+endif()
> -
> - target_include_directories(grpc++_unsecure
> -   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
> -@@ -4745,6 +4796,10 @@ if(WIN32 AND MSVC)
> -   endif()
> - endif()
> -
> -+if(_gRPC_PLATFORM_LINUX)
> -+  set_property(TARGET grpc_plugin_support PROPERTY VERSION ${CORE_VERSION})
> -+  set_property(TARGET grpc_plugin_support PROPERTY SOVERSION ${CORE_VERSION_MAJOR})
> -+endif()
> -
> - target_include_directories(grpc_plugin_support
> -   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
> -@@ -4813,6 +4868,11 @@ protobuf_generate_grpc_cpp(
> -   src/proto/grpc/channelz/channelz.proto
> - )
> -
> -+if(_gRPC_PLATFORM_LINUX)
> -+      set_property(TARGET grpcpp_channelz PROPERTY VERSION ${CPP_VERSION})
> -+  set_property(TARGET grpcpp_channelz PROPERTY SOVERSION ${CPP_VERSION_MAJOR})
> -+endif()
> -+
> - target_include_directories(grpcpp_channelz
> -   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
> -   PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
> -@@ -5367,6 +5427,10 @@ if(WIN32 AND MSVC)
> -   endif()
> - endif()
> -
> -+if(_gRPC_PLATFORM_LINUX)
> -+  set_property(TARGET grpc_csharp_ext PROPERTY VERSION ${CSHARP_VERSION})
> -+  set_property(TARGET grpc_csharp_ext PROPERTY SOVERSION ${CSHARP_VERSION_MAJOR})
> -+endif()
> -
> - target_include_directories(grpc_csharp_ext
> -   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
> diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.24.3.bb b/meta-oe/recipes-devtools/grpc/grpc_1.35.0.bb
> similarity index 80%
> rename from meta-oe/recipes-devtools/grpc/grpc_1.24.3.bb
> rename to meta-oe/recipes-devtools/grpc/grpc_1.35.0.bb
> index c25ce360e7..5097b2b1b8 100644
> --- a/meta-oe/recipes-devtools/grpc/grpc_1.24.3.bb
> +++ b/meta-oe/recipes-devtools/grpc/grpc_1.35.0.bb
> @@ -6,22 +6,15 @@ SECTION = "libs"
>  LICENSE = "Apache-2"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>
> -DEPENDS = "gflags c-ares protobuf protobuf-native protobuf-c protobuf-c-native openssl libnsl2"
> +DEPENDS = "gflags c-ares protobuf protobuf-native protobuf-c protobuf-c-native openssl libnsl2 abseil-cpp re2"
>  DEPENDS_append_class-target = " googletest grpc-native "
>  DEPENDS_append_class-nativesdk = " grpc-native "
>
>  S = "${WORKDIR}/git"
> -SRCREV_grpc = "2de2e8dd8921e1f7d043e01faf7fe8a291fbb072"
> -SRCREV_upb = "9effcbcb27f0a665f9f345030188c0b291e32482"
> -BRANCH = "v1.24.x"
> +SRCREV_grpc = "627a22541a1836ce00cdc40a3977aa8928de98bc"
> +BRANCH = "v1.35.x"
>  SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
> -           git://github.com/protocolbuffers/upb;name=upb;destsuffix=git/third_party/upb \
> -           file://0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch \
>             "
> -SRC_URI_append_class-target = " file://0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch \
> -                               "
> -SRC_URI_append_class-nativesdk = " file://0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch"
> -
>  # Fixes build with older compilers 4.8 especially on ubuntu 14.04
>  CXXFLAGS_append_class-native = " -Wl,--no-as-needed"
>
> @@ -33,6 +26,8 @@ EXTRA_OECMAKE = " \
>      -DgRPC_SSL_PROVIDER=package \
>      -DgRPC_PROTOBUF_PROVIDER=package \
>      -DgRPC_GFLAGS_PROVIDER=package \
> +    -DgRPC_ABSL_PROVIDER=package \
> +    -DgRPC_RE2_PROVIDER=package \
>      -DgRPC_INSTALL=ON \
>      -DCMAKE_CROSSCOMPILING=ON \
>      -DBUILD_SHARED_LIBS=ON \
> --
> 2.17.1
>
>
> 
>
