Received: from [64.233.166.182] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pmiscml@gmail.com>) id 1JZ1BT-0001Wo-Ht
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 10:54:23 +0100
Received: by py-out-1112.google.com with SMTP id y77so2329440pyg.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2008 02:52:14 -0700 (PDT)
Received: by 10.65.112.5 with SMTP id p5mr12884835qbm.52.1205229133477;
	Tue, 11 Mar 2008 02:52:13 -0700 (PDT)
Received: from widy.localdomain ( [78.164.227.166])
	by mx.google.com with ESMTPS id w40sm10036618ugc.45.2008.03.11.02.52.11
	(version=SSLv3 cipher=OTHER); Tue, 11 Mar 2008 02:52:12 -0700 (PDT)
Date: Tue, 11 Mar 2008 11:52:54 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080311115254.18524853@widy.localdomain>
In-Reply-To: <200803110807.11368.zecke@selfish.org>
References: <200803110807.11368.zecke@selfish.org>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 64.233.166.182
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: zecke@selfish.org
Subject: Re: Reconsidering the work flow and how the SCM system fits in
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
X-List-Received-Date: Tue, 11 Mar 2008 09:54:23 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Tue, 11 Mar 2008 08:07:10 +0100
Holger Freyther <zecke@selfish.org> wrote:

> Hey,
> 
> I'm anything but happy with the way we work with our repository. We
> have a dreambox branch that is not mergable due issues with our SCM
> system, the OpenMoko guys have to go back to diffing and applying the
> diff and merging by hand, we just commit fundamental changes like
> sysroot, packaged-staging, RFCs in one go and then do weeks of
> fixing. And I can continue with this list.
> 
> What: I think we should use more branches
> 	- As many shortlived and medium lived branches as developers
> want
> 	- Shared branches for stuff like packaged staging, RFCs,
> sysroot. Were you start the development, add features, other people
> will compile their stuff, other compile and then you rebase and merge!
> 	- Basicly you develop a feature in a branch until it is ready
> and not impacting other things, then you rebase/cleanup, propose it
> for inclusion and wait for feedback, then merge.

These latest 2 sound very nice in "SCM for dummies" book, but work in
real life only if many people are *forced* to do that. Works well in
commercial shops ;-). I doubt that's scalable for an average OpenSource
project.

> 	- Stable distributions and vendors get their own branch, they
> can merge, cherry-pick what ever they want.
> 
> 
> The issue:
> 	- mtn can not merge. Forcing me to manually delete files in
> one copy to do a merge is not acceptable.
> 	- mtn has not the concept of short-lived branches (e.g.
> deleting their existence once done), mtn suspend does not work as
> witnessed by our automerger.
> 	- mtn pluck is not making me happy
> 	- I lack a GUI to easily browse the repository
> 	- I can not clean up changes before I push them!

I kinda agree with these.

> I want that we use more branches for development, apply review on
> them, land/merge/push these branches after review, pull peoples
> changes from other hosts, work on perfetch patch series before
> landing patches. I believe we need to deploy this kind of development
> in OE again and as mtn is the obstacle to this kind of development I
> propose to switch to another SCM system that allows us to develop
> OpenEmbedded the way it should be developed.

I would sound my personal contributing developer's opinion here by
saying that any migration talks may happen only if complete changes
migration is proposed. Losing history is unacceptable. Not being able
to trace changelog beyond bitkeeper migration point is pretty
disabling already.

> 
> My criteria:
> 	- Should have branches, easy merging, easy merging of merges
> 	- Branches and merging should be cheap
> 	- Make it easy to put the OE tree into another SCM and still
> be able to merge (git-svn and such)
> 	- A good graphical tool to browse the repository
> 	- A good and maintained web frontend
> 	- A good set of builtin tools (e.g. like git-add -i and
> git-rebase -i)
> 
> I think the two options are hg and git, I tend to favor git due the
> size of its community. 

git suxx, hg rules ;-D. Well, I yet have to see an SCM which does
merges and cherry-picking properly (recording all merge events,
allowing to merge and recombine in arbitrary order, etc.).

And I have no idea how hg supports rebase and stuff, or used it in git
either. I'm sure they suck at that ;-). Also, good political move for
making choices for diversified community which cannot reach concord is
to select worst choice, not the best - this way noone will feel made
wrong in favor of others ;-). That worked well for me with mtn - I
currently feel much better about it than when I started, and glad that
I was made acquainted with yet another SCM. 

Well, per all abobe reasons, I vote for git too. 

> I want to switch OE to one of these systems by
> the end of this month and start using more branches and creating
> perfect patch series again.

Push it, push it! But with complete history, of course.

> 
> 
> comments? agreement?
> 
> 	z.
> 
> 
> PS: It is not the speed of mtn, it is the lack of development in
> areas like branches, merging, rebasing, we need to use these in OE!


-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


