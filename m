Return-Path: <mbc@koumoul.net>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1AEE060125
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2015 08:31:04 +0000 (UTC)
Received: by igcrk20 with SMTP id rk20so7786919igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Oct 2015 01:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=nfeif+yhQtjRJdfEQdTqburHepQQ60rXXWwpXVjOkww=;
	b=kghDIgorYCJ48hw4tcfcAMWNDyGBFuRidiF9EHAPlDuXnUht4LrBp3LG9AXSz6C0Me
	JURGEjIV+TZlx1P3hWJ3/DJpaV5C9Vd2mcrT1qKBbkIMOZPI3lmTYUi4S4/HmYtiyJ8k
	rCHRnCDvA19n4pjUJ3bTcQdBKUKFueC4QPFig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=nfeif+yhQtjRJdfEQdTqburHepQQ60rXXWwpXVjOkww=;
	b=QbE/EN6tXgHMCKRiwwxqcwnszUftTt34TsFvr+sdqvEIKn2+urAGzqo12LsQEZfUqU
	hPSPV1AwzumWxqnq8nICHq6hD1LkiC2F71s/nl3urgOoiY4Rw2XFpXrCzpALn6Hs6YFp
	GNXkBPpiS77pfDAqv77nf0KKi0FzL9weLYN8yW9ezVb+DiFd+FVpVZOs2ZzKFWdZ/87M
	tJh/wbhPLC9O2oirNNBZWmCyl1SOHE47qJZrQx2Suuo0l8In60qW8viE+4eAVPU+2zKz
	WamG/dTlMEeAnuNEsiaTThh0uADLGrq5HUNJwD6AhZAqX+lVOHF2GbnxV6c/vA2YiVVb
	fsNg==
X-Gm-Message-State: ALoCoQliK8F7wW6lOY5a7eR8UZ52vvAmbvwFLpaVcBg6AJDGHoqgvKVONG0JZGT2KI77nWV4ILdO
MIME-Version: 1.0
X-Received: by 10.50.82.73 with SMTP id g9mr1970426igy.67.1444293064340; Thu,
	08 Oct 2015 01:31:04 -0700 (PDT)
Sender: mbc@koumoul.net
Received: by 10.79.111.6 with HTTP; Thu, 8 Oct 2015 01:31:04 -0700 (PDT)
X-Originating-IP: [2.13.130.70]
In-Reply-To: <20151006222919.GC2383@jama>
References: <1443950022-18541-1-git-send-email-manuel.bachmann@iot.bzh>
	<CAP9ODKo0weXR60NYM_SUMDd-jZTxTVyq4ki90V5PDoBNdVihdg@mail.gmail.com>
	<20151006222919.GC2383@jama>
Date: Thu, 8 Oct 2015 10:31:04 +0200
X-Google-Sender-Auth: Vpl2eYnmQqqvuhc28NdVJTw4pV0
Message-ID: <CANTDXNcxF2EC1aX9Kix=57DPwjd=Tj-qY98zUv7kXHihe-8W0Q@mail.gmail.com>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH][meta-oe] freerdp: get out of "nonworking", fix build, improve
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Oct 2015 08:31:05 -0000
Content-Type: text/plain; charset=UTF-8

Hi Martin,

Just did that ; I'm sending a new patch based on top of "master-next" right
now. It will be marked "v2", but title changes and mentions "PNBLACKLIST".

Regards,

*Manuel Bachmann, Graphics Engineer www.iot.bzh <http://iot.bzh> *


2015-10-07 0:29 GMT+02:00 Martin Jansa <martin.jansa@gmail.com>:

> On Tue, Oct 06, 2015 at 06:58:25PM -0300, Otavio Salvador wrote:
> > On Sun, Oct 4, 2015 at 6:13 AM, Manuel Bachmann <manuel.bachmann@iot.bzh>
> wrote:
> > > We make the "freerdp" recipe active again, fix the build
> > > by pulling a more recent version (the "stable" branches are
> > > buggy and useless), and fix ARM runtime with -fPIC.
> > >
> > > We can then :
> > > - make X11 non-mandatory ;
> > > - add support for Wayland ("wlfreerdp" client) ;
> > > - add support for DirectFB ("dfreerdp" client) ;
> > > - add support for GStreamer 1.0 ;
> > > - make "heavy" features such as pulseaudio, cups...
> > > non-mandatory.
> > >
> > > We really want to install the "winpr-makecert" tool to have
> > > TLS, but CMake does not position its RPATH cleanly, so let
> > > us have a custom patch for that until it gets sorted out.
> > >
> > > Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
> >
> > I fully agree with the changes and those are very welcome. However, it
> > would be good if you could move from nonworking in one patch and do
> > the changes here in another patch.
>
> I wanted to get rid of all nonworking directories, I'm sending patch
> series which reverts the recipe moves and replaces it with PNBLACKLIST.
>
> > Do you mind to rework it?
>
> Please rebase it on top of current master-next which already has such
> reverts.
>
> >
> > --
> > Otavio Salvador                             O.S. Systems
> > http://www.ossystems.com.br        http://code.ossystems.com.br
> > Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

