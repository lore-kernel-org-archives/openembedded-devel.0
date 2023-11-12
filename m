Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4AEDC4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 23:06:34 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.25776.1699830388985116194
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 15:06:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gYECpNb9;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3b6cfc62514so1173659b6e.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 15:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699830388; x=1700435188; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kR+y8vAD+y9ycp64znPmiEH7AWQ9k6TEo8aaSTyB5Jk=;
        b=gYECpNb9NCnIEkoZx53HVnID+QwTsfA7wBhphmk6ZNwKJ3pBTn0K5MegGTqsvVn7MM
         Q2XpjP8xG6iWrrGK2nyxRiKdo6uON5lkgiKUsqxsXczxhIoVck74HBQdiKDl2JMLmD/M
         pXCJHBBP2+3nmz5jNOdYKc3Edk/JRgKCG5g6dpFFd00qJ72m90DJZfmRtqD+iCS5w6il
         8+NPqGr5ONmXpNIG/kL2bqxgsR7tsY7mIIsiBjbjOX4MeTtXExDsgFm2qwBZe1s0hxSq
         ZDarjOWhqRgtCmN3xxSEuiRTOO6+eP4jALsobNqo/n/1y0sTnmI8BABrajNcxzLGmzkM
         pGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699830388; x=1700435188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kR+y8vAD+y9ycp64znPmiEH7AWQ9k6TEo8aaSTyB5Jk=;
        b=nscubPIIg2zGu5HQNkYR8n0tg3g8T35p+I5cFD77357YFF1A5OqSMZtz99lfDaxh51
         YQdkHXcztbq714aDrbcHyYBxILxAeljMr2w6MAIk1pAD9NWflZr05VhQy9EDiFH9F6dG
         LDhnmtuK9P4vdDWE1uOWSoAgKvHAl2TIHfMGQ1lIrFkw0xi4O7STPdTGzOTxpYUHlhGW
         J/mmBwES8BNwFXzP+6TUzDgksDNfCndeDCj8bqjQaVtj67EBuMOQu6QWUdIBW+G04mh6
         7LPRXPXRLov+uRGsq8tOpkH0Gwi+kafgl9KhJRNxMRJjsyaVvkhXM95L/W/zSU06F7qK
         fmqA==
X-Gm-Message-State: AOJu0Yw+425CF9fp5ZPI9jAmKqR/+KR/ifdFtuk+KcqZZqdhRdWQrMNj
	x+Uj68lVKhdKM+0B3lp+PEADAkZpPvmkeOWLGTI=
X-Google-Smtp-Source: AGHT+IH/oc+XBxaToqc5RFPsjIw2NEOB+VMG9Y8pRLfA6nay8z73VdthRn5HMhbtyUbgiuna1AKON2rr4wxcHzq+CI4=
X-Received: by 2002:a05:6808:319a:b0:3b2:e65a:2c69 with SMTP id
 cd26-20020a056808319a00b003b2e65a2c69mr4983551oib.3.1699830388215; Sun, 12
 Nov 2023 15:06:28 -0800 (PST)
MIME-Version: 1.0
References: <20231112200451.610152-1-alperyasinak1@gmail.com>
In-Reply-To: <20231112200451.610152-1-alperyasinak1@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Nov 2023 15:06:01 -0800
Message-ID: <CAMKF1spEgyW=aNp6JkHkWckEQdLDWF3gpy9Aphk933zYYn5-Mw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] civetweb: upgrade 1.12 -> 1.16
To: Alper Ak <alperyasinak1@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 23:06:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106617

On Sun, Nov 12, 2023 at 12:05=E2=80=AFPM Alper Ak <alperyasinak1@gmail.com>=
 wrote:
>
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
> ---
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

Please add
License-Update: <reason for this checksum change>

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
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106603): https://lists.openembedded.org/g/openembedde=
d-devel/message/106603
> Mute This Topic: https://lists.openembedded.org/mt/102548768/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

