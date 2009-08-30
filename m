Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1Mhiio-000560-RH
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 13:37:23 +0200
Received: from 212-139-92-236.dynamic.dsl.as9105.com ([212.139.92.236]
	helo=[192.168.2.175])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MhiR0-0006TS-2x
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 12:18:58 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090830103836.GA19944@gmail.com>
References: <1251504044-2315-1-git-send-email-raj.khem@gmail.com>
	<20090829020254.GC6785@smtp.west.cox.net>
	<19c1b8a90908290050q60b6d47dw7b559087e343dc41@mail.gmail.com>
	<20090830012244.GA5033@gmail.com>
	<1251619852.4215.666.camel@lenovo.internal.reciva.com>
	<1251620948.4215.673.camel@lenovo.internal.reciva.com>
	<20090830092250.GA16275@gmail.com>
	<1251626062.4215.687.camel@lenovo.internal.reciva.com>
	<20090830103836.GA19944@gmail.com>
Date: Sun, 30 Aug 2009 12:18:55 +0100
Message-Id: <1251631135.22587.17.camel@kc.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.2 
Subject: Re: [PATCH] sane-toolchain-eglibc.inc: Set TARGET_OS	= linux-gnuspe for e500
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
X-List-Received-Date: Sun, 30 Aug 2009 11:37:25 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-08-30 at 03:38 -0700, Khem Raj wrote:
> On (30/08/09 10:54), Phil Blundell wrote:
> > On Sun, 2009-08-30 at 02:22 -0700, Khem Raj wrote:
> > > based upon your idea in last email. Here is something I put together
> > > seems to work. It will need testing ofcourse
> > > 
> > > What do you think about this one ?
> > 
> > Thanks for the update.  This looks like generally the right idea, except
> > that I still feel it is undesirable for an innocuous-looking change of
> > MACHINE to result in far-reaching abi consequences.  So we need to
> > figure out a way to deal with that.
> 
> I think some machines are incapable of dealing with EABI requirements.
> thats why this dependency of machines and sometimes machines also
> dictate ABI like e500 pushes you to use gnuspe. So I think ABI is tied
> to machine in some ways.

There are very few, if any, machines in OE that are fundamentally
incapable of running EABI code.  (There is a larger set of machines
where running true EABI code would be awkward and/or slow, but even on
those you don't necessarily want to fall back all the way to OABI; a
better compromise would be to use a non-interworking EABI variant.)  In
any case, I think the appropriate response if the user selects an
incompatible combination of machine and ABI is to issue a diagnostic,
not to silently select a different ABI that you think is more
appropriate.

> actually it returns oabi or eabi if architecture is arm otherwise it
> returns empty string

Ah, so it does.  Maybe it would be better to simply not call the
function at all on non-arm architectures.

> A lot of toolchain configuration depend upon TARGET_OS one can easily
> get is wrong. So IMO its better to synthesize it correctly.

Actually, I'm now beginning to think that this approach is backwards and
it would be better to do things the other way around.  That is, stick
with TARGET_OS as the primary configuration variable that the user sets,
and infer everything else (including ${LIBC}) from the value that they
have chosen.  That seems like it would avoid a lot of these issues with
bits of OE second-guessing the user and it would also help to prevent a
further proliferation of poorly-documented configuration variables.

> I think using arm-linux-gnu (OABI) arm-linux-gnueabi (EABI) would be
> more  logical at present we use arm-linux for OABI that said using
> linux-gnu on other arches is also nice thing to do.

Yes, agreed, I think it should ideally be CPU-linux-gnu in general, and
CPU-linux-gnuABISUFFIX for particular ABI variants.

> Similarily for uclibc/EABI we use arm-linux-uclibcgnueabi probably using
> arm-linux-uclibceabi(EABI)  and arm-linux-uclibc(OABI) would be cleaner. 

I guess that depends on what the GCC/uClibc conventions are.
"arm-linux-gnuuclibc" looks a bit ugly but presumably the GNU folks like
to keep their name in there somewhere.

p.



