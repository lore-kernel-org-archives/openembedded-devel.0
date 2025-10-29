Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F79CCF9EA
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 01:39:13 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.web11.25485.1761701948736689091
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 18:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lYix+WmQ;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-63e3568f90dso6973826d50.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 18:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761701948; x=1762306748; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dl4NvlEW0+kSCqEA6kK3rxJmI8RNMz1oCpblPP4oM90=;
        b=lYix+WmQJY98hfd0xmAXqCUG3LDLZmD8DF+/UBPA1Xuv1mKaNdsWtj6AbeNaq/p9oZ
         4Vhb1goibiQx3yMxCvAAvOMJCeZWzXSQAED3zK7gBZ1Ol1FBfM4XFL8s9LiUkIAVDMdI
         rlxjJgMeGeyL61wNhbRadSSPF1Q6yBZ4rNa3XpNIBTh+s7uSXNJ177ORUwQUGTYB2iIp
         ZA7GsDsffD1zLn5AT5h+qOdwFv6O7lS8GwLTbr/7hihJyhaENC/luFjXu3pllBzUiQPE
         A9sbYyTAj7s0N41ogw0nKvrfxJ5rThPwfWjUgnU+QP4X6SJpEyMPEmYWVwCfxjpoZNN+
         Z1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761701948; x=1762306748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dl4NvlEW0+kSCqEA6kK3rxJmI8RNMz1oCpblPP4oM90=;
        b=guklJnFRsopfI0gzAD/SDRGL3rR+UFMUhWwBeaCepQx7SCtrIv7yIiST3YUkY1XkBR
         HcC+xH4/3WZGuj8kwyapvXc6OpGoUPFYZehOhFHMkm7nbfH+TeqcQfKXxOl5jnOrDhGR
         2GplBVedbyQfyg/UbT8C0iY+JMmtdq6eTFFAtJZ5w9VZTrrIJm3BZhHbzvcI1VIQNuaD
         xVKyZ7NxbCim+qjGBi/MUQIl0Is6iHXAQxQGygEpx3hWC43Vh9I6XYLLH6E/ALK1Vsgd
         w3tr1AOal5FHSW0O1nSR3dV/LXJeONS5Pn4UiTu0g/QY+zmGIBgo7Qlt+rec78CEFxqq
         dv8A==
X-Gm-Message-State: AOJu0YwumA4bJe2WMJI8Tjc7g+hvsH4TAnLl+kue1od6246h5YhY6m7X
	sbdVrQdn0XkxpR8npUbo8acmQECKGQlB7caUS8QE0yeqbfULzbPva/n1MDWeehPCjbIei6opL0L
	ZuIz53xAslXl+JNZACeTlB49Yrck1nPk=
X-Gm-Gg: ASbGncuaxe2nsxzxbXW06efLlmYltD1goc3eFVybgwscqz2yDShFD5xYP/qLmdUHlEj
	adwKLaE7hsNE2OfPkMhyxmDwtqSIKJka23wnS2C7Nhd0PC6yTCvQAfKkU7lmmRlmmDWXuZu3vVm
	wmU5J2QrCpw9RSgRexh73xq5FHNSdowO1EfOu7oc5yTR/K+UcFjM9oKG4p5gZSUCO5mjzBGyJlN
	kYMW5cMAEXiopsm58UcyhNJJd7RdsJlbS5AgBlhOp1/jvvSWA3huQUt0QjWy0qU99YipSotjsQq
	ydYdqSV0Ub+rWWBx/lcOVhSUZeHFIV4KnMyGnWomagHWnuYt
X-Google-Smtp-Source: AGHT+IGXjgR14D5sEGn2yghmqMMh+etS47TNF8uHSIhXkZ4Z9Fm2sjNuyTtka19oSVMr0t1+SCntDMzq+Yg68yN2Qt8=
X-Received: by 2002:a05:690c:6d90:b0:785:bfd8:c4b5 with SMTP id
 00721157ae682-78628f8e2f3mr13788877b3.42.1761701947777; Tue, 28 Oct 2025
 18:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <20251028111956.2903925-1-hongxu.jia@windriver.com>
In-Reply-To: <20251028111956.2903925-1-hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Oct 2025 18:38:40 -0700
X-Gm-Features: AWmQ_bkZoMeMNLfW9hcrKoe3UtfezPmpqcvYJVeBnCgqGs0yvaHv7yDMsQSHpVQ
Message-ID: <CAMKF1so2PNXmxTsWOfiHU7fJ2RpbsyY06Ky=AQs9yjcCOUDLpg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] nodejs: fix compile failed for 32 bit
 arm target
To: hongxu.jia@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 01:39:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121139

I wonder if it needs to enable neon machine feature, I am not seeing
this failure with clang.

On Tue, Oct 28, 2025 at 4:20=E2=80=AFAM hongxu via lists.openembedded.org
<hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> Build failed for 32 bit arm target
>
> $ echo 'MACHINE =3D "qemuarm"' >> conf/local.conf
> $ bitbake nodejs
> ...
>  2645 |         );
>       |         ^
> ../deps/llhttp/src/llhttp.c:2643:11: error: incompatible type for argumen=
t 1 of 'vandq_u16'
>  2643 |           vcgeq_u8(input, vdupq_n_u8(' ')),
>       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |           |
>       |           uint8x16_t
> ...
>
> Use '-flax-vector-conversions' to permit conversions between vectors
> with differing element types or numbers of subparts
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta-oe/recipes-devtools/nodejs/nodejs_22.21.0.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.21.0.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_22.21.0.bb
> index 6d1a364be0..7a784bf7f2 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_22.21.0.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.21.0.bb
> @@ -48,6 +48,10 @@ CVE_PRODUCT +=3D "node.js"
>  # v8 errors out if you have set CCACHE
>  CCACHE =3D ""
>
> +# Use '-flax-vector-conversions' to permit conversions between vectors
> +# with differing element types or numbers of subparts
> +CFLAGS:append:arm =3D " -flax-vector-conversions"
> +
>  def map_nodejs_arch(a, d):
>      import re
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121077): https://lists.openembedded.org/g/openembedde=
d-devel/message/121077
> Mute This Topic: https://lists.openembedded.org/mt/115991441/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

