Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1610FC83F22
	for <webhook@archiver.kernel.org>; Sun, 20 Jul 2025 19:01:27 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.23523.1753038085245196247
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Jul 2025 12:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c0lSS+/3;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-70e64b430daso37647697b3.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Jul 2025 12:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753038084; x=1753642884; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zL93NLW2KGKYD4fVjMWZEIhvFxtI4nlowVDrVgkb+30=;
        b=c0lSS+/3MdX/+TO2w7L8BssyFFFkS+aF14ZF9L81R7URprFOu9ME7VS54v/DGiPGJd
         Yh98gNGLzc1DpMqbUr/qxD5TkhuW+KKc0+J9n+VfGL6C2hYl3eHeR9f6zKf3HUwDxApZ
         ydXVI+ipQv6BbbWSnRGEV2SGw1p/F6OKBf7Ep8T5tkqc+4YGKeHuY1KIbNoFXKhGxxrK
         e5j/OtXn3V+fZZJsVhYpSys01tSKt2uX57cQRA4b+EY2c5+5h/SY69mVNdn8eU/7bT+l
         K2cFNlsfIDdj8I+6vgMdTL+hq6+bYw5zqIpd25NoVgm6eRP9xJAVG2BoL4dTbg15cfjo
         kX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753038084; x=1753642884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zL93NLW2KGKYD4fVjMWZEIhvFxtI4nlowVDrVgkb+30=;
        b=VbJmaDuys22Dm1Vzu9VDICMwoq9I6xAh6pVT78eLU8lYrsCKEc34AgsDpVHXLQKVZ3
         2oRLWWAC7s1dGWbi5OI678ZvEBIHBr7H+xqF4EjqLVwWyz2P224xxSj+3iIxJ39e77k+
         9BecYsmNFPC/y36784+aSM0ZdA15bDheOVVWAf4KHPan3dvVzZgbha2SLjAwEwFEFsHk
         yP2UYYBiGYhaVOCeJ0PW3b3vojjt9Mu2YMmRYV1GFlXhcKF3pA0tQoi9vd8tyinsSqCn
         Dpk0IOhKVgtJ1L0dOG+cvlpHgyKLPsmqV9gLePfLPc+joD3MIqNUZTtSkiOMVcymoIbC
         0iyw==
X-Gm-Message-State: AOJu0YwC9u3KxA+HAfKhBC8CCexRFbDv8B0vcVKI7R8T1eYnOknGBG7S
	u0sXnXQCOYNEKF5EaIJs6aBzX+OFVnLU5YrqSOPBIsmXb4RGo7gVp/s9D4J4D1ASnVoLcSIH9tg
	0X/EZV89tz8smOarHffu+iYUYbO/d9uveKOJh
X-Gm-Gg: ASbGncsTFAqdxhfSbCi8A5kIiUJw/MB6oE5fvVdzuYL5qwXnNugK2hSlxzaxu/QwHfw
	+JaTUIP6YpulFj83tGkcWbBnIH39+JoSWdJ4/HThEBe4gJqH9NU0ONtp4oGAT7xIOimPQAhjNpA
	s3RPVkqB0N4IykkHsfv7bQ1StPU7QEvCLWj3k4GG1IIszYb3fW3mpmoeTZz1QP4B6/k0MVEDlsz
	tDkNYTJiYe5IYziy3izbA==
X-Google-Smtp-Source: AGHT+IFj9zWXlJ0ESRwbv+YBWXx0X+d/npLBGJvBMCjcmDdj5L/q7lk2lkfShJz1kGFhoXIh8hcvyjA7kPA48Y3wsPY=
X-Received: by 2002:a05:690c:2783:b0:70c:b534:868f with SMTP id
 00721157ae682-718374f08ddmr243546337b3.20.1753038084003; Sun, 20 Jul 2025
 12:01:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250720123127.25407-1-alperyasinak1@gmail.com>
In-Reply-To: <20250720123127.25407-1-alperyasinak1@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 Jul 2025 12:00:57 -0700
X-Gm-Features: Ac12FXw0GUnHgxc87iGkDAbe6-QUAdQPReWqRfDjhme5ya3GcZup6cEByIUm6F8
Message-ID: <CAMKF1spJyn03S5SiCVn7+r8qk7y47QrmAFA3_9=6BMZ=nhenmw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] avro-c++: Fix build for 32-bit targets
To: alperyasinak1@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Jul 2025 19:01:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118641

On Sun, Jul 20, 2025 at 5:31=E2=80=AFAM Alper Ak via lists.openembedded.org
<alperyasinak1=3Dgmail.com@lists.openembedded.org> wrote:
>
> Building avro-c++ for 32-bit targets currently fails due to the following=
 warnings being treated as errors:
>
> - `useless-cast` in Symbol.cc
> - `conversion` in FileStream.cc
>
> These are promoted to errors because of `-Werror` in the project's build =
flags.
>
> Fix:
>
> lib32-avro-c++/1.12/sources/avro-c++-1.12/lang/c++/impl/parsing/Symbol.cc=
:91:27:
> error: useless cast to type 'int' [-Werror=3Duseless-cast]
> 91 | adj.push_back(static_cast(it - rs.begin()));
> | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1plus: all warnings being treated as errors
>
> lib32-avro-c++/1.12/sources/avro-c++-1.12/lang/c++/impl/FileStream.cc:208=
:41:
> error: conversion from 'int64_t' {aka 'long long int'} to 'size_t' {aka '=
unsigned int'} may change value [-Werror=3Dconversion]
> 208 | in_->seek(position - byteCount_ - available_);
> | ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
>
> lib32-avro-c++/1.12/sources/avro-c++-1.12/lang/c++/impl/FileStream.cc:209=
:22:
> error: conversion from 'int64_t' {aka 'long long int'} to 'size_t'
> {aka 'unsigned int'} may change value [-Werror=3Dconversion]
> 209 | byteCount_ =3D position;
> | ^~~~~~~~
> cc1plus: all warnings being treated as errors
>
> Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> ---
>  meta-oe/recipes-support/avro/avro-c++_1.12.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta-oe/recipes-support/avro/avro-c++_1.12.bb b/meta-oe/reci=
pes-support/avro/avro-c++_1.12.bb
> index 726a861bc9..9032ff346d 100644
> --- a/meta-oe/recipes-support/avro/avro-c++_1.12.bb
> +++ b/meta-oe/recipes-support/avro/avro-c++_1.12.bb
> @@ -26,4 +26,11 @@ do_configure:prepend() {
>          cp -r ${UNPACKDIR}/_deps/fmt-src ${B}/_deps/
>  }
>
> +# Temporary workaround for 32-bit build failures due to -Werror:
> +# 'useless-cast' in Symbol.cc and 'conversion' in FileStream.cc
> +#
> +# A patch has been submitted upstream: https://github.com/apache/avro/pu=
ll/3433
> +# Once this or an equivalent fix is merged and the recipe upgraded, this=
 can be removed.
> +CXXFLAGS:append =3D " -Wno-error=3Duseless-cast -Wno-error=3Dconversion"

useless-cast warning option does not exist in clang, so it will break
clang builds.may be enable -Qunused-arguments
CCARGS:append:toolchain-clang along with this will make it work across
both compilers.
> +
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118636): https://lists.openembedded.org/g/openembedde=
d-devel/message/118636
> Mute This Topic: https://lists.openembedded.org/mt/114250491/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

