Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1JZ1iZ-00079l-Ph
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 11:28:25 +0100
Received: (qmail 21386 invoked by uid 813007); 11 Mar 2008 10:26:19 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 11 Mar 2008 10:26:19 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Mar 2008 11:25:59 +0100
User-Agent: KMail/1.9.9
References: <200803110807.11368.zecke@selfish.org>
In-Reply-To: <200803110807.11368.zecke@selfish.org>
MIME-Version: 1.0
Message-Id: <200803111126.04715.openembedded@haerwu.biz>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: openembedded@haerwu.biz
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
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
X-List-Received-Date: Tue, 11 Mar 2008 10:28:25 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia Tuesday 11 of March 2008, Holger Freyther napisa=B3:

> I'm anything but happy with the way we work with our repository. We
> have a dreambox branch that is not mergable due issues with our SCM
> system, the OpenMoko guys have to go back to diffing and applying the
> diff and merging by hand, we just commit fundamental changes like
> sysroot, packaged-staging, RFCs in one go and then do weeks of fixing.
> And I can continue with this list.

In short: our SCM situation suxx.

> What: I think we should use more branches
> 	- As many shortlived and medium lived branches as developers want
> 	- Shared branches for stuff like packaged staging, RFCs, sysroot. Were
> you start the development, add features, other people will compile
> their stuff, other compile and then you rebase and merge!
> 	- Basicly you develop a feature in a branch until it is ready and not
> 	  impacting other things, then you rebase/cleanup, propose it for
> inclusion and wait for feedback, then merge.
> 	- Stable distributions and vendors get their own branch, they can
> merge, cherry-pick what ever they want.

Agreed on that.

> The issue:
> 	- mtn can not merge. Forcing me to manually delete files in one copy
> to do a merge is not acceptable.

argh on that too

> 	- I lack a GUI to easily browse the repository

Does Mercurial has such one? GIT has gitk, qgit and probably something=20
more.

> 	- I can not clean up changes before I push them!

I do not know what exactly you mean here but from what I know it is doable=
=20
with GIT (exporting and re-importing patchsets).

> I want that we use more branches for development, apply review on them,
> land/merge/push these branches after review, pull peoples changes from
> other hosts, work on perfetch patch series before landing patches.=20

I like idea.

> I believe we need to deploy this kind of development in OE again and as
> mtn is the obstacle to this kind of development I propose to switch to
> another SCM system that allows us to develop OpenEmbedded the way it
> should be developed.

> My criteria:

> 	- Should have branches, easy merging, easy merging of merges
> 	- Branches and merging should be cheap
> 	- Make it easy to put the OE tree into another SCM and still be able
> 	  to merge (git-svn and such)
> 	- A good graphical tool to browse the repository
> 	- A good and maintained web frontend
> 	- A good set of builtin tools (e.g. like git-add -i and git-rebase -i)

Sounds like GIT :)

> I think the two options are hg and git, I tend to favor git due the
> size of its community. I want to switch OE to one of these systems by
> the end of this month and start using more branches and creating
> perfect patch series again.

When I have to choose between Mercurial (hg) and GIT I prefer to choose=20
GIT. It is because this one is more known to me and I know that it has=20
large users base. I also knew developers with lot of git experience so it=20
is easier to seek for help.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

 Learn the facts and make up your own damn mind. That's why you have one.




