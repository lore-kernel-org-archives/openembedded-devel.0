Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JQ46v-0006B7-Uc
	for openembedded-devel@openembedded.org; Fri, 15 Feb 2008 18:12:33 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1FHC1wK019928;
	Fri, 15 Feb 2008 17:12:01 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19679-08; Fri, 15 Feb 2008 17:11:53 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1FHBnB6019912
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 15 Feb 2008 17:11:50 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Paul Sokolovsky <pmiscml@gmail.com>
In-Reply-To: <20080215182949.053c3d3a@widy.localdomain>
References: <20080214045433.02de68cd@widy.localdomain>
	<74d0deb30802140255k6c16bafeq6771d572fd7c542c@mail.gmail.com>
	<20080215110230.526ea6a1@widy.localdomain>
	<74d0deb30802150141q71e844esd6185bf52b1e79ae@mail.gmail.com>
	<20080215133238.7d8f7887@widy.localdomain>
	<1203076695.8636.30.camel@dax.rpnet.com>
	<20080215182949.053c3d3a@widy.localdomain>
Date: Fri, 15 Feb 2008 17:11:50 +0000
Message-Id: <1203095510.8636.92.camel@dax.rpnet.com>
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
X-List-Received-Date: Fri, 15 Feb 2008 17:12:34 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2008-02-15 at 18:29 +0200, Paul Sokolovsky wrote:
> > On Fri, 2008-02-15 at 13:32 +0200, Paul Sokolovsky wrote:
> > This is deliberate. Its so if you have "deb" packaging enabled and
> > then switch to "ipk", everything just works since bitbake realises
> > which stamps are missing and builds the missing parts.
> 
> ;-( That's apparently a case where good rebuild from scratch would
> solve all issues ;-). 

Apart from the time taken. Why waste all the time when we don't need to.
This was a nice solution which fitted into existing frameworks, wasn't
complicated and worked well.

> Or looking at the root of it, making bitbake
> operate on hierarchical tasks would solve this and likely other issues
> we discuss.

What do you mean by hierarchical tasks? It is a hierarchical task
executor already?

> > What I'd prefer to see is a sequence like:
> > 
> > bitbake initramfs-image
> > bitbake initramfs-kernel
> > 
> 
> Ah, you mean sequences of:
> 
> ./configure <lotsa stuff>
> make
> make install <some stuff>

No, I don't mean sequences like that, they're obviously different.

> ? Wait, that holy place is taken already! And OE have been going in
> quite different direction for long time. It automates mind-boggling
> things like building gcc or glibc, but when it comes to automating
> bitbake with bitbake itself, there's suddenly a taboo? ;-)

Yes. It requires a very precise distro setup for this to work. For
example I changed the libc mode I was using in poky the other day and
smashed up a load of my glibc ipks.

You're proposing this as a solution to switching libc modes and who
knows what else and it really isn't an option.

> Running bitbake in recipe is just as visible and understandable as
> running gcc or anything else - nothing is shown to users except for
> some high-level motions, but all actions are recorded in logs. So, to
> understand what's going on, a look at recipe and logs is required in
> either case, and there're lots of "non-recursive" recipes which are
> beyond understanding of mere humans. On the contrary,
> initramfs-image-ipk is pretty easy (except for long lines) and should
> easily teach something new.

No, it breaks things for the user, e.g. "bitbake -g" no longer shows all
the tasks that actually happen. It also won't honour bitbake's threading
instuctions. Oh, and how sure are you that two bitbakes can run on the
same directory at once? (the answer is that they can't and it will break
badly.)

> Other points:
> * It only starts with 2 commands, the list grows with the time
> (exponentially?)

How many of these recursive executions have we ever needed? Can you give
me more examples of cases where we need to do exponential recursive
execution?

> * It's not going to be those easy "bitbake foo + bitbake bar"
> 2-word commands. As was pointed already, building an initramfs requires
> ANGSTROM_MODE (aka LIBC_TYPE aka (but unrecognized) SYSTYPE) and
> IMAGE_FSTYPES set. Further - more.

ANGSTROM_MODE? So this is even angstrom specific and requires special
setup? (it also implies multimachine which is not default)

> * One of the annoying issues is to how to get hands on results of the
> first task in the second one. Currently, for the second task, such
> location is rather unpredictable. I solved this by adding special task
> which just accepts parameter - location where to put stuff. Again,
> special tasks, special parameters. User would either need to know and
> use them, or do it all manually.

We used to have this problem with kernels and images for scripting
purposes which is why we added predictably named symlinks. These kind of
issues are solvable in simple ways with some thought.

I'm actually going to go as far as proposing any recursive bitbake
recipes are removed from OE.dev ASAP for the reasons I've mentioned
above. We *need* to find a better way. I will try and help you find that
and will extend bitbake if needed.

I think the problem is you're effectively trying to end up with
something where you "bitbake angstrom" and it produces a distribution,
uploads it, writes its own documentation and fixes its own bugs. There
is always going to be some effort that comes from a user when directing
bitbake what to do, be it setting the MACHINE, saying what image type
you'd like or what kind of image you want. The problem you're addressing
is one clearly where the user needs to provide some input.

Its ironic that you were arguing *against* my insistence of the
automatic setting of the IMAGE_FSTYPES variable on a per machine
basis ;-).

Cheers,

Richard




