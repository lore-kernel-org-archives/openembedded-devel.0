Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E7C2C35274
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 13:53:39 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.61998.1702646517603473765
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Dec 2023 05:21:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=QBLi1V/q;
 spf=pass (domain: baylibre.com, ip: 209.85.128.43, mailfrom: mkorpershoek@baylibre.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40c2c5a8150so6182595e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 05:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1702646516; x=1703251316; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9IME7/ehHvtQ1Rjrj2bOwZXF3CPDAGzfnmOA7eD6PV4=;
        b=QBLi1V/qbFgVjk4JMaB3hxhsDAUFcVbNDl+Hev7w7Z6xFf81vE2Jse6PeWD23ndqH9
         zkCFR9rXdrcqW9vtX5gIwnl78A40YtBJi3nAIuM1Hq0DMZ04LaumR7XXWCaqlDGqCnwS
         10BEBm4BwCBwkM55aTadw47bVMhp6D3jQHFEIU92ghetaN7MYq/ruOcVV94fuEBusKZM
         jhYzntb6VKA88hhoDaGMLkuHB9TU54luT9R1gqdiI/ozFEjc2Sthj10nglwXAWLakpwi
         bsL0S6s4mcuEbWJz6L1POsZ99SmvJPNeD4GfWko4rJv8Hdvq6akAig9nLhFUgcLpf1BP
         sgKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702646516; x=1703251316;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9IME7/ehHvtQ1Rjrj2bOwZXF3CPDAGzfnmOA7eD6PV4=;
        b=IZIoa6B2bEPAWweHq7CfX3HU9C4H5s9056uM+e7qEBrXC+ZBJghiWsJWS44BQA1fdE
         iaZgLs+PGLqaI+izYqsKoIrBZnagxkd1wkg4Gj37RPJsUxytxRYHRNsIlrycM+4IMVsC
         siySo+Xw8uKc8GlMIjeS1HUJg0+dXot7k01NxqXZdUE0ZoaITESWWBfPBlfgTw0AtvHo
         j53FjnkNNQIs0nSoJg1EjCb1OG83is/MpUxugszpXQOGwdtV9ReiO1qz3M55t5/978qy
         Q1kAI0hlVYFDlUOET/b2eqvRc31uGJoLnDBEaoEbbjbDcT6LNpu0NXhxU3su+pZFr85L
         7gjQ==
X-Gm-Message-State: AOJu0YyPMMeMfopntwSCeIbP8AxCR15Di0xvQ5AoShuFui82qzfU/xL4
	KKX+uSFHqcLotFUbT/H+EDkskA==
X-Google-Smtp-Source: AGHT+IESHpJfkU55IbDKQQJP+Sr73WL2i/BI0UIfPYmFQtVpPURhXo5z2ydKNY2cTcySiqZfPn05dQ==
X-Received: by 2002:a05:600c:46cf:b0:40c:3d90:49f1 with SMTP id q15-20020a05600c46cf00b0040c3d9049f1mr5573552wmo.125.1702646515989;
        Fri, 15 Dec 2023 05:21:55 -0800 (PST)
Received: from localhost ([89.207.171.106])
        by smtp.gmail.com with ESMTPSA id y8-20020adfee08000000b00336490c7433sm4267160wrn.31.2023.12.15.05.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 05:21:55 -0800 (PST)
From: "Mattijs Korpershoek" <mkorpershoek@baylibre.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Alexander Kanavin
 <alex.kanavin@gmail.com>
Cc: libcamera-devel@lists.libcamera.org,
 openembedded-devel@lists.openembedded.org
Subject: Re: [libcamera-devel] [PATCH 19/20] libcamera: skip until upstream resolves python 3.12 compatibility
In-Reply-To: <20231215125050.GK21146@pendragon.ideasonboard.com>
References: <20231215075239.3049865-1-alex@linutronix.de>
 <20231215075239.3049865-19-alex@linutronix.de>
 <170263538033.2829918.17327515467462630423@ping.linuxembedded.co.uk>
 <170263553291.2829918.9491731797867514491@ping.linuxembedded.co.uk>
 <CANNYZj-gFpOob-QsksbNiv-YFvDe6D=G8GLSz7X7LTfEJ78erA@mail.gmail.com>
 <20231215125050.GK21146@pendragon.ideasonboard.com>
Date: Fri, 15 Dec 2023 14:21:53 +0100
Message-ID: <8734w3txce.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 13:53:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107521

Hi Laurent,

On ven., d=C3=A9c. 15, 2023 at 14:50, Laurent Pinchart via libcamera-devel =
<libcamera-devel@lists.libcamera.org> wrote:

> On Fri, Dec 15, 2023 at 01:04:02PM +0100, Alexander Kanavin via libcamera=
-devel wrote:
>> That's right.
>>=20
>> This page provides hints for how to replace usage of imp with
>> equivalents in importlib:
>> https://docs.python.org/3.11/library/imp.html
>
> The trouble is that the code in libcamera that uses imp isn't ours, it's
> copied as-is from a third-party project. If we're lucky they will have
> fixed the issue, and we can just take the latest version.

If this is in mojo, seems that chromium fixed it:
https://chromium.googlesource.com/chromium/src/+/f5f6e361d037c31630661186e7=
bd7b31d2784cb8


>
>> On Fri, 15 Dec 2023 at 11:18, Kieran Bingham wrote:
>> > Quoting Kieran Bingham (2023-12-15 10:16:20)
>> > > +libcamera-devel mailing list
>> > >
>> > > Quoting Alexander Kanavin (2023-12-15 07:52:38)
>> > > > I'd note that imp module has been deprecated for years, so that's =
what
>> > > > happens when deprecation warnings are ignored.
>
> I haven't seen any warnings anywhere in the build process. Did I miss
> them ?
>
>> > > Can you tell me more about what this issue is please? I'm not aware =
of
>> > > it at all.
>> > >
>> > > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> > > > ---
>> > > >  meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb |=
 1 +
>> > > >  .../packagegroups/packagegroup-meta-multimedia.bb               |=
 1 -
>> > > >  meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.0.bb   |=
 2 +-
>> > > >  3 files changed, 2 insertions(+), 2 deletions(-)
>> > > >
>> > > > diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamer=
a_0.1.0.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0.bb
>> > > > index 2a3c6473e..9c04d7434 100644
>> > > > --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0=
.bb
>> > > > +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.1.0=
.bb
>> > > > @@ -73,3 +73,4 @@ FILES:${PN}-gst =3D "${libdir}/gstreamer-1.0"
>> > > >  # both 32 and 64 bit file APIs.
>> > > >  GLIBC_64BIT_TIME_FLAGS =3D ""
>> > > >
>> > > > +SKIP_RECIPE[libcamera] ?=3D "Not compatible with python 3.12, see=
 https://bugs.libcamera.org/show_bug.cgi?id=3D206"
>> >
>> > Aha, the clue was buried here.
>> >
>> > > > diff --git a/meta-multimedia/recipes-multimedia/packagegroups/pack=
agegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegro=
ups/packagegroup-meta-multimedia.bb
>> > > > index 672c8abc9..6ca4d539f 100644
>> > > > --- a/meta-multimedia/recipes-multimedia/packagegroups/packagegrou=
p-meta-multimedia.bb
>> > > > +++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegrou=
p-meta-multimedia.bb
>> > > > @@ -42,7 +42,6 @@ RDEPENDS:packagegroup-meta-multimedia =3D "\
>> > > >      tearsofsteel-1080p \
>> > > >      pipewire \
>> > > >      ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", =
bb.utils.contains("DISTRO_FEATURES", "x11", "projucer", "", d), "", d)} \
>> > > > -    libcamera \
>> > > >      vorbis-tools \
>> > > >      libopenmpt \
>> > > >      mimic \
>> > > > diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_=
1.0.0.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.0.bb
>> > > > index b4da781f0..4d894349a 100644
>> > > > --- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.0.bb
>> > > > +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.0.0.bb
>> > > > @@ -86,7 +86,7 @@ PACKAGECONFIG:class-target ??=3D " \
>> > > >      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd s=
ystemd-system-service systemd-user-service', '', d)} \
>> > > >      ${@bb.utils.filter('DISTRO_FEATURES', 'alsa vulkan pulseaudio=
', d)} \
>> > > >      ${PIPEWIRE_SESSION_MANAGER} \
>> > > > -    ${FFMPEG_AVAILABLE} avahi flatpak gstreamer gsettings jack li=
busb pw-cat raop sndfile v4l2 udev volume webrtc-echo-cancelling libcamera =
readline \
>> > > > +    ${FFMPEG_AVAILABLE} avahi flatpak gstreamer gsettings jack li=
busb pw-cat raop sndfile v4l2 udev volume webrtc-echo-cancelling readline \
>> > > >  "
>> > > >
>> > > >  # "jack" and "pipewire-jack" packageconfigs cannot be both enable=
d,
>
> --=20
> Regards,
>
> Laurent Pinchart

