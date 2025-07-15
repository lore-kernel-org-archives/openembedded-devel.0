Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA36AC83F27
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 21:41:20 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.6896.1752615675375922486
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 14:41:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d5vAb5Ve;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54d98aa5981so7791416e87.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 14:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752615673; x=1753220473; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZanFODEioVvLjGaCMi6ruX69Q9Hi2acqRcTMiJpdUTM=;
        b=d5vAb5VeqFoifXcVG9pxRQMlBh3kfKmaxeXTSJ3jA3fhMQc8kn+jg/v2l6cwUhvOPh
         XsjgPAOL7wS+b/aN4gl3LdMEmOwliOAKa4s+gE0q7sMNI9E63lNnCSzNmoNK7rfJCR0m
         /7HwGzL2OSf30txmSAwbPysF2+KsWEwrvIFuFj1oRfoYelsPnHht2qDDvnLmdqNSxTEb
         dxdcmmOo8Zc3GlPJWKDgtimore4l3dwBw6SA4x6Px/o7Bfk46j4CiBWA3ld3T327D/mp
         b3nX7Z6DSSuYeo4LD9MdN588uh/4QBeH6kZz5Qm9U7C1mt1IcSLzBiWjhiTqsIoRrVJ+
         ho5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752615673; x=1753220473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZanFODEioVvLjGaCMi6ruX69Q9Hi2acqRcTMiJpdUTM=;
        b=W+M0OK6M35sy72ON/zL2s5xsEwGFFCsSybab8sydSS+XQ0cy8D+cadlRHcrSoX0FKG
         JHUUswF/ZZMmCGpdaFrgk33Nh/vcWAveM356ZAdJG0rsJ6krQ8Isuofv1CaM47ALRU87
         txW9A4k/1pR0/eO+zINYHfCMuVyWNiGnHxozosKUqMeAZF5ugazRPaJwTI/FHzEneRlR
         n90jmOOjeKuhn2DE1O1xygN0wwiZD5/WH0FYk+e5Sjd9K/GEhTqBOQZqN4H6Nb9iMir6
         /BW8ByxAaR3dGagzFN+g1YGKVUN4Jb1BrL27FxAK3rH8Lb9DENbaYEqI+XScTVvFL22v
         q30g==
X-Gm-Message-State: AOJu0YzV/IzL2fFyE9a7SZ5yUYwXvL/3DFxcruGDDqsScQioAAnlqGvK
	XZjZH2UFnvSToSDjYk7H9yeDBy5O3ls9vduUmkbseVAbqy6DOvUXrz+wOeCK7dePRSY4MDL9gME
	sqSkO3y4i0B3rWlxrc7NB8L4mhOGDYIlnm3Gf
X-Gm-Gg: ASbGncvWwvxLTbMzYzWpjzwMg/nP3QmJkXdW3ebAgRNbVWHA4mpCd/nfd7YaW15e8iz
	Xf6pj+VCufmDMVPV0Yi14/T5YULU/aSrjUIpEsCwjvz16SQYBZ8pAP0Uyh2kfw/z4Q34rk7Pwoq
	hVwy+HcswmTNbs/k22O/mzXBixWJxaqr0yuvV+eHZyEE77L6Qn1JvGbVErhlcqK6e9GNYm6+G3t
	5ppSVT5Jg==
X-Google-Smtp-Source: AGHT+IHtDdVVEcpB8PP/jyZLj5/IndS/52sSGpTqiBCQl0XZuRg7FDByl3tqbOQE1vo+QDUltrf4zK9wR9XWg5PmM+M=
X-Received: by 2002:a05:6512:1301:b0:558:f76d:5a30 with SMTP id
 2adb3069b0e04-55a23f97b2amr123945e87.42.1752615673278; Tue, 15 Jul 2025
 14:41:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250711134106.4117273-1-leon.anavi@konsulko.com>
In-Reply-To: <20250711134106.4117273-1-leon.anavi@konsulko.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 15 Jul 2025 23:41:01 +0200
X-Gm-Features: Ac12FXxQHtfhV0AqxxWalsVAffyXnP1t2e7nttJQv6a8YpJfQROEfl4fvbkKUEw
Message-ID: <CA+chaQeimR77=PoEf9ZeGoZ_=szW7g9oJzfODX8ODSuri4O_0A@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-aiohttp: Upgrade 3.11.18 -> 3.12.14
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 21:41:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118568

This new version seems to fail to build for 32bit MACHINEs:

vendor/llhttp/build/c/llhttp.c: In function 'llhttp__internal__run':
vendor/llhttp/build/c/llhttp.c:2645:9: note: use
'-flax-vector-conversions' to permit conversions between vectors with
differing element types or numbers of subparts
 2645 |         );
      |         ^
vendor/llhttp/build/c/llhttp.c:2643:11: error: incompatible type for
argument 1 of 'vandq_u16'
 2643 |           vcgeq_u8(input, vdupq_n_u8(' ')),
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |           |
      |           uint8x16_t
In file included from vendor/llhttp/build/c/llhttp.c:14:

On Fri, Jul 11, 2025 at 3:41=E2=80=AFPM Leon Anavi via lists.openembedded.o=
rg
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:
>
> Upgrade to release 3.12.14:
>
> - Fixed file uploads failing with HTTP 422 errors when encountering
>   307/308 redirects, and 301/302 redirects for non-POST methods, by
>   preserving the request body when appropriate per
>   :rfc:9110#section-15.4.3-3.1
> - Fixed :py:meth:ClientSession.close() <aiohttp.ClientSession.close>
>   hanging indefinitely when using HTTPS requests through HTTP
>   proxies
> - Bumped minimum version of aiosignal to 1.4+ to resolve typing
>   issues
> - Added initial trailer parsing logic to Python HTTP parser
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  ...{python3-aiohttp_3.11.18.bb =3D> python3-aiohttp_3.12.14.bb} | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-aiohttp_3.11.18.bb =
=3D> python3-aiohttp_3.12.14.bb} (81%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.11.18.=
bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.12.14.bb
> similarity index 81%
> rename from meta-python/recipes-devtools/python/python3-aiohttp_3.11.18.b=
b
> rename to meta-python/recipes-devtools/python/python3-aiohttp_3.12.14.bb
> index 898871fe00..642fc6784a 100644
> --- a/meta-python/recipes-devtools/python/python3-aiohttp_3.11.18.bb
> +++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.12.14.bb
> @@ -4,10 +4,12 @@ HOMEPAGE =3D "https://github.com/aio-libs/aiohttp"
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D748073912af33aa59430d3702=
aa32d41"
>
> -SRC_URI[sha256sum] =3D "ae856e1138612b7e412db63b7708735cff4d38d0399f6a54=
35d3dac2669f558a"
> +SRC_URI[sha256sum] =3D "6e06e120e34d93100de448fd941522e11dafa78ef1a893c1=
79901b7d66aa29f2"
>
>  inherit python_setuptools_build_meta pypi
>
> +DEPENDS =3D "python3-pkgconfig-native"
> +
>  RDEPENDS:${PN} =3D "\
>      python3-aiohappyeyeballs \
>      python3-aiosignal \
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118453): https://lists.openembedded.org/g/openembedde=
d-devel/message/118453
> Mute This Topic: https://lists.openembedded.org/mt/114100302/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

