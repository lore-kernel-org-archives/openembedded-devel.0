Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32AFDC433EF
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 16:15:10 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.9686.1652976903929545757
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 09:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=URqXC/Qq;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id c9so4249557qvx.8
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 09:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sSrJ7+/StdTUwq9xtq2ORcKh4iHFWBsdBXsVIrca14s=;
        b=URqXC/QqPg/yFZ1ORmBZkUwZGvOw0U1803QvxPYWLqVZU8uoDAkV/wNUZHDc63Aiv1
         +bGMD8p+ejPOe8Ef8JWjs3zO2r2qrSeCpSOafOeVydnOu/W4SleQz7CrwQq+6eTvPj01
         i8Th9BSeFE99wZ6BRlFNVr5qVwpYPr8u9F8vDDAUypt7lH9sarrM9q059aT5fprHIdN5
         ooqpYB2LQkONCA9rTsJB3hBSllhtJzsyrDVpULVt5IbZCPVCVDJVFduEyiafNfg/WwnD
         i8NobxN2f0L6rIdi0Qj3tfvR7qX2pNRc3eWPKC2XBnPng8Tbo2v/C1JdQAAn1/cU0jfH
         4iXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sSrJ7+/StdTUwq9xtq2ORcKh4iHFWBsdBXsVIrca14s=;
        b=fRiQu58yTym9LY2Csn+oJa6UElOx5s57bfgDMKwpGppXsJePlH3ZgywmYzwaOMXUwx
         ZMTrasVB9WcQ+sCtvqkljqPJE+GBTEPI57VSGOfE/W1NIx45zTX5LQMwH+zisgsi7xsT
         KV2+RTX02vD55CMRS894nM+F+iKB0cokd+86DiDmLZ8hJNOcZp/6XjY60YF1jJGk9Rnu
         Zf1MHthO6YwIUuKtyEtWoW62euQWxse9/69/fkqTmT8B7H7q/uuZMBjQr8JDloOzmFbZ
         2//IDfZpJfIOisHGZQgH2hZysqPAktK2NzMb8EoZ1iOlOqi5+I3MjxQ6LQkWxwFa6opD
         WgNA==
X-Gm-Message-State: AOAM532dRSme1N1YlNqrVwy6bv8Z/GdMZTsFuKxQs22uZFf/Kzkmpo+8
	L9Y0h9pMfu5A79sL9UwJfrdQneInX9C7gbdhlZQ=
X-Google-Smtp-Source: 
 ABdhPJwQ7Wx1euaEpzWUIyqI1JRJakgtGSTx6IKbZQ8lDcaOszZzIJ3ubw87qd0raSNYnTdB1obrgvH9YuxgFjLGh+s=
X-Received: by 2002:a05:6214:4118:b0:462:e0c:897f with SMTP id
 kc24-20020a056214411800b004620e0c897fmr426661qvb.63.1652976902828; Thu, 19
 May 2022 09:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220519051622.1050304-1-zboszor@pr.hu>
In-Reply-To: <20220519051622.1050304-1-zboszor@pr.hu>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 May 2022 09:14:36 -0700
Message-ID: 
 <CAMKF1so8Zbzi56K1_-S9qqBiNhvc6yh3QSq+FMNV40b+kWpKhQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2 1/2] proj: Upgrade to 8.2.1
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	=?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 May 2022 16:15:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97200

I think there is a side effect

https://errors.yoctoproject.org/Errors/Details/656870/

On Wed, May 18, 2022 at 10:16 PM Zoltan Boszormenyi via
lists.openembedded.org <zboszor=3Dpr.hu@lists.openembedded.org> wrote:
>
> From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  .../proj/{proj_7.0.1.bb =3D> proj_8.2.1.bb}                  | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-navigation/proj/{proj_7.0.1.bb =3D> proj_8.2.1.bb=
} (63%)
>
> diff --git a/meta-oe/recipes-navigation/proj/proj_7.0.1.bb b/meta-oe/reci=
pes-navigation/proj/proj_8.2.1.bb
> similarity index 63%
> rename from meta-oe/recipes-navigation/proj/proj_7.0.1.bb
> rename to meta-oe/recipes-navigation/proj/proj_8.2.1.bb
> index 98e57f21e..0c1104926 100644
> --- a/meta-oe/recipes-navigation/proj/proj_7.0.1.bb
> +++ b/meta-oe/recipes-navigation/proj/proj_8.2.1.bb
> @@ -3,12 +3,11 @@ HOMEPAGE =3D "http://trac.osgeo.org/proj/"
>  SECTION =3D "libs"
>
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D74d9aaec5fa0cd734341e8c4dc91b=
608"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df27445198ba1500f508fce2b183ce=
0ff"
>
>  SRC_URI =3D "http://download.osgeo.org/${BPN}/${BP}.tar.gz"
>
> -SRC_URI[md5sum] =3D "5ba7536b579a6c9e0ad822dbdd455985"
> -SRC_URI[sha256sum] =3D "a7026d39c9c80d51565cfc4b33d22631c11e491004e19020=
b3ff5a0791e1779f"
> +SRC_URI[sha256sum] =3D "76ed3d0c3a348a6693dfae535e5658bbfd47f71cb7ff7eb9=
6d9f12f7e068b1cf"
>
>  DEPENDS =3D "sqlite3 sqlite3-native tiff"
>
> @@ -19,3 +18,5 @@ PACKAGECONFIG ?=3D "curl"
>  PACKAGECONFIG[curl] =3D ",--without-curl,curl"
>
>  FILES:${PN} +=3D "${datadir}/proj"
> +
> +BBCLASSEXTEND =3D "native"
> --
> 2.36.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97170): https://lists.openembedded.org/g/openembedded=
-devel/message/97170
> Mute This Topic: https://lists.openembedded.org/mt/91202580/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

