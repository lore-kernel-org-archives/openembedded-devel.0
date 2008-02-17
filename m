Received: from [66.249.82.228] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JQkK4-0002JP-Lj
	for openembedded-devel@openembedded.org; Sun, 17 Feb 2008 15:16:55 +0100
Received: by wx-out-0506.google.com with SMTP id t16so1085232wxc.6
	for <openembedded-devel@openembedded.org>;
	Sun, 17 Feb 2008 06:16:15 -0800 (PST)
Received: by 10.66.255.7 with SMTP id c7mr1953727ugi.43.1203257774304;
	Sun, 17 Feb 2008 06:16:14 -0800 (PST)
Received: from widy.localdomain ( [88.231.76.37])
	by mx.google.com with ESMTPS id k28sm2898660ugd.77.2008.02.17.06.16.09
	(version=SSLv3 cipher=OTHER); Sun, 17 Feb 2008 06:16:12 -0800 (PST)
Date: Sun, 17 Feb 2008 16:16:34 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
Message-ID: <20080217161634.06819fe1@widy.localdomain>
In-Reply-To: <1203247696.8272.63.camel@dax.rpnet.com>
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
	<1203247696.8272.63.camel@dax.rpnet.com>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 66.249.82.228
X-SA-Exim-Mail-From: pmiscml@gmail.com
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
X-List-Received-Date: Sun, 17 Feb 2008 14:16:55 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Sun, 17 Feb 2008 11:28:16 +0000
Richard Purdie <rpurdie@rpsys.net> wrote:

> On Sat, 2008-02-16 at 12:59 +0200, Paul Sokolovsky wrote:
> > On Fri, 15 Feb 2008 22:52:07 +0000 Richard Purdie
> > <rpurdie@rpsys.net> wrote:
> > > On Fri, 2008-02-15 at 20:11 +0200, Paul Sokolovsky wrote:
> > > > As for now, it seems that bitbake maintains flat task list,
> > > > with the flat dependencies (run task before x and after y).
> > > 
> > > Eh? Bitbake does not maintain a "flat" task list.
> > > 
> > > Looking at what package_*.bbclass say:
> > > 
> > > addtask package_write_deb before do_package_write after do_package
> > > addtask package_write_ipk before do_package_write after do_package
> > > 
> > > So it says each package output task must run after do_package and
> > > before do_package_write. After the package_write completes, all
> > > packaging is done.
> > 
> > This imposes only linear ordering.
> 
> Its not linear. There is nothing that says which of write_deb or
> write_ipk has to run first. In practise both can run at the same time.

Well, yep, sharpening epithets, its "non-deterministically linear" ;-).
Bitbake's job consists of applying constraints on task order, and so
there appear "slots" which are linearly ordered, but within each slot,
there're "parallel" tasks. If there's only 1 thread, it's just linear
list.

What I'm trying to point, is that apparently bitbake flattens out job
plan too early. 

> The infrastructure simply isn't designed to let you run packaging
> twice.

Yes, that's the issue.

> python my_second_packaging() {
> 	bb.data.setVar("PACKAGES", "kernel-image", d)
> 	bb.data.setVar("FILES_kernel-image", "/boot/*", d)
> 	bb.build.exec_func('package_do_package', d)
> 	bb.build.exec_func('do_package_ipk', d)
> 	bb.build.exec_func('do_package_deb', d)
> }

So, those 2 lines in my list are worse than recursive call, as
recursion at least elegant (though can be too deathly, who disagrees).

[]
> When package_write has run, you are guaranteed that the packaging
> writeout for all enabled packaging methods is complete. Show me
> another sane way to do it...

do_package is a task. There's new concept "subtask". do_package_ipk and
do_package_deb are subtasks of it. Executing such a compound task means
executing its subtasks. Full name of a task is <main_task>.<subtask>.
In particular, timestamps use that, so there's

foo.package_do_package.do_package_ipk

and 

foo.my_second_packaging.do_package_ipk


And I understand that maintaining proper (hierarchial) task plan vs
executing it with parallelism are somewhat mutually exclusive
in practice, as most tools do one or another ;-). Well, maintaining
tree structuring to support such "imperative callouts" like above, but
still optimize main plan for parallelism could be one option for the
future of bitbake.

[]
> 
> python my_second_packaging() {
> 	bb.data.setVar("PACKAGES", "kernel-image", d)
> 	bb.data.setVar("FILES_kernel-image", "/boot/*", d)
> 	bb.build.exec_func('package_do_package', d)
> 	bb.build.exec_func('do_package_ipk', d)
> 	bb.build.exec_func('do_package_deb', d)
> }
> 
> So the "ability to override execution environment for a task and all
> its subtasks" exists. 

But not to the level of sub-executing some tasks for another machine
for example, right?

[]

> > That doesn't mean I don't want to help with showing bitbake
> > deficiencies, and overcoming them, even in hacky way. So far, I
> > didn't get specific hints why running bitbake recursively on OS
> > level in the same dir may break.
> 
> I will give one simple potential problem - writes to the cache file.

Well, that's why I proceed to spool my ANGSTROM_MODE CACHE
override ;-). In my use there're even different caches ;-).

> Do you have any idea when bitbake makes them? I happen to know it
> probably wouldn't break as it exists at the moment. Does this mean it
> won't in future, no. So this imposes constraints on the code and
> there are a load of issues that have not been considered. The bitbake
> devs have not even been asked are we prepared to do this.
> 
> The question is whether we should push forward and stick holes in the
> dyke until we run out of fingers or we should stop trying to hold the
> dyke up and knock it over at the same time...
> 
> This is why I'm so frustrated with what you're doing - it amounts to
> ploughing straight over everyone elses needs and dumping a great pile
> of problems onto others which by your own admission don't plan to fix.

Well, I do not impose anything on others. Again, those recipes do not
touch any existing infrastructure and don't affect current usage in any
way. That's why I bothered to commit it directly. Let's face it -
noone would run to use them right away. Also, they are very pragmatic in
its nature, destined to solve very long-standing issue, first of all
for production distro in use by actual people who are restricted
without that being solved, that's another reason why it was committed,
as there's long cycle already from ideas on how to solve it, to actual
delivery to users.

>  
> > > Bitbake does not support recursion. Period. Full stop. No ifs,
> > > buts or otherwise. "Team bitbake" will not support such use.
> > 
> > It's easier for me here, not being "team bitbake" - I have a
> > problem at hand, due to bitbake deficiency cannot solve it
> > properly, so I devise a workaround which actually works (so far,
> > tested under specific conditions, but can be extended/explicitly
> > constrained to those conditions). It's up to "team bitbake" to
> > treat it in some or another way - as a hint where bitbake is
> > lacking to its "generic task executor" motto, as "no, no" and
> > destroy, or as once and at all exception solving very basic task at
> > hand, while something better coming up.
> 
> So this amounts to you wanting to force someone else to fix the
> problem. 

Nope, I'm just solving task at hand. But I'm at least trying to do that 
with generality approach, not as a completely non-reusable and dirty
hack. Nor I pledge for it to be the good and correct, just practical.

> I'm actually playing right into your hands too by coming up
> with alternatives. Once you know this approach works you'll do it
> again too.
> 
> I want you to see this approach is *not* acceptable. 

No problem in the end! Of course, I'm pretty frustrated for having
spent time blatantly hacking thru that to let people *build a distro*,
not *execute bunch of weird commands by hand*, achieving that, and not
being able to deliver that. I'm even more frustrated to face such
glaringly bitbake limitations. I really hoped that everything [needed]
can be done with it [already], and I can always come up to other folks
and say: "Your build tool sucks! All you building belongs to us!" ;-))
Alas, that feeling is gone now ;-(

[]

> > Yes, that's why I keep disagreeing that my recipes are just PoS -
> 
> I have *not* said they're PoS. I have said we can't been seen to
> officially condone recursive bitbake.

Please forgive my colloquial-speak, I use it to live up otherwise long
technical discussions ;-).

> Yes, I am also wary of changes to the core infrastructure. You are
> getting better at thinking them through and I'm pleased to see that
> but you still don't sometimes see the fallout from certain changes.
> No, I'm not perfect and I don't see it either all the time - this is
> why we have a review process for changes.

By all means you're right. And from my place, I enjoy my position which
allows me to have own priorities and use such guerrilla tactics.
For bitbake stuff. Because for other stuff I of course maintain strict
positions too.

[]
> You put it into the bugzilla and request that OE finds a better way to
> do it.

Well, I had pragmatic aim, and IMHO, such discussion is better than yet
another ticker of meta nature hanging in bugtracker.

> You have left little time for review as it is and trying to
> force people to do thing is always a bad idea.

It still can be though as a proof-of-concept, work-in-progress.

[]

> A better way would be to allow a list of variables to set along with a
> list of targets so you could tell bitbake to run:
> 
> MACHINE=akita bitbake image-foo
> MACHINE=spitz bitbake image-bar
> 
> in one command.

That still leaves question open how these 2 commands communicate with
each other. There should be another entity above them which handles
that. Recursion everywhere (and no, I don't mean recursive bitbake
executable invocation!)

[]

> I said the current design does not allow this. I did not say bitbake
> will not support it, I'd take patches to allow this in some form. That
> form will not be recursive bitbake though (and doesn't need to be).

If I promise patches, I will lie (only 1 head, only 24hrs/day). But I'm
glad we can discuss that, and maybe you, from your side, will find that
some of the functionality can be added not that hard (if I knew it can
be, I'd go for that, but I don't even know, see above).

> The plans for the bitbake client/server split also come into play here
> since there will be different ways you can "command" bitbake to run
> things.

Nice! Again, consider recursive invocation a poor man's emulation of
this client/server approach ;-).

> 
> > > > Building kernel is where user needs to provide some input?
> > > > Which one exactly?
> > > 
> > > Which flavour of rootfs to use (libc, image type, image contents)?
> > 
> > My recipes has parameters for that, but in specific case I build
> > for, its distro matter.
> 
> and yet the recipe isn't even marked as distro specific...

It's a bit less patch than removing it altogether ;-).

[]
> The core devs have agreed pretty unanimously the recipe should be
> removed since they share the concerns I've raised. If you want
> recursive bitbake recipes you need to convince both them and the
> bitbake devs who will have to maintain it that its a good idea. One
> problem case isn't going to be enough for that.
> 
> Do I personally take time out of my valuable free time to help you fix
> this properly? After the attitude you've shown, I think I could be
> forgiven for not doing so but we'll see. 

Thinking about that attitude ("We've been typing bunch of our commands
manually for years, and now you tell that it's wrong? No, continuing
typing bunch of commands is *the* proper way to handle that!") and
progressing with the practical task of which this work was a subtask, I
feel that for me it's indeed would be more practical to give up trying
to add generic kernel+initramfs support building to OE and instead to
workaround task at hand in different way. Because even ideas like above
seem more like workarounds, more safer than my approach, but at the
same time not as expressive enough to handle the real-world task at
hand.

So, I'm leaving assessment of similarities between kernel and gcc-cross
build to someone else. But let's just try and imagine that during
"bitbake <something>" you'd get message like: 

	"Sorry, gcc building is too complex. We cannot do it for you
	automatically. Now type 'foo bar' to continue the build."

Is it just me or such picture indeed pretty funny? And yet people
assuredly think that's how kernel should be built!

P.S.
Can't get off that productive thought - gcc is mentioned on purpose of
course, as that gcc-cross vs gcc-cross-initial break is made to solve
similar problem. But of course, there cannot be talk about splitting
each of 100+ kernel recipes in 2, nor, for myself, there cannot be
talk about doing that for one kernel leaving others behind. 

But that recent template/generator .bb idea from Richard - of foo vs
foo-native talk - can help here too. Once for each kernel .bb there's
underlying <kernel> vs <kernel>-modules targets, all this issue is
evaporated.

> 
> Cheers,
> 
> Richard
> 



-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


