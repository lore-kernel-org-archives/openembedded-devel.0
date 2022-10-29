Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8175C38A02
	for <webhook@archiver.kernel.org>; Sat, 29 Oct 2022 23:57:10 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web11.3787.1667087822909750688
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Oct 2022 16:57:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EHGwdTTl;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id r76-20020a4a374f000000b004988a70de2eso508247oor.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Oct 2022 16:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iuufJUmx+S8Vqk4AgnHOhtOUs3M+pMGfGaafi/6sgxc=;
        b=EHGwdTTlPBzjS3rlc9Jh04yYymZdm7vMmLhvfg7ma7k9Tp4rZJFH9Gl1ndVgHTk84I
         wgFtS+g5vwOSYu6Hk8vu+PCiZjsX/cUZBYoWOIK5a0InKXjjEGXUpvgfGGkTjbnaq4/z
         /iz78IuExBDOQs3mqJ08xDtQoOiN1YMjc2A5y77VmboTeV4HP+Y9YuH1E5l6uAYC9t8z
         AV7DNrZxUHmq835k/XgDikZ4D4VrnZH5+ay3QoT0v+Wg7cB3m498uhUwDijDtm3bUSb2
         sZkQ7NCHL5Fdr+oA98Ib+5FSz4syRkL+3+KzivQhcsuozdqbJZxqph9Rc38vJ+0IOGRQ
         4ydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iuufJUmx+S8Vqk4AgnHOhtOUs3M+pMGfGaafi/6sgxc=;
        b=LGraoiKm8OOzs59uOC/65l45j2Sfh/xWCqYC3mhBI/2KvKK8Oqk0jM5sB5QNsYuOK1
         SzylK15EgOv3gbtVZ2exvSFqeqk7MqNpSo8P3XlqFV94RLhZY12G4bpiD3Id7WY8mbhf
         TNmJFi3WR4gpvp83cX4rS72u4eeOo7SqWIXA7AB8zItDX4V2FRCmK7Rs6a9MW84mEtij
         U9T4GSKI9fX+TZb0J4nU5WPc2o/HLztiwX9NlpQ9Qfj9ETmNMlCod9L1uLRJYwPg/2qP
         aSdUdHj27m3SsEpNDVS4pgSikHKvvuIjlDlGzQ76JRALDalOvuqtBcouxnZbiEnSdTyd
         OSrQ==
X-Gm-Message-State: ACrzQf0twi8w7cdhqO6x9u7n8q1C5C71D74IDqeUVlLUl6o/K2s2SPmd
	l1x4aXzWmCXMB51H5M1sEqAfaMJC19om/2PaL4g=
X-Google-Smtp-Source: AMsMyM7kIFZeyTxLKMPSc/q6Sk6Uf5GlHDfQ2pqqg0XxB9G0uiUXkSUWa4OTZH4006VW6KOs/27D2N4IrZnefqLp8Aw=
X-Received: by 2002:a4a:c90f:0:b0:480:8d45:3246 with SMTP id
 v15-20020a4ac90f000000b004808d453246mr2593886ooq.9.1667087822037; Sat, 29 Oct
 2022 16:57:02 -0700 (PDT)
MIME-Version: 1.0
References: <20221018173118.784429-1-raj.khem@gmail.com> <7f680b57-19b4-d43e-df23-e774b259416e@windriver.com>
In-Reply-To: <7f680b57-19b4-d43e-df23-e774b259416e@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 29 Oct 2022 16:56:36 -0700
Message-ID: <CAMKF1spqB47ApZms=BVwe3eCpLZbDLj4e4jKYqShmeCZ9uOgDA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] grpc: Update to 1.50.x release
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Oct 2022 23:57:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99346

On Sat, Oct 29, 2022 at 2:08 PM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2022-10-18 13:31, Khem Raj wrote:
>
> License-update: Include MPL-2.0 [1]
>
> Add missing BSD 3-clause and MPL-2.0 to license field
>
> Switch to git submodules since its using locked versions of some
> components like opencensus-proto
>
> [1] https://github.com/grpc/grpc/commit/05fcd826f477ef1a024a2defa5e4b3d78f5e6eb4
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../grpc/{grpc_1.45.2.bb => grpc_1.50.0.bb}            | 10 +++++-----
>
>
> Is anyone else seeing:
>
> error: #error "C++ versions less than C++14 are not supported."
>
>
> i.e.
>
> TOPDIR/tmp-glibc/hosttools/g++ -Dgpr_EXPORTS \
> -ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/include \
> -ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git \
> -ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/third_party/address_sorting/include \
> -ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/src/core/ext/upb-generated \
> -ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/src/core/ext/upbdefs-generated \
> -ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/third_party/upb \
> -ITOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/third_party/xxhash \
> -isystemTOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/recipe-sysroot-native/usr/include \
> -O2 -pipe -Wl,--no-as-needed -fPIC -std=c++11 \
> -MD -MT \
> CMakeFiles/gpr.dir/src/core/lib/gpr/murmur_hash.cc.o \
> -MF \
> CMakeFiles/gpr.dir/src/core/lib/gpr/murmur_hash.cc.o.d \
> -o \
> CMakeFiles/gpr.dir/src/core/lib/gpr/murmur_hash.cc.o \
> -c \
> TOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/src/core/lib/gpr/murmur_hash.cc
> In file included from
> TOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/recipe-sysroot-native/usr/include/absl/base/config.h:86,
> from
> TOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/recipe-sysroot-native/usr/include/absl/base/attributes.h:37, \
> from \
> TOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/git/src/core/lib/gpr/murmur_hash.cc:25: \
> TOPDIR/tmp-glibc/work/x86_64-linux/grpc-native/1.45.2-r0/recipe-sysroot-native/usr/include/absl/base/policy_checks.h:79:2: \
> error: #error "C++ versions less than C++14 are not supported."
> 79 | #error "C++ versions less than C++14 are not supported." \
> | ^~~~~
>
>
> Happening for a variety of distros.
>
> fedora: 34, 35, 36, ubuntu: 1804, 2004, opensuse153

you seem to be still building 1.45.2 and the upgrade to 1.50x fixed
exactly this.

>
>
> ../Randy
>
>  1 file changed, 5 insertions(+), 5 deletions(-)
>  rename meta-oe/recipes-devtools/grpc/{grpc_1.45.2.bb => grpc_1.50.0.bb} (90%)
>
> diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.45.2.bb b/meta-oe/recipes-devtools/grpc/grpc_1.50.0.bb
> similarity index 90%
> rename from meta-oe/recipes-devtools/grpc/grpc_1.45.2.bb
> rename to meta-oe/recipes-devtools/grpc/grpc_1.50.0.bb
> index c2f952fc64..8efd9321ca 100644
> --- a/meta-oe/recipes-devtools/grpc/grpc_1.45.2.bb
> +++ b/meta-oe/recipes-devtools/grpc/grpc_1.50.0.bb
> @@ -3,8 +3,8 @@ Provides gRPC libraries for multiple languages written on top of shared C core l
>  (C++, Node.js, Python, Ruby, Objective-C, PHP, C#)"
>  HOMEPAGE = "https://github.com/grpc/grpc"
>  SECTION = "libs"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=6e4cf218112648d22420a84281b68b88"
> +LICENSE = "Apache-2.0 && BSD-3-Clause && MPL-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=731e401b36f8077ae0c134b59be5c906"
>
>  DEPENDS = "c-ares protobuf protobuf-native protobuf-c protobuf-c-native openssl libnsl2 abseil-cpp re2"
>  DEPENDS:append:class-target = " googletest grpc-native "
> @@ -20,9 +20,9 @@ RDEPENDS:${PN}-dev:append:class-native = " ${PN}-compiler"
>  # RDEPENDS:${PN}-dev += "${PN}-compiler"
>
>  S = "${WORKDIR}/git"
> -SRCREV_grpc = "b39ffcc425ea990a537f98ec6fe6a1dcb90470d7"
> -BRANCH = "v1.45.x"
> -SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
> +SRCREV_grpc = "91091e3668144de9c6aa392f496bb7639f7025a7"
> +BRANCH = "v1.50.x"
> +SRC_URI = "gitsm://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
>             file://0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch \
>             file://0001-cmake-add-separate-export-for-plugin-targets.patch \
>             file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99241): https://lists.openembedded.org/g/openembedded-devel/message/99241
> Mute This Topic: https://lists.openembedded.org/mt/94413640/3616765
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>
> --
> # Randy MacLeod
> # Wind River Linux

