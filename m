Return-Path: <ian@boundarydevices.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 446CF71DB8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 18:27:14 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id r45so72391159qte.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 11:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=boundarydevices-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RWIU5Ek0kghy4CW5gAsbZ/LPAuzp3ebRiSmPPxYNsg8=;
	b=0ACNT47AksSKLYlJYran5OfS2bFzdBu5x3hty7RN83Yv0E99xnxCPf+5jLOWXaeCv4
	9AodgzpXeX0SA78o3V8VLl4RgxEfxOBQFQkruKWAUerWO+2lB9Ljwke1VDUWopPKvAMe
	VaVX97IJRYZAbsHAWNuWVIMjgbKuTHBv+kBASNIlrUQJUulGN4csCPgLhYZXSe/sgO8u
	jF7IeqBz4iaKUMp+L9KxHGth145C/XbW1pStdtwaYDYq7RNCY1vtfldjJmQGs51zHy1W
	J4JI/8dxLs6RQw0iAFccFUthpfTO4ZDqjU7t1sxH6aY4XWok33QGjIFuTUdyICoXpL7t
	FLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RWIU5Ek0kghy4CW5gAsbZ/LPAuzp3ebRiSmPPxYNsg8=;
	b=Dg2nht3CDHyp1YkSVy3NuHwaVDs0Ro+vnsjTu//i1xDIe7PiktpRRW6MvQCiIdL7mX
	Nz/NAy7mIOdHRX5GPCiiOXiflaI7FYN9tnSQnM2QMKxTqRVDoPfi3Fg44E1yQD03l1VP
	3YjRNnejGymyNXFfpjPzNwdbP9wzHw7H8zOWF9XdPkRUaMRiVFALOHjvD5sInsSBzhBX
	BcwW6GRJaE2Bs+0IXxW6PYn45yL4VuwOoHxCaD+GRc8I98xaIydl8YuXq6O6NYXrctLg
	Al87fVvAgWUA/HOTYUM9pnWBaoiBaOpnosb5P99p6t4Eyakdby+5Q0PlnBETnCBy45+u
	353w==
X-Gm-Message-State: AFeK/H2Y4vTgjoS5Of8jnZVzmG1pAC4XPyfzWLb4SrrSMOPJ16ysob+kTuyPj3AuKVgBe8yc0vX4SFt35mtZCQ==
X-Received: by 10.237.57.37 with SMTP id l34mr4179285qte.114.1490984835989;
	Fri, 31 Mar 2017 11:27:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.55.103 with HTTP; Fri, 31 Mar 2017 11:27:15 -0700 (PDT)
In-Reply-To: <20170329220401.GQ15664@denix.org>
References: <CAHUNapSj77gK_kExofCWaeREZOqwQoHQei4YZbqE1F5Uh=2CFA@mail.gmail.com>
	<20170329220401.GQ15664@denix.org>
From: Ian Coolidge <ian@boundarydevices.com>
Date: Fri, 31 Mar 2017 11:27:15 -0700
Message-ID: <CADseiPkfT8uAF_eeA8Bpa5WtMQh1DFvDOVj++V+7ns3+CWGCnw@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser] calling all chromium recipe users
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Mar 2017 18:27:17 -0000
Content-Type: text/plain; charset=UTF-8

Chromium and Chromium-Wayland on IMX platform

Chromium is working great, although chromium-imx hasn't been updated yet
for the later 53.x versions as the patches for graphics need to be updated.

Chromium-Wayland hasn't worked in any of it's versions, or on wayland on
IMX in general for some time. Unless i'm doing something wrong... I've been
trying to get this working on the 48x version for a while now, I just get a
segfault on startup that looks like this

root@nitrogen6x-lite:~# google-chrome www.google.com
>
> [1:1:0327/214358:ERROR:image_metadata_extractor.cc(112)] Couldn't load
>> libexif. libexif.so.12: cannot open shared object file: No such file or
>> directory
>
> error: XDG_RUNTIME_DIR not set in the environment.
>
> error: XDG_RUNTIME_DIR not set in the environment.
>
> [512:512:0327/214400:ERROR:display.cc(148)] WaylandDisplay failed to
>> initialize hardware
>
> [512:512:0327/214400:FATAL:ozone_platform_wayland.cc(115)] failed to
>> initialize display hardware
>
> #0 0x00005524860a <unknown>
>
> #1 0x000055257dd0 <unknown>
>
> #2 0x0000558a506e <unknown>
>
> #3 0x000055989104 <unknown>
>
> #4 0x000055989a54 <unknown>
>
> #5 0x000055989b26 <unknown>
>
> #6 0x0000578ca552 <unknown>
>
> #7 0x00005521a1d4 <unknown>
>
> #8 0x00005521900a <unknown>
>
> #9 0x000054f3e4f8 ChromeMain
>
> #10 0x0000766e246a __libc_start_main
>
>
>> Received signal 6
>
> #0 0x00005524860a <unknown>
>
> #1 0x0000552488cc <unknown>
>
> #2 0x0000766f1020 <unknown>
>
> #3 0x0000766e26b6 <unknown>
>
> #4 0x0000766f040c gsignal
>
> #5 0x0000766f10fa abort
>
> #6 0x00005524842a <unknown>
>
> #7 0x000055257e98 <unknown>
>
> #8 0x0000558a506e <unknown>
>
> #9 0x000055989104 <unknown>
>
> #10 0x000055989a54 <unknown>
>
> #11 0x000055989b26 <unknown>
>
> #12 0x0000578ca552 <unknown>
>
> #13 0x00005521a1d4 <unknown>
>
> #14 0x00005521900a <unknown>
>
> #15 0x000054f3e4f8 ChromeMain
>
> #16 0x0000766e246a __libc_start_main
>
> [end of stack trace]
>
> Segmentation fault
>
>
>
On Wed, Mar 29, 2017 at 3:04 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> On Wed, Mar 29, 2017 at 03:35:22PM -0400, Trevor Woerner wrote:
> > When testing changes to the chromium[-wayland] recipes, it would be
> > great to know the layers, configurations, and MACHINEs with which
> > people are building.
> >
> > For example I care about chromium running on X11 for minnow
> > (meta-intel) and raspberry pi (meta-raspberrypi). How are other people
> > running chromium?
>
> chromium-wayland on TI platforms from meta-ti.
>
>
> > Also, are you able to run with accelerated graphics? If so, what
> > configuration are you using?
>
> Full acceleration is still in the works for our platforms.
> Very basic "hacky" way was to patch wayland.gyp to bypass the configure
> check
> for Mesa version:
> http://arago-project.org/git/?p=meta-arago.git;a=blob;f=
> meta-arago-distro/recipes-browser/chromium/chromium-
> wayland/0001-wayland.gyp-adjust-Mesa-version-to-work-
> with-TI-SGX-.patch;hb=HEAD
>
> --
> Denys
>
>
> > Specifically, I assume the trick is the correct configuration of various
> >
> >     PREFERRED_PROVIDER_virtual/X = Y
> >
> > where X is one of {mesa|gl|egl|gles1|gles2} and Y is probably
> > something BSP-specific. Is anything else needed to get accelerated
> > graphics working with chromium?
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

