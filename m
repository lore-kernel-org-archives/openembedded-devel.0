Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69D02CAC5BB
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 16:00:20 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.web11.1366.1759939210118400269
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 09:00:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XkkDjcbG;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6354f14b881so36152d50.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 09:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759939209; x=1760544009; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VmdpBEpn+RT0zIv77187obDKbAXLlgKUUB2Xtwh+mVA=;
        b=XkkDjcbGWP3DAAd520tiMVlWUk06gwIowLWA8Z+JRXY7rSJMQ8jl9QUS7I3z9cE49A
         DsCk1mvf/MTwuNb4s0Bt6cdDfym+i1KBbomlA99ON6dhppSwEpDx1v9xF0yWKrPSoBsN
         TVCr+sdmKMfExQheOYgQbHPWP5x/OrP1xr9XWf/rDIypcIExj8HeOlCP1Ki9cZIyQtI3
         IYV791e7I8M6m/hdCKO6N5NwGW3qvs8FQO6/653cEZpu3t3N7Z+ZWfy4alZ+EvAkknAN
         XLKFzJ55ShziA5JWCYJhtCXcPpFmPkzxzeOn9wsdwm8gkcQGaIpua06x5a6FvhPaiR0F
         ugzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759939209; x=1760544009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VmdpBEpn+RT0zIv77187obDKbAXLlgKUUB2Xtwh+mVA=;
        b=agEaE2PGEEL4m2DlBWGO8e5hu5I8anK59B32/OI2WUpw+lMKURyLYTARW+E40OGxsq
         2GXi694tPzkHrxf91zs9RBNMOBDYK09F6EJmwT/2mRkusIVnfMk2nEwYC1rgpIqqHHyT
         0uBlDHcCwK4EQhhL6GnyFG12U0Kk8cYiuCUe7DJ8RzGnI0vvzHHv+yCVGHh190jfHOTK
         O1S4ORNcr22MfJlNeqRTpmQslgXqJTFi4X4YNZUj9+fe0Jua1zGX4vzsz4Zm1aBdrWj5
         Yj2GBOY3ha+BDz97WGSsrfjas0XlaQjg+t0qQILd1xgmLKQVw6HGwMMtS+Uzx961lb+m
         ce5A==
X-Gm-Message-State: AOJu0YzP1HaxUNAG8FXKTjJzuDxTa/AqR4IzCurSWQrAUTDMXaM1zPHF
	wSkyer8o5bIuPoJ+AasHU5qyt6tridDHf8+8+dg3ld8/IM0/noP5zZ3ghsRs/hnV/qRAzAMgkOP
	6l6rpytJTbbkkM0LRuRsXqfHgZ2pEvRI=
X-Gm-Gg: ASbGncuihvkhrCcUnJgEuALaQq3uJPvKKXIeTvjhxYQ/05dLpKTtkwggx6cvjdeXwPm
	EnYsxjfNfCZOF7GgOBUcB2AXtr9cmsTcka1ON6dLPGDccieFbKH2OeBpTQzTq95zgasNtHuZjWa
	dFc/1Soi3C8OiHcewIN60Qw3Bj9VYWJ4laf54HKxPwhDx95J7DkNeoma7amXooQxvbO5cadlhws
	3OJ/3LbNnBppAYRnQK8LN7+SB/6wbfPp2kq7BmdXX4NPXCUOglz8tYpeBC6q/v1KzomM0R//XnE
	ASLaT+IINEPeEBrsV6Q6ANRKHZ3LMCpvta+bOhY36hoyE8xaVG1gRjtA4vS8UhDCKfJk4jBDvcG
	pGOgDQQ==
X-Google-Smtp-Source: AGHT+IG0pYL+33ouh67zjy2BssIHW5Mr7JjbVSPKoE1OKZiSd+UAKBFfGOv5PxnShyply0CfLmeVctvthwvrImY6z6M=
X-Received: by 2002:a05:690e:1598:10b0:5ff:3ae9:a36a with SMTP id
 956f58d0204a3-63ccb8177c3mr3274283d50.3.1759939208925; Wed, 08 Oct 2025
 09:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20251008093609.2094597-1-leon.anavi@konsulko.com> <20251008093609.2094597-2-leon.anavi@konsulko.com>
In-Reply-To: <20251008093609.2094597-2-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Oct 2025 08:59:42 -0700
X-Gm-Features: AS18NWBRG3W3J8ljvkTfw1G4TZH8J4ebku2PO033zN05_amvfamwDxy09LZlFfQ
Message-ID: <CAMKF1srk=4g3qn0dGcSoDe1KA-SqwZNPaZ7Z2NRsrHSm0Rn4+Q@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-xxhash: Upgrade 3.5.0 -> 3.6.0
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 16:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120372

On Wed, Oct 8, 2025 at 2:36=E2=80=AFAM Leon Anavi via lists.openembedded.or=
g
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:
>
> Upgrade to release 3.6.0:
>
> - Build wheels for Python 3.14
> - Python free-threading support
> - Typing: Use Buffer type stubs
> - Deprecate xxhash.VERSION_TUPLE, it will be removed in the next
>   major release
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../{python3-xxhash_3.5.0.bb =3D> python3-xxhash_3.6.0.bb}      | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-xxhash_3.5.0.bb =3D>=
 python3-xxhash_3.6.0.bb} (74%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-xxhash_3.5.0.bb =
b/meta-python/recipes-devtools/python/python3-xxhash_3.6.0.bb
> similarity index 74%
> rename from meta-python/recipes-devtools/python/python3-xxhash_3.5.0.bb
> rename to meta-python/recipes-devtools/python/python3-xxhash_3.6.0.bb
> index bfa14012d0..c62595c4d1 100644
> --- a/meta-python/recipes-devtools/python/python3-xxhash_3.5.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-xxhash_3.6.0.bb
> @@ -1,11 +1,11 @@
>  SUMMARY =3D "xxhash is a Python binding for the xxHash library by Yann C=
ollet."
>  SECTION =3D "devel/python"
>  LICENSE =3D "BSD-2-Clause"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3a9dab7f159514231249aa3e108ab=
26b"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D82f3295151c5e61043a4a201c031a=
5ee"
>

What caused it? Please document some details on commit message under
License-Update tag

>  DEPENDS +=3D "python3-setuptools-scm-native"
>
> -SRC_URI[sha256sum] =3D "84f2caddf951c9cbf8dc2e22a89d4ccf5d86391ac6418fe8=
1e3c67d0cf60b45f"
> +SRC_URI[sha256sum] =3D "f0162a78b13a0d7617b2845b90c763339d1f1d82bb04a4b0=
7f4ab535cc5e05d6"
>
>  SRC_URI +=3D " \
>      file://run-ptest \
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120359): https://lists.openembedded.org/g/openembedde=
d-devel/message/120359
> Mute This Topic: https://lists.openembedded.org/mt/115651203/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

