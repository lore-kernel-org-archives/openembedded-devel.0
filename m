Received: from [206.46.173.13] (helo=vms173013pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Me585-00008k-P5
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 12:44:26 +0200
Received: from gandalf.denix.org ([71.255.235.240]) by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KOO00DRJ7OMA8G3@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	20 Aug 2009 05:26:52 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id AD26014AF5F; Thu,
	20 Aug 2009 06:26:46 -0400 (EDT)
Date: Thu, 20 Aug 2009 06:26:46 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090820102646.GE459@denix.org>
References: <20090820032802.GA32010@denix.org>
	<200908200752.58210.holger+oe@freyther.de>
	<20090820071052.GA459@denix.org>
	<h6j1rj$nvf$1@ger.gmane.org> <20090820090136.GD459@denix.org>
	<20090820094642.GA16618@jama>
MIME-version: 1.0
In-reply-to: <20090820094642.GA16618@jama>
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
X-List-Received-Date: Thu, 20 Aug 2009 10:44:26 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Aug 20, 2009 at 11:46:42AM +0200, Martin Jansa wrote:
> On Thu, Aug 20, 2009 at 05:01:36AM -0400, Denys Dmytriyenko wrote:
> > On Thu, Aug 20, 2009 at 10:34:58AM +0200, Koen Kooi wrote:
> > > On 20-08-09 09:10, Denys Dmytriyenko wrote:
> > >> On Thu, Aug 20, 2009 at 07:52:58AM +0200, Holger Hans Peter Freyther 
> > >> wrote:
> > >>> On Thursday 20 August 2009 05:28:02 Denys Dmytriyenko wrote:
> > >>>> Now, when SRCREV = "${AUTOREV}", AUTOREV gets resolved into a Python
> > >>>> function, which does the magic of fetching the latest snapshot from a
> > >>>> repository. But now if PV contains references to SRCREV, it breaks
> > >>>> (undesrandably), since SRCREV gets resolved in do_fetch and PV needs to 
> > >>>> be
> > >>>> resolved early on.
> > >>>>
> > >>>> Are there any standard ways to work around this limitation?
> > >>>
> > >>> Check the mailinglist archives... Openmoko has deployed a solution that 
> > >>> has
> > >>> fixed that about 1 1/2 years ago.
> > >>>
> > >>> Short answer:
> > >>> 	- Do not put SRCREV into PV, e.g. create a new var called SRCPV
> > >>> 	- Populate SRCPV with something based on the SRCREV..
> > >>
> > >> Ah, thanks! I was able to find your RFC message from last year on the 
> > >> Openmoko
> > >> mailing list:
> > >> http://markmail.org/message/v3s32gmxxqcaxpph
> > >>
> > >> I'll give it a try. Thanks.
> > >>
> > >> To be clear - it's not used in OE. While there is a single 
> > >> python-phoneutils
> > >> recipe, which references SRCPV, it is not being set anywhere, 
> > >> apparently...
> > >
> > > Take a look at 
> > > http://cgit.openembedded.org/cgit.cgi/openembedded/log/?h=xora/angstrom-srcpv 
> > > :)
> > 
> > Thanks! More specifically:
> > 
> > http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?h=xora/angstrom-srcpv&id=453a13c7a68087895f4048410aba1a519ec99897
> > 
> > Any ETA for the merge back to .dev? :)
> 
> Just out of my curiosity:
> 
> How are PREFERRED_VERSION_pkg supposed to work when I prefer pkg with
> autoreved revision.
> 
> bbfile will be named like pkg_git.bb
> inside will be PV="1.0.0+gitr${SRCPV}" and DEFAULT_PREFERENCE=-1
> 
> I would like to force using this _git version even when there will be
> pkg_1.1.0.bb with PV="1.1.0"
> 
> For fixed revision ie from sane-srcrevs i can bump PREFERRED_VERSION_pkg
> with every revision bump in sane-srcrevs, but it also suboptimal :/.
> 
> With autorev I cannot set PREFERRED_VERSION_pkg at all, if I understand
> it right, because I never know which string will be in ${SRCPV} and
> using just PREFERRED_VERSION_pkg="1.0.0+git" or "git" ends with
> "preferred version is not available". Setting PREFERRED_VERSION_pkg to
> "1.0.0+gitr${SRCPV}" is not expanded and ends with a bit confusing 
> bitbake exception about SRC_URI not referencing some SCM.
> 
> I've asked on IRC and they said that its common practise to remove
> PREFERRED_VERSION_pkg and adjust DEFAULT_PREFERENCE or blacklist all
> other versions (like that with PV="1.1.0").
> 
> Now I solved my problem with updating PV in recipies which weren't
> preferred by bitbake to latest version from all available (moved to
> PV="1.1.0+gitr${SRCPV}" when pkg_1.1.0.bb is commited and removed
> DEFAULT_PREFERENCE=-1.
> 
> Could it be solved better? Something like:
> 1) use .bb file with exact the same PV
> 2) use .bb file where PV starts with the same string as is in
> PREFERRED_VERSION_pkg if exact is not found and print warning.

Another approach, which may be even less elegant, would be to rename 
pkg_git.bb into pkg-git.bb, let it PROVIDE=pkg and select it by 
PREFERRED_PROVIDER_pkg=pkg-git, then its lower version wouldn't matter.

-- 
Denys


