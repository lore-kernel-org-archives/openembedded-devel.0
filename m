Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HO0K9-000063-SH
	for openembedded-devel@openembedded.org; Mon, 05 Mar 2007 00:41:09 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l24Nf4VJ011583;
	Sun, 4 Mar 2007 23:41:04 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10327-08; Sun,  4 Mar 2007 23:41:00 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l24NevFX011571
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Sun, 4 Mar 2007 23:40:57 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Paul Sokolovsky <pmiscml@gmail.com>
In-Reply-To: <794972911.20070305013040@gmail.com>
References: <407130732.20070227223500@gmail.com>
	<1172609341.28406.169.camel@localhost.localdomain>
	<1828813817.20070227233137@gmail.com>
	<1172613830.28406.192.camel@localhost.localdomain>
	<794972911.20070305013040@gmail.com>
Date: Sun, 04 Mar 2007 23:40:58 +0000
Message-Id: <1173051658.5832.26.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] base_less_or_equal() for numerical value testing in OE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 04 Mar 2007 23:41:17 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-03-05 at 01:30 +0200, Paul Sokolovsky wrote:
> Wednesday, February 28, 2007, 12:03:50 AM, you wrote:
> > On Tue, 2007-02-27 at 23:31 +0200, Paul Sokolovsky wrote:
> > I've slowly being try to remove machine specific packages too
> > (tslib-conf is no longer machine specific in the standard case).
> 
>   Nice! Let's move this forward then, and think about guidelines how
> to handle different cases of machine-specificity. One bold example is
> udevd, which (at least last time I checked) was machine-specific only
> because for h2200, there was adhoc rule file added to override PCMCIA
> voltages settings for some cards. 

Well, I *hate* udev being machine specific. It was made machine specific
due to the different automounter blacklist files. Also, personally, I'd
prefer a whitelist, I've just never had the time to implement it. Or rip
it all out and write a better automounter scipt...

> As it is only additional file,
> there's really no need to contaminate base package, and instead I can
> imagine following ways to resolve it:
> 
> 1. Add that udevd rule to common machine config package, i.e.
> base-files.
> 2. Go even more clean and granular, and create own package for this
> rule, and MACHINE_EXTRA_RRECOMMEND it.

I'd always been thinking of splitting it out to a separate package. No
need to touch MACHINE_EXTRA_RRECOMMEND, just have udev RRECOMMEND it.

> >> hx4700: PACKAGE_EXTRA_ARCHS = "armv4 armv4t armv5te iwmmxt bigscreen"
> >> h4000: PACKAGE_EXTRA_ARCHS = "armv4 armv4t armv5te iwmmxt smallscreen"
> >> 
> >>   Voila, matching of actual bigsreen/smallscreen package will be done by
> >> ipkg.
> 
> > No. Adding architectures for every machine feature is just insane.
> 
>   Well, I understand that I raise few features at the same time, and
> it may be a bit confusing to follow thru them, but actual topic of all
> this - how to improve machine metadata handling in OE.
> 
>   So, I don't speak about adding virtual arch for every machine
> feature, but *only* for the screen size. That's the machine feature
> which seems as possibly calling for that - as it's not uncommon to
> supply image resources for different resolutions (i.e. these
> smallscreen/bigscreen arch packages won't be just for app), plus image
> resources are usually big enough to warrant placement into own
> package.

You only ask for screen size but I can guarantee that wouldn't be the
last request. I'm dead set against this.

>   But obviously, that's not the only possible solution. Other approach
> would be to consider smallscreen/bigscreen distinction just as a kind
> of app theming. So, there may be red color theme, blue color theme,
> or smallscreen or bigscreen theme. I'm not sure if ipkg handles OR
> dependencies, but we obviously can emulate them with Provides:
> 
> Package: foo
> Depends: foo-data
> 
> Package: foo-data-smallscreen
> Provides: foo-data
> 
> Package: foo-data-bigscreen
> Provides: foo-data
> 
> 
>   Drawback of this approach is complication of app installation - user
> will need to explicitly select which data package to install, whereas
> with "virtual arch" approach this would be handled by ipkg
> automagically.

The virtual-arch approach is a none starter IMO. I'd be interested to
know how ipkg handles the above scenario.

I don't think machine specific packages are that big a deal in
themselves, I do agree that having to edit .bb files for each machine as
standard is wrong though.

Cheers,

Richard



