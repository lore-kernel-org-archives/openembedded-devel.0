Received: from [64.233.170.188] (helo=rn-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1JZRf8-0007Z9-Ux
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Mar 2008 15:11:17 +0100
Received: by rn-out-0910.google.com with SMTP id s46so1761045rnb.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2008 07:08:28 -0700 (PDT)
Received: by 10.115.77.1 with SMTP id e1mr7038956wal.103.1205330906422;
	Wed, 12 Mar 2008 07:08:26 -0700 (PDT)
Received: by 10.114.190.2 with HTTP; Wed, 12 Mar 2008 07:08:26 -0700 (PDT)
Message-ID: <f96d234e0803120708r3286e264w6fbd21e6381bc235@mail.gmail.com>
Date: Wed, 12 Mar 2008 10:08:26 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <47D71B8F.1030108@balister.org>
MIME-Version: 1.0
References: <47D71B8F.1030108@balister.org>
X-SA-Exim-Connect-IP: 64.233.170.188
X-SA-Exim-Mail-From: cliff.brake@gmail.com
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
X-List-Received-Date: Wed, 12 Mar 2008 14:11:24 -0000
X-List-Received-Date: Wed, 12 Mar 2008 14:11:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Mar 11, 2008 at 7:53 PM, Philip Balister <philip@balister.org> wrote:
> Given the only serious contenders for possible SCM's for OE appear to be
>  git or Hg, I am curious about the expertise level available on this list.
>
>  Basically, let us know if you use git or Hg on a regular basis in a two
>  way workflow and consider yourself knowledgeable on sorting out problems
>  that crop up.

I use git regularly for kernel and u-boot development, and have
managed to get a flow going with multiple public repositories where
developers pull from public repositories.  This all works very well.
I have not set up a shared public repository yet, but will give it a
try to see how it works as I could use that capability that with a
current project.

Mercurial looks very interesting and nice in many aspects, but I have
not used it yet.  It seems to me one of the fundamental differences is
the concept of cheap/easy local branches.  Mercurial is working on
something like that
(http://www.selenic.com/mercurial/wiki/index.cgi/LocalBranches), but
it is obviously not central to its philosophy like git .  The idea of
creating many local branches a normal port of your development
workflow seems unique to git.  As the gitmagic link below states, it
makes it very easy to switch context to fix a bug, and then resume
work on another feature.  This is a lot more than just "being good at
generating patches"; it is a change in the way we work.  The ability
to manage cheap local branches caries with it some additional
complexities that may be part of the reason git is a little difficult
to understand when it comes to mirroring branches, etc.  To me, it
seems local branching is a central technical issue as it affects
developer workflow.  Comparing superficial things like the UI seems
secondary.  Many developers can't see this as it is difficult to
change the way we work once we get used to something.  git-stash is
another feature of git that adds to its capability to easily switch
context and fix a bug, etc.  The first time I watched Linus's talk on
git, I did not understand this.  But, after using git for a few months
it makes a lot more sense.

Some more information on git branches:
http://reddit.com/r/programming/info/69qe8/comments/c039eef
http://www-cs-students.stanford.edu/~blynn/gitmagic/ch04.html
http://mjtsai.com/blog/2007/07/15/subversion-to-git/
http://www.dribin.org/dave/blog/archives/2007/12/30/why_mercurial/
http://utsl.gen.nz/talks/git-svn/intro.html#howto-branch

So, in summary it seems that if developers are not interested in using
local branches in their personal development workflow, mercurial may
be a better choice (for technical reasons) as it is easier to use, has
lots of nice features for a more conventional distributed VCS flow.
But, if you want to utilize a workflow that leverages local branches
(which is a radical change), then git may be a better choice as it is
designed around this feature.  OE development (from a workflow
perspective) has not really been highly distributed in the past, so
perhaps git is overkill.  But, I still can't seem to overlook the
benefits to personal workflow that git branches offer.  That said, I
don't have any mercurial experience, and I would have to use it with a
real project to understand its advantages.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


