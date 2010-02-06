Received: from qmta02.westchester.pa.mail.comcast.net ([76.96.62.24])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pspreadborough@comcast.net>) id 1NdZe6-0000pW-DF
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Feb 2010 02:39:42 +0100
Received: from omta02.westchester.pa.mail.comcast.net ([76.96.62.19])
	by qmta02.westchester.pa.mail.comcast.net with comcast
	id eDs41d0070QuhwU52Rd8v2; Sat, 06 Feb 2010 01:37:08 +0000
Received: from sz0154.wc.mail.comcast.net ([76.96.58.220])
	by omta02.westchester.pa.mail.comcast.net with comcast
	id eRd81d00A4l5d103NRd8MP; Sat, 06 Feb 2010 01:37:08 +0000
Date: Sat, 6 Feb 2010 01:37:08 +0000 (UTC)
From: pspreadborough@comcast.net
To: openembedded-devel@lists.openembedded.org
Message-ID: <1464457259.415721265420228467.JavaMail.root@sz0154a.westchester.pa.mail.comcast.net>
In-Reply-To: <1444973837.415081265420091001.JavaMail.root@sz0154a.westchester.pa.mail.comcast.net>
MIME-Version: 1.0
X-Originating-IP: [76.24.64.15]
X-Mailer: Zimbra 5.0.19_GA_3172.RHEL5_64 (ZimbraWebClient - FF3.0
	(Linux)/5.0.19_GA_3177.RHEL5_64)
X-SA-Exim-Connect-IP: 76.96.62.24
X-SA-Exim-Mail-From: pspreadborough@comcast.net
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
X-List-Received-Date: Sat, 06 Feb 2010 01:39:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


----- "Travis Stratman" <tstratman@emacinc.com> wrote: 
> On Fri, 2010-02-05 at 13:41 -0800, Khem Raj wrote: 
> > On Fri, Feb 5, 2010 at 12:43 PM, Travis Stratman <tstratman@emacinc.com> wrote: 
> > > On Fri, 2010-02-05 at 10:00 -0800, Khem Raj wrote: 
> > >> On Fri, Feb 5, 2010 at 4:29 AM, Detlef Vollmann <dv@vollmann.ch> wrote: 
> > >> > On 02/03/10 15:03, pspreadborough@comcast.net wrote: 
> > >> >> 
> > >> >> My 2.6.29 kernel is built with the CodeSourcery 
> > >> >> arm-2009q3-67-arm-none-linux-gnueabi compiler and has the EABI and 
> > >> >> OABI_COMPAT config options enabled. Using this kernel I can boot my SA1110 
> > >> >> iPaq into a OABI ramfs with no problems, however if I build a "HelloWorld" 
> > >> >> executable with the same compiler and try and run it I get an "Illegal 
> > >> >> Instruction" error. I build the test program using static linking, select 
> > >> >> the correct machine type and tune options but to no avail, I always get the 
> > >> >> illegal instruction. 
> > >> 
> > >> You need gcc 4.4 to get EABI working on ARMv4 and there are additional patches 
> > >> to gcc on top of gcc 4.4 see 
> > >> gcc-armv4-pass-fix-v4bx-to-ld.patch for gcc in OE. So as Koen suggested earlier 
> > >> if you try with OE compiler you might have better chance of getting it 
> > >> to work as many 
> > >> OE devs have tried it. 
> > >> btw. are you passing march=armv4 to the compiler when doing the compile ? 
> > > 
> > > >From my understanding of this issue he has an OABI rootfs and is trying 
> > > to run an EABI executable on top of it. This just doesn't work period 
> > > AFAIK; the kernel can boot either OABI or EABI with the compatibility 
> > > flags config'd in, but all of the binaries on the filesystem must match. 
> > > 
> > > I'll have to look into the patch that you referenced above because I 
> > > have been using EABI (built through OE) for both the kernel and 
> > > filesystem with armv4t for a few years now. First w/ GCC 4.1.1 and now 
> > > with 4.2.4 and I've never run into issues. Does the issue only manifest 
> > > in certain situations? 
> > 
> > Well you said armv4t thats a whole different story than armv4 (without 
> > 't') for EABI 
> > AFAICT SA1110 is based on ARMv4 not ARMv4t. 
> 
> You are correct, my mistake. 

I have built a EABI rootfs but I get a kernel panic when it attempts
to run init, hence my attempts to verify my EABI executables on a OABI 
fs.

Perhaps it's time for me to try the OE EABI compiler. Can you advise me 
on which OE recipes to use for this?

Regards,

Pete 



