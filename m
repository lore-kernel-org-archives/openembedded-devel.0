Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1TOUmz-0003yU-Ex
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Oct 2012 16:40:05 +0200
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MC100JLHHBSS7L1@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	17 Oct 2012 08:26:27 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 42B6120087; Wed,
	17 Oct 2012 09:26:15 -0400 (EDT)
Date: Wed, 17 Oct 2012 09:26:15 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20121017132615.GE5662@denix.org>
References: <1346930610-2977-1-git-send-email-koen@dominion.thruhere.net>
	<k2a264$d2a$1@ger.gmane.org> <20121010213234.GG16944@denix.org>
	<20121015192315.GK16944@denix.org> <k5m8ub$p5v$1@ger.gmane.org>
MIME-version: 1.0
In-reply-to: <k5m8ub$p5v$1@ger.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-oe][for-denzil][PATCH 1/8] kernel: save $kerndir/tools and $kerndir/lib from pruning
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
X-List-Received-Date: Wed, 17 Oct 2012 14:40:05 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 17, 2012 at 02:39:44PM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Op 15-10-12 21:23, Denys Dmytriyenko schreef:
> > ping! Can we get it pushed to denzil, please? Thanks.
> 
> It's in now.

Thank you!


> > On Wed, Oct 10, 2012 at 05:32:34PM -0400, Denys Dmytriyenko wrote:
> >> On Thu, Sep 06, 2012 at 01:41:57PM +0200, Koen Kooi wrote:
> > One day I will figure out how to write a cover letter :)
> > 
> > The matching OE-core patchset is in denzil-next for testing and will 
> > hopefully get merged soon (provided it passes the testsuite).
> > 
> > My main objective is to support on-target builds of external
> > kernel-modules and initial reports are that it is working as expected.
> > 
> > Since there's a bitbake.conf change needed the matching oe-core set needs
> > to go in first and ideally this goes in right after that (provided this
> > passes the testsuite as well).
> > 
> > As you can imagine, this kind of inter-layer dependency sucks, but I
> > don't see a way around it in this case with the bitbake.conf change.
> >>> 
> >>> So, what happened to this patchset? Can we get it pushed in to
> >>> meta-oe/denzil now, since corresponding changes to oe-core/denzil
> >>> finally got in couple weeks ago and it breaks external kernel-modules
> >>> now? Thanks!
> >>> 
> >>> -- Denys
> >>> 
> >>> 
> > Op 06-09-12 13:23, Koen Kooi schreef:
> >>>>> From: Bruce Ashfield <bruce.ashfield@windriver.com>
> >>>>> 
> >>>>> The kernel source tree in the sysroot has all unecessary source
> >>>>> code removed. The existing use case is to support module building
> >>>>> out of the sysroot, but as more toolsa are moved into the kernel
> >>>>> tree itself there are new use cases for the kernel sysroot
> >>>>> source.
> >>>>> 
> >>>>> To avoid putting dependencies on the kernel, and to be able to 
> >>>>> individually build and package these tools out of the source
> >>>>> tree, we can save $kerndir/tools and $kernddir/lib from being
> >>>>> removed. This enables tools like perf to be built our of the
> >>>>> kernel source in the sysroot, without significantly increasing
> >>>>> the amount of source in the sysroot.
> >>>>> 
> >>>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com> 
> >>>>> Signed-off-by: Richard Purdie
> >>>>> <richard.purdie@linuxfoundation.org> Signed-off-by: Martin Jansa
> >>>>> <Martin.Jansa@gmail.com> Signed-off-by: Koen Kooi
> >>>>> <koen@dominion.thruhere.net> --- meta-oe/classes/kernel.bbclass
> >>>>> | 2 +- 1 files changed, 1 insertions(+), 1 deletions(-)
> >>>>> 
> >>>>> diff --git a/meta-oe/classes/kernel.bbclass 
> >>>>> b/meta-oe/classes/kernel.bbclass index ce82351..c44a2f5 100644
> >>>>> --- a/meta-oe/classes/kernel.bbclass +++
> >>>>> b/meta-oe/classes/kernel.bbclass @@ -178,7 +178,7 @@
> >>>>> kernel_do_install() { # oe_runmake -C $kerneldir 
> >>>>> CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean make -C $kerneldir 
> >>>>> _mrproper_scripts -	find $kerneldir -path $kerneldir/scripts
> >>>>> -prune -o -name "*.[csS]" -exec rm '{}' \; +	find $kerneldir
> >>>>> -path $kerneldir/lib -prune -o -path $kerneldir/tools -prune -o
> >>>>> -path $kerneldir/scripts -prune -o -name "*.[csS]" -exec rm '{}'
> >>>>> \; find $kerneldir/Documentation -name "*.txt" -exec rm '{}' \;
> >>>>> 
> >>>>> # As of Linux kernel version 3.0.1, the clean target removes
> >>>>> 
> > 
> >>> 
> >>> 
> >>> _______________________________________________ Openembedded-devel
> >>> mailing list Openembedded-devel@lists.openembedded.org 
> >>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >>
> >>
> >>> 
> _______________________________________________
> >> Openembedded-devel mailing list 
> >> Openembedded-devel@lists.openembedded.org 
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
> 
> iD8DBQFQfqcQMkyGM64RGpERAuo9AJ0Vvatb00Ssc6W9qjYogMnNeAY4/ACfcdsC
> oGpHmBDk73Eu/iC8q3Ne2tY=
> =88JB
> -----END PGP SIGNATURE-----
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


