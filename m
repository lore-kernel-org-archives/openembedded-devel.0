Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80398C46CC5
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 13:53:39 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
 by mx.groups.io with SMTP id smtpd.web11.59783.1702635537427490860
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Dec 2023 02:18:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ideasonboard.com header.s=mail header.b=GTaQZ04j;
 spf=pass (domain: ideasonboard.com, ip: 213.167.242.64, mailfrom: kieran.bingham@ideasonboard.com)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCABC9A8;
	Fri, 15 Dec 2023 11:18:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702635489;
	bh=j+AvixzUKVj6SF/2H2/YmG9eiIUS3HesQ7/6iRJhDfc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GTaQZ04jIOyuKhV0U5A/JwfyzTl4VhuLbCKXbHZLcgXHO7Jry43yjOFfcIJKLEh3A
	 5M0ATv02c+ycd5AGt87ec72kXkc6pFU7kKGE/HLb8Uq3sIRW8ZFEcEllF+lIzuBIwg
	 b+OiztLdjeezGnYRNRQ1Ovpvjva3vQgT9HXxHkIw=
MIME-Version: 1.0
In-Reply-To: <170263538033.2829918.17327515467462630423@ping.linuxembedded.co.uk>
References: <20231215075239.3049865-1-alex@linutronix.de> <20231215075239.3049865-19-alex@linutronix.de> <170263538033.2829918.17327515467462630423@ping.linuxembedded.co.uk>
Subject: Re: [PATCH 19/20] libcamera: skip until upstream resolves python 3.12 compatibility
From: "Kieran Bingham" <kieran.bingham@ideasonboard.com>
Cc: Alexander Kanavin <alex@linutronix.de>, libcamera-devel@lists.libcamera.org
To: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-devel@lists.openembedded.org
Date: Fri, 15 Dec 2023 10:18:52 +0000
Message-ID: <170263553291.2829918.9491731797867514491@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 13:53:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107520

Quoting Kieran Bingham (2023-12-15 10:16:20)
> +libcamera-devel mailing list
>=20
> Quoting Alexander Kanavin (2023-12-15 07:52:38)
> > I'd note that imp module has been deprecated for years, so that's what
> > happens when deprecation warnings are ignored.
>=20
> Can you tell me more about what this issue is please? I'm not aware of
> it at all.
>=20
> --
> Kieran
>=20
>=20
> >=20
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb | 1 +
> >  .../packagegroups/packagegroup-meta-multimedia.bb               | 1 -
> >  meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.0.bb   | 2 +-
> >  3 files changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1=
.0.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb
> > index 2a3c6473e..9c04d7434 100644
> > --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb
> > +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb
> > @@ -73,3 +73,4 @@ FILES:${PN}-gst =3D "${libdir}/gstreamer-1.0"
> >  # both 32 and 64 bit file APIs.
> >  GLIBC_64BIT_TIME_FLAGS =3D ""
> > =20
> > +SKIP_RECIPE[libcamera] ?=3D "Not compatible with python 3.12, see http=
s://bugs.libcamera.org/show_bug.cgi?id=3D206"


Aha, the clue was buried here.

--
Kieran


> > diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegr=
oup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/p=
ackagegroup-meta-multimedia.bb
> > index 672c8abc9..6ca4d539f 100644
> > --- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-met=
a-multimedia.bb
> > +++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-met=
a-multimedia.bb
> > @@ -42,7 +42,6 @@ RDEPENDS:packagegroup-meta-multimedia =3D "\
> >      tearsofsteel-1080p \
> >      pipewire \
> >      ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", bb.ut=
ils.contains("DISTRO_FEATURES", "x11", "projucer", "", d), "", d)} \
> > -    libcamera \
> >      vorbis-tools \
> >      libopenmpt \
> >      mimic \
> > diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.0=
.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.0.bb
> > index b4da781f0..4d894349a 100644
> > --- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.0.bb
> > +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.0.bb
> > @@ -86,7 +86,7 @@ PACKAGECONFIG:class-target ??=3D " \
> >      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd system=
d-system-service systemd-user-service', '', d)} \
> >      ${@bb.utils.filter('DISTRO_FEATURES', 'alsa vulkan pulseaudio', d)=
} \
> >      ${PIPEWIRE_SESSION_MANAGER} \
> > -    ${FFMPEG_AVAILABLE} avahi flatpak gstreamer gsettings jack libusb =
pw-cat raop sndfile v4l2 udev volume webrtc-echo-cancelling libcamera readl=
ine \
> > +    ${FFMPEG_AVAILABLE} avahi flatpak gstreamer gsettings jack libusb =
pw-cat raop sndfile v4l2 udev volume webrtc-echo-cancelling readline \
> >  "
> > =20
> >  # "jack" and "pipewire-jack" packageconfigs cannot be both enabled,
> > --=20
> > 2.39.2
> >=20
> >

