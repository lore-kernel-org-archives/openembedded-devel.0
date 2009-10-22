Received: from [206.46.173.15] (helo=vms173015pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1N0m3a-0007na-8x
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Oct 2009 03:01:37 +0200
Received: from gandalf.denix.org ([71.251.63.147]) by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KRW00HTR5FW965D@vms173015.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	21 Oct 2009 20:00:11 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A633714AF60; Wed,
	21 Oct 2009 20:59:56 -0400 (EDT)
Date: Wed, 21 Oct 2009 20:59:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20091022005956.GA11194@denix.org>
References: <hbmose$gtv$1@ger.gmane.org>
	<200910211303.49278.holger+oe@freyther.de>
	<1256123428.14897.18.camel@opal>
	<hbmqrv$ne5$1@ger.gmane.org> <1256125373.14897.33.camel@opal>
	<1256151460.23211.40.camel@dax.rpnet.com>
MIME-version: 1.0
In-reply-to: <1256151460.23211.40.camel@dax.rpnet.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.15
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SCM fetched recipes without a SRCREV - e.g. libgee-native
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
X-List-Received-Date: Thu, 22 Oct 2009 01:01:37 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 21, 2009 at 07:57:40PM +0100, Richard Purdie wrote:
> On Wed, 2009-10-21 at 13:42 +0200, Michael 'Mickey' Lauer wrote:
> > Am Mittwoch, den 21.10.2009, 13:21 +0200 schrieb Koen Kooi:
> > > If we continue down the sane-srcrevs.inc route we should consider moving 
> > > PV_pn into there as well. Having SRCREV and PN in 2 different places 
> > > only adds confusion and leads to misversions.
> > 
> > Correct.
> > 
> > > Speaking of misversioning, I should really go through all scm fetched 
> > > packages I use and verify PV is correct for those.
> > 
> > Agreed, will have to do the same here.
> 
> Can I also suggest we start using SRCPV in PV, not SRCREV? This removed
> the need to play a lot of games with PV...
> 
> (Poky has switched to this now)

AFAIK, it's not merged in OE yet. I would definitely like to see it in OE.
Last time we discussed it, the agreement was to introduce SRCPV in 
bitbake.conf first and then gradually switch existing recipes over from 
SRCREV, instead of mass-updating all of them at once...

-- 
Denys


