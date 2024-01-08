Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB67C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 18:36:49 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.5296.1704739009004018633
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 10:36:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Moho1L44;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-204fdd685fdso2096434fac.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 10:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704739008; x=1705343808; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kGPblISseAYKTqW42Czc4SZGz/2QB4INft3I/aeYTo=;
        b=Moho1L44EE5uWMKdpHswwPnvpCY9a3LCT0WTRkuSGSeThX0JSKe9El6QwJ7YLSYmnM
         +op/jY4rSHT6RcF/wlD5cdUezkY/6xIFKHRn3h81hDI7g9ihe0qwkEvZhq1TwOkxY9ud
         J+EkCYeQJBI2fCFS9v1n1jlNxkxyqaPix82cOiHWyMmOlDkn+8Mf2m8/YP7eBBgz4UdN
         18j4/bdMkqIqr5/2sm0BYXzhlmho9ecAzhRZufND1r4oYX4a3Zq1Zoq9+2xaXZSCGYcY
         IvmvG3IU2vw6RRzB5AfV+m+JWbaeG6tG+TaJu6MjIXJJ1+vlM+z2NxnWG2NIME6MCING
         CEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704739008; x=1705343808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1kGPblISseAYKTqW42Czc4SZGz/2QB4INft3I/aeYTo=;
        b=k4rel9G5kGwIQ2WhhPI8MNdOsKj/n9KaVzoOxVEgMazdP7hGRi+08sYyJSRrCsw06F
         N8BiPutQCXy50QV2qKlbAL4zWzlWah9XnofnnkRNRhEa9pmjrgw8k/LHvBoVtrT9J8Y+
         qW0J6VPgVkvW1mFCAX4WLf8g0+t05Fa2nFCAjq55ztCK1RJJd3goOUz8IlysX2gRS3sR
         fTvV7+sPmxuTijzWa2hjeutTpuTZMq5f6nC4VFo6enWhRQGb6f+8uvLOVqja1mHy7TjF
         3XnJAKS3DyC7tUVAB8kOiuRZzvj4JmiR00PIYNhGm1FXnGY2Gg7TUcnmEvIVl8g16yFa
         6OLw==
X-Gm-Message-State: AOJu0YxBsgxgQzkVrNL1e+QUDimAYxSsOb3uuksMiDwh4WSazDKoMrXz
	woRB7Rw4dmUSOK5irF0iYyzVhk5WqHtvDkRoBn9iDinf
X-Google-Smtp-Source: AGHT+IFyYUX7xT2Bv/9A3n5SuwzhHcq0DotjtLe4JQIN2AnnKOatb4uR2RnyZ0PBz6cVdBcMAUMzSL0zzhd6idUhAVg=
X-Received: by 2002:a05:6870:cd95:b0:203:ea4e:38a7 with SMTP id
 xb21-20020a056870cd9500b00203ea4e38a7mr6278289oab.31.1704739008085; Mon, 08
 Jan 2024 10:36:48 -0800 (PST)
MIME-Version: 1.0
References: <1704721743-30824-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1704721743-30824-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Jan 2024 10:36:21 -0800
Message-ID: <CAMKF1spAQz_fkf4nLp=c2A+1VL0zaDe9DjBEjjqekvxb-cH-Fw@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-netaddr: upgrade 0.9.0 -> 0.10.1
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 18:36:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108171

this is already applied to master

On Mon, Jan 8, 2024 at 5:49=E2=80=AFAM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
>  https://netaddr.readthedocs.io/en/latest/changes.html#release-0-10-1
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{python3-netaddr_0.9.0.bb =3D> python3-netaddr_0.10.1.bb}     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-netaddr_0.9.0.bb =3D=
> python3-netaddr_0.10.1.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-netaddr_0.9.0.bb=
 b/meta-python/recipes-devtools/python/python3-netaddr_0.10.1.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-netaddr_0.9.0.bb
> rename to meta-python/recipes-devtools/python/python3-netaddr_0.10.1.bb
> index 471d939a8..ce16cc178 100644
> --- a/meta-python/recipes-devtools/python/python3-netaddr_0.9.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-netaddr_0.10.1.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "A network address manipulation library for P=
ython."
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De6345d695ffe3776f68a56fe7962d=
b44"
>
> -SRC_URI[sha256sum] =3D "7b46fa9b1a2d71fd5de9e4a3784ef339700a53a08c8040f0=
8baf5f1194da0128"
> +SRC_URI[sha256sum] =3D "f4da4222ca8c3f43c8e18a8263e5426c750a3a837fdfeccf=
74c68d0408eaa3bf"
>
>  inherit pypi setuptools3
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108157): https://lists.openembedded.org/g/openembedde=
d-devel/message/108157
> Mute This Topic: https://lists.openembedded.org/mt/103596959/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

