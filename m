Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MhrHr-000785-OQ
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 22:46:10 +0200
Received: from 212-139-92-236.dynamic.dsl.as9105.com ([212.139.92.236]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1Mhqzp-0003vg-LG
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 21:27:30 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <19c1b8a90908301108td29060ci1e63e1239ef6802d@mail.gmail.com>
References: <1251504044-2315-1-git-send-email-raj.khem@gmail.com>
	<20090829020254.GC6785@smtp.west.cox.net>
	<19c1b8a90908290050q60b6d47dw7b559087e343dc41@mail.gmail.com>
	<20090830012244.GA5033@gmail.com>
	<1251619852.4215.666.camel@lenovo.internal.reciva.com>
	<1251620948.4215.673.camel@lenovo.internal.reciva.com>
	<20090830092250.GA16275@gmail.com>
	<1251626062.4215.687.camel@lenovo.internal.reciva.com>
	<20090830103836.GA19944@gmail.com>
	<1251631135.22587.17.camel@kc.internal.reciva.com>
	<19c1b8a90908301108td29060ci1e63e1239ef6802d@mail.gmail.com>
Date: Sun, 30 Aug 2009 21:27:23 +0100
Message-Id: <1251664043.4215.725.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [PATCH] sane-toolchain-eglibc.inc: Set TARGET_OS =	linux-gnuspe for e500
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 30 Aug 2009 20:46:12 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-08-30 at 11:08 -0700, Khem Raj wrote:
> On Sun, Aug 30, 2009 at 4:18 AM, Phil Blundell<philb@gnu.org> wrote:
> > Actually, I'm now beginning to think that this approach is backwards and
> > it would be better to do things the other way around.  That is, stick
> > with TARGET_OS as the primary configuration variable that the user sets,
> > and infer everything else (including ${LIBC}) from the value that they
> > have chosen.  That seems like it would avoid a lot of these issues with
> > bits of OE second-guessing the user and it would also help to prevent a
> > further proliferation of poorly-documented configuration variables.
> 
> hmm yes and these function could be turned into checking functions
> of some sort if needed. So user can get notified for what sins he has
> done by selecting a particular TARGET_OS :)

That kind of thing, yes.

> where do you think it should be defined then ?
> it definitely needs to know about machine so machine conf seems
> to be correct and distros are not per arch bases so defining it in
> distros would not work the way it does now.

If "it" means TARGET_OS then I think it probably should be defined by
DISTRO.conf just as it is now.  DISTROs do need to have some
architecture knowledge (and, in fact, I would guess that the vast
majority of currently-defined DISTROs are single-architecture-only) so
this doesn't seem like it should be a problem.

> I do not like guessing work too but somehow it should not be
> too much of a pain for a user to set it too.
>
> not many users would know so many details about machine libraries
> and ABIs and how they impact the target triplets. More than
> often they will get it wrong.

All that the end user needs to do is set MACHINE and DISTRO and he
should be in business; the distro will figure everything else out.

Worrying about target triplets is the job of the distro maintainer, and
they ought to know what they're doing for at least the set of
architectures that they care about.

> Saying that user defines MACHINE and LIBC one wants in his DISTRO
> and computing  TARGET_TRIPLET from this does not sound a bad idea to me.
> may be we can change TARGET_OS to not indicate the last part of target triplet
> instead it is something like say 'linux' 'freebsd' or 'none'  and then
> we can concatenate them
> as we are doing to form the real target triplet.
> 
> I think this would enhance the user experience of OE.

I'm not sure that changing the meaning of TARGET_OS at this stage is a
good idea.  If you wanted to add a new include file that folks can use
to auto-compute a TARGET_OS value from a (LIBC, ABI) kind of tuple then
that wouldn't be an unreasonable thing to do.  I still feel that random
fluctuations of target abi as a result of changes to MACHINE are
probably a toxic idea and something best avoided, unless there is a
reliable method of interlocking them with PACKAGE_ARCH in some way.

p.



