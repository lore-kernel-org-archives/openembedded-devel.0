Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21958C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 23:49:46 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.204.1649367557009422416
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Apr 2022 14:39:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ayo4UORA;
 spf=pass (domain: gmail.com, ip: 209.85.160.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id s11so9282545qtc.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Apr 2022 14:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=sRLSiPI6ZuFtz0LqZ5O1KHBtF4D735t6dus8+U6XlVA=;
        b=Ayo4UORAXFx8dIFevA8nNlsYMo5szLUKZgjD5SvBCKryZSXwWIPurtDMelyp4KX1UO
         CMG/QZbk4Nv9J7IU5xr/EZ9RT9fIRX+Iwb+HZV6ekaWUFHXW8BpQDGrXMdXfZs5MFoVe
         FCOqWoio8tTVmlsqj1z2hOiCqYIWyPkceTtmq0JOotQizaT0r9lDxqIEn3lN1/u7KJOs
         TAXiVo4DFA3xyKh8yw9kEVDz078Shy4rMeebptyTic19ibTe5GZW126P19Sa19xDLr3i
         p1S8BSVhmY07ruU/AvK+iQ12ecpqfUv5Nf84SzRPkz1o7QrXSl/oW465t5ada9mRvfUg
         ClAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=sRLSiPI6ZuFtz0LqZ5O1KHBtF4D735t6dus8+U6XlVA=;
        b=iKhdeWZM0TrtokQRxIq8EG42plawg/50N9RsJnYpLeftjhpXJ/OQUk/1erIm2nUU0c
         CuJapMGNZC9qnA5euFy5LSoFmAAENFG2lw3mjAxFHseOHcsJ1FJhp3DosC6zIvwNGJeE
         XI/zoWQzOu7DRmYOsFGZa/4qRuhBmK1QGmLeSsA4Dt+Zw4J9UtU/FXqMAZL6Og/p9DJN
         IGEcB9P1Pjo/tabpGkBppaatmXYRUaOjh7FV2qe5gDStyijM6H97gJYtV+3voeo4Nwdb
         UItq9prH8wBkT7qtWG3GKxTy9B+RerFR/bevPfORAbijWBdfZL44MXSMRItzHWubIBdM
         /QPQ==
X-Gm-Message-State: AOAM530W1BA5fmH7vFeJL9K6rT+1Gjtfjeakr5gmnyHApX1Y23AAhN72
	NQsBW4CL8h/dBlImBxEnsyc=
X-Google-Smtp-Source: 
 ABdhPJx1bvSDEGBVcY5hHTXL0IP8MAohUNrY9lJoYfj8GXyLkHC2BuYwtVcX2v8sL35mjfOJL126ug==
X-Received: by 2002:a05:622a:24f:b0:2e1:d658:a595 with SMTP id
 c15-20020a05622a024f00b002e1d658a595mr13602720qtx.657.1649367555956;
        Thu, 07 Apr 2022 14:39:15 -0700 (PDT)
Received: from [10.44.189.203] ([12.161.6.169])
        by smtp.gmail.com with ESMTPSA id
 t3-20020a05620a0b0300b00699c6a9b2d1sm7742045qkg.32.2022.04.07.14.39.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 14:39:15 -0700 (PDT)
Message-ID: <93edb444-4030-12f2-a156-2c752c8edd5f@gmail.com>
Date: Thu, 7 Apr 2022 17:39:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [oe] [meta-oe][ PATCH 1/2] grpc: add cmake support for target
Content-Language: en-US
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>,
 openembedded-devel@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20220407114406.6828-1-stefan.herbrechtsmeier-oss@weidmueller.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: 
 <20220407114406.6828-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Apr 2022 23:49:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96463

can you rebase it on top of latest master or master-next and resend, we 
now have grpc 1.45.1 in master.

On 4/7/22 7:44 AM, Stefan Herbrechtsmeier wrote:
> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> 
> The CMake gRPC config checks for binaries and fails if a binary (plugin)
> is missing. Fix the problem in the code and add the CMake gRPC config
> back to the target package.
> 
> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> ---
> 
>   ...d-separate-export-for-plugin-targets.patch | 93 +++++++++++++++++++
>   meta-oe/recipes-devtools/grpc/grpc_1.45.0.bb  |  3 +-
>   2 files changed, 94 insertions(+), 2 deletions(-)
>   create mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-cmake-add-separate-export-for-plugin-targets.patch
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
> diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.45.0.bb b/meta-oe/recipes-devtools/grpc/grpc_1.45.0.bb
> index d25a01cf3..d50fd2727 100644
> --- a/meta-oe/recipes-devtools/grpc/grpc_1.45.0.bb
> +++ b/meta-oe/recipes-devtools/grpc/grpc_1.45.0.bb
> @@ -24,6 +24,7 @@ SRCREV_grpc = "494b08ada4009ead0d0b70e44d354be72f9c283a"
>   BRANCH = "v1.45.x"
>   SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
>              file://0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch \
> +           file://0001-cmake-add-separate-export-for-plugin-targets.patch \
>              "
>   # Fixes build with older compilers 4.8 especially on ubuntu 14.04
>   CXXFLAGS:append:class-native = " -Wl,--no-as-needed"
> @@ -80,8 +81,6 @@ do_configure:prepend:toolchain-clang:x86() {
>   
>   BBCLASSEXTEND = "native nativesdk"
>   
> -SYSROOT_DIRS_IGNORE:append:class-target = " ${baselib}/cmake/grpc"
> -
>   FILES:${PN}-compiler += " \
>       ${bindir} \
>       ${libdir}/libgrpc_plugin_support${SOLIBS} \
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96451): https://lists.openembedded.org/g/openembedded-devel/message/96451
> Mute This Topic: https://lists.openembedded.org/mt/90310753/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

