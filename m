Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B63C4332F
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:09:35 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web09.5093.1649420727736614109
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Apr 2022 05:25:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mrlJVRsR;
 spf=pass (domain: gmail.com, ip: 209.85.160.53,
 mailfrom: peron.clem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-de3ca1efbaso9534632fac.9
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Apr 2022 05:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EoQrQr6dY80GypW2f8OPb+VzESflEVYYJxYJyIic/Gk=;
        b=mrlJVRsR/v155eVyHxgkpUNbsoMJTvxAdpdv2fnwOZlcF0zkv0c7Na4eklnQBqBSdM
         lSlBEx2frRa3IxpcVh5QQgsFggbQyiInZYAP9MzUpBL9nmv8yTFJW0Q9TglU+6sFaxGh
         DmsU1h5Xj0d21GP9LwgEFU0bI/n9+KdUKPqmyqxrCzCJsXtNKs/TsOsgTL35dHEIFuK0
         SbGLxYbm7UOMzjXt8zsJhFY08/dReFomT76GqQwt8CSN3fol39lhVATeO+KCFiMSqgem
         vFgIpjQeyVF2ZE7GrL8OoYWshZ/126VxFZNnBdFxn+ceDNzai2H6Yy7zBS6mRumTDg2h
         3wzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EoQrQr6dY80GypW2f8OPb+VzESflEVYYJxYJyIic/Gk=;
        b=uPoKRgwnTnz1pTCX1PA7hBsp77b6kF8PXLpReVJsCNj+72/H7AtDHTwfjUeZO15N2R
         hX/lR11gIJOaRIzj8gakPoGun6PLip6cZZqLuVuqAnULuym/sEjufCTqvcFfkCo77MS4
         hApGNFhgcEczGf2QXphXo+b/K5iNzxztXnY9U51dEDkVlNkKczFdo9flfbbo8Gkn05qw
         gfoslK1n4bLl8CxNdrOF48PFCOa+7nyhLvk9f3PRDlNvunsCxwRZpdH7Jzxgc9TeTvPt
         cnkbocTJjsio/V96WkMbpWTTCgywp8h1l0m+lR+dFosSkJRhkNuFn/m7oTXapfAPVnLG
         SVWg==
X-Gm-Message-State: AOAM532JlRQvrdTRsXOwZotlBd16HdpnQvZ9UB2OTEB/2D4S2PJZ5GLD
	e0yJ2DEwsNToqW9jJJoNKjbm2pZgYHh4RlqrW7I=
X-Google-Smtp-Source: 
 ABdhPJwTZ3Txt+QkLXaAhGgMo0cyiD2kURb8+iJxd6E1hg4lfLGAJ0fIeYulM6/dOR7pCu8hbcLjyx7rjCcfmIGqw4s=
X-Received: by 2002:a05:6870:f149:b0:de:e873:4a46 with SMTP id
 l9-20020a056870f14900b000dee8734a46mr8121949oac.286.1649420726768; Fri, 08
 Apr 2022 05:25:26 -0700 (PDT)
MIME-Version: 1.0
References: 
 <20220408073004.20207-1-stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <20220408073004.20207-1-stefan.herbrechtsmeier-oss@weidmueller.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Fri, 8 Apr 2022 14:25:15 +0200
Message-ID: 
 <CAJiuCccdcaYf19Qx8-p7uO5TRPxwiAuwJwhw=AmCR=45DZpVRw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2 1/2] grpc: add cmake support for target
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Apr 2022 17:09:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96476

Hi Stefan,

On Fri, 8 Apr 2022 at 09:30, Stefan Herbrechtsmeier
<stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
>
> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>
> The CMake gRPC config checks for binaries and fails if a binary (plugin)
> is missing. Fix the problem in the code and add the CMake gRPC config
> back to the target package.

Thanks for your patch, I'm still using gRPC 1.35 + your previous similar patch.
I'm trying to bump to gRPC 1.45.1 + these patches.

My recipe use CMake and depends on grpc and grpc-native:
PACKAGECONFIG[grpc] = "-DCONFIG_GRPC=ON,-DCONFIG_GRPC=OFF,grpc grpc-native"

But unfortunately CMake doesn't find the grpc_cpp_plugin.

| -- Using gRPC 1.45.1
....
| CMake Error at modules/grpc/CMakeLists.txt:37 (add_custom_command):
|   Error evaluating generator expression:
|
|     $<TARGET_FILE:gRPC::grpc_cpp_plugin>
|
|   No target "gRPC::grpc_cpp_plugin"
|
|
| CMake Error at modules/grpc/CMakeLists.txt:37 (add_custom_command):
|   Error evaluating generator expression:
|
|     $<TARGET_FILE:gRPC::grpc_cpp_plugin>
|
|   No target "gRPC::grpc_cpp_plugin"
|
|
| CMake Error at modules/grpc/CMakeLists.txt:37 (add_custom_command):
|   Error evaluating generator expression:
|
|     $<TARGET_FILE:gRPC::grpc_cpp_plugin>
|
|   No target "gRPC::grpc_cpp_plugin"

Here is my CMake source file:

# Find Protobuf installation Yocto SDK doensn't support protobuf-config.cmake
# for the moment
set(protobuf_MODULE_COMPATIBLE TRUE)
find_package(Protobuf REQUIRED)
message(STATUS "Using protobuf ${Protobuf_VERSION}")
set(_PROTOBUF_LIBPROTOBUF protobuf::libprotobuf)

# Find gRPC installation Looks for gRPCConfig.cmake file installed by gRPC's
# cmake installation.
find_package(gRPC CONFIG REQUIRED)
message(STATUS "Using gRPC ${gRPC_VERSION}")
set(_REFLECTION gRPC::grpc++_reflection)
set(_GRPC_GRPCPP gRPC::grpc++)

# Get full path of protobuf/gRPC compiler
set(_PROTOBUF_PROTOC $<TARGET_FILE:protobuf::protoc>)
set(_GRPC_CPP_PLUGIN_EXECUTABLE $<TARGET_FILE:gRPC::grpc_cpp_plugin>)

Do you have an example of how you look for gRPC in your recipe?

Thanks for your help
Regards,
Clement

>
> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>
> ---
>
> Changes in v2:
> - Rebase on top of latest master
>
>  ...d-separate-export-for-plugin-targets.patch | 93 +++++++++++++++++++
>  meta-oe/recipes-devtools/grpc/grpc_1.45.1.bb  |  3 +-
>  2 files changed, 94 insertions(+), 2 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separate-export-for-plugin-targets.patch
>
> diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separate-export-for-plugin-targets.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separate-export-for-plugin-targets.patch
> new file mode 100644
> index 000000000..679bd3882
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separate-export-for-plugin-targets.patch
> @@ -0,0 +1,93 @@
> +From 3150cb043363e05588062dd392b940be25594713 Mon Sep 17 00:00:00 2001
> +From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> +Date: Tue, 18 Feb 2020 14:17:07 +0100
> +Subject: [PATCH] cmake: add separate export for plugin targets
> +
> +Upstream-Status: Submitted [https://github.com/grpc/grpc/pull/29328]
> +
> +
> +---
> + CMakeLists.txt | 18 +++++++++++-------
> + 1 file changed, 11 insertions(+), 7 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index efdaf8936d..6608b1b00c 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -10935,7 +10935,7 @@ target_link_libraries(grpc_cpp_plugin
> +
> +
> + if(gRPC_INSTALL)
> +-  install(TARGETS grpc_cpp_plugin EXPORT gRPCTargets
> ++  install(TARGETS grpc_cpp_plugin EXPORT gRPCPluginTargets
> +     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
> +     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> +     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
> +@@ -10975,7 +10975,7 @@ target_link_libraries(grpc_csharp_plugin
> +
> +
> + if(gRPC_INSTALL)
> +-  install(TARGETS grpc_csharp_plugin EXPORT gRPCTargets
> ++  install(TARGETS grpc_csharp_plugin EXPORT gRPCPluginTargets
> +     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
> +     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> +     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
> +@@ -11015,7 +11015,7 @@ target_link_libraries(grpc_node_plugin
> +
> +
> + if(gRPC_INSTALL)
> +-  install(TARGETS grpc_node_plugin EXPORT gRPCTargets
> ++  install(TARGETS grpc_node_plugin EXPORT gRPCPluginTargets
> +     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
> +     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> +     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
> +@@ -11055,7 +11055,7 @@ target_link_libraries(grpc_objective_c_plugin
> +
> +
> + if(gRPC_INSTALL)
> +-  install(TARGETS grpc_objective_c_plugin EXPORT gRPCTargets
> ++  install(TARGETS grpc_objective_c_plugin EXPORT gRPCPluginTargets
> +     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
> +     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> +     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
> +@@ -11095,7 +11095,7 @@ target_link_libraries(grpc_php_plugin
> +
> +
> + if(gRPC_INSTALL)
> +-  install(TARGETS grpc_php_plugin EXPORT gRPCTargets
> ++  install(TARGETS grpc_php_plugin EXPORT gRPCPluginTargets
> +     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
> +     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> +     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
> +@@ -11135,7 +11135,7 @@ target_link_libraries(grpc_python_plugin
> +
> +
> + if(gRPC_INSTALL)
> +-  install(TARGETS grpc_python_plugin EXPORT gRPCTargets
> ++  install(TARGETS grpc_python_plugin EXPORT gRPCPluginTargets
> +     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
> +     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> +     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
> +@@ -11175,7 +11175,7 @@ target_link_libraries(grpc_ruby_plugin
> +
> +
> + if(gRPC_INSTALL)
> +-  install(TARGETS grpc_ruby_plugin EXPORT gRPCTargets
> ++  install(TARGETS grpc_ruby_plugin EXPORT gRPCPluginTargets
> +     RUNTIME DESTINATION ${gRPC_INSTALL_BINDIR}
> +     BUNDLE DESTINATION  ${gRPC_INSTALL_BINDIR}
> +     LIBRARY DESTINATION ${gRPC_INSTALL_LIBDIR}
> +@@ -17349,6 +17349,10 @@ if(gRPC_INSTALL)
> +     DESTINATION ${gRPC_INSTALL_CMAKEDIR}
> +     NAMESPACE gRPC::
> +   )
> ++  install(EXPORT gRPCPluginTargets
> ++    DESTINATION ${gRPC_INSTALL_CMAKEDIR}
> ++    NAMESPACE gRPC::
> ++  )
> + endif()
> +
> + include(CMakePackageConfigHelpers)
> +--
> +2.30.2
> +
> diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.45.1.bb b/meta-oe/recipes-devtools/grpc/grpc_1.45.1.bb
> index 872bc6afc..292ea7f9b 100644
> --- a/meta-oe/recipes-devtools/grpc/grpc_1.45.1.bb
> +++ b/meta-oe/recipes-devtools/grpc/grpc_1.45.1.bb
> @@ -24,6 +24,7 @@ SRCREV_grpc = "1c159689ceda2c408f7f9d97d96a264c9521b806"
>  BRANCH = "v1.45.x"
>  SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
>             file://0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch \
> +           file://0001-cmake-add-separate-export-for-plugin-targets.patch \
>             "
>  # Fixes build with older compilers 4.8 especially on ubuntu 14.04
>  CXXFLAGS:append:class-native = " -Wl,--no-as-needed"
> @@ -80,8 +81,6 @@ do_configure:prepend:toolchain-clang:x86() {
>
>  BBCLASSEXTEND = "native nativesdk"
>
> -SYSROOT_DIRS_IGNORE:append:class-target = " ${baselib}/cmake/grpc"
> -
>  FILES:${PN}-compiler += " \
>      ${bindir} \
>      ${libdir}/libgrpc_plugin_support${SOLIBS} \
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96473): https://lists.openembedded.org/g/openembedded-devel/message/96473
> Mute This Topic: https://lists.openembedded.org/mt/90331029/4240582
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [peron.clem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

