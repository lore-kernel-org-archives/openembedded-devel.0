Return-Path: <kieran.bingham@ideasonboard.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F91C43458
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 16:36:44 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123.1783960600386737980
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jul 2026 09:36:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ideasonboard.com header.s=mail header.b=KEc1dhdv;
 spf=pass (domain: ideasonboard.com, ip: 213.167.242.64, mailfrom: kieran.bingham@ideasonboard.com)
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0FC2D19FC;
	Mon, 13 Jul 2026 18:35:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783960544;
	bh=Dun6Su27Q/ZW4GMgAX1I70eFqnelsBGdtZ7IsRYOrSg=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=KEc1dhdvJ9A8XHzvcHfgFb/Zg0XTDTByRDNsMpYRJ9ZCOyurnNq0rcmNJBib6690u
	 Y5aRuNDqDwD5KlbUFl8iMNm497q6Oq6vnUEtGjAWJC5Xz5g7kbJpdQ7M5htz6IWWlB
	 lVpasPMTiu1RevGpH65ubdMni3cfN6a5Z2WxvrFY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <O6G4IT.2K2BXOEJZR5O@t-online.de>
References: <20260713091756.66416-1-f_l_k@t-online.de> <178393909487.727359.6008456952924140739@ping.linuxembedded.co.uk> <O6G4IT.2K2BXOEJZR5O@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCH] libcamera: add libdrm dependency
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org, Kieran Bingham via lists.openembedded.org <kieran.bingham=ideasonboard.com@lists.openembedded.org>, libcamera-devel@lists.libcamera.org, Robert Mader <robert.mader@collabora.com>,
Date: Mon, 13 Jul 2026 17:36:35 +0100
Message-ID: <178396059500.1428882.2934911266719928973@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jul 2026 16:36:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128159

+Cc libcamera-devel, Robert,

Quoting Markus Volk (2026-07-13 17:23:12)
> Am Mo, 13. Jul 2026 um 11:38:14 +01:00:00 schrieb Kieran Bingham via=20
> lists.openembedded.org=20
> <kieran.bingham=3Dideasonboard.com@lists.openembedded.org>:
> > Perhaps rather than add an incorrect dependency, we could backport the
> > patch for the recipe or bump to libcamera-0.7.2?
>=20
> That sounds reasonable. I have updated libcamera to v0.7.2 and now=20
> libyuv seems to be a requirement. It was formerly added by the 'virtual'
> PACKAGECONFIG where I have no idea what this is for but removing this=20
> PACKAGECONFIG  and adding libyuv to DEPENDS fixes the build.
> Since you know about libcameras dependencies: Is this the right thing=20
> to do or am I missing something about 'virtual'?

Aha, I wish I'd thought of that for the release notes.

There was a patch merged that makes virtual built in by default.

So adding libyuv as a dependency for 0.7.2 probably makes sense. I
wonder if virtual should instead only be defaulted to build in when
libyuv is available!

--
Kieran


>=20
> 0.7.2 builds for me like this:
>=20
> diff --git=20
> a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb=20
> b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb
> similarity index 97%
> rename from=20
> meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb
> rename to=20
> meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb
> index 2b351a39be..4b5e735a37 100644
> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb
> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb
> @@ -13,11 +13,11 @@ SRC_URI =3D " \
>         =20
> git://git.libcamera.org/libcamera/libcamera.git;protocol=3Dhttps;branch=
=3Dmaster;tag=3Dv${PV=20
> <git://git.libcamera.org/libcamera/libcamera.git;protocol=3Dhttps;branch=
=3Dmaster;tag=3Dv$%7BPV>}=20
> \
>  "
>=20
> -SRCREV =3D "183e37362f57ff3ce7493abf0bc6f1b57b931f55"
> +SRCREV =3D "191e202178f02430b5942397c70d215cdd2056fa"
>=20
>  PE =3D "1"
>=20
> -DEPENDS =3D "python3-pyyaml-native python3-jinja2-native=20
> python3-ply-native python3-jinja2-native udev gnutls chrpath-native=20
> libevent libyaml"
> +DEPENDS =3D "python3-pyyaml-native python3-jinja2-native=20
> python3-ply-native python3-jinja2-native udev gnutls chrpath-native=20
> libevent libyaml libyuv"
>  DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase=20
> qtbase-native', '', d)}"
>=20
>  PACKAGES =3D+ "${PN}-compliance ${PN}-gst ${PN}-pycamera"
> @@ -38,7 +38,6 @@ PACKAGECONFIG[raspberrypi] =3D ",,libpisp"
>  PACKAGECONFIG[sdl] =3D=20
> "-Dcam-output-sdl2=3Denabled,-Dcam-output-sdl2=3Ddisabled,virtual/libsdl2"
>  PACKAGECONFIG[unwind] =3D=20
> "-Dlibunwind=3Denabled,-Dlibunwind=3Ddisabled,libunwind"
>  PACKAGECONFIG[vimc] =3D ",,"
> -PACKAGECONFIG[virtual] =3D ",,libyuv libjpeg-turbo"
>=20
>  ARM_PIPELINES =3D "imx8-isi,mali-c55,simple,uvcvideo"
>  # Raspberry Pi requires the meta-raspberrypi layer
>=20
>

