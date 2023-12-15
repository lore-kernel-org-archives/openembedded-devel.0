Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFCBEC46CA2
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 12:04:18 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.60788.1702641855521970204
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Dec 2023 04:04:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TtEitIYm;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50bdec453c8so560666e87.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 04:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702641854; x=1703246654; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WFmfZaWzuwsfVsEYOOi0vU/pZGG/Bh4kiBVzlO912zY=;
        b=TtEitIYmKm56c7NtJjx3tMGjdfJSHg84jIoW/ptOQPu9mjdH+gT7xHZM5RSDxmm9lf
         yXenHpBFL7YWEcunxmnwTO+LQIF/vCaAsn+kCoev8nrt56+4ePwZoqk5Kcrox+/CZqmo
         ZA0InriO7JxFUjuM23QN7Vs/8LhjdhVUlQYvaJ/tTqWi3e+oB1Qi9FNLub01qOjMsB+P
         e5S2hQCfgE/V+QplrAji6l7/w6sCeJO8bVT+vnRUQEUlPzZv5Vy1QvHma2SdPnIok9pu
         FV0ul63HAB1of7MH9w3u5uUDHjTo8JFv0VRT2ZKm7SFVmY0rlZllPlbgTnNC4qmcvf6U
         0sKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702641854; x=1703246654;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WFmfZaWzuwsfVsEYOOi0vU/pZGG/Bh4kiBVzlO912zY=;
        b=ssTzTtumF4AYQ6+xnqdL+HskBSH6NauPmxrYeprs/MjnLh74BSsEVfHN3Kjphot57D
         dquRo551YIa0ZfqIawXklBTWQW5LLUkp9r6rlykV0Z77Hv/zDJJfIC0020JtDK2nMr/r
         X8WtRmfvkhmDW/lMO2bGAgpKH/utgd3qKXGstddiGflLgyE6zsn2LglnlYYXC9i9TpMR
         HxUaiByzGWRjxAatVIMoTsIA74aPme+yNBjcgGCq0kUFPAtJbk7p6OVWUrgiqRBmlbap
         cbPCucCYVcmBul7B2T8agGeoQssd5rmc6q9Cy5/E2yScYS6vybureQMye2kw66RtLk4D
         Cq9w==
X-Gm-Message-State: AOJu0Yyepunpt/YAmvqxKFE66lMEVFw9Mvj5Bxv524OVgo43Rqr207Wt
	SpKm6qSFam/nGQxy195xZYlpVYE/bnoezNTPnDCfv/NLrxY=
X-Google-Smtp-Source: AGHT+IEMN6q2F+EIegmP7ns5ydpI76pD6YckeAzq5l/mQGg92teerVh1IrrSPGuMYPk6dkWBZyu4b4+Ixy+KZCjgULA=
X-Received: by 2002:a05:6512:3156:b0:50b:f279:c9b with SMTP id
 s22-20020a056512315600b0050bf2790c9bmr5272018lfi.61.1702641853510; Fri, 15
 Dec 2023 04:04:13 -0800 (PST)
MIME-Version: 1.0
References: <20231215075239.3049865-1-alex@linutronix.de> <20231215075239.3049865-19-alex@linutronix.de>
 <170263538033.2829918.17327515467462630423@ping.linuxembedded.co.uk> <170263553291.2829918.9491731797867514491@ping.linuxembedded.co.uk>
In-Reply-To: <170263553291.2829918.9491731797867514491@ping.linuxembedded.co.uk>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 15 Dec 2023 13:04:02 +0100
Message-ID: <CANNYZj-gFpOob-QsksbNiv-YFvDe6D=G8GLSz7X7LTfEJ78erA@mail.gmail.com>
Subject: Re: [PATCH 19/20] libcamera: skip until upstream resolves python 3.12 compatibility
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: openembedded-devel@lists.openembedded.org, 
	libcamera-devel@lists.libcamera.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 12:04:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107516

That's right.

This page provides hints for how to replace usage of imp with
equivalents in importlib:
https://docs.python.org/3.11/library/imp.html

Alex

On Fri, 15 Dec 2023 at 11:18, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> Quoting Kieran Bingham (2023-12-15 10:16:20)
> > +libcamera-devel mailing list
> >
> > Quoting Alexander Kanavin (2023-12-15 07:52:38)
> > > I'd note that imp module has been deprecated for years, so that's what
> > > happens when deprecation warnings are ignored.
> >
> > Can you tell me more about what this issue is please? I'm not aware of
> > it at all.
> >
> > --
> > Kieran
> >
> >
> > >
> > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > ---
> > >  meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb | 1 +
> > >  .../packagegroups/packagegroup-meta-multimedia.bb               | 1 -
> > >  meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.0.bb   | 2 +-
> > >  3 files changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb
> > > index 2a3c6473e..9c04d7434 100644
> > > --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb
> > > +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb
> > > @@ -73,3 +73,4 @@ FILES:${PN}-gst = "${libdir}/gstreamer-1.0"
> > >  # both 32 and 64 bit file APIs.
> > >  GLIBC_64BIT_TIME_FLAGS = ""
> > >
> > > +SKIP_RECIPE[libcamera] ?= "Not compatible with python 3.12, see https://bugs.libcamera.org/show_bug.cgi?id=206"
>
>
> Aha, the clue was buried here.
>
> --
> Kieran
>
>
> > > diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
> > > index 672c8abc9..6ca4d539f 100644
> > > --- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
> > > +++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
> > > @@ -42,7 +42,6 @@ RDEPENDS:packagegroup-meta-multimedia = "\
> > >      tearsofsteel-1080p \
> > >      pipewire \
> > >      ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", bb.utils.contains("DISTRO_FEATURES", "x11", "projucer", "", d), "", d)} \
> > > -    libcamera \
> > >      vorbis-tools \
> > >      libopenmpt \
> > >      mimic \
> > > diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.0.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.0.bb
> > > index b4da781f0..4d894349a 100644
> > > --- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.0.bb
> > > +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.0.bb
> > > @@ -86,7 +86,7 @@ PACKAGECONFIG:class-target ??= " \
> > >      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-system-service systemd-user-service', '', d)} \
> > >      ${@bb.utils.filter('DISTRO_FEATURES', 'alsa vulkan pulseaudio', d)} \
> > >      ${PIPEWIRE_SESSION_MANAGER} \
> > > -    ${FFMPEG_AVAILABLE} avahi flatpak gstreamer gsettings jack libusb pw-cat raop sndfile v4l2 udev volume webrtc-echo-cancelling libcamera readline \
> > > +    ${FFMPEG_AVAILABLE} avahi flatpak gstreamer gsettings jack libusb pw-cat raop sndfile v4l2 udev volume webrtc-echo-cancelling readline \
> > >  "
> > >
> > >  # "jack" and "pipewire-jack" packageconfigs cannot be both enabled,
> > > --
> > > 2.39.2
> > >
> > >

