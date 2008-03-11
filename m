Received: from [64.233.166.178] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pmiscml@gmail.com>) id 1JZ6am-0005BC-Ko
	for openembedded-devel@openembedded.org; Tue, 11 Mar 2008 16:40:58 +0100
Received: by py-out-1112.google.com with SMTP id p76so3787764pyb.2
	for <openembedded-devel@openembedded.org>;
	Tue, 11 Mar 2008 08:38:40 -0700 (PDT)
Received: by 10.35.115.18 with SMTP id s18mr10428707pym.41.1205249919482;
	Tue, 11 Mar 2008 08:38:39 -0700 (PDT)
Received: from widy.localdomain ( [78.164.227.166])
	by mx.google.com with ESMTPS id j9sm376091mue.6.2008.03.11.08.38.32
	(version=SSLv3 cipher=OTHER); Tue, 11 Mar 2008 08:38:33 -0700 (PDT)
Date: Tue, 11 Mar 2008 17:39:20 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
Message-ID: <20080311173920.38c3f35e@widy.localdomain>
In-Reply-To: <1205243052.4521.82.camel@dax.rpnet.com>
References: <200803110807.11368.zecke@selfish.org>
	<200803111126.04715.openembedded@haerwu.biz>
	<fr5ntp$n0v$1@ger.gmane.org>
	<1205233201.4521.30.camel@dax.rpnet.com>
	<20080311143030.68d6341b@widy.localdomain>
	<1205239153.4521.53.camel@dax.rpnet.com>
	<20080311150320.7c31b2f6@widy.localdomain>
	<1205243052.4521.82.camel@dax.rpnet.com>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 64.233.166.178
X-SA-Exim-Mail-From: pmiscml@gmail.com
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
X-List-Received-Date: Tue, 11 Mar 2008 15:41:06 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Tue, 11 Mar 2008 13:44:12 +0000
Richard Purdie <rpurdie@rpsys.net> wrote:

> On Tue, 2008-03-11 at 15:03 +0200, Paul Sokolovsky wrote:
> > On Tue, 11 Mar 2008 12:39:13 +0000 Richard Purdie
> > <rpurdie@rpsys.net> wrote:
> > > You will never have seen me argue git has a nice UI. I've said
> > > quite the opposite on many occasions. I have said its powerful
> > > but thats different.
> > 
> > It's nice to have that said explicit - different. Supposedly it's
> > more powerful for developers, but how good it is for end users? How
> > many industry entities select git as their in-house SCM? I doubt
> > that too many, knowing too well that many still select just CVS.
> 
> OE is there to serve a multitude of people, both developers and end
> users. For the end user, hopefully we can document the basics of "git
> clone", "git pull" and "git diff" or documentation already exists for
> this. 

Hopefully "git pull" and "git diff" do not need any documentation. But
the fact that "git checkout file.ext" actually reverts a file is not
obvious at all. 

Or let's have a look at "git commit --all": "Tell the
command to automatically stage files that have been modified and
deleted, but new files you have not told git about are not affected."
So, it's all, but ... not all at all. And git is full of such quirks.

> Also, I think more end users coming fresh to OE will know how to do
> this with git in the current climate than with monotone, hg or any
> other distributed SCM.

Well, there's some core SCM language which is already known to most
users. git abuses it.

> Regarding industrial entities, hopefully we call agree CVS is a pretty
> bad SCM and that proves said industrial entities don't know what
> they're doing, usually since it often it comes down to politics
> rather than technical merit. I know of a few surprising companies
> using git FWIW although I know of a few abominations in use too.
>  
> > > I'm assuming we're considering distributed scms but you know
> > > this ;-)
> > 
> > Yes, I'm trying to hint that arguments like having something already
> > installed, or some niche, but big project already using it, are not
> > necessarily valid for the topic of selecting SCM for OE.
> 
> You're asking about end users and how we should represent them above
> then you claim its irrelevant?

Sorry, installing a package is <your-favorite-pkgmanager> install
<package>.

> 
> I'm not saying this is the only factor to consider but I am arguing
> that its a valid factor to consider.
> 
> > I'd really like someone who lead this idea to actually try few
> > "advanced" usecases with both git and hg. But if that's not going to
> > happen, at least let's not pretend that git is going to be "better"
> > than hg or even mtn. It will be just different, possibly, bringing
> > more issues overall.
> 
> Well, we have use cases explained where mtn has failed and we know git
> is better. Some of us use git for other projects like kernel work and
> in my/their opinion, we *know* it can do some things better.
> 
> Personally my hg knowledge is weak. If thats the case for me, it
> probably is for a lot of other people and I think its valid to use
> that as a factor. I'm not against learning hg if it solves all our
> problems, I just don't think it will.
> 
> So, firstly, is anyone else willing to propose any other distributed
> SCMs or is this just a choice between hg and git? If so, we have three
> options:
> 
> 1. Continue as we are with monotone
> 2. Switch to git
> 3. Switch to hg
> 
> We've talked about whether 1 is a good idea or not and assuming its
> not, what are the pros/cons of 2/3?
> 
> git
> ---
> 
> * Most likely to to be installed on a given newcommer's machine

On a newcomer's machine, nowadays dash is installed instead of the real
shell, not git or something of that kind.

> * Most likely to have been used before by a newcommer
> * Has lots of documentation

Yeah, every user, once hit the fact that git is not usable out of the
box, spends some small time (read: possibly incompletely, or
incorrectly) to figure out how to do trivial things with it, and then
posts that to his blog, for everyone's confusion.

> * Has a lot of users
> * Powerful web and visualisation tools
> * Very actively growing
> [I've not listed the other git features since I don't know how they
> compare to hg, help?]

* Written as the set of hacks targetted at specific development model,
without much design thought. Remember CVS history? "What's now CVS is
used to be a set of shell scripts around RCS which gradually were
rewritten in C." That's what git now is.

* Started by people (and supposedly continued by people with alike
attitudes) who known to be change punks having a bible at
Documentation/stable_api_nonsense.txt giving them indulgence to make
changes for the purpose of changes, with things like "consistency" and
"interface contract" meaning nothing to them. So, git 1.5 is muuuch
better than 1.4? Who know what will be with 1.6?

> 
> hg
> --
> 
> * Has a nicer commandline?

* Designed to be an SCM from the start, not a "stupid content tracker".
* Written consistently in the sane language
* Has consistent interface for extension using plugins
* Thought to be easy and nice to use. Well-known command core, many
other usability features here-and-there (like local integer incrementing
revision numbers (so if you remember that some change has rev 20, you
know how to diff that with 2 revs before without searching for
anything or remembering funky rev ref syntax)).
* Cross-platform (not "soon" or "almost", but by the design)
* "git with a human face"
* Big names: Mozilla, etc.

> These are just the issues I can know for near enough certain. Could
> one of the hg proponents please put together a list of what makes its
> great, and compare its branching/merge handling features with git?

That's unfortunately what I cannot do, or I would have done already.
My usecases for hg are simple:

1. Default SCM for local projects (had replaced SVN)
2. Replacement for incremental archiver which appears to not exist for
unix. For example, I use it to lazily track changes to /etc on my
machines.
3. Rich-man's quilt replacement.

For all these cases starting to use it:

1. hg init # creates single hidden dir at the top
2. hg ci -A # This is real "all". And yes, it known common shortcuts
# like "ci", unlike git
3. hg diff --patch # as usual

A repo can be cloned by a mere dir copy. Changes can be easily
propagated from "master". Branch are something within the same repo.
Dunno if it's "checkout" (classical) or "switching" style (like git, I
personally keep finding this confusing - kernel folks simply don't have
much choice except for such mess with their datasize).


To my knowledge, neither git not hg record merge/cherypick history
intrinsically.


> Another thing we should consider is whether something is likely to
> improve over time. This is something we hoped would happen with
> monotone and whilst it has to an extent, it hasn't as much as we'd
> have liked. Personally I think someone will write a nice frontend
> (porcelain) for git eventually but we don't have a guarantee of that.

Isn't there bunch already? Or do you hint that they still can't get it
right? Another question - is it so important to select system with bad
interface and hope that one sweet day something better will be stuffed
on top (apparently, to make us answer questions about both interfaces),
comparing to selecting system which has it right from the start? As
usual, the question is rhetoric.

> The strength of the communities in question plays a part here.
> 
> Cheers,
> 
> Richard
> 
> 



-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


