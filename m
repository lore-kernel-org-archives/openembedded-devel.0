Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MQqVp-0000mT-OM
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jul 2009 00:30:13 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KMS00D79LUYZHHE@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	14 Jul 2009 17:16:15 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3E71814AF5F; Tue,
	14 Jul 2009 18:16:10 -0400 (EDT)
Date: Tue, 14 Jul 2009 18:16:10 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090714221610.GA31558@denix.org>
References: <200907121334.38852.raj.khem@gmail.com>
	<20090713035713.GA21203@denix.org>
	<1247600832.29960.18.camel@dax.rpnet.com>
	<20090714203551.GA8460@gmail.com>
MIME-version: 1.0
In-reply-to: <20090714203551.GA8460@gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
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
X-List-Received-Date: Tue, 14 Jul 2009 22:30:14 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Jul 14, 2009 at 01:35:51PM -0700, Khem Raj wrote:
> On (14/07/09 20:47), Richard Purdie wrote:
> > Hi,
> > 
> > On Sun, 2009-07-12 at 23:57 -0400, Denys Dmytriyenko wrote:
> > > On Sun, Jul 12, 2009 at 01:34:34PM -0700, Khem Raj wrote:
> > > > Like many others I was also getting this problem reported on this mailing list in past 
> > > > 
> > > > http://article.gmane.org/gmane.comp.handhelds.openembedded/24445/match=e2fsprogs+libs
> > > > 
> > > > I looked a bit into this and the problem is that PN gets overwritten when 
> > > > do_package_write_ipk -> read_subpackage_metadata 
> > >
> > > Have you seen this thread several months ago with the same analysis:
> > > http://thread.gmane.org/gmane.comp.handhelds.openembedded/22376/focus=22556
> > > 
> > > As I said before, pkgdata/runtime handling needs fixing - if multiple recipes 
> > > (or even target vs. native/sdk of the same package, like it was with curl) 
> > > provide the identically named .so library (libblkid in this case) during the 
> > > build, there may be a conflict in the pkgdata/runtime files.
> > > 
> > > What are the pkgdata files are used for ultimately? Do they need to contain 
> > > PN/PV/PR? That was introduced by the commit mentioned in the thread above... 
> > > Should it be reverted?
> > > 
> > > Lets ask Richard - he made this change in Poky, maybe he has a better fix for 
> > > it... :)
> > 
> > The real problem here is two packages providing the same library. This
> > is actually a critical error and means your distro is screwed unless
> > handled very carefully. Rather than hacking around the problem, I'd much
> > rather we detect and abort in this case and warn the user something is
> > about to break and that any package feeds will need careful attention.
> 
> yeah I would agree on both counts.

Sorry, this might be a stupid question, but can update-alternatives handle 
libraries? Would that solve the issue of multiple packages providing the same 
library?

-- 
Denys


