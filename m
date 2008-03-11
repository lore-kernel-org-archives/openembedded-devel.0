Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JZ7AX-0005el-6k
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 17:17:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2BGFc5q000317;
	Tue, 11 Mar 2008 16:15:38 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32640-04; Tue, 11 Mar 2008 16:15:34 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2BGFX4T000308
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 11 Mar 2008 16:15:33 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Paul Sokolovsky <pmiscml@gmail.com>
In-Reply-To: <20080311173920.38c3f35e@widy.localdomain>
References: <200803110807.11368.zecke@selfish.org>
	<200803111126.04715.openembedded@haerwu.biz>
	<fr5ntp$n0v$1@ger.gmane.org>
	<1205233201.4521.30.camel@dax.rpnet.com>
	<20080311143030.68d6341b@widy.localdomain>
	<1205239153.4521.53.camel@dax.rpnet.com>
	<20080311150320.7c31b2f6@widy.localdomain>
	<1205243052.4521.82.camel@dax.rpnet.com>
	<20080311173920.38c3f35e@widy.localdomain>
Date: Tue, 11 Mar 2008 16:15:33 +0000
Message-Id: <1205252133.4521.132.camel@dax.rpnet.com>
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
Cc: openembedded-devel <openembedded-devel@openembedded.org>
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
X-List-Received-Date: Tue, 11 Mar 2008 16:18:03 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2008-03-11 at 17:39 +0200, Paul Sokolovsky wrote:
> On Tue, 11 Mar 2008 13:44:12 +0000
> Richard Purdie <rpurdie@rpsys.net> wrote:
> Hopefully "git pull" and "git diff" do not need any documentation. But
> the fact that "git checkout file.ext" actually reverts a file is not
> obvious at all. 

What did you expect it to do?

> Or let's have a look at "git commit --all": "Tell the
> command to automatically stage files that have been modified and
> deleted, but new files you have not told git about are not affected."
> So, it's all, but ... not all at all. And git is full of such quirks.

No argument from me. It has quirks, you get used to them...

> > git
> > ---
> > 
> > * Most likely to to be installed on a given newcommer's machine
> 
> On a newcomer's machine, nowadays dash is installed instead of the real
> shell, not git or something of that kind.

This amounts to trolling and I'm really getting sick of it. We're not
talking about shells, we're talking about which distributed scm is the
user most likely to have some experience of and which is most likely to
aleady exist on their machine. But you know this.

> > * Most likely to have been used before by a newcommer
> > * Has lots of documentation
> 
> Yeah, every user, once hit the fact that git is not usable out of the
> box, spends some small time (read: possibly incompletely, or
> incorrectly) to figure out how to do trivial things with it, and then
> posts that to his blog, for everyone's confusion.

Agreed there is a ton of confusion out there about git. There is good
documentation too.

> > * Has a lot of users
> > * Powerful web and visualisation tools
> > * Very actively growing
> > [I've not listed the other git features since I don't know how they
> > compare to hg, help?]
> 
> * Written as the set of hacks targetted at specific development model,
> without much design thought. Remember CVS history? "What's now CVS is
> used to be a set of shell scripts around RCS which gradually were
> rewritten in C." That's what git now is.

I can buy that...

> * Started by people (and supposedly continued by people with alike
> attitudes) who known to be change punks having a bible at
> Documentation/stable_api_nonsense.txt giving them indulgence to make
> changes for the purpose of changes, with things like "consistency" and
> "interface contract" meaning nothing to them. So, git 1.5 is muuuch
> better than 1.4? Who know what will be with 1.6?

... but this sounds like a boulder on your shoulder weighing you down.
The linux kernel Documentation/stable_api_nonsense.txt has little to do
with git and our choice of it as an SCM. That document was GregKH
propaganda not Linus. There are parts of the kernel which have absolute
API (syscalls) and there are parts which don't (function names). Its all
documented and well known about.

What matters is whether upstream are likely to break the on disk format
of git in the future or the data interchange formats. I suggest they are
not likely to do so, at least not in incompatible ways.

[hg pros]

> * Designed to be an SCM from the start, not a "stupid content tracker".
> * Written consistently in the sane language
> * Has consistent interface for extension using plugins
> * Thought to be easy and nice to use. Well-known command core, many
> other usability features here-and-there (like local integer incrementing
> revision numbers (so if you remember that some change has rev 20, you
> know how to diff that with 2 revs before without searching for
> anything or remembering funky rev ref syntax)).
> * Cross-platform (not "soon" or "almost", but by the design)
> * "git with a human face"
> * Big names: Mozilla, etc.

ok, thanks for the list. Just for reference a lot of these reasons are
why we went for monotone...

> My usecases for hg are simple:
> 
> 1. Default SCM for local projects (had replaced SVN)
> 2. Replacement for incremental archiver which appears to not exist for
> unix. For example, I use it to lazily track changes to /etc on my
> machines.
> 3. Rich-man's quilt replacement.

Can you elaborate on its usage as a quilt replacement? Is each stacked
patch a commit?

> A repo can be cloned by a mere dir copy. 

So can git.

> Changes can be easily propagated from "master".

So can git.

> Branch are something within the same repo.

Hmm, not sure what you mean here.

> Dunno if it's "checkout" (classical) or "switching" style (like git, I
> personally keep finding this confusing - kernel folks simply don't have
> much choice except for such mess with their datasize).

I'm told its checkout style.

> To my knowledge, neither git not hg record merge/cherypick history
> intrinsically.

Merge history is stored in git, rebase and cherrypick is not. The nature
of a rebase/cherrypick operation precludes history by design really.

> > Another thing we should consider is whether something is likely to
> > improve over time. This is something we hoped would happen with
> > monotone and whilst it has to an extent, it hasn't as much as we'd
> > have liked. Personally I think someone will write a nice frontend
> > (porcelain) for git eventually but we don't have a guarantee of that.
> 
> Isn't there bunch already? Or do you hint that they still can't get it
> right? 

I've not tried them since I didn't know about them although admittedly
I'd not looked. Its nice to know people are addressing the issue.

Cheers,

Richard



