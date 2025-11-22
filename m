Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6DDCFC51E
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 08:26:38 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5944.1763799993511810037
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Nov 2025 00:26:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OGIWKkpS;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5959b2f3fc9so2754774e87.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 00:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763799991; x=1764404791; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVcGRbd+2SsKa9Zu18cRTqH4ipAgSVmjAGhBpGmRp1Q=;
        b=OGIWKkpS3blNbNeu4pGmg8oy/0UaLUh34m/2e8ToiZPDNFaxIgx0Hjv1DYhr05O2nH
         rr9fBfNdtV0u6cZi7/9PMmMq/IC4Q8bEBdtfrkYJFLSjHGFaqw2G0///KYduoK1dyVwF
         kZDDbHgD+y+nBUKwY0+wxB3qWWUU8dfPGVi8RMgEVQj7g3XDljSkxIGLoNF2axLBdeC+
         veUJXcG+cpFkUV4wxc5zKWbZL5Os6uJN6DqNPESsX91LBOinmV2tgxlZBSwu5NGaFJxg
         cbluBcrRxyhs0WDb6MH08uwpJ5lLs0IHC75c0CpFA7TLhE3JLQgBTvemadnZWTSRB1TB
         bOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763799991; x=1764404791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SVcGRbd+2SsKa9Zu18cRTqH4ipAgSVmjAGhBpGmRp1Q=;
        b=YEqnvhqcQHZmmbyUKd74tC8QeKMZFws3453Z9Vd8Vf4AC14FNyl2u5hMpvqbNhx6q+
         DnPmvePG/mjoE5UMayhHEakAD6Oa/JlUMvJIuB6IGUBa5y+I1M0twK5YZlCbOHPaf1Fl
         SPOXBUjcKO5Iq9TnXraIZAy+Gc/j/iXKHhOUVAYXVKSZ8lJ8HGwUVVmlg5aHRsXnCLMm
         AVg0b0yOu2N7TrGQ0KKtwn+8uTTd9FbmlkwhrywSuu5EAwaQEDvjh5aiXk0AwSg+RmWf
         ZXVdDO4SqLd/xqHAZlLZOqCGom9EGwtbNED1us2YrKby9iGqXVEBs7acEEydKLuIrVW+
         fSsw==
X-Gm-Message-State: AOJu0YwQY13zkYfZ793Nnb6mSP3hC4JNN0kIYsx91/kkaxLGQd/cxxr9
	+C9GnmpAYDjx+TQhKbdeQk+1TbfH3qAeS5gPUhHR6G5ueOD4iUhPhh63gVQNamCvPp/uJpkPdzl
	893uyShyYw4pNtXiniZlahy/3Ea6tYHo=
X-Gm-Gg: ASbGncsgXUyfAjXfmuy/UUGmL1Fz9GKCdglDTvLyAkRav7vqVI6lLXD99nHgh6/Lcng
	+NbDpke4YKM5b55Ue52K7JiWAHwMDIQYVnWECexyTPvBHVLUnTa/8z+XIoLD7d+2D3G0drZGp3M
	oUtxTAbD1OtuJ3CoeG2hIRpMkmlwJTZX8J2flYERL5vsrBMYZaQCWV8UqZsUzXj/z43G3EVIgin
	pP8FNTyizdt8icaHyAzLHYEcsdsTRVSGPJjPEEQnWt/2kHEnvRs3xLsUsIcdnmFbb1qI4m1hg==
X-Google-Smtp-Source: AGHT+IE8bDQlh1YIDAJdE2pmoDfgeYTD1MPMeEbZfjpAh7CKc1NyvW5HSeXyIa0MhYZoCYFjnv323Z653qyW/NWHhMA=
X-Received: by 2002:a05:6512:3992:b0:57a:2be1:d779 with SMTP id
 2adb3069b0e04-596a3ecf608mr1341867e87.31.1763799991188; Sat, 22 Nov 2025
 00:26:31 -0800 (PST)
MIME-Version: 1.0
References: <20251122001227.3538675-1-yoann.congal@smile.fr>
In-Reply-To: <20251122001227.3538675-1-yoann.congal@smile.fr>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 22 Nov 2025 09:26:18 +0100
X-Gm-Features: AWmQ_blYchbb7zZ0_d4GPOkr3KyrSMeI5arNb_fKuRH_vlQ3VIn-JTy08kAUItA
Message-ID: <CA+chaQfZvbqdBi1GWS-QuBpQytAeSuGBavXGE4mXbsdswWccLQ@mail.gmail.com>
Subject: Re: [meta-python][PATCH 1/4] python3-asttokens: add BBCLASSEXTEND nativesdk
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 08:26:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121968

Not sure why it didn't show in my testing, but thanks for taking care of th=
ese.

Acked-by: Martin Jansa <martin.jansa@gmail.com>

On Sat, Nov 22, 2025 at 1:12=E2=80=AFAM Yoann Congal <yoann.congal@smile.fr=
> wrote:
>
> From: Yoann Congal <yoann.congal@smile.fr>
>
> nativesdk-python3-asttokens is needed for the dependency tree :
> `-> nativesdk-python3-icontract
>    `-> nativesdk-python3-pylddwrap
>        `-> nativesdk-python3-checksec-py
>
> Cc: Martin Jansa <martin.jansa@gmail.com>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  meta-python/recipes-devtools/python/python3-asttokens_3.0.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-asttokens_3.0.1.=
bb b/meta-python/recipes-devtools/python/python3-asttokens_3.0.1.bb
> index 81eab1d5c7..5b6cf0624f 100644
> --- a/meta-python/recipes-devtools/python/python3-asttokens_3.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-asttokens_3.0.1.bb
> @@ -15,4 +15,4 @@ RDEPENDS:${PN} +=3D " \
>         python3-six \
>  "
>
> -BBCLASSEXTEND =3D "native"
> +BBCLASSEXTEND =3D "native nativesdk"

