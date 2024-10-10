Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE6DD24448
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:58:44 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web10.53959.1728590321466757036
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:58:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T4KZ27hn;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2884e7fadb8so672521fac.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 12:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728590320; x=1729195120; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dB/kvoClv3gmWb/zs4aS35yuQ67I8jwr6DbTv5E7lJM=;
        b=T4KZ27hne0cDS7berxY/PXc8IDTt9jvs5VpbAxj536QsVbYhZXlsw30AzMDFFARaV4
         CwI/YM+771NriBsUyaAioSLJkRGokrpB2U4mG8PMRNX4siGL0P+pL6j4WBI0Ia4X2nnL
         y2ycV1gB8kFjmm0qoGPPKXvZbV8+InEFisbq1xqmDcF3oYDnh74z649wn5/Poyld+ZUg
         OZkjqoDH0Nbx8edn8e7ebbTT7PPHKvmSjnoqacqtUsPFbvQsRrg1oFz1qeUFCzZq8fm3
         k3cQhD3Eehbk/yvpOd4gUHietJi/0OwV1nHqdurVdlI7JUl8nU8iyQJqhrvr8OGXnrxQ
         imfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728590320; x=1729195120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dB/kvoClv3gmWb/zs4aS35yuQ67I8jwr6DbTv5E7lJM=;
        b=U2YJnqFlxPOqBt3NvhuGmb+/AoPgR5dGBjNN6/RCUVFZ3R2lTNgof0IetCB/POX7ee
         Xs/yrCWGsaOOEZsuTTIu3WsBe5aQCck5PpSA1ugwXXe9MyoPBciuFg1k3SOLYVimzX8s
         SHCUdaBForLOTl6NfFaw1E0T9nX89Z2Fu32HXPx2BFaeg4kW6N0WLc32RmZA+WmmcmZ+
         0uDTMLUjUy2ken74Zelv/wz2ROeqPeMkMpR0oT7Esd6uSZbSLu+nysJSGWw4S2XzuV7K
         DIGIQu0N/SzgWnq1RMiOsO8fi4gXSgPC+kM3sWc/JGFKIgGejCbDlvRo7i/Q5csnu3Ht
         /RxA==
X-Gm-Message-State: AOJu0YzZLJy9lpVBSsLdNqw4s0k3UrzX+nSYbypBjxL0uvPrrhjud0Ln
	MWb/V1VozS/Ce458eeiQu9Pbjt7BWFuJ+Lxa6GWAjFnMWeJZh5V8U27K6on/6wmrfvtYXgIei/6
	ixDLiRV4nBUoKK/54tFg0FJkP9oY=
X-Google-Smtp-Source: AGHT+IFUuJ3RaXPFGGnZYznXVoqRLtp+15FeiXmpJjhG5+Q++TJGdkn1lcVQgGZkSJuD2hpSTkE1DxBmNeUdy5e7//I=
X-Received: by 2002:a05:6871:e803:b0:25e:bd07:4743 with SMTP id
 586e51a60fabf-2886da5d6dfmr239837fac.0.1728590320506; Thu, 10 Oct 2024
 12:58:40 -0700 (PDT)
MIME-Version: 1.0
References: <20241007200946.414276-1-patrick@subset.ch>
In-Reply-To: <20241007200946.414276-1-patrick@subset.ch>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Oct 2024 12:58:14 -0700
Message-ID: <CAMKF1spFuOqQPRVwNtW=+ACePT=9-vq7sQHdnM96K-TOL4Ncvw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] fluentbit: fix building with wasm support
To: patrick.wicki@subset.ch
Cc: openembedded-devel@lists.openembedded.org, 
	Patrick Wicki <patrick.wicki@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 19:58:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112779

Hi Patrick

Thanks for the patch. There have been few iterations of the fluentbit
upgrade patch ( currently testing v4 in master-next )
can you rebase this patch on top of the latest master-next and resend
if it's still needed.

On Mon, Oct 7, 2024 at 1:10=E2=80=AFPM Patrick Wicki via
lists.openembedded.org
<patrick.wicki=3Dsubset.ch@lists.openembedded.org> wrote:
>
> From: Patrick Wicki <patrick.wicki@siemens.com>
>
> Add patch for the wasm runtime that fixes building for x86.
>
> Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
> ---
>  ...d-cmake-try_run-when-cross-compiling.patch | 42 +++++++++++++++++++
>  .../fluentbit/fluentbit_3.1.9.bb              |  1 +
>  2 files changed, 43 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0002-was=
m-avoid-cmake-try_run-when-cross-compiling.patch
>
> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-wasm-avoid=
-cmake-try_run-when-cross-compiling.patch b/meta-oe/recipes-extended/fluent=
bit/fluentbit/0002-wasm-avoid-cmake-try_run-when-cross-compiling.patch
> new file mode 100644
> index 000000000..419e85903
> --- /dev/null
> +++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-wasm-avoid-cmake-=
try_run-when-cross-compiling.patch
> @@ -0,0 +1,42 @@
> +From 5b6d274664f92a6c6083f4d27a1b1604a326f22c Mon Sep 17 00:00:00 2001
> +From: Patrick Wicki <patrick.wicki@siemens.com>
> +Date: Sat, 5 Oct 2024 21:36:12 +0200
> +Subject: [PATCH] wasm: avoid cmake try_run when cross-compiling for x86
> +
> +This fixes building the wasm micro runtime used when enabling wasm
> +support in fluentbit.
> +cmake try_run does not work when cross-compiling because the test progra=
m
> +cannot be executed:
> +
> +| CMake Error: try_run() invoked in cross-compiling mode, please set the=
 following cache variables appropriately:
> +|    TEST_WRGSBASE_RESULT (advanced)
> +| For details see .../fluentbit/3.1.9/build/TryRunResults.cmake
> +|      Write linear memory base addr to x86 GS register disabled
> +| -- Configuring incomplete, errors occurred!
> +
> +Since we cannot run the test program, assume that the instruction is not
> +available and disable the option.
> +
> +This patch is no longer needed once fluentbit updates WAMR, as it's been
> +fixed in https://github.com/bytecodealliance/wasm-micro-runtime/pull/306=
6.
> +
> +Upstream-Status: Pending [https://github.com/fluent/fluent-bit/pull/8744=
]
> +
> +Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
> +---
> + .../build-scripts/config_common.cmake                           | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lib/wasm-micro-runtime-WAMR-1.3.0/build-scripts/config_comm=
on.cmake b/lib/wasm-micro-runtime-WAMR-1.3.0/build-scripts/config_common.cm=
ake
> +index e73ebc85f..c2504e007 100644
> +--- a/lib/wasm-micro-runtime-WAMR-1.3.0/build-scripts/config_common.cmak=
e
> ++++ b/lib/wasm-micro-runtime-WAMR-1.3.0/build-scripts/config_common.cmak=
e
> +@@ -408,7 +408,7 @@ if (WAMR_BUILD_STATIC_PGO EQUAL 1)
> +   add_definitions (-DWASM_ENABLE_STATIC_PGO=3D1)
> +   message ("     AOT static PGO enabled")
> + endif ()
> +-if (WAMR_DISABLE_WRITE_GS_BASE EQUAL 1)
> ++if (WAMR_DISABLE_WRITE_GS_BASE EQUAL 1 OR CMAKE_CROSSCOMPILING)
> +   add_definitions (-DWASM_DISABLE_WRITE_GS_BASE=3D1)
> +   message ("     Write linear memory base addr to x86 GS register disab=
led")
> + elseif (WAMR_BUILD_TARGET STREQUAL "X86_64"
> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb b/meta=
-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
> index e88b5e91a..9eccb8d0b 100644
> --- a/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
> +++ b/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
> @@ -19,6 +19,7 @@ SRCREV =3D "431fa79ae27edaef8d050a7af6f038f4400193a1"
>  SRC_URI =3D "\
>      git://github.com/fluent/fluent-bit.git;branch=3D3.1;protocol=3Dhttps=
 \
>      file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.pat=
ch \
> +    file://0002-wasm-avoid-cmake-try_run-when-cross-compiling.patch \
>      file://0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.pat=
ch \
>  "
>
> --
> 2.46.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112701): https://lists.openembedded.org/g/openembedde=
d-devel/message/112701
> Mute This Topic: https://lists.openembedded.org/mt/108876258/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

