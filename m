Received: from mail.emacinc.com ([63.245.244.68])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tstratman@emacinc.com>) id 1NdX5s-0007rN-CN
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Feb 2010 23:56:12 +0100
Received: from [63.245.244.67] (helo=emac081.emacinc.com)
	by mail.emacinc.com with esmtp (Exim 4.50) id 1NdX3C-0005H7-Ct
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Feb 2010 16:53:29 -0600
From: Travis Stratman <tstratman@emacinc.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <19c1b8a91002051341m3465d125hcaa15fcfac08f10@mail.gmail.com>
References: <1497161523.3479291265205781088.JavaMail.root@sz0154a.westchester.pa.mail.comcast.net>
	<4B6C0F0D.8030308@vollmann.ch>
	<19c1b8a91002051000r69e645bey7395aa912d38e172@mail.gmail.com>
	<1265402638.4267.384.camel@cheeto.emacinc.com>
	<19c1b8a91002051341m3465d125hcaa15fcfac08f10@mail.gmail.com>
Date: Fri, 05 Feb 2010 16:53:19 -0600
Message-Id: <1265410399.4267.412.camel@cheeto.emacinc.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 
X-SA-Exim-Connect-IP: 63.245.244.68
X-SA-Exim-Mail-From: tstratman@emacinc.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: EABI pain and frustration!
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
X-List-Received-Date: Fri, 05 Feb 2010 22:56:12 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2010-02-05 at 13:41 -0800, Khem Raj wrote:
> On Fri, Feb 5, 2010 at 12:43 PM, Travis Stratman <tstratman@emacinc.com> wrote:
> > On Fri, 2010-02-05 at 10:00 -0800, Khem Raj wrote:
> >> On Fri, Feb 5, 2010 at 4:29 AM, Detlef Vollmann <dv@vollmann.ch> wrote:
> >> > On 02/03/10 15:03, pspreadborough@comcast.net wrote:
> >> >>
> >> >> My 2.6.29 kernel is built with the CodeSourcery
> >> >> arm-2009q3-67-arm-none-linux-gnueabi compiler and has the EABI and
> >> >> OABI_COMPAT config options enabled. Using this kernel I can boot my SA1110
> >> >> iPaq into a OABI ramfs with no problems, however if I build a "HelloWorld"
> >> >> executable with the same compiler and try and run it I get an "Illegal
> >> >> Instruction" error. I build the test program using static linking, select
> >> >> the correct machine type and tune options but to no avail, I always get the
> >> >> illegal instruction.
> >>
> >> You need gcc 4.4 to get EABI working on ARMv4 and there are additional patches
> >> to gcc on top of gcc 4.4 see
> >> gcc-armv4-pass-fix-v4bx-to-ld.patch for gcc in OE. So as Koen suggested earlier
> >> if you try with OE compiler you might have better chance of getting it
> >> to work as many
> >> OE devs have tried it.
> >> btw. are you passing march=armv4 to the compiler when doing the compile ?
> >
> > >From my understanding of this issue he has an OABI rootfs and is trying
> > to run an EABI executable on top of it. This just doesn't work period
> > AFAIK; the kernel can boot either OABI or EABI with the compatibility
> > flags config'd in, but all of the binaries on the filesystem must match.
> >
> > I'll have to look into the patch that you referenced above because I
> > have been using EABI (built through OE) for both the kernel and
> > filesystem with armv4t for a few years now. First w/ GCC 4.1.1 and now
> > with 4.2.4 and I've never run into issues. Does the issue only manifest
> > in certain situations?
> 
> Well you said armv4t thats a whole different story than armv4 (without
> 't') for EABI
> AFAICT SA1110 is based on ARMv4 not ARMv4t.

You are correct, my mistake.

Thanks,

TAS




