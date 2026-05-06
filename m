Return-Path: <kieran.bingham@ideasonboard.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E4BCD342C
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 12:10:14 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16910.1778069413228241999
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 May 2026 05:10:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ideasonboard.com header.s=mail header.b=FXyl078m;
 spf=pass (domain: ideasonboard.com, ip: 213.167.242.64, mailfrom: kieran.bingham@ideasonboard.com)
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D19B63D;
	Wed,  6 May 2026 14:10:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778069407;
	bh=CIzjKNR1BZbR55YNSSVAP662xtqfcUgaBvtoV3x9N5E=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=FXyl078mGod8w6V5kgNSuVr+bLWPBa9OBI3LqO3hh4/NyqC5a3Ih9ebhYpd2TkXt4
	 WmdNW+nepIf8FcfLN4DLe4CjcJV6R0PUtc/kIkmowOCrPGYWF57TOxJK6Z+aE1i4F/
	 LIX4jGNUaMidwfu1aJb5O57EpJMAiP7enCJ5BTQs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260506111552.2782-2-jose.quaresma@foundries.io>
References: <20260506111552.2782-1-jose.quaresma@foundries.io> <20260506111552.2782-2-jose.quaresma@foundries.io>
Subject: Re: [meta-oe][PATCH 2/6] libcamera: add configs pipelines for testing
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: jose.quaresma@oss.qualcomm.com, Jose Quaresma <jose.quaresma@foundries.io>
To: Jose Quaresma <quaresma.jose@gmail.com>, openembedded-devel@lists.openembedded.org
Date: Wed, 06 May 2026 13:10:08 +0100
Message-ID: <177806940817.45302.5857955111130743302@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 May 2026 12:10:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126804

Hi Jose,

Quoting Jose Quaresma (2026-05-06 12:15:48)
> vimc:
> Is a driver that emulates complex video hardware, and is
> useful for testing libcamera without needing access to a physical
> camera. We would like to add support to the libcamera vimc
> pipeline handler for multiple simultaneous streams, to ease
> testing of such mechanism. This also requires adding multistream
> support to the vimc driver in the Linux kernel.
>=20
> virtual:
> Is a specialized handler designed to create software-based,
> virtual camera devices. It allows for testing, debugging, and
> simulating camera pipelines without needing physical hardware,
> often producing test patterns (e.g., all green frames) via qcam.
> This enables developers to emulate camera sensors and
> Image Signal Processors (ISPs) within the libcamera
>=20
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  .../recipes-multimedia/libcamera/libcamera_0.6.0.bb       | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.6.0=
.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.6.0.bb
> index 4dce26a5d0..1f9e21e45b 100644
> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.6.0.bb
> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.6.0.bb
> @@ -28,12 +28,16 @@ PACKAGECONFIG[dng] =3D ",,tiff"
>  PACKAGECONFIG[gst] =3D "-Dgstreamer=3Denabled,-Dgstreamer=3Ddisabled,gst=
reamer1.0 gstreamer1.0-plugins-base"
>  PACKAGECONFIG[pycamera] =3D "-Dpycamera=3Denabled,-Dpycamera=3Ddisabled,=
python3 python3-pybind11"
>  PACKAGECONFIG[raspberrypi] =3D ",,libpisp"
> +PACKAGECONFIG[vimc] =3D ",,"
> +PACKAGECONFIG[virtual] =3D ",,libyuv libjpeg-turbo"
> =20
> +ARM_PIPELINES =3D "imx8-isi,mali-c55,simple,uvcvideo"
>  # Raspberry Pi requires the meta-raspberrypi layer
>  # These values are coming from the project's meson.build file,
>  # which lists the supported values by arch.
> -ARM_PIPELINES =3D "${@bb.utils.contains('PACKAGECONFIG', 'raspberrypi', =
'rpi/pisp,rpi/vc4,', '', d)}"
> -ARM_PIPELINES .=3D "imx8-isi,mali-c55,simple,uvcvideo"
> +ARM_PIPELINES .=3D "${@bb.utils.contains('PACKAGECONFIG', 'raspberrypi',=
 ',rpi/pisp,rpi/vc4', '', d)}"


> +ARM_PIPELINES .=3D "${@bb.utils.contains('PACKAGECONFIG', 'vimc', ',vimc=
', '', d)}"
> +ARM_PIPELINES .=3D "${@bb.utils.contains('PACKAGECONFIG', 'virtual', ',v=
irtual', '', d)}"

These are not 'ARM' pipelines. Maybe they should be categorised
separately as test platforms ?

--
Kieran



> =20
>  LIBCAMERA_PIPELINES ??=3D "auto"
>  LIBCAMERA_PIPELINES:arm ??=3D "${ARM_PIPELINES}"
> --=20
> 2.54.0
>=20
>

