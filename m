Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Me24F-0001Mj-1i
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 09:28:15 +0200
Received: from gandalf.denix.org ([71.255.235.240]) by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KON00CRBYM7XZBA@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	20 Aug 2009 02:10:57 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5184714AF5F; Thu,
	20 Aug 2009 03:10:52 -0400 (EDT)
Date: Thu, 20 Aug 2009 03:10:52 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090820071052.GA459@denix.org>
References: <20090820032802.GA32010@denix.org>
	<200908200752.58210.holger+oe@freyther.de>
MIME-version: 1.0
In-reply-to: <200908200752.58210.holger+oe@freyther.de>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: Use AUTOREV and have revision/commit number in package	name?
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
X-List-Received-Date: Thu, 20 Aug 2009 07:28:15 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Aug 20, 2009 at 07:52:58AM +0200, Holger Hans Peter Freyther wrote:
> On Thursday 20 August 2009 05:28:02 Denys Dmytriyenko wrote:
> > All,
> >
> > I've been playing with AUTOREV for some time now and also asked this
> > question before on the IRC, but so far there seems to be no easy solution
> > to the problem in subject.
> >
> > Usually, when a package is built from an SCM repository, SRCREV is set to a
> > specific commit#/tag etc. And SRCREV is also usually referenced from PV
> > (like PV = "X.Y.Z-scmr${SRCREV}") to have the revision/commit number in the
> > package name, to easily track different builds.
> >
> > Now, when SRCREV = "${AUTOREV}", AUTOREV gets resolved into a Python
> > function, which does the magic of fetching the latest snapshot from a
> > repository. But now if PV contains references to SRCREV, it breaks
> > (undesrandably), since SRCREV gets resolved in do_fetch and PV needs to be
> > resolved early on.
> >
> > Are there any standard ways to work around this limitation?
> 
> Check the mailinglist archives... Openmoko has deployed a solution that has 
> fixed that about 1 1/2 years ago.
> 
> Short answer:
> 	- Do not put SRCREV into PV, e.g. create a new var called SRCPV
> 	- Populate SRCPV with something based on the SRCREV..

Ah, thanks! I was able to find your RFC message from last year on the Openmoko 
mailing list:
http://markmail.org/message/v3s32gmxxqcaxpph

I'll give it a try. Thanks.

To be clear - it's not used in OE. While there is a single python-phoneutils 
recipe, which references SRCPV, it is not being set anywhere, apparently...

-- 
Denys


