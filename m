Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OgsDs-0003MR-Uj
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 06:38:30 +0200
Received: by pxi16 with SMTP id 16so192756pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 21:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=RhoWA1gKdV1NbuXtijsel4DnApiQy+fjox3uqPzQ3YQ=;
	b=NY49CiHXsZixDsKZtFn1FD+54m3P5+ZQmcvJIVz3JKHjlhY1Rjwtk5Vxaci9gnSmYr
	FK9v1lreuMwpUHTzNzC1WlmL4LiURg4XVez6wf2mGeiBdMQ9EdJSjEj62+Pj2VLTcoGa
	dcxPonyrRh6vyPs0t/+ez6+lZUcS7llSCLDVg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=d6E8AubhGKQK3xEdu9kqPLNaAmd+mBxZLvRKDd9elxljZZtDmKKr0KrYkLGEeQCQhR
	yqe6GOqDfiUdU40FEuDjgdEaIvwRkI13RgGNKUZO2x1CBxt46H8NBe9FeB09UrdvIy81
	mPTl2ZLLHDvA0S+QyiVPPHuQXIrhG8G1SVjBM=
Received: by 10.114.61.8 with SMTP id j8mr8056296waa.228.1280983102894;
	Wed, 04 Aug 2010 21:38:22 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id d38sm17422444wam.20.2010.08.04.21.38.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Aug 2010 21:38:22 -0700 (PDT)
Date: Wed, 4 Aug 2010 21:38:12 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100805043812.GA9414@gmail.com>
References: <1280872040-31952-1-git-send-email-chase.maupin@ti.com>
	<1280915670.2692.350.camel@mill.internal.reciva.com>
	<AANLkTinBPTAF2UH0weQ7FKpHqFUBeLkzoO8kuQg41e+0@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F0802E91E8FFA@dlee06.ent.ti.com>
	<AANLkTi=8efwOur=U1Od-fMS7BdHGEBjydwYWona_NgVh@mail.gmail.com>
	<i3cun3$aoh$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <i3cun3$aoh$1@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] base.bbclass: add support for SOC_FAMILY in COMPATIBLE_MACHINES
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Aug 2010 04:38:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (05/08/10 01:56), Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 04-08-10 23:37, Khem Raj wrote:
> > On Wed, Aug 4, 2010 at 1:24 PM, Maupin, Chase <chase.maupin@ti.com> wrote:
> >>> -----Original Message-----
> >>> From: openembedded-devel-bounces@lists.openembedded.org
> >>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> >>> Khem Raj
> >>> Sent: Wednesday, August 04, 2010 2:49 PM
> >>> To: openembedded-devel@lists.openembedded.org
> >>> Subject: Re: [oe] [PATCH] base.bbclass: add support for SOC_FAMILY in
> >>> COMPATIBLE_MACHINES
> >>>
> >>> On Wed, Aug 4, 2010 at 2:54 AM, Phil Blundell <philb@gnu.org> wrote:
> >>>> On Tue, 2010-08-03 at 16:47 -0500, Chase Maupin wrote:
> >>>>> * Add support for using SOC_FAMILY in the COMPATIBLE_MACHINES
> >>>>>   setting for a recipe.
> >>>>> * This will allow recipes to work for entire families of
> >>>>>   devices without having to maintain/update the compatible
> >>>>>   devices as new devices are added into a family
> >>>>
> >>>> I don't suppose you'd consider refactoring your MACHINE names in order
> >>>> to allow a simple regex in COMPATIBLE_MACHINE?
> >>>
> >>> that would be a good approach too. Has it been
> >>> considered.
> >>
> >> As I mentioned before, we are matching the machine names to the name of the actual device.  Unfortunately, not every device that falls into an SOC family has a similar name and cannot all be dictated by us.  For example in omap3 SOC_FAMILY there is:
> > 
> > and omap3 family is armv7-a or cortex-a8 based can it have different
> > CPUs and be still categorized as omap3
> > is there omap3 specific you need which is not covered with armv7-a or cortex-a8
> 
> DSP, SGX, IVA, DSS, AESE, ISP, take your pick.

I see. Do we have knobs to toggle their use in some applications ?

> 
> regards,
> 
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> 
> iD8DBQFMWf4jMkyGM64RGpERAnM2AKCR2UEEdmgB/WFr0F9UZ55DqffJ0ACgrROX
> 7OIjSOU9ki67zIi8c1Xx66k=
> =nZ7Z
> -----END PGP SIGNATURE-----
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


