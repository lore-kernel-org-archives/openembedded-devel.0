Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6ACA9799D2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 18:46:56 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id c25-v6so10120007qtp.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 11:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MRgjb68kMRSd0C6MGFa7+DcmGbFTHLCjjSjL2DAzI8E=;
	b=g7PbfC6PkKgEfa5P9gXX9awNyuANh7DsA1pdy4uW6K1T9j+pUF3Wx9gYsHlLijktYy
	OoZ0/SxP4BXYU7E43aPjxecpBWNKdHdFVdW+qW7I/jhW2oY9LNMLskcF8DcwhpZ6s1sB
	Hg1XwVASuzgV5Jvk+aBP8C6IqRAxg2FBdK6nw7Jakb50HaL1bu79oF4xRAUt4Y3sVp9N
	HMJqwwZpImUH98RmujUgQi4B6CmEfY0N1Frp1hMNBgBFz3b0gImPIG0RQJFQyE0+U52I
	R9g4xjsfyQI9y+pBq4ont1hirMWfzriFq/CMqs4nT66U5XMpdy0qu74jR7RZhv2kIux8
	6TxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MRgjb68kMRSd0C6MGFa7+DcmGbFTHLCjjSjL2DAzI8E=;
	b=cagdgWGSrvDqJgyV48VHpN/H2/AtGT2kQhohL9aCYgbtkiRFDMHTiIwDFYNpX0Fvul
	STtimActHgoiYNWs0kclgdzMzcaIcbEtNhA9RGLxYVehmtx7n8bWk6Hwj9NEdNYmi2YC
	RKzPu1HGbCmmFvyYhUHgwj17jZqWTKpsZMu9eXKDJQ8Z4iUNCnJZLloZDj5q1jK85hEe
	A0zUnivgTIilA8bcRGMtlIHmmdVol+SQBYN87wFZbuXJTvC1qP9Z+3Vza8AXsFlUDuIR
	hLxS2LbipwYolej1kQBlJgtq5c0LKFeUARIgy8hEvyyohOWpFn+dbpN3chB2AGzzLdOU
	sHGQ==
X-Gm-Message-State: ABuFfogmChBOFXs3DE8ei6clqfPJ5TzIl1y44wkJY96Jdklr1qnojuBg
	upW40MR/kgpkKQecmE3L8UEhJUoI89YM4dafrag=
X-Google-Smtp-Source: ACcGV61OKt8JOOdmxse8mK2x47XerJq8+bgYmZmwNjh2KtYzB40OG9hW6Nk9JjSsj75PrRH+FA7sOZ/fIm/FViOhtKI=
X-Received: by 2002:a0c:e552:: with SMTP id
	n18-v6mr1553995qvm.224.1538246817146; 
	Sat, 29 Sep 2018 11:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <20180929181029.22080-1-akuster808@gmail.com>
	<20180929181518.GB1449@jama>
In-Reply-To: <20180929181518.GB1449@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 29 Sep 2018 11:46:31 -0700
Message-ID: <CAMKF1spF3hNc5Bu68j3=+poRud6v6JLpbDd-gYvYJXvidiCkiA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH] mpd: fix yocto-check-layer issue with mulitmedia
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
X-List-Received-Date: Sat, 29 Sep 2018 18:46:56 -0000
Content-Type: text/plain; charset="UTF-8"

v2 needs to be rebased on top of master as well.
On Sat, Sep 29, 2018 at 11:15 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Sat, Sep 29, 2018 at 11:10:29AM -0700, Armin Kuster wrote:
> > ERROR: Nothing PROVIDES 'faad2' (but /home/akuster/oss/maint/meta-openembedded/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb DEPENDS on or otherwise requires it)
> >
> > enable acc only if LICENSE_FLAGS is commercial
>
> aac
>
> > Signed-off-by: Armin Kuster <akuster808@gmail.com>
> > ---
> >  meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
> > index c0d4c8c2b..aee9e0769 100644
> > --- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
> > +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
> > @@ -27,7 +27,8 @@ SRC_URI[sha256sum] = "8322764dc265c20f05c8c8fdfdd578b0722e74626bef56fcd8eebfb01a
> >  EXTRA_OECONF = "enable_bzip2=yes"
> >  EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
> >
> > -PACKAGECONFIG ??= "aac alsa ao bzip2 ffmpeg flac fluidsynth iso9660 jack libsamplerate mms mpg123 modplug sndfile upnp openal opus vorbis wavpack zlib"
> > +PACKAGECONFIG ??= "alsa ao bzip2 ffmpeg flac fluidsynth iso9660 jack libsamplerate mms mpg123 modplug sndfile upnp openal opus vorbis wavpack zlib"
> > +PACKAGECONFIG += "${@bb.utils.contains('LICENSE_FLAGS', 'commercial', 'aac', '', d)}"
> >
> >  PACKAGECONFIG[aac] = "--enable-aac,--disable-aac,faad2"
> >  PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

