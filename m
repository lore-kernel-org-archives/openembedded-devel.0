Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1234E731CF
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Jul 2019 20:08:18 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id i11so57510782edq.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Jul 2019 13:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ij5fvEKlXZqCjEKgMB+PsLXj3MHof4HRxEBILPCN0aI=;
	b=kjhZurry8HnLX1aiPh8WDngLQKivc+LYYCPAz+6/XLUS8a9CDmB3UwPqQ6yXPJbZ7c
	+b+/9JVmn3zmR6e1yTknVCfwuVrJrMyMa8IYcZypiMNyykccvj1+hivrOB5AZr/aaDeG
	DyOjX4rWacb7954vPby/+eZ13xy0X1wVfmtvvZzSRugXyvUc+tsEBG2HxK1w0wXkqN6k
	iNqNKpq+6ZPQsgNxmtUNPko12f49RnfpXtIXC1W0x75NKZsdYbo5O4/QQ3yIupMcM6xl
	8vSztlek7CSFOYVGVPLWCDOeFgHLIwhh8Ktl/td4+op09dM7x6kItLEPY1TSud0mfax6
	Kmpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ij5fvEKlXZqCjEKgMB+PsLXj3MHof4HRxEBILPCN0aI=;
	b=iN0Db9XAC7VmYa367M2VOXAFkoAlF/9zi9Ww/O10+4CudNzJAIh7dS3nire1CPMHDv
	g7+Sp3gxFinLoujOfdpNu7fn9nrt3iOobYpZCz1NdmsISF+FNaVCh6y9Z2X2rL8Ze2st
	p/OmPk6uZhbICPJcGuqX2IHlb2Yv7GfnLERnEsYirc3tvtZO/LiojS9vXDtB1y6NDn65
	HwMziSz2qUcPN/KdE1v3l+f/FJMrHw2X0bPIaJ5GbBvTbQjfV08/0vagvB3RAEs8DTh0
	BzCQX0OqGveduivQKfguIfR1+4ohoIOiFnlnPvcOt6vhk7U8jCMlA2iipfcT55YI0MvS
	r4/A==
X-Gm-Message-State: APjAAAXQGdQKrFNoAkIclZxleLZDknBAdEgTUbqVJc0gEZB2sg0cISxz
	PsFNxvPZ6j4HpiQV/LPhu+1WBwhUbMeaaYe75qM=
X-Google-Smtp-Source: APXvYqzYAlamt/VuoDdQ+wQKABBmfBfdbL7rW/Rx8xgsIpNICe3YmUaYrQrcFZQHdwd4fTr39pqtXpepOiPGjmpuCT4=
X-Received: by 2002:a17:906:e95:: with SMTP id
	p21mr80428559ejf.205.1564344499535; 
	Sun, 28 Jul 2019 13:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190728105220.20595-1-bunk@stusta.de>
	<69940a08-dfb2-cd3b-1e31-af3f69aa5591@gmail.com>
	<20190728162013.GA13799@localhost>
In-Reply-To: <20190728162013.GA13799@localhost>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 28 Jul 2019 22:08:24 +0200
Message-ID: <CA+chaQcF5WfXW_Ryo9q0Ub2rjMKmPUQVXNA_dAw5Nqr-9dCMWA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH] gnome-system-monitor: Add DEPENDS on polkit
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
X-List-Received-Date: Sun, 28 Jul 2019 20:08:19 -0000
Content-Type: text/plain; charset="UTF-8"

It does tell that there are errors, but we don't want errors in "bitbake
world" :).

inherit distro_features_check
REQUIRED_DISTRO_FEATURES = "polkit"

tells the same for gnome-system-monitor directly without showing any errors
(because it's automatically skipped when polkit isn't in DISTRO_FEATURES).

On Sun, Jul 28, 2019 at 6:20 PM Adrian Bunk <bunk@stusta.de> wrote:

> On Sun, Jul 28, 2019 at 08:32:37AM -0700, Khem Raj wrote:
> >
> > On 7/28/19 3:52 AM, Adrian Bunk wrote:
> > > The build fails without polkit in DISTRO_FEATURES:
> > > FAILED: org.gnome.gnome-system-monitor.policy
> > > msgfmt: cannot locate ITS rules for
> org.gnome.gnome-system-monitor.policy.in
> > >
> > > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > > ---
> > >   .../gnome-system-monitor/gnome-system-monitor_3.32.0.bb          |
> 1 +
> > >   1 file changed, 1 insertion(+)
> > >
> > > diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/
> gnome-system-monitor_3.32.0.bb
> b/meta-gnome/recipes-gnome/gnome-system-monitor/
> gnome-system-monitor_3.32.0.bb
> > > index 701b0891c..8d39101e9 100644
> > > --- a/meta-gnome/recipes-gnome/gnome-system-monitor/
> gnome-system-monitor_3.32.0.bb
> > > +++ b/meta-gnome/recipes-gnome/gnome-system-monitor/
> gnome-system-monitor_3.32.0.bb
> > > @@ -10,6 +10,7 @@ DEPENDS = " \
> > >       gtkmm3 \
> > >       libgtop \
> > >       librsvg \
> > > +    polkit \
> > >   "
> > this should be probably guarded with polkit as DISTRO_FEATURE knob as
> well.
>
> The error message already tells that automatically:
>
> ERROR: Nothing PROVIDES 'polkit' (but
> /home/bunk/sources/meta-openembedded/meta-gnome/recipes-gnome/gnome-system-monitor/
> gnome-system-monitor_3.32.0.bb DEPENDS on or otherwise requires it)
> polkit was skipped: missing required distro feature 'polkit' (not in
> DISTRO_FEATURES)
> ERROR: Required build target 'gnome-system-monitor' has no buildable
> providers.
> Missing or unbuildable dependency chain was: ['gnome-system-monitor',
> 'polkit']
>
>
> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

