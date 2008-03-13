Received: from [72.14.220.154] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pmiscml@gmail.com>) id 1JZsg2-0001qe-DD
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Mar 2008 20:01:24 +0100
Received: by fg-out-1718.google.com with SMTP id 13so2714479fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2008 11:59:07 -0700 (PDT)
Received: by 10.82.146.10 with SMTP id t10mr24051836bud.6.1205434747146;
	Thu, 13 Mar 2008 11:59:07 -0700 (PDT)
Received: from widy.localdomain ( [88.231.54.215])
	by mx.google.com with ESMTPS id p38sm22863316fke.13.2008.03.13.11.59.03
	(version=SSLv3 cipher=OTHER); Thu, 13 Mar 2008 11:59:05 -0700 (PDT)
Date: Thu, 13 Mar 2008 21:00:52 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080313210052.0878a0b7@widy.localdomain>
In-Reply-To: <1205407690.4547.29.camel@dax.rpnet.com>
References: <47D71B8F.1030108@balister.org>
	<f96d234e0803120708r3286e264w6fbd21e6381bc235@mail.gmail.com>
	<20080313101513.3e72ca08@widy.localdomain>
	<1205407690.4547.29.camel@dax.rpnet.com>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 72.14.220.154
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
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
X-List-Received-Date: Thu, 13 Mar 2008 19:01:27 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Thu, 13 Mar 2008 11:28:10 +0000
Richard Purdie <rpurdie@rpsys.net> wrote:

> On Thu, 2008-03-13 at 10:15 +0200, Paul Sokolovsky wrote:
> > Ok, so let's finally visualize how this unique feature would apply
> > to OE. So, we have set up all the BBPATH, build dir to reference to
> > OE working copy. Now, one magic spell, and OE working copy
> > transmogrifies into something else than it was before. What's next?
> > 
> > 1. Suppose that we have thought that before, and prepared separate
> > build dir for this another local branch. Here, it's important to not
> > miss which build dir to use for which of workdir's phases of moon.
> > That's a bit harder that it would be with branches checked out into
> > separate workdirs, but careful people indeed can run many days
> > before making mistake. But all in all, "lightweight branching in
> > OE" is not that "lightweight" as just issuing SCM command.
> 
> Agreed, using lightweight branches means you do have to be careful
> what you're doing with them. 

Sounds good. What I'm failing to grasp is where thresholds and tipping
points of this logic. Why feature1 which potentially risky but was
bound and restricted for specific usecase considered harmful, while
feature2 with similar characteristics don't raise much concern? As
usual for out-of-band questions, it's mostly rhetoric one.

> The kind of useful usecase I envisage is
> where some person says "can you commit foo?". In that case I can
> switch whatever checkout I'm using to OE.dev, update it, commit foo
> and push and then switch back to what I was doing. I might even merge
> it into a temporary merge'd branch of whatever head is compatible
> with my workdir so I can test it.

Ok.

> An OE checkout here appears to weigh in at ~222MB. 

Aha, so I'm getting anachronic with this stuff - I kinda worn pink
glasses that our codebase still/is some tens of megabytes. Well, 200Mb
add weight to lightweight branches priority.

> What you're
> proposing is that I should keep multiple copies of this around, just
> so I can do multiple things at once. If I don't have the right
> checkout handy that is 222MB of disk IO before I can do anything and
> 222MB of disk IO I then have to remove.
> 
> Whilst harddisk space is cheap, its not that cheap and even my new
> desktop which was custom spec'd for OE/poky work runs out frequently
> due to the number of things I'm working on at once. When I'm on the
> laptop the problem is a lot worse and thats with a laptop spec'd to
> cope with OE.

I'm not that much of proposing to have multiple copies around, than
point that it's the most obvious way to deal with that, which people
have been using all the time. You rejected SVN parallel, but make me
come back to it in more explicit example:

Do you, or someone else of O-Hand folks have following setup:

-------
svn co http://svn.o-hand.com/repos/poky/trunk
then:
svn switch http://svn.o-hand.com/repos/poky/branches/blinky
or
svn switch http://svn.o-hand.com/repos/poky/branches/clyde
...
then again
svn switch http://svn.o-hand.com/repos/poky/trunk
-------

vs
-------
svn co http://svn.o-hand.com/repos/poky/trunk
# Yes, all branches - customers may use any, so you probably want all
# branches easily accessible, right?
svn co http://svn.o-hand.com/repos/poky/branches
-------

The 1st *is* the same in-place branch switching paradigm as git
(except that it of course won't blow your uncommitted changes, etc.)
Would you at least consider such workflow with SVN?

So, it the case that we need lightweight in-place branches and select
git, or select git, and use lightweight branches just becasue git
postulates (forces by authority?) such workflow?


And finally, there's still other alternative - for developers, to
moderate their appetite, choosing only some healthy food subset, giving
up on delicatessen which are so tasty for them, but can give stomach
problems to users. That's the hg alternative. And developers won't
necessary lose - they will skip the need to learn too complex and
peculiar stuff (As was pointed several times by Koen and me, one
doesn't really need to "learn" hg, at least to start working in
similar manner to what we have now, and more advanced use should come
in naturally either).


So, if you considered all these (and those) alternatives, compromises,
and criteria, and think that what git offers worth more complicated
learning and use curve for everyone in OE community, then that must be
it. It's different from assuming that git will win anyway, and not
caring about what entailments such choice will bring.

> 
> > 2. Now suppose that we don't think that multiple builddirs is a
> > must. Then, we rm -rf tmp/ with each branch switch, or what? Btw, I
> > wonder how kernel people *actually* deal with that problem. Because
> > only CS freshman would buy into "very easy to switch context to fix
> > a bug, and then resume work on another feature." Real developers
> > know, that fixes are accompanied by testing.
> 
> See above, I can merge it into my current work tree and test. Yes,
> this assumes that my changes in the work tree don't influence the
> testing but most kernel developers and most OE developers can usually
> manage to work this out.
> 
> > 3. Now let's think what happens if mistake was made per above
> > (workdir not switched, tmp dir not removed, ...) - we either
> > already see errors during build and end up with garbled builddir,
> > or end up with builddir garbled, but in silent manner. The latter
> > is obvious good candidate case for submitting in a week bugs that
> > OE behaves.
> 
> The nature of OE means you can garble a workdir in thousands of
> different ways.
> 
> We are working on making rebuilds and recovery cheaper and detection
> of corruption better. 

That's nice.

> 
> > 4. And finally, what happens if we didn't think about all the above?
> > That's likely what will happen with newcomers and "mere users". They
> > may have no idea that building different OE branches may require
> > different builddirs. They may not know if given branch requires
> > that, or no. Ability to switch branches in-place would give them
> > false premise that it actually can be done easily. And give them
> > good tool to shoot themselves in feet.
> 
> This is why we now have things like staging ABI versioning. The user
> gets warned of the incompatibility. No its not perfect but some of us
> are already trying to address this kind of problem which already
> exists without the SCM consideration.

I'm glad that we're moving in that direction. That kinda shows that
we're not ready for that lightweight branches fully, but I'm glad
people are ready to make required changes fast, as empty dirs issue
shows. I just hope we're moving in that direction in consistent way. 

In that regard, do you remember myself once proposing to make bitbake
cache files to contain cache version suffix, so concurrent bitbake
version can be used? You rejected that idea on the basis that
concurrent bitbake version usage shouldn't be supported at all. I hope
we see evolution in treating such cases. Not that the specific issue is
relevant now - we're long out of 1.6 vs 1.8 move, but one day there may
be 2.0, and it may become important again.

> 
> Cheers,
> 
> Richard

[]

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


