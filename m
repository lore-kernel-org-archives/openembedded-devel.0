Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 262B6D3C52B
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 18:54:43 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web11.5824.1729191282396332350
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Oct 2024 11:54:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RQIhUV5W;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5eb858c4d20so280676eaf.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Oct 2024 11:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729191281; x=1729796081; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLth0KwMm00K9ttJBDMkIiJ1S8JeLejexMj300Ph/lY=;
        b=RQIhUV5WoQ4GCaqUKdQW4xyXGVEOQwXY7bpwMxhLM6hoqcYt0oE+FO1KokeKha5T4r
         dcOBhyMzDsdWuGv0MQOhP0fYw2zYGZ168uCbD9//Qm6+M1ykpYE1TYbnkymNPtz8yGFU
         jPLgwSm/WUoryfmyUpRqt+hptPlkxAv5SUxXdC8TkPbvQ7clSZ4q039R372167uYKXiO
         Kbt2mNohfHaAmtkyxR93y2i+jEM8PhZY3WakQ0Zx8Oqdno7Wsjx6F6ECJCkyZroQwHtj
         LzF5dl7sJGFcOhTkI1MbwgpCuC9oQUNzvzrOT5yNRfQ+plu8/MNai+SbN0o/OIRjoV4m
         Al0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729191281; x=1729796081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jLth0KwMm00K9ttJBDMkIiJ1S8JeLejexMj300Ph/lY=;
        b=OUP9tVb94/8QngBPmRohWYfnecrby0QkH5/h1EpEnIIlVSjgEgqTOOnnBqnunJbqC7
         yGrSzvnJKNUvp+fomnBYvEdbaVO6cvPabs5bAq9p3BRClLPkuLZlC1rpF8l69iOsAr2g
         ECulWqKx3mJI5X4wMV9zFg5BaNNjeGEY2uyxlYCujgCAU1Ftzl7TAS229cU7cKFClv80
         2yKFrCipB0kNEgKvVXehWi0OYpkwL7K0Oi6xzfisdzeZD2YiA8Jm9bKExrwCn/FzqYqR
         gAW7zKc+f2dLQqSf+z4sHlrSSD+1QlY95PN2dZW9iBWMp+Jj4Bvvu9pInI1Wc0cU51C0
         BKNQ==
X-Gm-Message-State: AOJu0Ywq8kYAd4s05jWSUVBoFFzPHZ70P0qqbJYWAKcuJY0O6O09B+vV
	G2dbbs+G68/E+8Lzofq3O+MnlJ6dnEYfCW2F7Yf/D7xlpAXI59ginMgIdQfu2MvTWtWOOcIWzeB
	IaXnL2KP3eX4ng6I6BQdBXQRcrUg=
X-Google-Smtp-Source: AGHT+IEUsx3qc3HlI4JgrqDMooZCDgeg4SogxyGLpTQsPFhyHFYP8l7somQO4JsZLUnPNLa4jNxPL2CXPWd2cafRrsc=
X-Received: by 2002:a05:6820:1625:b0:5e7:cb2e:dfec with SMTP id
 006d021491bc7-5eb26452981mr10968635eaf.8.1729191281646; Thu, 17 Oct 2024
 11:54:41 -0700 (PDT)
MIME-Version: 1.0
References: <20241017070839.39476-1-patrick@subset.ch>
In-Reply-To: <20241017070839.39476-1-patrick@subset.ch>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Oct 2024 11:54:15 -0700
Message-ID: <CAMKF1spGmL-v7izu2-zJQ=KmxE=qf2QwVQe_sGE-9exGhMeHhw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] fluentbit: fix building with wasm support
To: patrick.wicki@subset.ch
Cc: openembedded-devel@lists.openembedded.org, 
	Patrick Wicki <patrick.wicki@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Oct 2024 18:54:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112969

it fails in configure -
https://valkyrie.yoctoproject.org/#/builders/81/builds/66/steps/14/logs/std=
io

On Thu, Oct 17, 2024 at 12:09=E2=80=AFAM Patrick Wicki via
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
> index fc67236d3..d42a9a964 100644
> --- a/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
> +++ b/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
> @@ -21,6 +21,7 @@ SRCREV =3D "431fa79ae27edaef8d050a7af6f038f4400193a1"
>  SRC_URI =3D "\
>      git://github.com/fluent/fluent-bit.git;branch=3D3.1;protocol=3Dhttps=
 \
>      file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.pat=
ch \
> +    file://0002-wasm-avoid-cmake-try_run-when-cross-compiling.patch \
>      file://0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.pat=
ch \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0003-=
Disable-installing-systemd-service-file.patch', d)} \
>  "
> --
> 2.47.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112961): https://lists.openembedded.org/g/openembedde=
d-devel/message/112961
> Mute This Topic: https://lists.openembedded.org/mt/109059531/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

