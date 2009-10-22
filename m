Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1N0tMZ-0001zy-R8
	for openembedded-devel@openembedded.org; Thu, 22 Oct 2009 10:49:44 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n9M8jtlY003245 for <openembedded-devel@openembedded.org>;
	Thu, 22 Oct 2009 09:45:56 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id PMAbATKXXFek for <openembedded-devel@openembedded.org>;
	Thu, 22 Oct 2009 09:45:55 +0100 (BST)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n9M8jqh2003232
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@openembedded.org>;
	Thu, 22 Oct 2009 09:45:54 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20091022005956.GA11194@denix.org>
References: <hbmose$gtv$1@ger.gmane.org>
	<200910211303.49278.holger+oe@freyther.de>
	<1256123428.14897.18.camel@opal>
	<hbmqrv$ne5$1@ger.gmane.org> <1256125373.14897.33.camel@opal>
	<1256151460.23211.40.camel@dax.rpnet.com>
	<20091022005956.GA11194@denix.org>
Date: Thu, 22 Oct 2009 09:44:54 +0100
Message-Id: <1256201094.23211.64.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
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
X-List-Received-Date: Thu, 22 Oct 2009 08:49:44 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-10-21 at 20:59 -0400, Denys Dmytriyenko wrote:
> On Wed, Oct 21, 2009 at 07:57:40PM +0100, Richard Purdie wrote:
> > On Wed, 2009-10-21 at 13:42 +0200, Michael 'Mickey' Lauer wrote:
> > > Am Mittwoch, den 21.10.2009, 13:21 +0200 schrieb Koen Kooi:
> > > > If we continue down the sane-srcrevs.inc route we should consider moving 
> > > > PV_pn into there as well. Having SRCREV and PN in 2 different places 
> > > > only adds confusion and leads to misversions.
> > > 
> > > Correct.
> > > 
> > > > Speaking of misversioning, I should really go through all scm fetched 
> > > > packages I use and verify PV is correct for those.
> > > 
> > > Agreed, will have to do the same here.
> > 
> > Can I also suggest we start using SRCPV in PV, not SRCREV? This removed
> > the need to play a lot of games with PV...
> > 
> > (Poky has switched to this now)
> 
> AFAIK, it's not merged in OE yet. I would definitely like to see it in OE.
> Last time we discussed it, the agreement was to introduce SRCPV in 
> bitbake.conf first and then gradually switch existing recipes over from 
> SRCREV, instead of mass-updating all of them at once...

Either way is fine but this looks like a good time to think about it if
we're already assessing the variables!

Cheers,

Richard



