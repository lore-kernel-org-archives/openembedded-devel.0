Return-Path: <laurent.pinchart@ideasonboard.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31358C35274
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 12:50:49 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
 by mx.groups.io with SMTP id smtpd.web10.61470.1702644645688094752
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Dec 2023 04:50:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ideasonboard.com header.s=mail header.b=PmIbRscN;
 spf=pass (domain: ideasonboard.com, ip: 213.167.242.64, mailfrom: laurent.pinchart@ideasonboard.com)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2DBCDAF3;
	Fri, 15 Dec 2023 13:49:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702644596;
	bh=qAMYbRemOfmE3gWQQZbhpMslzkrOGRZPKkwiVUGOOys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PmIbRscNWV/NeEHz6McjpzwN+WQA2Ylm+j3j3QjmggEuf326dmwA8vh9xVv/zxbbe
	 jku0eQ8z0mQFDdgt/3LO6h+XgOk2tCqvFYVp0tSUVQUPeL1PYW9BLK92mXQ2nx9lTQ
	 A3at4pnzQqSyegcenC3SCqMIm4Ou5WQZOJCfi1/o=
Date: Fri, 15 Dec 2023 14:50:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	libcamera-devel@lists.libcamera.org,
	openembedded-devel@lists.openembedded.org
Subject: Re: [libcamera-devel] [PATCH 19/20] libcamera: skip until upstream
 resolves python 3.12 compatibility
Message-ID: <20231215125050.GK21146@pendragon.ideasonboard.com>
References: <20231215075239.3049865-1-alex@linutronix.de>
 <20231215075239.3049865-19-alex@linutronix.de>
 <170263538033.2829918.17327515467462630423@ping.linuxembedded.co.uk>
 <170263553291.2829918.9491731797867514491@ping.linuxembedded.co.uk>
 <CANNYZj-gFpOob-QsksbNiv-YFvDe6D=G8GLSz7X7LTfEJ78erA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANNYZj-gFpOob-QsksbNiv-YFvDe6D=G8GLSz7X7LTfEJ78erA@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 12:50:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107517

On Fri, Dec 15, 2023 at 01:04:02PM +0100, Alexander Kanavin via libcamera-devel wrote:
> That's right.
> 
> This page provides hints for how to replace usage of imp with
> equivalents in importlib:
> https://docs.python.org/3.11/library/imp.html

The trouble is that the code in libcamera that uses imp isn't ours, it's
copied as-is from a third-party project. If we're lucky they will have
fixed the issue, and we can just take the latest version.

> On Fri, 15 Dec 2023 at 11:18, Kieran Bingham wrote:
> > Quoting Kieran Bingham (2023-12-15 10:16:20)
> > > +libcamera-devel mailing list
> > >
> > > Quoting Alexander Kanavin (2023-12-15 07:52:38)
> > > > I'd note that imp module has been deprecated for years, so that's what
> > > > happens when deprecation warnings are ignored.

I haven't seen any warnings anywhere in the build process. Did I miss
them ?

> > > Can you tell me more about what this issue is please? I'm not aware of
> > > it at all.
> > >
> > > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > > ---
> > > >  meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb | 1 +
> > > >  .../packagegroups/packagegroup-meta-multimedia.bb               | 1 -
> > > >  meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.0.bb   | 2 +-
> > > >  3 files changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb
> > > > index 2a3c6473e..9c04d7434 100644
> > > > --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb
> > > > +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb
> > > > @@ -73,3 +73,4 @@ FILES:${PN}-gst = "${libdir}/gstreamer-1.0"
> > > >  # both 32 and 64 bit file APIs.
> > > >  GLIBC_64BIT_TIME_FLAGS = ""
> > > >
> > > > +SKIP_RECIPE[libcamera] ?= "Not compatible with python 3.12, see https://bugs.libcamera.org/show_bug.cgi?id=206"
> >
> > Aha, the clue was buried here.
> >
> > > > diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
> > > > index 672c8abc9..6ca4d539f 100644
> > > > --- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
> > > > +++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
> > > > @@ -42,7 +42,6 @@ RDEPENDS:packagegroup-meta-multimedia = "\
> > > >      tearsofsteel-1080p \
> > > >      pipewire \
> > > >      ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", bb.utils.contains("DISTRO_FEATURES", "x11", "projucer", "", d), "", d)} \
> > > > -    libcamera \
> > > >      vorbis-tools \
> > > >      libopenmpt \
> > > >      mimic \
> > > > diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.0.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.0.bb
> > > > index b4da781f0..4d894349a 100644
> > > > --- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.0.bb
> > > > +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.0.bb
> > > > @@ -86,7 +86,7 @@ PACKAGECONFIG:class-target ??= " \
> > > >      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-system-service systemd-user-service', '', d)} \
> > > >      ${@bb.utils.filter('DISTRO_FEATURES', 'alsa vulkan pulseaudio', d)} \
> > > >      ${PIPEWIRE_SESSION_MANAGER} \
> > > > -    ${FFMPEG_AVAILABLE} avahi flatpak gstreamer gsettings jack libusb pw-cat raop sndfile v4l2 udev volume webrtc-echo-cancelling libcamera readline \
> > > > +    ${FFMPEG_AVAILABLE} avahi flatpak gstreamer gsettings jack libusb pw-cat raop sndfile v4l2 udev volume webrtc-echo-cancelling readline \
> > > >  "
> > > >
> > > >  # "jack" and "pipewire-jack" packageconfigs cannot be both enabled,

-- 
Regards,

Laurent Pinchart

