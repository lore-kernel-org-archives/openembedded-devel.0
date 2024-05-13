Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5967EC25B10
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 04:49:37 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.52766.1715575775462269364
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 May 2024 21:49:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fzmxAvXm;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-23f59d71d10so2736333fac.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 May 2024 21:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715575774; x=1716180574; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wa1hnIUFLyv2j3MnudNM82etPMb3PSWCl2wUTkBcNRo=;
        b=fzmxAvXmTYEGmXWSRgbiuNwUDtd1Id/INpMrZ4X3gnYkq4l4+NRc+cty9RrZkeDt+D
         XgqMDJAFjfRq38rc99A1agyHpTMdUs2usrMWGOwN3LoP9bTm2nq/N51kitgzqj3mzUeK
         6yXzBejuiAxs1/ZXGiVl/whWCJFLBy7PI5/XlUAG3EahzRNDQeQXb65WvXR9wj54Io0Y
         gfncCgYGxDdbutMWFJ2vdjmVidlV+GZN/OQwH7s0SS9v9H9mfsvA/D3skQ8ABxnvmemZ
         5eXNYl2xuAAr0iSxRqu22hyC6PL/nAqy8sabR2WNncR1PxD/Ja7fvnWIz9k4LKlk66EE
         u+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715575774; x=1716180574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wa1hnIUFLyv2j3MnudNM82etPMb3PSWCl2wUTkBcNRo=;
        b=Q79erq08R0n0WtZPWoFIstp2zAkyaln3Ncsai/wD7pAuoiNZMIFZaME6fOLgYE/1Un
         elf0i/6gtSgKqJjImEdpHmOeSJ9goeNVdB1XyUViz2ioxt+PvwxxL14Acbj8FXUNcOBj
         zl19ryJVDFOX5CLzyCTMIYk0odqZxHE89flLe390nhp0GE335ZbkH5/fK2qseM/Nvie7
         s5AXvVXJ+PCDSW/wfnAJcUTi0SJQH3m/ZcVKmb7lxJTlOrlU9cBWhA1JwVw3qmQP9XEf
         TeHnFO3IU08eNWiTWEW6jTjhDwKBS0gF4LPnGLnW+sx5kNQ997izf9dlqMhxv2rwOUz3
         0wTg==
X-Gm-Message-State: AOJu0Yw0zRcEqwxlCebowOg0TUh8T2NaVWvxd3HVW4jSb+Qs1oews3w0
	USFW3nJ+3Ypc8VGD19mcgEfXrVRbid/Y3CpiOw/Cr7nzuoQ+pk+KQqRdqpMnA+rJYoFDtPhNFk9
	wUt20zk3xWXLAlU5OmTdfOlo9zOU=
X-Google-Smtp-Source: AGHT+IFXRK1W+g3LdAjE20B9BXMUb2o1sVFT1rcTGQkO1o1tuh6xr4Ro2W+LpQZYytbGdb+R+0FDPQuENc4kIvbZPfI=
X-Received: by 2002:a05:6871:6208:b0:23c:9f1b:8cef with SMTP id
 586e51a60fabf-24172fc60a9mr13087942fac.48.1715575774538; Sun, 12 May 2024
 21:49:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240510054709.4044191-1-f_l_k@t-online.de>
In-Reply-To: <20240510054709.4044191-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 May 2024 21:49:07 -0700
Message-ID: <CAMKF1sqdW5a8qTQJRn+iOv1udRXNXFo1OiyTiAzisADu+8K0_g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] fuse3: move from meta-filesystems to meta-oe
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 May 2024 04:49:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110331

This fails layer compatibility tests - see
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3853/step=
s/12/logs/errors

On Thu, May 9, 2024 at 10:46=E2=80=AFPM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> Technically flatpak and xdg-desktop-portal have a runtime dependency on
> fuse3-utils. I was worried that adding it might cause problems with CI si=
nce fuse3
> is not included in meta-oe.
>
> Given that both packages also require fuse3 at buildtime it could be a go=
od
> idea to move fuse3 to avoid a meta-filesystems dependency for meta-oe
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../recipes-support/fuse/fuse3/run-ptest                       | 0
>  .../recipes-support/fuse/fuse3_3.16.2.bb                       | 3 +--
>  2 files changed, 1 insertion(+), 2 deletions(-)
>  rename {meta-filesystems =3D> meta-oe}/recipes-support/fuse/fuse3/run-pt=
est (100%)
>  rename {meta-filesystems =3D> meta-oe}/recipes-support/fuse/fuse3_3.16.2=
.bb (98%)
>
> diff --git a/meta-filesystems/recipes-support/fuse/fuse3/run-ptest b/meta=
-oe/recipes-support/fuse/fuse3/run-ptest
> similarity index 100%
> rename from meta-filesystems/recipes-support/fuse/fuse3/run-ptest
> rename to meta-oe/recipes-support/fuse/fuse3/run-ptest
> diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb b/meta=
-oe/recipes-support/fuse/fuse3_3.16.2.bb
> similarity index 98%
> rename from meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
> rename to meta-oe/recipes-support/fuse/fuse3_3.16.2.bb
> index 2b0797a6f..307544bf3 100644
> --- a/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
> +++ b/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb
> @@ -13,8 +13,7 @@ LIC_FILES_CHKSUM =3D " \
>      file://LICENSE;md5=3Da55c12a2d7d742ecb41ca9ae0a6ddc66 \
>  "
>
> -SRC_URI =3D "https://github.com/libfuse/libfuse/releases/download/fuse-$=
{PV}/fuse-${PV}.tar.gz \
> -"
> +SRC_URI =3D "https://github.com/libfuse/libfuse/releases/download/fuse-$=
{PV}/fuse-${PV}.tar.gz"
>  SRC_URI[sha256sum] =3D "f797055d9296b275e981f5f62d4e32e089614fc253d1ef29=
85851025b8a0ce87"
>
>  S =3D "${WORKDIR}/fuse-${PV}"
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110306): https://lists.openembedded.org/g/openembedde=
d-devel/message/110306
> Mute This Topic: https://lists.openembedded.org/mt/106016169/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

