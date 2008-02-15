Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JQ9Pz-0005Y4-FB
	for openembedded-devel@openembedded.org; Fri, 15 Feb 2008 23:52:46 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1FMqBXJ008784;
	Fri, 15 Feb 2008 22:52:11 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08661-05; Fri, 15 Feb 2008 22:52:06 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1FMq5SG008778
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 15 Feb 2008 22:52:05 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Paul Sokolovsky <pmiscml@gmail.com>
In-Reply-To: <20080215201102.0375245d@widy.localdomain>
References: <20080214045433.02de68cd@widy.localdomain>
	<74d0deb30802140255k6c16bafeq6771d572fd7c542c@mail.gmail.com>
	<20080215110230.526ea6a1@widy.localdomain>
	<74d0deb30802150141q71e844esd6185bf52b1e79ae@mail.gmail.com>
	<20080215133238.7d8f7887@widy.localdomain>
	<1203076695.8636.30.camel@dax.rpnet.com>
	<20080215182949.053c3d3a@widy.localdomain>
	<1203095510.8636.92.camel@dax.rpnet.com>
	<20080215201102.0375245d@widy.localdomain>
Date: Fri, 15 Feb 2008 22:52:07 +0000
Message-Id: <1203115927.8636.134.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
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
X-List-Received-Date: Fri, 15 Feb 2008 22:52:46 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2008-02-15 at 20:11 +0200, Paul Sokolovsky wrote:
> Richard Purdie <rpurdie@rpsys.net> wrote:
> > On Fri, 2008-02-15 at 18:29 +0200, Paul Sokolovsky wrote:
> > What do you mean by hierarchical tasks? It is a hierarchical task
> > executor already?
> 
> For this specific case, I meant to have following hierarchy:
> 
> do_package_write
>  \-- do_package_write_ipk
>  |-- do_package_write_deb
> 
> So, by calling do_package_write task, one would be assured that
> packages in whatever selected formats were written. Timestamps could be
> of form:
> 
> foo.do_package_write.do_package_write_ipk
> 
> As for now, it seems that bitbake maintains flat task list, with the
> flat dependencies (run task before x and after y).

Eh? Bitbake does not maintain a "flat" task list.

Looking at what package_*.bbclass say:

addtask package_write_deb before do_package_write after do_package
addtask package_write_ipk before do_package_write after do_package

So it says each package output task must run after do_package and before
do_package_write. After the package_write completes, all packaging is
done.

"So, by calling do_package_write task, one *is* assured that packages in
whatever selected formats were written."

> > Yes. It requires a very precise distro setup for this to work. For
> > example I changed the libc mode I was using in poky the other day and
> > smashed up a load of my glibc ipks.
> 
> Fully agree. And very precise distro setup is also what is needed to
> assure user satisfaction with the building (because even with
> recursion, there're lots of things to misconfigure), and also to assure
> quality and QAability. So, OE should be moving at that direction, and I
> would think that Angstrom is a testbed for that for example.

I think you mean adding recursion adds whole new dimensions of problems.

> > You're proposing this as a solution to switching libc modes and who
> > knows what else 
> 
> Else - what practice calls. All this came out not from mere
> speculation, but from the need to build a kernel with linked-in
> initramfs - which is upstream-supported configuration for many years,
> and which OE is unable to build.

So lets try and teach it. There are boundaries we can't cross though.
Recursion is not and never will be supported. If you think it should be,
please start sending patches to bitbake to make it safe. With the
current bitbake manpower there are much more important things to do I'm
afraid.

> > No, it breaks things for the user, e.g. "bitbake -g" no longer shows
> > all the tasks that actually happen. 
> 
> 	This also assume flat world view, where bitbake is the singular
> god. Because with other look, bitbake -g shows *all* tasks it runs,
> just on the current level of its power.

Bitbake runs the OE metadata, thats its job.

> 	Yes, I expressed this concern in the very first mail. IMHO,
> productive consideration of this issue would involve assessing prior
> art, noting that parallel make doesn't work for some Makefiles, noting
> that OE has safeguards to disallow it for some recipes, and wondering
> if ability to disable parallel bitbake for some recipes is a viable
> idea.

Bitbake does not support recursion. Period. Full stop. No ifs, buts or
otherwise. "Team bitbake" will not support such use.

> > Oh, and how sure are you that two bitbakes can
> > run on the same directory at once? (the answer is that they can't and
> > it will break badly.)
> 
> 	Well, only practice, itself ;-). It all does run here, without
> any disasters. Again, if it doesn't, let's fix it?

Pure luck. I'd bet I can break it in several different ways which you
can't fix...

> > > Other points:
> > > * It only starts with 2 commands, the list grows with the time
> > > (exponentially?)
> > 
> > How many of these recursive executions have we ever needed? Can you
> > give me more examples of cases where we need to do exponential
> > recursive execution?
> 
> Not literally, I'm afraid, just usual quoting laws of nature ;-).

So for one problematic case we should open a tanker of worms?

> > > * It's not going to be those easy "bitbake foo + bitbake bar"
> > > 2-word commands. As was pointed already, building an initramfs
> > > requires ANGSTROM_MODE (aka LIBC_TYPE aka (but unrecognized)
> > > SYSTYPE) and IMAGE_FSTYPES set. Further - more.
> > 
> > ANGSTROM_MODE? 
> 
> 	No, SYSTYPE! And that should be INITRAMFS_SYSTYPE, of course.
> Just not everything in one iteration (still blocked on the very
> SYSTYPE).

Another discussion for another time/place.

> > So this is even angstrom specific and requires special
> > setup? (it also implies multimachine which is not default)
> 
> 	Maybe it's time to make it default.

I'd argue for that for different reasons. Sadly multimachine isn't bug
free though as I keep finding holes in its behaviour :(.

> > > * One of the annoying issues is to how to get hands on results of
> > > the first task in the second one. Currently, for the second task,
> > > such location is rather unpredictable. I solved this by adding
> > > special task which just accepts parameter - location where to put
> > > stuff. Again, special tasks, special parameters. User would either
> > > need to know and use them, or do it all manually.
> > 
> > We used to have this problem with kernels and images for scripting
> > purposes which is why we added predictably named symlinks. These kind
> > of issues are solvable in simple ways with some thought.
> 
> Those predictably named symlinks live in unpredictably named and
> structured directories. My recipes take care of that - in simple ways
> exactly.

Those very unpredictably named directories you rely on in the script and
without your recipe would break?

> > I'm actually going to go as far as proposing any recursive bitbake
> > recipes are removed from OE.dev ASAP for the reasons I've mentioned
> > above. We *need* to find a better way. I will try and help you find
> > that and will extend bitbake if needed.
> 
> Yes, we need to find a better way. But many things are on todo for a
> long time in OE, without much moving ;-(. My recipes for building
> kernel with linked initramfs is a kind of sprint trying to solve one
> of such long-standing issues. The solution is of course is not perfect,
> but does work, and can be elaborated to either remove unneeded
> environment dependencies, or solved in completely different way. But in
> the meantime, it would be already usable where it is needed. So, I have
> alternative proposal - leaving them in OE, possibly move to
> angstrom-specific dir if its considered too Angstrom-specific. 

Or we remove it and wait until something we're willing to maintain is
developed. Working for some use cases is not a good reason to push this
into OE. This is why we have the mess that is rm_work for example. I'm
now left trying to figure out a way to integrate its behaviour into
bitbake. Sure people complain about the ways it breaks, nobody steps up
to help fix it though :(. I think we'll find a way to salvage rm_work. I
don't think this case is salvageable and I don't even going to go there.

> My reason for working in this direction is purely pragmatic - since
> then HH.org LAB was given up as a price to be able to work closer with
> other kernel porting communities, there were no bootloader which would
> be able to boot kernel out of rootfs. That in turn means choring
> complexities for users while upgrading kernel. So, all this work is
> just to be able to boot using initramfs-shaped bootloaders, and thus
> purely practical, intended to go general availability tomorrow or so.
> obviously, removing recipes from OE would rather complicate my work.

So you're going to push something that core OE devs object to into
widespread use and ignore our concerns? Thanks :(.

> > I think the problem is you're effectively trying to end up with
> > something where you "bitbake angstrom" and it produces a distribution,
> 
> Yes, isn't that what bitbake supposed to do?

Not with its current design, no.

> > There
> > is always going to be some effort that comes from a user when
> > directing bitbake what to do, be it setting the MACHINE, saying what
> > image type you'd like or what kind of image you want. The problem
> > you're addressing is one clearly where the user needs to provide some
> > input.
> 
> Building kernel is where user needs to provide some input? Which one
> exactly?

Which flavour of rootfs to use (libc, image type, image contents)?

> > Its ironic that you were arguing *against* my insistence of the
> > automatic setting of the IMAGE_FSTYPES variable on a per machine
> > basis ;-).
> 
> It's because we see this problem from orthogonal views. There're
> thousands of machines (yes, there're, the fact that OE lacks all them
> is not only due to fact that noone contributes them all, but also due to
> OE's lack of good paradigm to maintain them). So, carefully crafted
> hacks for one or another machine appear to be just random divergences
> looking from eagle's eye on entire machine set. So IMHO, machines
> should be maintained just like that - as a set.
> 
> Regarding this case, I would understand your concerns if I hacked this
> stuff on linux-hh level. But of course, I try to make it generic and
> potentially working for any kernel and config. Where it can't be right
> now, is not my fault, but something hopefully to fix, not to limit new
> developments by.

We have certain confines we have to live within. If we break these the
foundations collapse. You're tunnelling through foundations and I'm not
happy at all about it since the walls will fall in :(. I also don't
think you realise the implications of what you're doing.

Just for the lists reference I've raised this with the core devs who I
will discuss this with and then take any action agreed upon.

Cheers,

Richard







