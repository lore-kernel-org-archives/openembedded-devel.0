Received: from [66.249.92.172] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JQ51f-0003Nz-Ry
	for openembedded-devel@openembedded.org; Fri, 15 Feb 2008 19:11:25 +0100
Received: by ug-out-1314.google.com with SMTP id q7so1339431uge.0
	for <openembedded-devel@openembedded.org>;
	Fri, 15 Feb 2008 10:10:50 -0800 (PST)
Received: by 10.66.224.19 with SMTP id w19mr1387282ugg.34.1203099049121;
	Fri, 15 Feb 2008 10:10:49 -0800 (PST)
Received: from widy.localdomain ( [88.252.162.97])
	by mx.google.com with ESMTPS id 28sm5448483ugs.43.2008.02.15.10.10.43
	(version=SSLv3 cipher=OTHER); Fri, 15 Feb 2008 10:10:47 -0800 (PST)
Date: Fri, 15 Feb 2008 20:11:02 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
Message-ID: <20080215201102.0375245d@widy.localdomain>
In-Reply-To: <1203095510.8636.92.camel@dax.rpnet.com>
References: <20080214045433.02de68cd@widy.localdomain>
	<74d0deb30802140255k6c16bafeq6771d572fd7c542c@mail.gmail.com>
	<20080215110230.526ea6a1@widy.localdomain>
	<74d0deb30802150141q71e844esd6185bf52b1e79ae@mail.gmail.com>
	<20080215133238.7d8f7887@widy.localdomain>
	<1203076695.8636.30.camel@dax.rpnet.com>
	<20080215182949.053c3d3a@widy.localdomain>
	<1203095510.8636.92.camel@dax.rpnet.com>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 66.249.92.172
X-SA-Exim-Mail-From: pmiscml@gmail.com
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
X-List-Received-Date: Fri, 15 Feb 2008 18:11:26 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Fri, 15 Feb 2008 17:11:50 +0000
Richard Purdie <rpurdie@rpsys.net> wrote:

> On Fri, 2008-02-15 at 18:29 +0200, Paul Sokolovsky wrote:
> > > On Fri, 2008-02-15 at 13:32 +0200, Paul Sokolovsky wrote:
> > > This is deliberate. Its so if you have "deb" packaging enabled and
> > > then switch to "ipk", everything just works since bitbake realises
> > > which stamps are missing and builds the missing parts.
> > 
> > ;-( That's apparently a case where good rebuild from scratch would
> > solve all issues ;-). 
> 
> Apart from the time taken. Why waste all the time when we don't need
> to. This was a nice solution which fitted into existing frameworks,
> wasn't complicated and worked well.
> 
> > Or looking at the root of it, making bitbake
> > operate on hierarchical tasks would solve this and likely other
> > issues we discuss.
> 
> What do you mean by hierarchical tasks? It is a hierarchical task
> executor already?

For this specific case, I meant to have following hierarchy:

do_package_write
 \-- do_package_write_ipk
 |-- do_package_write_deb

So, by calling do_package_write task, one would be assured that
packages in whatever selected formats were written. Timestamps could be
of form:

foo.do_package_write.do_package_write_ipk

As for now, it seems that bitbake maintains flat task list, with the
flat dependencies (run task before x and after y).

> 
> > > What I'd prefer to see is a sequence like:
> > > 
> > > bitbake initramfs-image
> > > bitbake initramfs-kernel
> > > 
> > 
> > Ah, you mean sequences of:
> > 
> > ./configure <lotsa stuff>
> > make
> > make install <some stuff>
> 
> No, I don't mean sequences like that, they're obviously different.
> 
> > ? Wait, that holy place is taken already! And OE have been going in
> > quite different direction for long time. It automates mind-boggling
> > things like building gcc or glibc, but when it comes to automating
> > bitbake with bitbake itself, there's suddenly a taboo? ;-)
> 
> Yes. It requires a very precise distro setup for this to work. For
> example I changed the libc mode I was using in poky the other day and
> smashed up a load of my glibc ipks.

Fully agree. And very precise distro setup is also what is needed to
assure user satisfaction with the building (because even with
recursion, there're lots of things to misconfigure), and also to assure
quality and QAability. So, OE should be moving at that direction, and I
would think that Angstrom is a testbed for that for example.

> You're proposing this as a solution to switching libc modes and who
> knows what else 

Else - what practice calls. All this came out not from mere
speculation, but from the need to build a kernel with linked-in
initramfs - which is upstream-supported configuration for many years,
and which OE is unable to build.

> and it really isn't an option.
> 
> > Running bitbake in recipe is just as visible and understandable as
> > running gcc or anything else - nothing is shown to users except for
> > some high-level motions, but all actions are recorded in logs. So,
> > to understand what's going on, a look at recipe and logs is
> > required in either case, and there're lots of "non-recursive"
> > recipes which are beyond understanding of mere humans. On the
> > contrary, initramfs-image-ipk is pretty easy (except for long
> > lines) and should easily teach something new.
> 
> No, it breaks things for the user, e.g. "bitbake -g" no longer shows
> all the tasks that actually happen. 

	This also assume flat world view, where bitbake is the singular
god. Because with other look, bitbake -g shows *all* tasks it runs,
just on the current level of its power.

> It also won't honour bitbake's
> threading instuctions. 

	Yes, I expressed this concern in the very first mail. IMHO,
productive consideration of this issue would involve assessing prior
art, noting that parallel make doesn't work for some Makefiles, noting
that OE has safeguards to disallow it for some recipes, and wondering
if ability to disable parallel bitbake for some recipes is a viable
idea.

> Oh, and how sure are you that two bitbakes can
> run on the same directory at once? (the answer is that they can't and
> it will break badly.)

	Well, only practice, itself ;-). It all does run here, without
any disasters. Again, if it doesn't, let's fix it?

> 
> > Other points:
> > * It only starts with 2 commands, the list grows with the time
> > (exponentially?)
> 
> How many of these recursive executions have we ever needed? Can you
> give me more examples of cases where we need to do exponential
> recursive execution?

Not literally, I'm afraid, just usual quoting laws of nature ;-).

> 
> > * It's not going to be those easy "bitbake foo + bitbake bar"
> > 2-word commands. As was pointed already, building an initramfs
> > requires ANGSTROM_MODE (aka LIBC_TYPE aka (but unrecognized)
> > SYSTYPE) and IMAGE_FSTYPES set. Further - more.
> 
> ANGSTROM_MODE? 

	No, SYSTYPE! And that should be INITRAMFS_SYSTYPE, of course.
Just not everything in one iteration (still blocked on the very
SYSTYPE).

> So this is even angstrom specific and requires special
> setup? (it also implies multimachine which is not default)

	Maybe it's time to make it default.

> > * One of the annoying issues is to how to get hands on results of
> > the first task in the second one. Currently, for the second task,
> > such location is rather unpredictable. I solved this by adding
> > special task which just accepts parameter - location where to put
> > stuff. Again, special tasks, special parameters. User would either
> > need to know and use them, or do it all manually.
> 
> We used to have this problem with kernels and images for scripting
> purposes which is why we added predictably named symlinks. These kind
> of issues are solvable in simple ways with some thought.

Those predictably named symlinks live in unpredictably named and
structured directories. My recipes take care of that - in simple ways
exactly.

> 
> I'm actually going to go as far as proposing any recursive bitbake
> recipes are removed from OE.dev ASAP for the reasons I've mentioned
> above. We *need* to find a better way. I will try and help you find
> that and will extend bitbake if needed.

Yes, we need to find a better way. But many things are on todo for a
long time in OE, without much moving ;-(. My recipes for building
kernel with linked initramfs is a kind of sprint trying to solve one
of such long-standing issues. The solution is of course is not perfect,
but does work, and can be elaborated to either remove unneeded
environment dependencies, or solved in completely different way. But in
the meantime, it would be already usable where it is needed. So, I have
alternative proposal - leaving them in OE, possibly move to
angstrom-specific dir if its considered too Angstrom-specific. 

My reason for working in this direction is purely pragmatic - since
then HH.org LAB was given up as a price to be able to work closer with
other kernel porting communities, there were no bootloader which would
be able to boot kernel out of rootfs. That in turn means choring
complexities for users while upgrading kernel. So, all this work is
just to be able to boot using initramfs-shaped bootloaders, and thus
purely practical, intended to go general availability tomorrow or so.
obviously, removing recipes from OE would rather complicate my work.

> I think the problem is you're effectively trying to end up with
> something where you "bitbake angstrom" and it produces a distribution,

Yes, isn't that what bitbake supposed to do?

> uploads it, writes its own documentation and fixes its own bugs. 

No, none of these three.

> There
> is always going to be some effort that comes from a user when
> directing bitbake what to do, be it setting the MACHINE, saying what
> image type you'd like or what kind of image you want. The problem
> you're addressing is one clearly where the user needs to provide some
> input.

Building kernel is where user needs to provide some input? Which one
exactly?

> 
> Its ironic that you were arguing *against* my insistence of the
> automatic setting of the IMAGE_FSTYPES variable on a per machine
> basis ;-).

It's because we see this problem from orthogonal views. There're
thousands of machines (yes, there're, the fact that OE lacks all them
is not only due to fact that noone contributes them all, but also due to
OE's lack of good paradigm to maintain them). So, carefully crafted
hacks for one or another machine appear to be just random divergences
looking from eagle's eye on entire machine set. So IMHO, machines
should be maintained just like that - as a set.

Regarding this case, I would understand your concerns if I hacked this
stuff on linux-hh level. But of course, I try to make it generic and
potentially working for any kernel and config. Where it can't be right
now, is not my fault, but something hopefully to fix, not to limit new
developments by.

> 
> Cheers,
> 
> Richard
> 
> 



-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


