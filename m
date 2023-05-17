Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A90EFC77B7F
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 12:10:59 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
 by mx.groups.io with SMTP id smtpd.web10.47591.1684325260711253010
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 May 2023 05:07:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ideasonboard.com header.s=mail header.b=ZeUrAUes;
 spf=pass (domain: ideasonboard.com, ip: 213.167.242.64, mailfrom: kieran.bingham@ideasonboard.com)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18C17720;
	Wed, 17 May 2023 14:07:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1684325246;
	bh=zQrsg8iCBWYfJf5bEeHEF9vSjtgvj1HUMgkl2F/Ibs4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ZeUrAUesJS+GqYXfVkKUpTVz2C7mTDG7r44x+xkxIjHjF2oPphKD8YycEVRzpp7og
	 DtYBaYnz2dq+Ni0ObwzP5LilZlZMfllwnloR5QwWwWLXiwU6kks2536xnvgcwhEoms
	 Waqo/ppEqaGDQT7p9+DR9sH18bQZj0G5IiOL65mo=
MIME-Version: 1.0
In-Reply-To: <20230517082759.1289294-1-alexander.stein@ew.tq-group.com>
References: <20230517082759.1289294-1-alexander.stein@ew.tq-group.com>
Subject: Re: [[oe] [meta-oe] 1/1] libcamera: Allow overwriting default pipelines and IPA
From: "Kieran Bingham" <kieran.bingham@ideasonboard.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, openembedded-devel@lists.openembedded.org
Date: Wed, 17 May 2023 13:07:35 +0100
Message-ID: <168432525509.3378917.14773482271941853163@Monstersaurus>
User-Agent: alot/0.10
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 May 2023 12:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102648

Hi Alex,

Quoting Alexander Stein (2023-05-17 09:27:59)
> By default only uvcvideo, simple and vimc pipelines as well as vimc IPA
> are built. Add new variables for enabling a custom set of enabled
> pipelines and IPAs.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> An example is the 'rkips1' pipeline and IPA.
>=20
>  .../recipes-multimedia/libcamera/libcamera_0.0.5.bb        | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.5=
.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.5.bb
> index 14a20b431..47da0ec61 100644
> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.5.bb
> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.5.bb
> @@ -26,9 +26,12 @@ PACKAGES =3D+ "${PN}-gst"
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[gst] =3D "-Dgstreamer=3Denabled,-Dgstreamer=3Ddisabled,gst=
reamer1.0 gstreamer1.0-plugins-base"
> =20
> +LIBCAMERA_PIPELINES ??=3D "uvcvideo,simple,vimc"
> +LIBCAMERA_IPAS ??=3D "vimc"

Could you test with LIBCAMERA_PIPELINES ??=3D "auto" please? That should
give an appropriate selection based on the architecture. But it may
depend on the correct architecture being conveyed through the meson
cross files.


> +
>  EXTRA_OEMESON =3D " \
> -    -Dpipelines=3Duvcvideo,simple,vimc \
> -    -Dipas=3Dvimc \
> +    -Dpipelines=3D${LIBCAMERA_PIPELINES} \
> +    -Dipas=3D${LIBCAMERA_IPAS} \

I think you should probably remove the -Dipas option too and let that be
selected automatically by the pipelines choice.

--
Kieran


>      -Dv4l2=3Dtrue \
>      -Dcam=3Denabled \
>      -Dlc-compliance=3Ddisabled \
> --=20
> 2.34.1
>=20
>

