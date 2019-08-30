Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 59E697CF1B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 05:13:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46KSL72yjCz28;
	Fri, 30 Aug 2019 07:13:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567141999;
	bh=mc9+A0fguCLJ41+EoAoPKND001PuYk5E8Qq43BcbqDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ShWC3B34f1R0Qaq3i4FNDJ1d1+Lg9mhiX6w2uLTViKbSEUeGb8w234NrVfjJ5ey1b
	DaQo8FZ0xGWtB4RPwDx5xB7E5t1MNg0ciGLLyD76Db9RWdmixT6CMGEVqTMCXwLzdh
	4cU0fmYjSusKSfgDjZ6IVX989QtjBawCa0E4QPT4bn2iu8tuaFSPVjQL2HM2k7Fz11
	+tyZ0REwhZpyOZPrtEU0HTfxC39ILQiBBHm1htMOePFesHVSVV/LiprQoM6zY0oliF
	s1N1YkqrFRMFf2/XIfaL69CNBIeeuVzYFyebZ6k69JZ8wLC5yxRnAYuQ/KZG4496vr
	CEr996AvZRZEmkjYWPPSrC2q4sog/5imsYAAMip2fjpX8/9pAUiROmDinMxegYAhoo
	tx6DrFyQDHST3AsNBfLLMTIJrQgaN+PbLJG9o34DC7oJFiEMZ89D/sqmuHvFDAuNrp
	UuY7/7t/OXbkI6FMc+VwkOGf30r6+Ha1oi2cH2HABDj/Y+sj+8GJJUY238QHlzj4mZ
	haTu3D68nL0r35iWf+A9DJkGoWSY7598ob7SeIRLJ7ORhwwYbPmGtNU5mLsX9Ys6CN
	uIdcWo3Z6H0A13j9ZLl3GmGx3qaa19qHm4BBUdxpTr3tkB3akZX6NvfOulgYV+2JcP
	IN6a+51J2XJnXawDjGfWLv6U=
Date: Fri, 30 Aug 2019 08:13:17 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190830051317.GF24691@localhost>
References: <20190829103934.21804-1-bunk@stusta.de>
	<CAMKF1srGz8Zw4vh3_9GJsbmrKzARCrVHrs9k9tmd=aAznXHTHA@mail.gmail.com>
	<20190829191417.GA24691@localhost>
	<CAMKF1sp-XUzwLpW4_VfWkDOH8vuJ4TAo+Wgj+uPFS4DWSox1wg@mail.gmail.com>
	<20190829202554.GC24691@localhost>
	<CAMKF1sp0NpB-JgQSxvHCYurYtccv1NfU61a=VvTnYB+yArbrPQ@mail.gmail.com>
	<20190829212352.GD24691@localhost>
	<CAMKF1srqhNCYgMHkumXFda=ZLLfMOJB5ZhZJtMi00SpL5GTRYw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srqhNCYgMHkumXFda=ZLLfMOJB5ZhZJtMi00SpL5GTRYw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libwebsockets: Fix the build with -Os
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
X-List-Received-Date: Fri, 30 Aug 2019 05:13:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Aug 29, 2019 at 03:09:17PM -0700, Khem Raj wrote:
> On Thu, Aug 29, 2019 at 2:23 PM Adrian Bunk <bunk@stusta.de> wrote:
> > On Thu, Aug 29, 2019 at 01:51:05PM -0700, Khem Raj wrote:
>...
> > > and better still with a patch.
> >
> > But please do not add such patches to OE.
> >
> > Patches from people who don't know the code well are often quite buggy,
> > and fixing warnings then tends to add more bugs than it fixes.
> >
> > Google "Debian OpenSSL disaster" for how the Debian maintainer "fixing"
> > a Valgrind warning in the Debian OpenSSL package made private keys used
> > for ssh authentication in Debian/Ubuntu predictable (AKA everyone on the
> > internet could log into the affected machines).
> 
> right I remember that, but then I also know first-hand cases where the
> compiler was telling you all the way and it was
> ignored which ended up in field bugs, so there is no right answer.
>...

That's a lesson for upstream, not so much for a distribution.

The worst case is when people are just doing whatever is the fastest 
code "fix" to silence a warning/error.

When the compiler is telling that the C library does not support 
FNM_EXTMATCH, then ignoring the error with
  #define FNM_EXTMATCH 0
can turn it into a field bug.

Ignoring the compile error when the C library does not support qsort_r 
by using qsort instead can create exactly the runtime race conditions 
qsort_r is designed to avoid.

Finding correct solutions can be hard and time-consuming,
especially when the person doing the change does not know
the code in question well.

But few correct fixes are better than many quick fixes that might 
introduce more bugs than they fix.

And there is also a blame game involved:
If upstream software contains bugs, the blame goes to upstream.
If distribution patches introduce bugs, the blame goes to the
distribution.
Heartbleed was even worse than the above mentioned bug, but noone
could blame Debian for it.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


