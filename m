Received: from [72.14.220.155] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pmiscml@gmail.com>) id 1JZDvo-0005C6-PM
	for openembedded-devel@openembedded.org; Wed, 12 Mar 2008 00:30:56 +0100
Received: by fg-out-1718.google.com with SMTP id e12so2092994fga.0
	for <openembedded-devel@openembedded.org>;
	Tue, 11 Mar 2008 16:28:52 -0700 (PDT)
Received: by 10.86.59.2 with SMTP id h2mr8561056fga.78.1205278132808;
	Tue, 11 Mar 2008 16:28:52 -0700 (PDT)
Received: from widy.localdomain ( [78.164.227.166])
	by mx.google.com with ESMTPS id d6sm11492265fga.9.2008.03.11.16.28.50
	(version=SSLv3 cipher=OTHER); Tue, 11 Mar 2008 16:28:51 -0700 (PDT)
Date: Wed, 12 Mar 2008 01:29:36 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
Message-ID: <20080312012936.6201f9c4@widy.localdomain>
In-Reply-To: <1205252133.4521.132.camel@dax.rpnet.com>
References: <200803110807.11368.zecke@selfish.org>
	<200803111126.04715.openembedded@haerwu.biz>
	<fr5ntp$n0v$1@ger.gmane.org>
	<1205233201.4521.30.camel@dax.rpnet.com>
	<20080311143030.68d6341b@widy.localdomain>
	<1205239153.4521.53.camel@dax.rpnet.com>
	<20080311150320.7c31b2f6@widy.localdomain>
	<1205243052.4521.82.camel@dax.rpnet.com>
	<20080311173920.38c3f35e@widy.localdomain>
	<1205252133.4521.132.camel@dax.rpnet.com>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 72.14.220.155
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
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
X-List-Received-Date: Tue, 11 Mar 2008 23:30:57 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Tue, 11 Mar 2008 16:15:33 +0000
Richard Purdie <rpurdie@rpsys.net> wrote:

> On Tue, 2008-03-11 at 17:39 +0200, Paul Sokolovsky wrote:
> > On Tue, 11 Mar 2008 13:44:12 +0000
> > Richard Purdie <rpurdie@rpsys.net> wrote:
> > Hopefully "git pull" and "git diff" do not need any documentation.
> > But the fact that "git checkout file.ext" actually reverts a file
> > is not obvious at all. 
> 
> What did you expect it to do?

I expect: 1) checkout to do check out; 2) have an explicit command
withe explicit name to revert changes; 3) nothing else except that
command to trash my changes.

> 
> > Or let's have a look at "git commit --all": "Tell the
> > command to automatically stage files that have been modified and
> > deleted, but new files you have not told git about are not
> > affected." So, it's all, but ... not all at all. And git is full of
> > such quirks.
> 
> No argument from me. It has quirks, you get used to them...

My argument is that once out of this mirror world, you forget these
quirks as useless luggage on your mind, and coming back again, need to
relearn them again. That's worse than being able to use different
systems with the common set of knowledge.

> 
> > > git
> > > ---
> > > 
> > > * Most likely to to be installed on a given newcommer's machine
> > 
> > On a newcomer's machine, nowadays dash is installed instead of the
> > real shell, not git or something of that kind.
> 
> This amounts to trolling and I'm really getting sick of it. We're not
> talking about shells, we're talking about which distributed scm is the
> user most likely to have some experience of and which is most likely
> to aleady exist on their machine. But you know this.

And I'm talking about what to answer to real *newbie* *users* who will
hit funky git issues again and again, just the same as they hit mtn
ones. I did lot of explanation why OE uses mtn already, and would like
to at least be prepared to respond to similar question regarding git
something more convincing than "git!!!!111 As seen on TV!" (read:
on Linux Kernel).

> 
> > > * Most likely to have been used before by a newcommer
> > > * Has lots of documentation
> > 
> > Yeah, every user, once hit the fact that git is not usable out of
> > the box, spends some small time (read: possibly incompletely, or
> > incorrectly) to figure out how to do trivial things with it, and
> > then posts that to his blog, for everyone's confusion.
> 
> Agreed there is a ton of confusion out there about git. There is good
> documentation too.
> 
> > > * Has a lot of users
> > > * Powerful web and visualisation tools
> > > * Very actively growing
> > > [I've not listed the other git features since I don't know how
> > > they compare to hg, help?]
> > 
> > * Written as the set of hacks targetted at specific development
> > model, without much design thought. Remember CVS history? "What's
> > now CVS is used to be a set of shell scripts around RCS which
> > gradually were rewritten in C." That's what git now is.
> 
> I can buy that...
> 
> > * Started by people (and supposedly continued by people with alike
> > attitudes) who known to be change punks having a bible at
> > Documentation/stable_api_nonsense.txt giving them indulgence to make
> > changes for the purpose of changes, with things like "consistency"
> > and "interface contract" meaning nothing to them. So, git 1.5 is
> > muuuch better than 1.4? Who know what will be with 1.6?
> 
> ... but this sounds like a boulder on your shoulder weighing you down.
> The linux kernel Documentation/stable_api_nonsense.txt has little to
> do with git and our choice of it as an SCM. That document was GregKH
> propaganda not Linus. There are parts of the kernel which have
> absolute API (syscalls) and there are parts which don't (function
> names). Its all documented and well known about.
> 
> What matters is whether upstream are likely to break the on disk
> format of git in the future or the data interchange formats. I
> suggest they are not likely to do so, at least not in incompatible
> ways.
> 
> [hg pros]
> 
> > * Designed to be an SCM from the start, not a "stupid content
> > tracker".
> > * Written consistently in the sane language
> > * Has consistent interface for extension using plugins
> > * Thought to be easy and nice to use. Well-known command core, many
> > other usability features here-and-there (like local integer
> > incrementing revision numbers (so if you remember that some change
> > has rev 20, you know how to diff that with 2 revs before without
> > searching for anything or remembering funky rev ref syntax)).
> > * Cross-platform (not "soon" or "almost", but by the design)
> > * "git with a human face"
> > * Big names: Mozilla, etc.
> 
> ok, thanks for the list. Just for reference a lot of these reasons are
> why we went for monotone...
> 
> > My usecases for hg are simple:
> > 
> > 1. Default SCM for local projects (had replaced SVN)
> > 2. Replacement for incremental archiver which appears to not exist
> > for unix. For example, I use it to lazily track changes to /etc on
> > my machines.
> > 3. Rich-man's quilt replacement.
> 
> Can you elaborate on its usage as a quilt replacement? Is each stacked
> patch a commit?

Heh, I know you'll catch on this. Nope, by "quilt replacement" I mean
that nowadays, when I want to make a patch, I use not diff, not quilt,
but hg. It doesn't have push/pop ability builtin (nor even rebasing
AFAIK) - such stuff is handled by plugins. And there's plugin for
stacked stuff, but I personally didn't have need to play with it so far.

> 
> > A repo can be cloned by a mere dir copy. 
> 
> So can git.

Nope, not "so can git". "So can hg"! My personal idea of hg's idea is
that they want to have the same functionality as git, but in more
nice, sane manner. That's the impression I got. But I don't have proofs
based on my real experience regarding more advanced usage than "just
SCM", which place it did win for myself however.

> 
> > Changes can be easily propagated from "master".
> 
> So can git.
> 
> > Branch are something within the same repo.
> 
> Hmm, not sure what you mean here.

It's common misconception that hg doesn't have branches - they do, but
fairly enough suggest to not bother with them unless needed, and instead
just clone repos, as that's the easiest way to "branch".

> 
> > Dunno if it's "checkout" (classical) or "switching" style (like
> > git, I personally keep finding this confusing - kernel folks simply
> > don't have much choice except for such mess with their datasize).
> 
> I'm told its checkout style.
> 
> > To my knowledge, neither git not hg record merge/cherypick history
> > intrinsically.
> 
> Merge history is stored in git, rebase and cherrypick is not. The
> nature of a rebase/cherrypick operation precludes history by design
> really.

Well, cherrypick takes revision, so can record that fact somehow. The
matter that one may need to edit work copy to fix conflicts during
cherry-picking shouldn't be excuse for noone trying to do that... Just
thoughts on SCM feature set...

> 
> > > Another thing we should consider is whether something is likely to
> > > improve over time. This is something we hoped would happen with
> > > monotone and whilst it has to an extent, it hasn't as much as we'd
> > > have liked. Personally I think someone will write a nice frontend
> > > (porcelain) for git eventually but we don't have a guarantee of
> > > that.
> > 
> > Isn't there bunch already? Or do you hint that they still can't get
> > it right? 
> 
> I've not tried them since I didn't know about them although admittedly
> I'd not looked. Its nice to know people are addressing the issue.

Cogito is obvious candidate for user-friendliness and better
consistency. I even used it once, because I just *couldn't* find out
how to do something with bare git (don't remember what it was now, but
it involved doing something about specific rev). There's stacked git for
something quilty, etc. But again, in my list, that's complication with
supporting users trying to use all that blossom, instead of using
something single and consistent... (talking users, as developer can do
lots of things anyway with almost anything, modulo laziness and
superstitions).

> 
> Cheers,
> 
> Richard
> 



-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


