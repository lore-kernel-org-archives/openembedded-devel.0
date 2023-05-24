Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9061DC77B7A
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 14:24:05 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
 by mx.groups.io with SMTP id smtpd.web11.10058.1684937871061283804
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 07:17:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ideasonboard.com header.s=mail header.b=IDf1hxNF;
 spf=pass (domain: ideasonboard.com, ip: 213.167.242.64, mailfrom: kieran.bingham@ideasonboard.com)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A7EB283;
	Wed, 24 May 2023 16:17:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1684937852;
	bh=D5HXbVuymKSBVE75VZ8L55OJibo1craIJld8jxjYTLk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=IDf1hxNFjHa6VLcdT7+4rOA0bzYAH3bVouKS3nM4vFAcR+PWP/LAREi3sm2XBYixK
	 alQ1AreMsAx/DPwmiy/eIRjP3/pRFe9NdbrMuip2900uBmImHD1phiUR3LvHcVjvCT
	 oKzUiYGfKfgdC3e+AcDglrOjKNV06rNKLnWhgN/w=
MIME-Version: 1.0
In-Reply-To: <20230524065534.2977672-1-alexander.stein@ew.tq-group.com>
References: <20230524065534.2977672-1-alexander.stein@ew.tq-group.com>
Subject: Re: [oe] [meta-oe][PATCH 1/1] libcamera: Simplify pipeline configuration
From: "Kieran Bingham" <kieran.bingham@ideasonboard.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, openembedded-devel@lists.openembedded.org
Date: Wed, 24 May 2023 15:17:45 +0100
Message-ID: <168493786556.2931851.16780521682397268834@Monstersaurus>
User-Agent: alot/0.10
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 14:24:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102779

Quoting Alexander Stein (2023-05-24 07:55:34)
> Default to 'auto' which enables all target architecture pipelines (+UVC).
> IPAs are also automatically enabled if the corresponding required pipeline
> is enabled as well.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Yup, This is what I would do!

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> ---
>  .../recipes-multimedia/libcamera/libcamera_0.0.5.bb           | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.5=
.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.5.bb
> index 47da0ec61..6ad376f29 100644
> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.5.bb
> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.5.bb
> @@ -26,12 +26,10 @@ PACKAGES =3D+ "${PN}-gst"
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[gst] =3D "-Dgstreamer=3Denabled,-Dgstreamer=3Ddisabled,gst=
reamer1.0 gstreamer1.0-plugins-base"
> =20
> -LIBCAMERA_PIPELINES ??=3D "uvcvideo,simple,vimc"
> -LIBCAMERA_IPAS ??=3D "vimc"
> +LIBCAMERA_PIPELINES ??=3D "auto"
> =20
>  EXTRA_OEMESON =3D " \
>      -Dpipelines=3D${LIBCAMERA_PIPELINES} \
> -    -Dipas=3D${LIBCAMERA_IPAS} \
>      -Dv4l2=3Dtrue \
>      -Dcam=3Denabled \
>      -Dlc-compliance=3Ddisabled \
> --=20
> 2.34.1
>=20
>

