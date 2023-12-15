Return-Path: <laurent.pinchart@ideasonboard.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5F8C41535
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 13:27:39 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
 by mx.groups.io with SMTP id smtpd.web10.62089.1702646850406841421
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Dec 2023 05:27:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ideasonboard.com header.s=mail header.b=Yst1F3+g;
 spf=pass (domain: ideasonboard.com, ip: 213.167.242.64, mailfrom: laurent.pinchart@ideasonboard.com)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C51D7AF3;
	Fri, 15 Dec 2023 14:26:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702646801;
	bh=bOQvoJBdjtddSwzeEoJ/0WsJ+fnXXqdVD/YKMeZVs7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yst1F3+gp7tHixl0mQsFS7nQjj/D51h3zaKRB5IOhcN7OOjsyvoTrViSHfZxE0Xny
	 3OQ28GGRL/8+KfVAoLj6ERaCNn6+C6EP04WW8VHobh/lDmzLR2Gf8Pf5hUR0nQG4zI
	 MXT76/urQLrCmIXfd6B5Y+te9kBJ321Lw7GShPfc=
Date: Fri, 15 Dec 2023 15:27:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	libcamera-devel@lists.libcamera.org,
	openembedded-devel@lists.openembedded.org
Subject: Re: [libcamera-devel] [PATCH 19/20] libcamera: skip until upstream
 resolves python 3.12 compatibility
Message-ID: <20231215132735.GM12450@pendragon.ideasonboard.com>
References: <20231215075239.3049865-1-alex@linutronix.de>
 <20231215075239.3049865-19-alex@linutronix.de>
 <170263538033.2829918.17327515467462630423@ping.linuxembedded.co.uk>
 <170263553291.2829918.9491731797867514491@ping.linuxembedded.co.uk>
 <CANNYZj-gFpOob-QsksbNiv-YFvDe6D=G8GLSz7X7LTfEJ78erA@mail.gmail.com>
 <20231215125050.GK21146@pendragon.ideasonboard.com>
 <8734w3txce.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8734w3txce.fsf@baylibre.com>
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 13:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107518

On Fri, Dec 15, 2023 at 02:21:53PM +0100, Mattijs Korpershoek wrote:
> On ven., d=C3=A9c. 15, 2023 at 14:50, Laurent Pinchart via libcamera-de=
vel wrote:
> > On Fri, Dec 15, 2023 at 01:04:02PM +0100, Alexander Kanavin via libca=
mera-devel wrote:
> >> That's right.
> >>=20
> >> This page provides hints for how to replace usage of imp with
> >> equivalents in importlib:
> >> https://docs.python.org/3.11/library/imp.html
> >
> > The trouble is that the code in libcamera that uses imp isn't ours, i=
t's
> > copied as-is from a third-party project. If we're lucky they will hav=
e
> > fixed the issue, and we can just take the latest version.
>=20
> If this is in mojo, seems that chromium fixed it:
> https://chromium.googlesource.com/chromium/src/+/f5f6e361d037c316306611=
86e7bd7b31d2784cb8

Nice :-) Looks like we have a (hopefully easy) path forward.

Thank you for checking.

> >> On Fri, 15 Dec 2023 at 11:18, Kieran Bingham wrote:
> >> > Quoting Kieran Bingham (2023-12-15 10:16:20)
> >> > > +libcamera-devel mailing list
> >> > >
> >> > > Quoting Alexander Kanavin (2023-12-15 07:52:38)
> >> > > > I'd note that imp module has been deprecated for years, so tha=
t's what
> >> > > > happens when deprecation warnings are ignored.
> >
> > I haven't seen any warnings anywhere in the build process. Did I miss
> > them ?
> >
> >> > > Can you tell me more about what this issue is please? I'm not aw=
are of
> >> > > it at all.
> >> > >
> >> > > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> >> > > > ---
> >> > > >  meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.=
bb | 1 +
> >> > > >  .../packagegroups/packagegroup-meta-multimedia.bb            =
   | 1 -
> >> > > >  meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.0.bb=
   | 2 +-
> >> > > >  3 files changed, 2 insertions(+), 2 deletions(-)
> >> > > >
> >> > > > diff --git a/meta-multimedia/recipes-multimedia/libcamera/libc=
amera_0.1.0.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0=
.1.0.bb
> >> > > > index 2a3c6473e..9c04d7434 100644
> >> > > > --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0=
.1.0.bb
> >> > > > +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0=
.1.0.bb
> >> > > > @@ -73,3 +73,4 @@ FILES:${PN}-gst =3D "${libdir}/gstreamer-1.0=
"
> >> > > >  # both 32 and 64 bit file APIs.
> >> > > >  GLIBC_64BIT_TIME_FLAGS =3D ""
> >> > > >
> >> > > > +SKIP_RECIPE[libcamera] ?=3D "Not compatible with python 3.12,=
 see https://bugs.libcamera.org/show_bug.cgi?id=3D206"
> >> >
> >> > Aha, the clue was buried here.
> >> >
> >> > > > diff --git a/meta-multimedia/recipes-multimedia/packagegroups/=
packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/pack=
agegroups/packagegroup-meta-multimedia.bb
> >> > > > index 672c8abc9..6ca4d539f 100644
> >> > > > --- a/meta-multimedia/recipes-multimedia/packagegroups/package=
group-meta-multimedia.bb
> >> > > > +++ b/meta-multimedia/recipes-multimedia/packagegroups/package=
group-meta-multimedia.bb
> >> > > > @@ -42,7 +42,6 @@ RDEPENDS:packagegroup-meta-multimedia =3D "\
> >> > > >      tearsofsteel-1080p \
> >> > > >      pipewire \
> >> > > >      ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercia=
l", bb.utils.contains("DISTRO_FEATURES", "x11", "projucer", "", d), "", d=
)} \
> >> > > > -    libcamera \
> >> > > >      vorbis-tools \
> >> > > >      libopenmpt \
> >> > > >      mimic \
> >> > > > diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipew=
ire_1.0.0.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.0=
.bb
> >> > > > index b4da781f0..4d894349a 100644
> >> > > > --- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0=
.0.bb
> >> > > > +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0=
.0.bb
> >> > > > @@ -86,7 +86,7 @@ PACKAGECONFIG:class-target ??=3D " \
> >> > > >      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'syste=
md systemd-system-service systemd-user-service', '', d)} \
> >> > > >      ${@bb.utils.filter('DISTRO_FEATURES', 'alsa vulkan pulsea=
udio', d)} \
> >> > > >      ${PIPEWIRE_SESSION_MANAGER} \
> >> > > > -    ${FFMPEG_AVAILABLE} avahi flatpak gstreamer gsettings jac=
k libusb pw-cat raop sndfile v4l2 udev volume webrtc-echo-cancelling libc=
amera readline \
> >> > > > +    ${FFMPEG_AVAILABLE} avahi flatpak gstreamer gsettings jac=
k libusb pw-cat raop sndfile v4l2 udev volume webrtc-echo-cancelling read=
line \
> >> > > >  "
> >> > > >
> >> > > >  # "jack" and "pipewire-jack" packageconfigs cannot be both en=
abled,

--=20
Regards,

Laurent Pinchart

