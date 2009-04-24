Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1LxR5O-0004Jy-S8
	for openembedded-devel@openembedded.org; Fri, 24 Apr 2009 21:29:23 +0200
Received: (qmail 31654 invoked from network); 24 Apr 2009 19:24:36 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by  with SMTP; 24 Apr 2009 12:24:36 -0700
Date: Fri, 24 Apr 2009 12:24:35 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090424192435.GC15489@smtp.west.cox.net>
References: <gsst4a$cvj$1@ger.gmane.org> <49F1FCFB.9000205@balister.org>
	<gst2dn$u4j$1@ger.gmane.org>
	<20090424191413.GB15489@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20090424191413.GB15489@smtp.west.cox.net>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: reverting some csets that kill package upgrade paths
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
X-List-Received-Date: Fri, 24 Apr 2009 19:29:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 24, 2009 at 12:14:13PM -0700, Tom Rini wrote:
> On Fri, Apr 24, 2009 at 09:03:18PM +0200, Koen Kooi wrote:
[snip]
> > Upgrade paths are the foundation of package management, breaking them is  
> > stabbing people using your binaries in the eye. Do you want to tell the  
> > companies evaluating OE using .dev that they can't use the feature  
> > anymore that drew them to OE, namely package management?
> >
> > If it's OK to break package management is it OK to break toolchains as  
> > well? If people can't use the resulting binaries it should be OK to  
> > break the compiler that would build them, right?
> >
> > Without upgrade paths OE is just buildroot with a really slow parser on top.
> 
> So it's not OK to say "Upstream changed things, and we're following suit
> here in the development line.  Over in the stable line we're adding the
> extra overhead to allow for a clean upgrade path".

To be clear going from stable/2009 to stable/2011 should work iff via
stable/2010.  And in stable/2011 we shouldn't have RCONFLICT/RPROVIDES
libwhatever-rename-happend-in-2009.  But I don't think updating dev on a
live system from a few months ago to a few months in the future has to
absolutely work with no human intervention.  It sounds like some apps
need to be rebuilt vs the new libraries or so and that's the problem.

-- 
Tom Rini


