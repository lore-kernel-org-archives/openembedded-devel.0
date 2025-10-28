Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C4DCCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 06:09:35 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.web10.5495.1761631773039875322
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 23:09:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UaCklcNb;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-63e2c7a3d10so6057226d50.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 23:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761631772; x=1762236572; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CcE2ep1VeVZ1zUmiynRBP0mhJLp3rSdBZK2CrJLU0xI=;
        b=UaCklcNbV7CXoFY+8CiORHPgSc528O/i6TSW2GcE1IEGTMsHfKcSs6G1zaEpxjSFl8
         fm8IY2IAEBSbmUdR+/5Q47tT3nCdbafAejZWsEKepm/aA6L408C7SviuIv5KcAFXrZ7n
         8mXUqJg9LOXdHVGJlRgHvRwrdaU9rH0WIUQGCiskJc9itO0Ga+mhSNqAoPjYmkIULIPl
         3T7f8NjT5ZCru25kCvMhYddrUtC5M9nTaF+1g7g/RT8z+1pRvNIXtxqvDDHa+Aa6/61G
         as0dv3HtjrRmt5Ivw1WRxAPLbFktUt1YsXnQZEKysdM5l0w4ujgjJKiAlFsZSJ6vMJJo
         Vs/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761631772; x=1762236572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CcE2ep1VeVZ1zUmiynRBP0mhJLp3rSdBZK2CrJLU0xI=;
        b=bPcSd9gVL22n/vZ4Ca8Yd6qW7HdPFjaZXvt/STjNcuAdaOlBM2AHdAM6/j4Ji7yZ95
         3gmloZ35Uwiin7sPW5j6bVX6lSIT13znRnIybWRHid7CywaV2iljHv5wXaachfsnAwZ8
         lXC0GtdLcz+nb99eg/H/PdxD6tSMWreyR9lXxEi9yGn9qbCRKiTlFm4RjjLSP812XVNk
         GMTdF03C/H8boHe7R834SnjKwlKU8hBliWZc9cA2aFxNnxLZgMgRys/mw0l4l0aIEoGl
         MDn0RE7skIBCvx5xwoutURPJDklkf4vxdUkjdUNuRUXBtgDkR5K5VO7pDVjgjvNn3Sjp
         OGkQ==
X-Gm-Message-State: AOJu0YzNV4n+ueee/Sh6SWgftk8Jc0ByGeInTz00JsYpESPED3/jq/i8
	6SfM6VYoEh7MbW4jQ0WRSowRZkHjzyg8+gwDV7uldbB5Xwm7y548ImDW4Kli8nt5bc5+/5LAKp6
	nI3/VEGhrtVxGvK1GdTf/gFTLUDnNneZquAC5
X-Gm-Gg: ASbGncvib0d73NN7z0a7YxUgQfqNGaDZcp77hTlsRMbYqvjEZcrTNkICmlfnmvHL1V2
	TAWGDyL30tSPSfWM0gfyt7XDmqJ/j7u90p0ZMfx3HLg52XHghfJR3bYyGFLc2emkvtL5OQvdFXZ
	tKD/7y9JchR3lc0VNCzxo+EAN0JKsgYHqd80ucOInx38FYi482BhcKljSZkSv98o+3aMEVeD2+d
	fbNR/S6/iZnCrDZty+LH0Te6HhUejJqjSu3oFxXSAG6Ds37AYCmLLRAt39ymqS4dzWET8bbiE1f
	CllSHff+gl1VaOT2UNFcDqmwud6nO1H2YcgY+YIYFDS6qvmmMyj8AVqBoECY
X-Google-Smtp-Source: AGHT+IEzxs0K1fvWbqfszI+4NWhqjTtEMuQRXYZPm0Oj17UPb1ji+VwHx8pcWrEZtVUWeA1Jz2SOQr4O7XU8uwWohSk=
X-Received: by 2002:a05:690e:23c6:b0:63b:9347:1a5c with SMTP id
 956f58d0204a3-63f6ba713a9mr1655090d50.40.1761631772013; Mon, 27 Oct 2025
 23:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <20251028054756.2113752-1-hongxu.jia@windriver.com>
In-Reply-To: <20251028054756.2113752-1-hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Oct 2025 23:09:05 -0700
X-Gm-Features: AWmQ_bmLc3lYPu3Xyrbm9mYaOFf_f2sz6aU9NEHMBQ6XuQsboj8lto1tm80F8dw
Message-ID: <CAMKF1spyayYnie=3TpxNSWWCZ_5Tqo_abCsZYKjdy2uj_Dv8oQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nodejs: fix compile failed for 32 bit arm target
To: hongxu.jia@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 06:09:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121064

On Mon, Oct 27, 2025 at 10:48=E2=80=AFPM hongxu via lists.openembedded.org
<hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> When debug build is enabled, build failed for 32 bit arm target
>
> $ echo 'MACHINE =3D "qemuarm"' >> conf/local.conf
> $ echo 'DEBUG_BUILD =3D "1"  >> conf/local.conf
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

I am not sure if this is the right thing to do in the general case.
Please keep it limited to debug builds.

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
> View/Reply Online (#121063): https://lists.openembedded.org/g/openembedde=
d-devel/message/121063
> Mute This Topic: https://lists.openembedded.org/mt/115989513/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

