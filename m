Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JZuLH-0002qw-Ag
	for openembedded-devel@openembedded.org; Thu, 13 Mar 2008 21:48:02 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2DKjkq3011890;
	Thu, 13 Mar 2008 20:45:46 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11787-03; Thu, 13 Mar 2008 20:45:42 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2DKjaBm011883
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 13 Mar 2008 20:45:37 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Paul Sokolovsky <pmiscml@gmail.com>
In-Reply-To: <20080313210052.0878a0b7@widy.localdomain>
References: <47D71B8F.1030108@balister.org>
	<f96d234e0803120708r3286e264w6fbd21e6381bc235@mail.gmail.com>
	<20080313101513.3e72ca08@widy.localdomain>
	<1205407690.4547.29.camel@dax.rpnet.com>
	<20080313210052.0878a0b7@widy.localdomain>
Date: Thu, 13 Mar 2008 20:45:37 +0000
Message-Id: <1205441137.4547.149.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: Git versus Hg
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Mar 2008 20:48:02 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-03-13 at 21:00 +0200, Paul Sokolovsky wrote:
> Sounds good. What I'm failing to grasp is where thresholds and tipping
> points of this logic. Why feature1 which potentially risky but was
> bound and restricted for specific usecase considered harmful, while
> feature2 with similar characteristics don't raise much concern? As
> usual for out-of-band questions, it's mostly rhetoric one.

I don't 100% follow, you mean when new features should be put on a
branch and when they can be directly committed?

> > An OE checkout here appears to weigh in at ~222MB. 
> 
> Aha, so I'm getting anachronic with this stuff - I kinda worn pink
> glasses that our codebase still/is some tens of megabytes. Well, 200Mb
> add weight to lightweight branches priority.

Right :)

> I'm not that much of proposing to have multiple copies around, than
> point that it's the most obvious way to deal with that, which people
> have been using all the time. You rejected SVN parallel, but make me
> come back to it in more explicit example:
> 
> Do you, or someone else of O-Hand folks have following setup:
> 
> -------
> svn co http://svn.o-hand.com/repos/poky/trunk
> then:
> svn switch http://svn.o-hand.com/repos/poky/branches/blinky
> or
> svn switch http://svn.o-hand.com/repos/poky/branches/clyde
> ...
> then again
> svn switch http://svn.o-hand.com/repos/poky/trunk
> -------
> 
> vs
> -------
> svn co http://svn.o-hand.com/repos/poky/trunk
> # Yes, all branches - customers may use any, so you probably want all
> # branches easily accessible, right?
> svn co http://svn.o-hand.com/repos/poky/branches
> -------

I actually have a full checkout and some symlinks which are kind of my
"svn switch" :).

> The 1st *is* the same in-place branch switching paradigm as git
> (except that it of course won't blow your uncommitted changes, etc.)
> Would you at least consider such workflow with SVN?

I think you'd find "svn switch" explodes fairly easily since its not
really designed to be used like that. Ignoring that, the IO (disk and
net) involved in svn switch is very heavy and it takes a comparative age
to run.

> So, it the case that we need lightweight in-place branches and select
> git, or select git, and use lightweight branches just becasue git
> postulates (forces by authority?) such workflow?

I use light weight branches in other projects (kernel work) and would
love to be able to use them for OE. git doesn't force that way of
working and you can still have multiple checkouts, just not many people
actually do that. Why? Because its actually a really useful feature :).

> And finally, there's still other alternative - for developers, to
> moderate their appetite, choosing only some healthy food subset, giving
> up on delicatessen which are so tasty for them, but can give stomach
> problems to users. That's the hg alternative. And developers won't
> necessary lose - they will skip the need to learn too complex and
> peculiar stuff (As was pointed several times by Koen and me, one
> doesn't really need to "learn" hg, at least to start working in
> similar manner to what we have now, and more advanced use should come
> in naturally either).
> 
> So, if you considered all these (and those) alternatives, compromises,
> and criteria, and think that what git offers worth more complicated
> learning and use curve for everyone in OE community, then that must be
> it. It's different from assuming that git will win anyway, and not
> caring about what entailments such choice will bring.

I don't deny the git UI is horrible. I've just said I consider git's
benefits in branching and the possible advantages an SCM in widespread
use has enough to outweight the UI.

> > This is why we now have things like staging ABI versioning. The user
> > gets warned of the incompatibility. No its not perfect but some of us
> > are already trying to address this kind of problem which already
> > exists without the SCM consideration.
> 
> I'm glad that we're moving in that direction. That kinda shows that
> we're not ready for that lightweight branches fully, but I'm glad
> people are ready to make required changes fast, as empty dirs issue
> shows. I just hope we're moving in that direction in consistent way. 
>
> In that regard, do you remember myself once proposing to make bitbake
> cache files to contain cache version suffix, so concurrent bitbake
> version can be used? You rejected that idea on the basis that
> concurrent bitbake version usage shouldn't be supported at all. I hope
> we see evolution in treating such cases. Not that the specific issue is
> relevant now - we're long out of 1.6 vs 1.8 move, but one day there may
> be 2.0, and it may become important again.

There will be a 2.0 someday if I have anything to do with it :)

On the subject of cache versioning, you would never want to run two
bitbakes on the same work directory at the same time. The cache file
acted as a kind of lock file against that although with the things in
the path to the cache file we have now, that doesn't work as well as it
once did.

If you switch between two bitbake versions, a cache rebuild isn't likely
to be too problematic or unreasonable though and that is the only real
result.

Just is case you don't realise, all recent versions of bitbake embed a
version number in the cache and will ignore it and rebuild if that
version isn't one they understand. This is part of the ongoing usability
drive I'm doing my best to push.

Cheers,

Richard




