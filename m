Received: from [209.85.200.173] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MQow9-0002OT-Vg
	for openembedded-devel@openembedded.org; Tue, 14 Jul 2009 22:49:19 +0200
Received: by wf-out-1314.google.com with SMTP id 28so1016052wfa.6
	for <openembedded-devel@openembedded.org>;
	Tue, 14 Jul 2009 13:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=8RHJKlouSDRUKZagJNpukMNacckkpPvl30nfRV5OcVk=;
	b=fyHmDhbSmS5yB28CR2vteaMCqj+h4t1rop0tt2PNYKl+2nIbae7ykYSHaZnLItkcaQ
	gzYTdJN7hykTUZdDIn7AYpTUimSeGN4brFumXnkMs6z4kM/UzKQZgw3vT+gLtgPrHc4b
	HZk1tMrhI8jRl/P4soxdtLPeeIffjEI8k/IOk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=CYOCQcto9Dnz+GkrA5vd4Nz/QB5OQgDeMGY5hU7BfeozljwPpFOcE6CkjQZ3E/Nw2m
	q7VkN2CN2p9n6GHhyuAzcM96aLPpT7kphVnXxmRuN4X9C2NSZsNijdF9vTSzkw9hlXaD
	7xoMstlOxb/4D/IRyPFOfMvos9r7ODHJkjKew=
Received: by 10.142.226.7 with SMTP id y7mr1626162wfg.303.1247603757468;
	Tue, 14 Jul 2009 13:35:57 -0700 (PDT)
Received: from gmail.com (adsl-71-146-11-93.dsl.pltn13.sbcglobal.net
	[71.146.11.93])
	by mx.google.com with ESMTPS id 24sm12094556wfc.17.2009.07.14.13.35.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 14 Jul 2009 13:35:56 -0700 (PDT)
Date: Tue, 14 Jul 2009 13:35:51 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090714203551.GA8460@gmail.com>
References: <200907121334.38852.raj.khem@gmail.com>
	<20090713035713.GA21203@denix.org>
	<1247600832.29960.18.camel@dax.rpnet.com>
MIME-Version: 1.0
In-Reply-To: <1247600832.29960.18.camel@dax.rpnet.com>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
Cc: openembedded-devel@openembedded.org
Subject: Re: e2fsprogs-libs build failure analysis
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
X-List-Received-Date: Tue, 14 Jul 2009 20:49:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (14/07/09 20:47), Richard Purdie wrote:
> Hi,
> 
> On Sun, 2009-07-12 at 23:57 -0400, Denys Dmytriyenko wrote:
> > On Sun, Jul 12, 2009 at 01:34:34PM -0700, Khem Raj wrote:
> > > Like many others I was also getting this problem reported on this mailing list in past 
> > > 
> > > http://article.gmane.org/gmane.comp.handhelds.openembedded/24445/match=e2fsprogs+libs
> > > 
> > > I looked a bit into this and the problem is that PN gets overwritten when 
> > > do_package_write_ipk -> read_subpackage_metadata 
> >
> > Have you seen this thread several months ago with the same analysis:
> > http://thread.gmane.org/gmane.comp.handhelds.openembedded/22376/focus=22556
> > 
> > As I said before, pkgdata/runtime handling needs fixing - if multiple recipes 
> > (or even target vs. native/sdk of the same package, like it was with curl) 
> > provide the identically named .so library (libblkid in this case) during the 
> > build, there may be a conflict in the pkgdata/runtime files.
> > 
> > What are the pkgdata files are used for ultimately? Do they need to contain 
> > PN/PV/PR? That was introduced by the commit mentioned in the thread above... 
> > Should it be reverted?
> > 
> > Lets ask Richard - he made this change in Poky, maybe he has a better fix for 
> > it... :)
> 
> The real problem here is two packages providing the same library. This
> is actually a critical error and means your distro is screwed unless
> handled very carefully. Rather than hacking around the problem, I'd much
> rather we detect and abort in this case and warn the user something is
> about to break and that any package feeds will need careful attention.

yeah I would agree on both counts.


> 
> Cheers,
> 
> Richard
> 
> 
> -- 
> Richard Purdie
> Intel Open Source Technology Centre
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


