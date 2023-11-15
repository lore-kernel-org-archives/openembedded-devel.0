Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A87DC47072
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 07:25:28 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.8127.1700033123025103412
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 23:25:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lK7OId/u;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1f03db0a410so3795820fac.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 23:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700033122; x=1700637922; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdmNDk48zVEfSAZYgqkMMKXmml8RhYUKn5nj6+A4keY=;
        b=lK7OId/uIt9V/jcPmWpUoKSnndaT4DK5KKJBB9ruy2dL2NMvqTeTT713Df/HLyYkhs
         SuZIPn93wURgymtNOdtSJT+f/eY/0InKYHlltl/PFPQSzbwbMf8xAZn7LFKzWs4eMmQR
         sZyPkdHQ5Vk/KvfK92/8jAevOpclBuWtd4A7iH2tRGGTPMq9sTwcqo96ACXPi2UNdgBs
         ROP1kDG9JbiNYS69z5oPKq2+58eVY65sDAiKPFApUSJbMWkeUVNYsSgICvIki3OJjtr1
         KrQbLAxkD4/Bj9X3fwkRGc1dLT83wZT4NkmD3mf0to3A0HRzBkDuz7XdrT0//8/bDxNq
         xOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700033122; x=1700637922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zdmNDk48zVEfSAZYgqkMMKXmml8RhYUKn5nj6+A4keY=;
        b=ShdyO5A5nTkmWNpiV3s6B9Hfd0/oU4J4kvkXbxX2snQMv2CoCmpvTvdoChThfuSZKd
         iX31GIsi7bKPS/oXHARXwd7HkWHtgozsyCJc9Tu9zBYS19pSruzLrvSVjYItXwiDAG1s
         ZlJ4iSpG586bRMihCqCz1O6NobuyU5weppDj8amsmuL6xJZn7iUGLUylntkgdCVglUti
         VyRuOuVegMMuEAF/zn46DWyKD8BAVTWp/J9JCCaSxC3QfMg2enCZOg+GqQrSKRJypmrH
         uRQ37oyyIDAP/YZM/TMc+B4G4MnuR5d/cTCx4eqXWTwxWt26yM9FOqB3EUbSIe7CEJ68
         5FNQ==
X-Gm-Message-State: AOJu0Yw367FTeXnsycDrfLyWiv1fZ7CQOrulDtNHzhDbWk+OVDr6NSTF
	q7bhQ9GwBsplX6nrXc+rrXl6OpECbsxZWUAoDpxfY/urNUM=
X-Google-Smtp-Source: AGHT+IEaHmQ/9PQ1G+bynYhitR31AxRRdLh5mIJWyYIGuoh2cPPXjE7ZizTreUqP9aeiSQDHPEHXDoFb9tTvpKa7IAI=
X-Received: by 2002:a05:6870:4206:b0:1e9:ec03:80ba with SMTP id
 u6-20020a056870420600b001e9ec0380bamr15310888oac.18.1700033122274; Tue, 14
 Nov 2023 23:25:22 -0800 (PST)
MIME-Version: 1.0
References: <20231115070733.186462-1-alperyasinak1@gmail.com>
In-Reply-To: <20231115070733.186462-1-alperyasinak1@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Nov 2023 23:24:56 -0800
Message-ID: <CAMKF1sqhrVOVPz7w9pRaP886sNCAdYc3skD8Nf08Bf0Pu50KMg@mail.gmail.com>
Subject: Re: [meta-networking][master][PATCHv3] civetweb: Added license change reason
To: alperak <alperyasinak1@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 07:25:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106744

Thanks for following up, since the change you are posting on top v2 is
a commit msg change, it wont be possible to apply it as I have already
accepted v2. So I will skip it for now.

On Tue, Nov 14, 2023 at 11:08=E2=80=AFPM alperak <alperyasinak1@gmail.com> =
wrote:
>
> License-Update:
>
> - Copyright years changed
> - Added additional components Copyright
> - The website keplerproject.org seems to no longer exist. So, the source =
URL used was changed
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> - Added "-DCIVETWEB_SSL_OPENSSL_API_3_0=3DON" because of following error:
>
> civetweb.c:1561:2: error: #error "Please define OPENSSL_API_#_# or USE_MB=
EDTLS"
>
> You may also want to check out the available CMake options here:
>
> https://github.com/civetweb/civetweb/blob/d7ba35bbb649209c66e582d5a0244ba=
988a15159/CMakeLists.txt
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>
> Changelog:
>
> https://github.com/civetweb/civetweb/blob/d7ba35bbb649209c66e582d5a0244ba=
988a15159/RELEASE_NOTES.md
>
> Signed-off-by: alperak <alperyasinak1@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  Added explanation about why the license was updated.
>
>  .../civetweb/{civetweb_git.bb =3D> civetweb_1.16.bb}         | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>  rename meta-networking/recipes-connectivity/civetweb/{civetweb_git.bb =
=3D> civetweb_1.16.bb} (91%)
>
> diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_git.b=
b b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
> similarity index 91%
> rename from meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
> rename to meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
> index e9c205618..0a654a10f 100644
> --- a/meta-networking/recipes-connectivity/civetweb/civetweb_git.bb
> +++ b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
> @@ -2,10 +2,10 @@ SUMMARY =3D "Civetweb embedded web server"
>  HOMEPAGE =3D "https://github.com/civetweb/civetweb"
>
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D50bd1d7f135b50d7e218996ba2=
8d0d88"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Dce6ce6eb1b2fd59ee6bab21947=
0442a3"
> +
> +SRCREV =3D "d7ba35bbb649209c66e582d5a0244ba988a15159"
>
> -SRCREV =3D "4b440a339979852d5a51fb11a822952712231c23"
> -PV =3D "1.12+git${SRCPV}"
>  SRC_URI =3D "git://github.com/civetweb/civetweb.git;branch=3Dmaster;prot=
ocol=3Dhttps \
>             file://0001-Unittest-Link-librt-and-libm-using-l-option.patch=
 \
>             "
> @@ -23,6 +23,7 @@ EXTRA_OECMAKE =3D " \
>      -DCIVETWEB_ENABLE_LUA=3DOFF \
>      -DCIVETWEB_ENABLE_ASAN=3DOFF \
>      -DCIVETWEB_BUILD_TESTING=3DOFF \
> +    -DCIVETWEB_SSL_OPENSSL_API_3_0=3DON \
>  "
>
>  # Building with ninja fails on missing third_party/lib/libcheck.a (which
> --
> 2.25.1
>

