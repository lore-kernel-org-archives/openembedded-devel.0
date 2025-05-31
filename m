Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0141FC5AE59
	for <webhook@archiver.kernel.org>; Sat, 31 May 2025 19:49:27 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.13595.1748720960122344449
 for <Openembedded-devel@lists.openembedded.org>;
 Sat, 31 May 2025 12:49:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MWAgPuTe;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-31062172698so31872211fa.0
        for <Openembedded-devel@lists.openembedded.org>; Sat, 31 May 2025 12:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748720958; x=1749325758; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqW6Hm6nCIA2fgUuGU1aVR/Bzh29rQlDU+Qa3G0iR1k=;
        b=MWAgPuTeppYSvS+xrkMesg/1b2U4TeLna2nhnzbshlMvKziVoiYwKOXh/VcSd8pIVc
         3jfZUZB7hy8HLlnBdBr2jPbeOHoEN4HXWMFw4EPtzFQhM2gMDd5Hg/5BEgA8ml529TXM
         eW2aFB2YHYOtI41lMIIvH1UAy1CIQuz1co3Ryk9zkx8vWgj2LNrk+YdH8LvbGtgUoWok
         ZEOydiRv8HNuKAHWIWlPULsgRI/MxylRLZrA4F19fEZsmvoasYtqTUHn1QOwTNzPU/GD
         PrmIxybrPGK8pmPtk5UXO7E3dOU5H5joSmY+Km2OCqGM3tVU4qoCh0DrgL0ORuXdG637
         ipqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748720958; x=1749325758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WqW6Hm6nCIA2fgUuGU1aVR/Bzh29rQlDU+Qa3G0iR1k=;
        b=UZZl63k17dShJTEjLHbuHPVQfYDW+QoTTrUIMcf62AytNdMUmOAyiQZ3jqojzxuPQD
         Kg/VZq/FoyrNIU4rowzLuOeeGDp7H0xeFzs76baw1InROj2g9+A/JmL86Q+TiX3J01XA
         2pakDK26zz+6TNUNusaNAC1N6GBB3X8zS7iN6FCnqCnoGzyW0Vq/MKaAYCSaG596NIwt
         oxC1NgsifuM8u0+pwQrxPO46xUTBCYRFCK3Hx2jiont6RrpVNw7Xh4VLi36+UZeoyiO1
         vj5p64KzgWv+mEVGfRMAWWR5IqiyE71Cpe20r8Jst0MbGUQYs6dy4mHRBPl1W2j7pCAl
         NJqA==
X-Gm-Message-State: AOJu0YyQnI6Rsb8Pm12R8XcucsW3njezBpsrAzbtrR6ZogsAML+KKGrO
	N9/xJA5GW/VJrvFxU3qMxKfLkUIL4jL0+svQLdKDvzTSFzojRN1PEqlsPM32AtOv7tJKEbLqdjJ
	7VMjfrvY8HIt/Eknc4D0KiypUogGunNc=
X-Gm-Gg: ASbGncsW/mBotFEnQQsUc4NLt8D2yLcj3Mog+lTdYQJQJX0mkPUcuKOuJacR9MWYeVz
	CuuHyrbLs/zBsv1AMntHsK4Z60oXHN5P8+HJz/jpYXySJvdTh/+cB7INaKwis1Pyy2+DFbOt1DR
	JFaAaFD7V61iP9qjahbNsNmeWuwt8orcTHfjbqX24sC7A/SQ==
X-Google-Smtp-Source: AGHT+IFi3f/SXr9wE+dWvct63a7RszQ/gy4Lld5I3nRLYBRl1Nwv0AlcMuMHmlCIdK+bz3UQL87IydUW0jAZGV4DXXc=
X-Received: by 2002:a05:651c:1509:b0:32a:78f7:9bef with SMTP id
 38308e7fff4ca-32a9e9b2d8cmr7686171fa.8.1748720957573; Sat, 31 May 2025
 12:49:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250531190624.583666-1-dimitris@siganos.org>
In-Reply-To: <20250531190624.583666-1-dimitris@siganos.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 31 May 2025 21:49:04 +0200
X-Gm-Features: AX0GCFtCsj4OrmkIITgluVuaZ1XcqXkrEz1xSXX6JH7P2Jf65ecZE1N777o9YFI
Message-ID: <CA+chaQf4VHLugsnMC0RMvtgw+MwqbDR3_U1V+UgLtoAf5akQ=g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] Fix bvi license + tiny improvement in SRC_URI
To: dimitris@siganos.org
Cc: Openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 May 2025 19:49:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117690

Please follow the commit message convention and start the summary with
"<recipe>: " as "bvi: ".

On Sat, May 31, 2025 at 9:06=E2=80=AFPM Dimitrios Siganos via
lists.openembedded.org <dimitris=3Dsiganos.org@lists.openembedded.org>
wrote:
>
> Signed-off-by: Dimitrios Siganos <dimitris@siganos.org>
> ---
>  meta-oe/recipes-support/bvi/bvi_1.4.2.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-support/bvi/bvi_1.4.2.bb b/meta-oe/recipes-s=
upport/bvi/bvi_1.4.2.bb
> index b0081794d0..fb136e16a6 100644
> --- a/meta-oe/recipes-support/bvi/bvi_1.4.2.bb
> +++ b/meta-oe/recipes-support/bvi/bvi_1.4.2.bb
> @@ -2,10 +2,10 @@ SUMMARY =3D "Binary VI editor"
>  DESCRIPTION =3D "bvi is a visual editor for binary files."
>  HOMEPAGE =3D "https://sourceforge.net/projects/bvi"
>  SECTION =3D "console/utils"
> -LICENSE =3D "GPL-3.0-only"
> +LICENSE =3D "GPL-3.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da36207309d382da27cd66fdaae922=
e3c"
>
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/bvi/bvi-${PV}.src.tar.gz"
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.src.tar.gz"
>  SRC_URI[sha256sum] =3D "4bba16c2b496963a9b939336c0abcc8d488664492080ae43=
a86da18cf4ce94f2"
>
>  DEPENDS +=3D "ncurses"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117689): https://lists.openembedded.org/g/openembedde=
d-devel/message/117689
> Mute This Topic: https://lists.openembedded.org/mt/113400854/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

