Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F347C433EF
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 20:12:14 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web08.915.1649445158149556979
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Apr 2022 12:12:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E//CD2RV;
 spf=pass (domain: gmail.com, ip: 209.85.160.52,
 mailfrom: peron.clem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-df22f50e0cso10725571fac.3
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Apr 2022 12:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nKS1ijOLwC3wrBvnuqLCwxlSj+4bfWn/qYXZBvkT030=;
        b=E//CD2RVGSKViaqpJAjIQxj3vXy9+oqIQEQxjq9kVUFIboM9Han4q7focNacNoeP/K
         9X2W2F6GTHXqrLOWX6QjIDSD4y5XZ7vVjgCpPPkEcPygxLI0TMosLFUSI7k8C2Yn+9R3
         9Jf8YuQBNpMOAkzB7fOODHH0hKCJTEw2Y1sUFGCEAiLdpRp67SpwEMypNMSY1PXK4NFX
         hQ65HkcPelbrCj+jolgA0piBfMdeiwKsq8wbAL+4hTzRBwoxjIrW4I8hHH5Lid8JagPc
         dV+Iu4IgY/aLZh185hOa6LOpl2eX+FQ4TM5/bZgz8IzO2LPW7I4PFikehDyM8pDpPwfm
         AX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nKS1ijOLwC3wrBvnuqLCwxlSj+4bfWn/qYXZBvkT030=;
        b=k33m0rpUXMTieJKsRNtG9YkYeQ0OuufU5AM8OgpG57bQpNIQQCvxm4HJT2RnGzKYsr
         BKJXLc4qwJJJlLbqd/t4ZLS/Dz80cjrKgxQutqa2uT2WJJolxnIcMsfezE+E726FH8EC
         4ENlnGygEHEK45BAuzChWsPwqV4V/LYKzZqqPIpFGd8srfDSYAwda7PMiVh2ZhlVgqRh
         dib+XVj7hGS45KVm9WpZCB0GFIxG+8WbQgAWBussrRdjp0cgY6KYS2IEXLozkRn/KMUm
         NHenjgKKFZ9jK5gz4L40KUrzsJ0U8/qVKoh5lCfWllKVElF2z2NsXNi9xEjE2aK6LjEH
         zacw==
X-Gm-Message-State: AOAM5309LviuJ5Wv1Ho2fi4n/wy8pa/2G5JotMHXAdDFIc4pLmJd02vZ
	RzoCVMEW/MpYwW3yz2B9Qk0IA5bb3drtHMTsNww=
X-Google-Smtp-Source: 
 ABdhPJxBpHSlJBjZssvPRK/hV1QIaSjTaM8mSoiEQyOkysxt1+xd7lQmhrDFsvbO+vjN0zQw6DASi5fTukxnT7bhwLs=
X-Received: by 2002:a05:6870:f149:b0:de:e873:4a46 with SMTP id
 l9-20020a056870f14900b000dee8734a46mr9031791oac.286.1649445157256; Fri, 08
 Apr 2022 12:12:37 -0700 (PDT)
MIME-Version: 1.0
References: 
 <20220408073004.20207-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <CAJiuCccdcaYf19Qx8-p7uO5TRPxwiAuwJwhw=AmCR=45DZpVRw@mail.gmail.com>
 <568f92fd-be75-f0d3-5e3d-c4be0e4b6b76@weidmueller.com>
In-Reply-To: <568f92fd-be75-f0d3-5e3d-c4be0e4b6b76@weidmueller.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Fri, 8 Apr 2022 21:12:26 +0200
Message-ID: 
 <CAJiuCce=b-bX54gSxSsmLtQEgLdON0GSrVB3gSYCHQmULnynoA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2 1/2] grpc: add cmake support for target
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Apr 2022 20:12:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96485

Hi Stefan,

On Fri, 8 Apr 2022 at 14:47, Stefan Herbrechtsmeier
<stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
>
> Hi Clement,
>
> Am 08.04.2022 um 14:25 schrieb Cl=C3=A9ment P=C3=A9ron:
> > Hi Stefan,
> >
> > On Fri, 8 Apr 2022 at 09:30, Stefan Herbrechtsmeier
> > <stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
> >>
> >> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> >>
> >> The CMake gRPC config checks for binaries and fails if a binary (plugi=
n)
> >> is missing. Fix the problem in the code and add the CMake gRPC config
> >> back to the target package.
> >
> > Thanks for your patch, I'm still using gRPC 1.35 + your previous simila=
r patch.
> > I'm trying to bump to gRPC 1.45.1 + these patches.
> >
> > My recipe use CMake and depends on grpc and grpc-native:
> > PACKAGECONFIG[grpc] =3D "-DCONFIG_GRPC=3DON,-DCONFIG_GRPC=3DOFF,grpc gr=
pc-native"
> >
> > But unfortunately CMake doesn't find the grpc_cpp_plugin.
>
> This is the correct behavior of my patch because the grpc_cpp_plugin
> from the cross build isn't usable during cross build. You need the
> grpc_cpp_plugin from the host and therefore have to search the
> grpc_cpp_plugin by yourself during cross compile [1].
>
> My first patch was rejected and therefore I create a minimal patch which
> only make the CMake gRPC config usable.
>
> >
> > | -- Using gRPC 1.45.1
> > ....
> > | CMake Error at modules/grpc/CMakeLists.txt:37 (add_custom_command):
> > |   Error evaluating generator expression:
> > |
> > |     $<TARGET_FILE:gRPC::grpc_cpp_plugin>
> > |
> > |   No target "gRPC::grpc_cpp_plugin"
> > |
> > |
> > | CMake Error at modules/grpc/CMakeLists.txt:37 (add_custom_command):
> > |   Error evaluating generator expression:
> > |
> > |     $<TARGET_FILE:gRPC::grpc_cpp_plugin>
> > |
> > |   No target "gRPC::grpc_cpp_plugin"
> > |
> > |
> > | CMake Error at modules/grpc/CMakeLists.txt:37 (add_custom_command):
> > |   Error evaluating generator expression:
> > |
> > |     $<TARGET_FILE:gRPC::grpc_cpp_plugin>
> > |
> > |   No target "gRPC::grpc_cpp_plugin"
> >
> > Here is my CMake source file:
> >
> > # Find Protobuf installation Yocto SDK doensn't support protobuf-config=
.cmake
> > # for the moment
> > set(protobuf_MODULE_COMPATIBLE TRUE)
> > find_package(Protobuf REQUIRED)
> > message(STATUS "Using protobuf ${Protobuf_VERSION}")
> > set(_PROTOBUF_LIBPROTOBUF protobuf::libprotobuf)
> >
> > # Find gRPC installation Looks for gRPCConfig.cmake file installed by g=
RPC's
> > # cmake installation.
> > find_package(gRPC CONFIG REQUIRED)
> > message(STATUS "Using gRPC ${gRPC_VERSION}")
> > set(_REFLECTION gRPC::grpc++_reflection)
> > set(_GRPC_GRPCPP gRPC::grpc++)
> >
> > # Get full path of protobuf/gRPC compiler
> > set(_PROTOBUF_PROTOC $<TARGET_FILE:protobuf::protoc>)
> > set(_GRPC_CPP_PLUGIN_EXECUTABLE $<TARGET_FILE:gRPC::grpc_cpp_plugin>)
>
> You have to search the binaries if you cross compile [1]:
>
> if(CMAKE_CROSSCOMPILING)
>    find_program(_GRPC_CPP_PLUGIN_EXECUTABLE grpc_cpp_plugin)
> else()
>    set(_GRPC_CPP_PLUGIN_EXECUTABLE $<TARGET_FILE:gRPC::grpc_cpp_plugin>)
> endif()

Thanks this fix my issue

Tested-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>

>
> >
> > Do you have an example of how you look for gRPC in your recipe?
>
> This isn't possible because you use a target and not a variable.

Maybe a dumb question but how protobuf-compiler handle this?

Thanks,
Clement



>
> [1] https://github.com/grpc/grpc/blob/master/examples/cpp/cmake/common.cm=
ake
>
> Regards
>    Stefan

