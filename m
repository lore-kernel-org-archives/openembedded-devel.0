Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E58C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 17:43:40 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.29286.1702575816029213054
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 09:43:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LLOl1NK8;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-20321785480so1451637fac.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 09:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702575815; x=1703180615; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQuIQGCK64++p2LByF1uho9wE1SJzNg3dfjQE1LCa1M=;
        b=LLOl1NK8bs/cFgCveZLDegWQY/DGE+ULWrRqEnEqrxu+DBS14iYgORw6az8E4lUxVM
         9z7a1xuPBpr+8COLz9K1r6zsyEvYx8ASqZ5xzkBz6xNhHDQ03Uf29VEulTm8QZkI78/m
         Aym/ampzUI4NcgnfJCDhHpEAoHOe6ZTlnj3rDLYV17XN6tqAs421eMZeem+O2XJJKTur
         t7bcjh5yRhEQyTNUn8Zma/JQWbuWeaiKbGxOTWlBmJWQXytUHIAukWl3ggpHNt1g5ca8
         9PRGSC0QaEZ0R5m8pMpv9i9HIzvdds+pXOBbBW9JXM0r6TBocu2F1HDiZ2hXRlTSvNz3
         RGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702575815; x=1703180615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQuIQGCK64++p2LByF1uho9wE1SJzNg3dfjQE1LCa1M=;
        b=xT2TJ9k87FqMhz/S2dICeLSCWabqqncyBfUrCkFi6WDu4mQKV7vwOJ/G9wKb3785MG
         ApuR8nMNN8/yWlvEpJJ2HMA7XcTjudVMJ2tfvh4SbbUYULEJWK8aqvvdWxUD31VAJAKR
         MwlXLsfXSrRf1pj5H8/0MY+lAL9HELrx16czKIHBJ+AAmlKcrnNyac5eFEumqPCSQDyh
         8EZ/Q3vClasXtSwEjRe7dcHbz+3cpoeXCqjZI2DB4NsbAn/EO4/cmuHodEh4nqTqUHgw
         EfWeKcz8ZIC9CDdnj6/DDcI9jf7TSd5XRQ9hjgdNK/IYBkwwrArotp11PKx2UrhskhN4
         KTyg==
X-Gm-Message-State: AOJu0Yz1fXWkByI4TKpTGUPjkUwp6Q+pgUWY5cvZKIpebviXx02EzbIb
	znKGYGeqqAdQlmLjnbyhNErv03NmZRN+6tqgrKT4uVwLdUU=
X-Google-Smtp-Source: AGHT+IEa146iTiB1XWwI5PNs8vO6vCLQ1XS6q8u3IGPKl9oQV9u1N5hFTA46pDisFX8ApDwOX3Qz5t5pyfDZqxI2wyk=
X-Received: by 2002:a05:6871:4609:b0:203:d46:ff79 with SMTP id
 nf9-20020a056871460900b002030d46ff79mr6278745oab.106.1702575815226; Thu, 14
 Dec 2023 09:43:35 -0800 (PST)
MIME-Version: 1.0
References: <1702544257-28082-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1702544257-28082-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Dec 2023 09:43:09 -0800
Message-ID: <CAMKF1so+rz8aE9Enc8Zjy=sYw+kuT6LBvHiZ+YYbbMAHOK=N4Q@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-ipython: upgrade 8.18.0 -> 8.18.1
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:43:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107459

duplicate of https://patchwork.yoctoproject.org/project/oe/patch/2023121405=
4139.1220161-1-derek@asterius.io/

On Thu, Dec 14, 2023 at 12:58=E2=80=AFAM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{python3-ipython_8.18.0.bb =3D> python3-ipython_8.18.1.bb}    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-ipython_8.18.0.bb =
=3D> python3-ipython_8.18.1.bb} (88%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.18.0.b=
b b/meta-python/recipes-devtools/python/python3-ipython_8.18.1.bb
> similarity index 88%
> rename from meta-python/recipes-devtools/python/python3-ipython_8.18.0.bb
> rename to meta-python/recipes-devtools/python/python3-ipython_8.18.1.bb
> index aaeb720e6..5a7e1fbc5 100644
> --- a/meta-python/recipes-devtools/python/python3-ipython_8.18.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-ipython_8.18.1.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING.rst;md5=3D59b20262b8=
663cdd094005bddf47af5f"
>
>  PYPI_PACKAGE =3D "ipython"
>
> -SRC_URI[sha256sum] =3D "4feb61210160f75e229ce932dbf8b719bff37af123c0b985=
fd038b14233daa16"
> +SRC_URI[sha256sum] =3D "ca6f079bb33457c66e233e4580ebfc4128855b4cf6370ddd=
d73842a9563e8a27"
>
>  RDEPENDS:${PN} =3D "\
>      ${PYTHON_PN}-setuptools \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107439): https://lists.openembedded.org/g/openembedde=
d-devel/message/107439
> Mute This Topic: https://lists.openembedded.org/mt/103166841/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

