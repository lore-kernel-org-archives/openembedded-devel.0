Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E5AC44507
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 17:18:36 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.500.1783961564930029133
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jul 2026 09:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ideasonboard.com header.s=mail header.b=khYtPn6/;
 spf=pass (domain: ideasonboard.com, ip: 213.167.242.64, mailfrom: laurent.pinchart@ideasonboard.com)
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C50A1B41;
	Mon, 13 Jul 2026 18:43:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783961029;
	bh=dSP1sTNyRDok9EDPp8La+UB2Bm/pf47T0kTpyJwiJto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=khYtPn6/ZZhpoQZ+vhw67x0ms4b69jSj+DRCSunotTA11sXJAo/rp5KbAmO1bHqRp
	 E4A+RpiMEnHIhrOAUgzl8LYLbO4O+/h+4PBFO+P4bknL5RzZ9AgXwfnf03X50qvTqF
	 O6FhKm6A45yObhmbEV/THpkVEXnoe6NsdHN6wT6c=
Date: Mon, 13 Jul 2026 19:44:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Markus Volk <f_l_k@t-online.de>,
	openembedded-devel@lists.openembedded.org,
	"Kieran Bingham via lists.openembedded.org" <kieran.bingham=ideasonboard.com@lists.openembedded.org>,
	libcamera-devel@lists.libcamera.org,
	Robert Mader <robert.mader@collabora.com>
Subject: Re: [oe] [meta-multimedia][PATCH] libcamera: add libdrm dependency
Message-ID: <20260713164441.GH1127719@killaraus.ideasonboard.com>
References: <20260713091756.66416-1-f_l_k@t-online.de>
 <178393909487.727359.6008456952924140739@ping.linuxembedded.co.uk>
 <O6G4IT.2K2BXOEJZR5O@t-online.de>
 <178396059500.1428882.2934911266719928973@ping.linuxembedded.co.uk>
MIME-Version: 1.0
In-Reply-To: <178396059500.1428882.2934911266719928973@ping.linuxembedded.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jul 2026 17:18:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128162

On Mon, Jul 13, 2026 at 05:36:35PM +0100, Kieran Bingham wrote:
> +Cc libcamera-devel, Robert,
> 
> Quoting Markus Volk (2026-07-13 17:23:12)
> > Am Mo, 13. Jul 2026 um 11:38:14 +01:00:00 schrieb Kieran Bingham via 
> > lists.openembedded.org 
> > <kieran.bingham=ideasonboard.com@lists.openembedded.org>:
> > > Perhaps rather than add an incorrect dependency, we could backport the
> > > patch for the recipe or bump to libcamera-0.7.2?
> > 
> > That sounds reasonable. I have updated libcamera to v0.7.2 and now 
> > libyuv seems to be a requirement. It was formerly added by the 'virtual'
> > PACKAGECONFIG where I have no idea what this is for but removing this 
> > PACKAGECONFIG  and adding libyuv to DEPENDS fixes the build.
> > Since you know about libcameras dependencies: Is this the right thing 
> > to do or am I missing something about 'virtual'?
> 
> Aha, I wish I'd thought of that for the release notes.
> 
> There was a patch merged that makes virtual built in by default.
> 
> So adding libyuv as a dependency for 0.7.2 probably makes sense. I
> wonder if virtual should instead only be defaulted to build in when
> libyuv is available!

Not a good idea, that would break reproducible builds badly.

> > 0.7.2 builds for me like this:
> > 
> > diff --git 
> > a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb 
> > b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb
> > similarity index 97%
> > rename from 
> > meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb
> > rename to 
> > meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb
> > index 2b351a39be..4b5e735a37 100644
> > --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.1.bb
> > +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb
> > @@ -13,11 +13,11 @@ SRC_URI = " \
> >          
> > git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master;tag=v${PV 
> > <git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master;tag=v$%7BPV>} 
> > \
> >  "
> > 
> > -SRCREV = "183e37362f57ff3ce7493abf0bc6f1b57b931f55"
> > +SRCREV = "191e202178f02430b5942397c70d215cdd2056fa"
> > 
> >  PE = "1"
> > 
> > -DEPENDS = "python3-pyyaml-native python3-jinja2-native 
> > python3-ply-native python3-jinja2-native udev gnutls chrpath-native 
> > libevent libyaml"
> > +DEPENDS = "python3-pyyaml-native python3-jinja2-native 
> > python3-ply-native python3-jinja2-native udev gnutls chrpath-native 
> > libevent libyaml libyuv"
> >  DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase 
> > qtbase-native', '', d)}"
> > 
> >  PACKAGES =+ "${PN}-compliance ${PN}-gst ${PN}-pycamera"
> > @@ -38,7 +38,6 @@ PACKAGECONFIG[raspberrypi] = ",,libpisp"
> >  PACKAGECONFIG[sdl] = 
> > "-Dcam-output-sdl2=enabled,-Dcam-output-sdl2=disabled,virtual/libsdl2"
> >  PACKAGECONFIG[unwind] = 
> > "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
> >  PACKAGECONFIG[vimc] = ",,"
> > -PACKAGECONFIG[virtual] = ",,libyuv libjpeg-turbo"
> > 
> >  ARM_PIPELINES = "imx8-isi,mali-c55,simple,uvcvideo"
> >  # Raspberry Pi requires the meta-raspberrypi layer

-- 
Regards,

Laurent Pinchart

