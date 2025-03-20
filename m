Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25080C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 20:11:05 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web11.4683.1742501464767613592
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 13:11:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lam4Ors4;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-72bceb93f2fso1179553a34.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 13:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742501464; x=1743106264; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2ppSBghO6nYOLUH7urz6Uk+c56qoV3WbjBvlNKJNk8=;
        b=Lam4Ors4yD/fp0nSt954kD4D+cgxHwxSZwO74ZxsqgVR7xIQVOb5va7xnei/6na2DK
         55sqjaupq6Ic0a5whDPi93PGm/CgUacSYnD3BgEHqvmSzheN1iWorwsUx1iOKlNJG1Il
         RFmLmLAuTE447NFW4IqN4L9vZyYKCHdB3BBUpRth2TfEptCh1XoDIwN68kmW3TEFaCtR
         T8W1ZTL7d3bQ5G1T1nZD+Vyhp9ybOVnMkuJR2Skw6tseGhusFZB/vgT8EXVsxyNJQsOz
         w8hbjL0k4+DPcDL+kGMH9MvMgrmEF1LJVxB0RWqket485nmMiEycMi3paFiIjcKQpMVO
         KiXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742501464; x=1743106264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k2ppSBghO6nYOLUH7urz6Uk+c56qoV3WbjBvlNKJNk8=;
        b=WDQidafv4gCa7fBD2DPiamHaI1hC4ps9hMPGtLIYPY3DlN6TNFi+5jnmvUxoX9Pk9r
         sGt0eP5KlkI5pXR8hYyjI7rL+VHZtoKrVKlA0INaR2Q0xHgsSnR/7zx/hOVDyBRHMpgQ
         2g1upN8WQcctARmmRET8mLqw4ap7keid1dCpjDQiWOM8VtmbUZNIUzEY3nVNzwLPFU9u
         hJ2la58o7iJiEK3qgu2QXrF7q0H8WG7ZXykxJ4k0psPugRKiQyhQ5sWxxgCOBb/7ofCS
         O/5lvub5PhO+wm3e4As5miB+g79i8/EDRbbPrIGL+mrb8Z+6PNiHnJqriRBBoR5fyjkR
         /r+A==
X-Gm-Message-State: AOJu0Yx3KXyDnaKZoCTpgvi2NCnXzmJ7ytx4SbpLS8Lo+borf0Z+M9hB
	Rs9oWICiKP9SgJj4ud1elb7ygqigJH2SAE/gO1OP/ArAZJn5VOYwiJThGZt1Lac+TMcDTNqxavA
	6HSu4RlzuAhnKkuzW8OU013xhqag=
X-Gm-Gg: ASbGncs8qagB/TcPtDavTZIPlksZQDFX/YmQzxoL0V3rcSgcbovll9hVWa2ZZtWSOD6
	fsIT9mrDqulhwcT+T3UmL3UjYQXND2iOea+SZYKiYeKMg35Q8jDV2zfhiJyKg43o3JRi7LAP5D5
	Bc5Dn5JZOA/PnYYUMxQEpBm0+Dofl41P14fCnFs1AkGBVFOWx7Ju2mqlR8iIvRdXaEfw==
X-Google-Smtp-Source: AGHT+IGsrDtL069aScsY6tOIlPK8bLldHMFEP83I2Es/0YLsBG8iJsUOCrEHvdB9Hq89fvkdadXuAoMqhnnPDAGN11s=
X-Received: by 2002:a05:6808:bc7:b0:3f4:11b3:206b with SMTP id
 5614622812f47-3feb46f1006mr3507213b6e.17.1742501463558; Thu, 20 Mar 2025
 13:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250320123227.2198743-1-leon.anavi@konsulko.com>
In-Reply-To: <20250320123227.2198743-1-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Mar 2025 13:10:37 -0700
X-Gm-Features: AQ5f1JomAixRXDW2cVgfs4ds-45ribFSueRv7M_nRzBBrJf5S_OdKUVzRCJh61Q
Message-ID: <CAMKF1sqJfWaqeFR0-8iMKFm-sceBNHv4j8mvot+Nn0vX14kYGg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-pybind11: Upgrade 2.12.0 -> 2.13.6
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 20:11:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116141

On Thu, Mar 20, 2025 at 5:32=E2=80=AFAM Leon Anavi via lists.openembedded.o=
rg
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:
>
> Upgrade to release 2.13.6:
>
> - A new self._pybind11_conduit_v1_() method is automatically added
>   to all py::class_-wrapped types, to enable type-safe
>   interoperability between different independent Python/C++
>   bindings systems, including pybind11 versions with different
>   PYBIND11_INTERNALS_VERSION's. Supported on pybind11 2.11.2,
>   2.12.1, and 2.13.6+.
> - Using __cpp_nontype_template_args instead of
>   __cpp_nontype_template_parameter_class.
> - Properly translate C++ exception to Python exception when
>   creating Python buffer from wrapped object.
> - Adds an answer (FAQ) for "What is a highly conclusive and simple
>   way to find memory leaks?".
>

I am seeing a build failure, build was on qemuriscv32 but I wonder if
any 32bit system will have this error. Once qemuarm build is done I
will report back.

   | -- Found PythonInterp:
/home/kraj01/yoe/buildtools-5.1.2/sysroots/x86_64-pokysdk-linux/usr/bin/pyt=
hon3
(found suitable version "3.12.8", minimum required is "3.7")
   | CMake Error at
/home/kraj01/yoe/build/tmp/work/riscv32-yoe-linux/python3-pybind11-json/0.2=
.15/recipe-sysroot/usr/share/cmake/pybind11/FindPythonLibsNew.cmake:214
(message):
   |   Python config failure: Python is 64-bit, chosen compiler is 32-bit
   | Call Stack (most recent call first):
   |   /home/kraj01/yoe/build/tmp/work/riscv32-yoe-linux/python3-pybind11-j=
son/0.2.15/recipe-sysroot/usr/share/cmake/pybind11/pybind11Tools.cmake:50
(find_package)
   |   /home/kraj01/yoe/build/tmp/work/riscv32-yoe-linux/python3-pybind11-j=
son/0.2.15/recipe-sysroot/usr/share/cmake/pybind11/pybind11Common.cmake:228
(include)
   |   /home/kraj01/yoe/build/tmp/work/riscv32-yoe-linux/python3-pybind11-j=
son/0.2.15/recipe-sysroot/usr/share/cmake/pybind11/pybind11Config.cmake:250
(include)
   |   CMakeLists.txt:26 (find_package)
   |
   |
   | -- Configuring incomplete, errors occurred!

> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../{python3-pybind11_2.12.0.bb =3D> python3-pybind11_2.13.6.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-pybind11_2.12.0.bb =
=3D> python3-pybind11_2.13.6.bb} (92%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.12.0.=
bb b/meta-python/recipes-devtools/python/python3-pybind11_2.13.6.bb
> similarity index 92%
> rename from meta-python/recipes-devtools/python/python3-pybind11_2.12.0.b=
b
> rename to meta-python/recipes-devtools/python/python3-pybind11_2.13.6.bb
> index 0403e406a4..ee5722fbcb 100644
> --- a/meta-python/recipes-devtools/python/python3-pybind11_2.12.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pybind11_2.13.6.bb
> @@ -7,7 +7,7 @@ DEPENDS =3D "\
>      python3-ninja-native \
>  "
>
> -SRCREV =3D "3e9dfa2866941655c56877882565e7577de6fc7b"
> +SRCREV =3D "a2e59f0e7065404b44dfe92a28aca47ba1378dc4"
>  SRC_URI =3D "\
>      git://github.com/pybind/pybind11.git;branch=3Dstable;protocol=3Dhttp=
s \
>  "
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116135): https://lists.openembedded.org/g/openembedde=
d-devel/message/116135
> Mute This Topic: https://lists.openembedded.org/mt/111807326/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

