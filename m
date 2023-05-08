Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04AA3C77B7F
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 16:03:50 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web10.111774.1683561822904677335
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 09:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=C90VQkS8;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1929818d7faso32385813fac.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 09:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683561822; x=1686153822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6hwQPPQUgV8sqyFAPTmSN/l73UgGidxctcw7eEsAvaE=;
        b=C90VQkS8NnQMmI58RiNTT5i5S8/AXV0719lDyZn0S67gx12mjG2Y9CfysaAXD5u1e9
         Te7f6ZcVvlcvFp3BFcywl8xOt62721laOsEIJCr2GOPoiKeN5g5z6qwvtguMlxh8qFfn
         4xDNw8B09O5fnDK6PQgLKXyA+eEsnlmP6BBJoldlA5vBZSy2Efp8q23XYf43AGWAM2ru
         Rs1bKMulYCtev7DocFvcIATno4Ft9zBW2JlMyh3anIivFzmaI4Sp5waGuSbBVYTi0mc7
         hST8lVwLP3O5+dC+YO9SZAh2k9i8a9+cZTaxSOyP5C8R61UNx/QV70q+ALkxDTwsiA6Y
         Svsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683561822; x=1686153822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6hwQPPQUgV8sqyFAPTmSN/l73UgGidxctcw7eEsAvaE=;
        b=F8E2msI1qWwqj3ZeXN/l5h6ZyZ4nxY4RbV0A0Q5GButYgZTR5f/2b+l7ctKglplMMw
         eBgrUOnRLj8iYYpF093yKql2llU+t2HwY4ieeVh7LgzRNRfZGahffk7VbZSr7x8Akavp
         bu54ALKmnMwpjwbuup5KrF+j4HqTSu2aHsmS3ko8BQ01EXko/a68i1B+kYLSXkq6BuXB
         eyawpO8E8T0twacND5BvxR0GejLjPBtd4xnlNY5aqz2+U/cCm9MxLUqRgpQqbPemB9/2
         pBxRGZ1WjZMgDN3PzD7lrOj7sRuvr/ljn8k3ZWCxIlhzEj8ujIrXNZSmeZHkmnSUjnQ7
         +xdQ==
X-Gm-Message-State: AC+VfDyBhVZRfrMikQmW4AAMvQaA2/XPqa6KWKiSX3qPmKXKte8Fg4lX
	94DE2Q0/0QchsnmDu1f7995RkC5+3AT/qcOe6aI=
X-Google-Smtp-Source: ACHHUZ4huOP2FygIUHlwT/Z3FuBytZmIrsfDLIHM1o8ZKEbyzoVHxttBuEH5WmNT6YgbYfzd4Aa5C9gNXcvndtr5R3U=
X-Received: by 2002:aca:6155:0:b0:38e:a925:8f95 with SMTP id
 v82-20020aca6155000000b0038ea9258f95mr8081280oib.26.1683561821876; Mon, 08
 May 2023 09:03:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230507132349.10674-1-marex@denx.de>
In-Reply-To: <20230507132349.10674-1-marex@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 May 2023 09:03:13 -0700
Message-ID: <CAMKF1spA6mxAtVLEXp04Ku_YDF-XeaVtfe7zNrJDd_VtGcSrhQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 1/5] lvgl: Upgrade lvgl to 8.3.7 and lv-driver to 8.3.0
To: Marek Vasut <marex@denx.de>
Cc: openembedded-devel@lists.openembedded.org, 
	Fabio Estevam <festevam@denx.de>, Martin Jansa <martin.jansa@gmail.com>, 
	Philippe Coval <philippe.coval.ext@huawei.com>, Philippe Coval <philippe.coval@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 16:03:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102442

I am seeing a build failure across multiple builds with clang.

https://errors.yoctoproject.org/Errors/Details/703557/
https://errors.yoctoproject.org/Errors/Details/703481/

On Sun, May 7, 2023 at 6:24=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
>
> Both the LVGL and lv-drivers are now available in 8.3.y release,
> upgrade both to latest 8.3.y release version in lock step. Also,
> lvgl contains no submodules, drop the gitsm fetcher use.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Fabio Estevam <festevam@denx.de>
> Cc: Khem Raj <raj.khem@gmail.com>
> Cc: Martin Jansa <martin.jansa@gmail.com>
> Cc: Philippe Coval <philippe.coval.ext@huawei.com>
> Cc: Philippe Coval <philippe.coval@huawei.com>
> ---
>  .../lvgl/{lv-drivers_7.11.0.bb =3D> lv-drivers_8.3.0.bb}       | 5 ++---
>  .../recipes-graphics/lvgl/{lvgl_8.1.0.bb =3D> lvgl_8.3.7.bb}   | 4 ++--
>  2 files changed, 4 insertions(+), 5 deletions(-)
>  rename meta-oe/recipes-graphics/lvgl/{lv-drivers_7.11.0.bb =3D> lv-drive=
rs_8.3.0.bb} (89%)
>  rename meta-oe/recipes-graphics/lvgl/{lvgl_8.1.0.bb =3D> lvgl_8.3.7.bb} =
(89%)
>
> diff --git a/meta-oe/recipes-graphics/lvgl/lv-drivers_7.11.0.bb b/meta-oe=
/recipes-graphics/lvgl/lv-drivers_8.3.0.bb
> similarity index 89%
> rename from meta-oe/recipes-graphics/lvgl/lv-drivers_7.11.0.bb
> rename to meta-oe/recipes-graphics/lvgl/lv-drivers_8.3.0.bb
> index cf33c6904..d9cde497c 100644
> --- a/meta-oe/recipes-graphics/lvgl/lv-drivers_7.11.0.bb
> +++ b/meta-oe/recipes-graphics/lvgl/lv-drivers_8.3.0.bb
> @@ -8,9 +8,8 @@ DESCRIPTION =3D "Collection of drivers: SDL, framebuffer,=
 wayland and more..."
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd6fc0df890c5270ef045981b516bb=
8f2"
>
> -# TODO: Pin upstream release (current v7.11.0-80-g419a757)
> -SRC_URI =3D "git://github.com/lvgl/lv_drivers;protocol=3Dhttps;nobranch=
=3D1"
> -SRCREV =3D "419a757c23aaa67c676fe3a2196d64808fcf2254"
> +SRC_URI =3D "git://github.com/lvgl/lv_drivers;protocol=3Dhttps;branch=3D=
release/v8.3"
> +SRCREV =3D "71830257710f430b6d8d1c324f89f2eab52488f1"
>
>  DEPENDS =3D "libxkbcommon lvgl wayland"
>
> diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb b/meta-oe/recipe=
s-graphics/lvgl/lvgl_8.3.7.bb
> similarity index 89%
> rename from meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb
> rename to meta-oe/recipes-graphics/lvgl/lvgl_8.3.7.bb
> index ea74c5918..a82ab3b74 100644
> --- a/meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb
> +++ b/meta-oe/recipes-graphics/lvgl/lvgl_8.3.7.bb
> @@ -8,8 +8,8 @@ SUMMARY =3D "Light and Versatile Graphics Library"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENCE.txt;md5=3Dbf1198c89ae87f043108cea62=
460b03a"
>
> -SRC_URI =3D "gitsm://github.com/lvgl/lvgl;protocol=3Dhttps;nobranch=3D1"
> -SRCREV =3D "d38eb1e689fa5a64c25e677275172d9c8a4ab2f0"
> +SRC_URI =3D "git://github.com/lvgl/lvgl;protocol=3Dhttps;branch=3Dreleas=
e/v8.3"
> +SRCREV =3D "2b56e04205481daa6575bd5f7ab5df59d11676eb"
>
>  REQUIRED_DISTRO_FEATURES =3D "wayland"
>
> --
> 2.39.2
>

