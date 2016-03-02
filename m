Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BD543770AB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Mar 2016 22:08:26 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 02 Mar 2016 14:08:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,530,1449561600"; d="scan'208";a="928289580"
Received: from gslim-mobl4.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.139.223])
	by fmsmga002.fm.intel.com with ESMTP; 02 Mar 2016 14:08:24 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 03 Mar 2016 11:08:21 +1300
Message-ID: <1592801.EHfQ34bF0n@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.2-301.fc23.x86_64; KDE/4.14.17; x86_64; ;
	)
In-Reply-To: <20160302132725.GC12524@mentor.com>
References: <20160225171903.GC2565@jama> <20160302103341.GA10529@jama>
	<20160302132725.GC12524@mentor.com>
MIME-Version: 1.0
Subject: Re: Still many meta-networking changes waiting in patchwork/master-next
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Mar 2016 22:08:27 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wed, 02 Mar 2016 08:27:26 Joe MacDonald wrote:
> [Re: [oe] Still many meta-networking changes waiting in patchwork/master-
next] On 16.03.02 (Wed 11:33) Martin Jansa wrote:
> > On Fri, Feb 26, 2016 at 08:39:45PM -0500, Joe MacDonald wrote:
> > > Hi Martin,
> > > 
> > > [Re: [oe] Still many meta-networking changes waiting in 
patchwork/master-next] On 16.02.26 (Fri 20:56) Martin Jansa wrote:
> > > > On Fri, Feb 26, 2016 at 01:13:17PM -0500, Joe MacDonald wrote:
> > > > > Hey Martin,
> > > > > 
> > > > > [[oe] Still many meta-networking changes waiting in 
patchwork/master-next] On 16.02.25 (Thu 18:19) Martin Jansa wrote:
> > > > > > Hi Joe.
> > > > > 
> > > > > > there are still 18 meta-networking commits in master-next:
> > > > > I thought I'd follow up to this and let you know I'll do something
> > > > > with
> > > > > these before the end of the month.  Almost all of them (waf-samba
> > > > > aside)
> > > > > obviously got missed because I'm watching patchwork based on
> > > > > 'meta-networking' and none of these had it in the subject line.
> > > > > 
> > > > > I think I've asked before, but are you curating all of those bundles
> > > > > by
> > > > > hand or have you got some machinery that filters patches into
> > > > > bundles
> > > > > based on path names in the patches?  Because that would be kind of
> > > > > neat
> > > > > to have.
> > > > 
> > > > I think I've answered before, but I'm filtering them manually based on
> > > > subject and also actual paths inside the patch. I also need to mark
> > > > them
> > > > "Accepted", "Superseded", ..  manually, there is git hooks which is
> > > > supposed to mark at least accepted one, but it finds 1 from 1000 if
> > > > any.
> > > 
> > > Yeah, I've seen the hooks trying to find something when I push commits
> > > and
> > > just spewing a slew of errors.  I generally do my best to stay on top of
> > > the status in patchwork, doing it all at one time, though.
> > > 
> > > > This is of course a bit error prone, especially when there are
> > > > multiple
> > > > versions of the same patch already in master-next - I usually end up
> > > > marking all versions merged patch as Accepted (unless I've marked
> > > > older
> > > > versions already as Superseded when filtering incoming queue).
> > > 
> > > I took a bit of time this afternoon to try to come up with a way to
> > > automate at least part of the process for me and I'm sure there's a
> > > better
> > > way to do it (hence why I asked again) but since it sounds like you're
> > > doing it by hand for a much larger space than I am, maybe there's not.
> > > 
> > > Anyway, for what it's worth, here's what I came up with:
> > >    git log --cherry-pick --format="'%s'" \
> > >    
> > >       oe/master-next...oe/master meta-networking | \
> > >       xargs -r -n1 pwclient search -f "%{id} %{name}" -s New
> > > 
> > > Which does pretty well, though it obviously goes a little insane if
> > > someone puts a ' in the short log, but it didn't seem worth trying to
> > > work
> > > around that pretty rare (I hope) corner case.  As an aside, the first
> > > time
> > > I did this I was using --format="\"%s\"" and the *very* top commit
> > > ('recipes: Replace "cp ...) showed me what kind of pain I'm in for when
> > > there are colliding characters in the short log.  It's ugly but nothing
> > > catastrophic.
> > > 
> > > So that gave me 14 of the patches you asked about.  The others were easy
> > > 
> > > to find:
> > >    git log --cherry-pick --format="'%s'" \
> > >    
> > >       oe/master-next...oe/master meta-networking | \
> > >       xargs -r -n1 pwclient search -f "%{id} %{name}" -s Accepted
> > > 
> > > But obviously they haven't been accepted into 'master' next, obviously
> > > just a typo or a mis-click at some point.  So that's not bad.
> > > 
> > > Once I had that sanity check done, it's easy to harvest them all:
> > >    git log --cherry-pick --format="'%s'" \
> > >    
> > >       oe/master-next...oe/master meta-networking | \
> > >       xargs -r -n1 pwclient search -f "%{name}" -s new | \
> > >       sed 's=\[.*\] *==;s="=.=g;s=\(.*\)="\1"=' | \
> > >       xargs -r -n1 git log --format="%h" --grep | \
> > >       xargs -r -n1 git cherry-pick -s
> > > 
> > > The hideous sed in the middle is just to throw out stuff from the
> > > pwclient
> > > output that doesn't appear in the git logs (eg. "[v2]") and to skip over
> > > the craziness that happens on the 'git log grep' if you have a " in the
> > > subject.
> > > 
> > > Run it a second time to grab the three 'accepted' patches and we're
> > > nearly
> > > done.
> > > 
> > > Setting aside all of the inspection steps that follow that nobody would
> > > want to automate, the same machinery applies equally well to keeping
> > > 
> > > patchwork up to date:
> > >    git log --cherry-pick --format="'%s'" \
> > >    
> > >       master...oe/master meta-networking | \
> > >       xargs -r -n1 pwclient search -f "%{id}" -s new | \
> > >       xargs -r -n1 pwclient update -s "accepted"
> > > 
> > > There's not really any point in running this one a second time for the
> > > patches already marked 'accepted'.
> > > 
> > > I've been using a version of this last one for a while now because the
> > > git
> > > hooks are non-functional.
> > > 
> > > The end result is that my semi-automated process above gets 17 of the 18
> > > patches you cited and the 18th (waf-samba.bbclass) is a special case
> > > that
> > > I don't think could ever be caught except by manual intervention.
> > > 
> > > Mostly just throwing this out there so that maybe it'll help you or
> > > someone else with similar tasks and maybe someone can look at what I'm
> > > doing and point out obvious flaws / shortcomings / bear-traps /
> > > improvements.  And also since I haven't bothered to put this into a
> > > shell
> > > function or git alias yet, at least my process is archived in the
> > > mailing
> > > list and I can find it again if I need it.
> > 
> > Thanks for trying to improve patchwork experience with bunch of scripts.
> > Personally I would prefer to just use gerrit (that's why I gave up
> > trying to work around patchwork issues with scripts and rather sort &
> > apply the patches manually with just small help from pwclient).
> 
> I've never been a fan of gerrit, but I've only used it on a couple of
> projects, so I don't really have a lot of experience with it.  Probably
> obviously, so long as the CLI experience isn't terrible and I can easily
> script around things that don't work well for me, I can work with almost
> anything.

FWIW, and I know some people may be tired of hearing about this without much 
visible progress, but we still have some people within Intel working on 
Patchwork as well as some automated patch testing functionality aimed at OE 
specifically, and they are making progress. I hope to have something to show 
pretty soon. It should eliminate a lot of the manual work required with the 
current version.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

