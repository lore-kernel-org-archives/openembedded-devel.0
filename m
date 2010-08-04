Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OgWPT-0003QC-DC
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 07:21:05 +0200
Received: by gxk2 with SMTP id 2so1963807gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 22:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=8jz8Zqfic5mZSqPMsrhSrCX29YRTRnOmmrx9ckIuHSM=;
	b=NvSiBh0myne8shZzcB0yM+swuk1dbI2PKfr7mOjboK5cQq6EFsjpqdxixYCwyw7ilI
	e+GDUpDN+PprnT4tlly2m7f7EcIAyeZFQRTq8wOqL/qSa6dIkYCC6hJsaK5uu5UCeIrs
	nIqGvQC6RhqWbWfOTuHGG7/wVbmE6dfsBAtes=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=plphoQhuYkZnBqmSiL1DjK+AHh3izC/2XPmA/BUpYp4EjcHgwWVy1sU+x199DQTrm7
	4S668lcMeb5G37S/0X6d4glXnb8jWE2uaiPJ6Kn9VKSfrrb8BIUtnXv0TgsGrJociJ5f
	x/uhG08FRveGUByf6/xKVvpcS6HmHHT6/XrR4=
Received: by 10.150.230.14 with SMTP id c14mr7770675ybh.18.1280899250263;
	Tue, 03 Aug 2010 22:20:50 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id e7sm538279ybe.16.2010.08.03.22.20.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 03 Aug 2010 22:20:49 -0700 (PDT)
Date: Tue, 3 Aug 2010 22:20:42 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100804052042.GB7085@gmail.com>
References: <1280872040-31952-1-git-send-email-chase.maupin@ti.com>
	<20100804001959.GF17391@denix.org>
MIME-Version: 1.0
In-Reply-To: <20100804001959.GF17391@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.175
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
X-List-Received-Date: Wed, 04 Aug 2010 05:21:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (03/08/10 20:19), Denys Dmytriyenko wrote:
> On Tue, Aug 03, 2010 at 04:47:20PM -0500, Chase Maupin wrote:
> > * Add support for using SOC_FAMILY in the COMPATIBLE_MACHINES
> >   setting for a recipe.
> > * This will allow recipes to work for entire families of
> >   devices without having to maintain/update the compatible
> >   devices as new devices are added into a family
> > 
> > Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> 
> Acked-by: Denys Dmytriyenko <denys@ti.com>
> 
> While SOC_FAMILY feature is relatively new on its own, it was designed and now 
> being extensively used with TI machines and corresponding recipes as an 
> effective override - e.g. covering many OMAP3-based machines with a single 
> VAR_omap3 = "VAL" expression.

So arch -> sub-arch -> soc ->machine seems to be the heirarchy. I
would prefer to keep it per machine unless its too much clutter
and we have so many machines specific recipes.

> 
> > ---
> >  classes/base.bbclass |    4 +++-
> >  1 files changed, 3 insertions(+), 1 deletions(-)
> > 
> > diff --git a/classes/base.bbclass b/classes/base.bbclass
> > index 1847491..02c7875 100644
> > --- a/classes/base.bbclass
> > +++ b/classes/base.bbclass
> > @@ -389,7 +389,9 @@ python () {
> >              import re
> >              this_machine = bb.data.getVar('MACHINE', d, 1)
> >              if this_machine and not re.match(need_machine, this_machine):
> > -                raise bb.parse.SkipPackage("incompatible with machine %s" % this_machine)
> > +                this_soc_family = bb.data.getVar('SOC_FAMILY', d, 1)
> > +                if this_soc_family and not re.match(need_machine, this_soc_family):
> > +                    raise bb.parse.SkipPackage("incompatible with machine %s" % this_machine)
> >  
> >          need_target = bb.data.getVar('COMPATIBLE_TARGET_SYS', d, 1)
> >          if need_target:
> > -- 
> > 1.7.0.4
> > 
> > 
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


