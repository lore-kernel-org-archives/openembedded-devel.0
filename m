Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JQhha-0007ee-7Z
	for openembedded-devel@openembedded.org; Sun, 17 Feb 2008 12:29:05 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1HBSPPb001965;
	Sun, 17 Feb 2008 11:28:25 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01807-04; Sun, 17 Feb 2008 11:28:21 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1HBSGCI001955
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 17 Feb 2008 11:28:17 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Paul Sokolovsky <pmiscml@gmail.com>
In-Reply-To: <20080216125903.3c446440@widy.localdomain>
References: <20080214045433.02de68cd@widy.localdomain>
	<74d0deb30802140255k6c16bafeq6771d572fd7c542c@mail.gmail.com>
	<20080215110230.526ea6a1@widy.localdomain>
	<74d0deb30802150141q71e844esd6185bf52b1e79ae@mail.gmail.com>
	<20080215133238.7d8f7887@widy.localdomain>
	<1203076695.8636.30.camel@dax.rpnet.com>
	<20080215182949.053c3d3a@widy.localdomain>
	<1203095510.8636.92.camel@dax.rpnet.com>
	<20080215201102.0375245d@widy.localdomain>
	<1203115927.8636.134.camel@dax.rpnet.com>
	<20080216125903.3c446440@widy.localdomain>
Date: Sun, 17 Feb 2008 11:28:16 +0000
Message-Id: <1203247696.8272.63.camel@dax.rpnet.com>
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
Subject: Re: Building a kernel with builtin initramfs
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
X-List-Received-Date: Sun, 17 Feb 2008 11:29:05 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2008-02-16 at 12:59 +0200, Paul Sokolovsky wrote:
> On Fri, 15 Feb 2008 22:52:07 +0000 Richard Purdie <rpurdie@rpsys.net> wrote:
> > On Fri, 2008-02-15 at 20:11 +0200, Paul Sokolovsky wrote:
> > > As for now, it seems that bitbake maintains flat task list, with the
> > > flat dependencies (run task before x and after y).
> > 
> > Eh? Bitbake does not maintain a "flat" task list.
> > 
> > Looking at what package_*.bbclass say:
> > 
> > addtask package_write_deb before do_package_write after do_package
> > addtask package_write_ipk before do_package_write after do_package
> > 
> > So it says each package output task must run after do_package and
> > before do_package_write. After the package_write completes, all
> > packaging is done.
> 
> This imposes only linear ordering.

Its not linear. There is nothing that says which of write_deb or
write_ipk has to run first. In practise both can run at the same time.

> > "So, by calling do_package_write task, one *is* assured that packages
> > in whatever selected formats were written."
> 
> No, do_package_write is empty task, by "calling" it, one gets nothing.

When package_write has run, you are guaranteed that the packaging
writeout for all enabled packaging methods is complete. Show me another
sane way to do it...

> To get packaging done, one would need to "call all tasks between
> do_package and do_package_write", for what there's of course no API,
> which is not guaranteed to not do other things, and where do_package
> and do_package_write are arbitrary anchors.

The infrastructure simply isn't designed to let you run packaging twice.

> I keep discussion this, because the same approach -
> explicitly hierarchical tasks with ability to override execution
> environment for a task and all its subtasks would solve "recursion on
> the OS level" problem (by taking that recursion into bitbake level of
> course).

Well, you can do something like:

python my_second_packaging() {
	bb.data.setVar("PACKAGES", "kernel-image", d)
	bb.data.setVar("FILES_kernel-image", "/boot/*", d)
	bb.build.exec_func('package_do_package', d)
	bb.build.exec_func('do_package_ipk', d)
	bb.build.exec_func('do_package_deb', d)
}

So the "ability to override execution environment for a task and all its
subtasks" exists. Yes, we're assuming which packaging classes are in
force above but there are ways we could clean that up.

Sadly, this doesn't solve your problem though. I originally put "See my
other mail." here but see below, I may right it or I may not...

> > So lets try and teach it. There are boundaries we can't cross though.
> > Recursion is not and never will be supported. If you think it should
> > be, please start sending patches to bitbake to make it safe. With the
> > current bitbake manpower there are much more important things to do
> > I'm afraid.
> 
> Well, I wish I had resources to submit patches everywhere, but I don't.

And we don't have the resources to support recursive bitbake.

> That doesn't mean I don't want to help with showing bitbake
> deficiencies, and overcoming them, even in hacky way. So far, I didn't
> get specific hints why running bitbake recursively on OS level in the
> same dir may break.

I will give one simple potential problem - writes to the cache file. Do
you have any idea when bitbake makes them? I happen to know it probably
wouldn't break as it exists at the moment. Does this mean it won't in
future, no. So this imposes constraints on the code and there are a load
of issues that have not been considered. The bitbake devs have not even
been asked are we prepared to do this.

The question is whether we should push forward and stick holes in the
dyke until we run out of fingers or we should stop trying to hold the
dyke up and knock it over at the same time...

This is why I'm so frustrated with what you're doing - it amounts to
ploughing straight over everyone elses needs and dumping a great pile of
problems onto others which by your own admission don't plan to fix.
 
> > Bitbake does not support recursion. Period. Full stop. No ifs, buts or
> > otherwise. "Team bitbake" will not support such use.
> 
> It's easier for me here, not being "team bitbake" - I have a problem at
> hand, due to bitbake deficiency cannot solve it properly, so I devise a
> workaround which actually works (so far, tested under specific
> conditions, but can be extended/explicitly constrained to those
> conditions). It's up to "team bitbake" to treat it in some or another
> way - as a hint where bitbake is lacking to its "generic task executor"
> motto, as "no, no" and destroy, or as once and at all exception solving
> very basic task at hand, while something better coming up.

So this amounts to you wanting to force someone else to fix the problem.
I'm actually playing right into your hands too by coming up with
alternatives. Once you know this approach works you'll do it again too.

I want you to see this approach is *not* acceptable. The sad thing is I
think I have an idea to solve your packaging problem too. I'm now not
actually sure I want to explain it. I can tell you it is possible
without recursive bitbake...

> Why there're other option, for example for one and only one problematic
> case we can allow a workaround.

That depends on the workaround. In some cases yes but in this case it
sets a precedent that is too dangerous.

> > > > So this is even angstrom specific and requires special
> > > > setup? (it also implies multimachine which is not default)
> > > 
> > > 	Maybe it's time to make it default.
> > 
> > I'd argue for that for different reasons. Sadly multimachine isn't bug
> > free though as I keep finding holes in its behaviour :(.
> 
> Unfortunately, in a development tool, there're usually multiple holes
> everywhere. Constraining that tool config to one configuration (the
> more powerful one) may be good choice to save effort.

With multimachine you can still use OE in "single machine" mode so in a
way I agree on this. Its a discussion for another time/place though.

> > Or we remove it and wait until something we're willing to maintain is
> > developed. Working for some use cases is not a good reason to push
> > this into OE. This is why we have the mess that is rm_work for
> > example. I'm now left trying to figure out a way to integrate its
> > behaviour into bitbake. Sure people complain about the ways it
> > breaks, nobody steps up to help fix it though :(. I think we'll find
> > a way to salvage rm_work. I don't think this case is salvageable and
> > I don't even going to go there.
> 
> Yes, that's why I keep disagreeing that my recipes are just PoS -

I have *not* said they're PoS. I have said we can't been seen to
officially condone recursive bitbake.

Yes, I am also wary of changes to the core infrastructure. You are
getting better at thinking them through and I'm pleased to see that but
you still don't sometimes see the fallout from certain changes. No, I'm
not perfect and I don't see it either all the time - this is why we have
a review process for changes.

> Well, this one is different - again, it's about kernel building.
> Inability to build one of the upstream supported configurations is
> serious drawback. And not desire to accept a solution, even if its of
> workaround type, do tell something new about the matter.

If I propose a new wonderful recipe which lets OE generate every deb
package possible but requires root access to your machine and wipes out
everything else on it, would you accept that such a recipe should be
pushed into OE? There will always be solutions which are unacceptable.

> > So you're going to push something that core OE devs object to into
> > widespread use and ignore our concerns? Thanks :(.
> 
> What else can I do? I want to help OE to lose its deficiencies and work
> towards that per my humble resources. But I "push" it only as specific,
> limited workaround, not for "widespread use" in any case.

You put it into the bugzilla and request that OE finds a better way to
do it. You have left little time for review as it is and trying to force
people to do thing is always a bad idea.


> > > > I think the problem is you're effectively trying to end up with
> > > > something where you "bitbake angstrom" and it produces a
> > > > distribution,
> > > 
> > > Yes, isn't that what bitbake supposed to do?
> > 
> > Not with its current design, no.
> 
> That's where things are getting interesting. Because before it was.
> Someone may ask where did I get that idea from, and I can point to
> Angstrom autobuilder - it produces the whole distro in fully automated
> manner. It does have some workarounds to deal with multiple wide
> varying config, but only high-level ones.

and I can point to the poky autobuilder too. I actually understand this
problem much more than you realise. Recursive bitbake isn't the way to
solve it though.

A better way would be to allow a list of variables to set along with a
list of targets so you could tell bitbake to run:

MACHINE=akita bitbake image-foo
MACHINE=spitz bitbake image-bar

in one command.

Once, you couldn't even do this without editing a config file, someone
(me) added the functionality and fixed the bugs to allow it from the
commandline to ease some of the pain in autobuilder scripts. Do I get
any thanks for it, no, I get told its deficient and that I should spend
my time fixing insane bugs because someone else doesn't have time for
proper solutions.

> But now if bitbake is not a distro tool, what it is? A limited-scope
> crutch for developer who is still left on its own with distro building
> due to accidental gaps in the tool's functionality? Maybe bitbake
> actually is not enough on its own to handle the task? And we should
> encourage, not discourage use of separate tools on top of it? Makefiles
> suddenly seem so attractive - I can easily put
> 
> bitbake initramfs-image
> bitbake initramfs-kernel
> 
> there, if there're no place with bitbake where it can be put.

I said the current design does not allow this. I did not say bitbake
will not support it, I'd take patches to allow this in some form. That
form will not be recursive bitbake though (and doesn't need to be).

The plans for the bitbake client/server split also come into play here
since there will be different ways you can "command" bitbake to run
things.

> > > Building kernel is where user needs to provide some input? Which one
> > > exactly?
> > 
> > Which flavour of rootfs to use (libc, image type, image contents)?
> 
> My recipes has parameters for that, but in specific case I build for,
> its distro matter.

and yet the recipe isn't even marked as distro specific...

> > Just for the lists reference I've raised this with the core devs who I
> > will discuss this with and then take any action agreed upon.
> 
> I have no issues with any such decision and action, but from my
> position, make a choice to not accept bitbake's deficiencies silently,
> even if I can't solve them properly.

The core devs have agreed pretty unanimously the recipe should be
removed since they share the concerns I've raised. If you want recursive
bitbake recipes you need to convince both them and the bitbake devs who
will have to maintain it that its a good idea. One problem case isn't
going to be enough for that.

Do I personally take time out of my valuable free time to help you fix
this properly? After the attitude you've shown, I think I could be
forgiven for not doing so but we'll see. 

Cheers,

Richard



