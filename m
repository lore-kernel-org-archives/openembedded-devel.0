Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 239867F20A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Jul 2019 16:20:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45xShw3bNRz2C;
	Sun, 28 Jul 2019 18:20:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1564330816;
	bh=3n/R4nNH2LqvymkXHbegM2xmQMYMFHgIBKkmDoScO1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tjnGXNjZyfiaUhbBas075EwfiziX8tVQKwiL0vS4IwU5XYpOvPhkQSCSkfgb5O1eA
	YJSTdFw3P6p7oI92n+G4ZRAmHGCmXBqeKXgyfcW1QSlewiGJqznqtrd8DfUnxkcx1d
	sf1nBDsAVRirIHSP6CYIxBknFBpu7xIBarZ89hUJeV254vQ0n5nPyV424Upy9x/44k
	k24NmR8Ic4Qv9nvLi8fSJj2Hk2uz/NdyNMIwot6Pcep1V+3Z482WH0//djCSO/6INt
	H0gTIam6ZpJeZ2ftBZIkmplERiqqQM7vZm/PXfC3PsO9h5hKkJIJqdlWKn1+ivwp16
	LVpznRsMJkNXdSIHc8znmdAguyS0h7NaNldF783rfbR7E09keBR0bBHZ6loX4FcwBw
	5pY9NX7pLuFdDfM1TdjOaS05zSiZS5SHSX/+z/sF/H/5W6Itfyc63RqDRvfKvWB8cO
	krNu4hshQkNfbnk0Mx7MyxDNXkAWK0I7ntRgfBfaxHEQAUjztylMobTTV9abL+YnGf
	lGUR8yTo+z/1cZ4K69KutrKmCjkq2T6vivcIkBuxkKdajqODOpGaAdfrXke6ZF1bwy
	IpswawQwiDV/GFTsjZ7V8dmNBORD5EEJJQUmG28kDGQv8zPQjhm7ESqo+eBwJ2EJa2
	rebgXMUhZx72a/SBPgC8ei40=
Date: Sun, 28 Jul 2019 19:20:13 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190728162013.GA13799@localhost>
References: <20190728105220.20595-1-bunk@stusta.de>
	<69940a08-dfb2-cd3b-1e31-af3f69aa5591@gmail.com>
MIME-Version: 1.0
In-Reply-To: <69940a08-dfb2-cd3b-1e31-af3f69aa5591@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Sun, 28 Jul 2019 16:20:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Jul 28, 2019 at 08:32:37AM -0700, Khem Raj wrote:
> 
> On 7/28/19 3:52 AM, Adrian Bunk wrote:
> > The build fails without polkit in DISTRO_FEATURES:
> > FAILED: org.gnome.gnome-system-monitor.policy
> > msgfmt: cannot locate ITS rules for org.gnome.gnome-system-monitor.policy.in
> > 
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > ---
> >   .../gnome-system-monitor/gnome-system-monitor_3.32.0.bb          | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.0.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.0.bb
> > index 701b0891c..8d39101e9 100644
> > --- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.0.bb
> > +++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.0.bb
> > @@ -10,6 +10,7 @@ DEPENDS = " \
> >       gtkmm3 \
> >       libgtop \
> >       librsvg \
> > +    polkit \
> >   "
> this should be probably guarded with polkit as DISTRO_FEATURE knob as well.

The error message already tells that automatically:

ERROR: Nothing PROVIDES 'polkit' (but /home/bunk/sources/meta-openembedded/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.0.bb DEPENDS on or otherwise requires it)
polkit was skipped: missing required distro feature 'polkit' (not in DISTRO_FEATURES)
ERROR: Required build target 'gnome-system-monitor' has no buildable providers.
Missing or unbuildable dependency chain was: ['gnome-system-monitor', 'polkit']


cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


