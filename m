Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MAUBF-0006Of-9F
	for openembedded-devel@openembedded.org; Sat, 30 May 2009 21:25:21 +0200
Received: (qmail 27843 invoked from network); 30 May 2009 19:16:47 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 30 May 2009 12:16:47 -0700
Date: Sat, 30 May 2009 12:16:47 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090530191647.GL23842@smtp.west.cox.net>
References: <20090522213142.GF23842@smtp.west.cox.net>
	<200905242049.30726.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
In-Reply-To: <200905242049.30726.marcin@juszkiewicz.com.pl>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Kernel recipes with broken PRs now
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
X-List-Received-Date: Sat, 30 May 2009 19:25:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 24, 2009 at 08:49:29PM +0200, Marcin Juszkiewicz wrote:
> Dnia pi??tek, 22 maja 2009 o 23:31:43 Tom Rini napisa??(a):
> > Hey all.  With the MACHINE_KERNEL_PR stuff, the following recipes
> > will now revert to r0 rather than:
> 
> One solution is to set PR after 'inherit kernel'. But thats workaround.

Perhaps this isn't so much a workaround but an opt-out ?  The more I
think about it, while this is a useful mechanism for machines that need
it, it's also a PITA for machines that don't (now you need to modify
your kernel recipe and bump something in your machine.conf, meaning full
cache rebuild just for a feature you aren't even using).  Comments?  I'm
tempted to just do that re-org next weekend, if no one beats me to it.

-- 
Tom Rini


