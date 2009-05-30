Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MAXlI-0005Wa-GI
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 May 2009 01:14:48 +0200
Received: from 88-109-34-80.dynamic.dsl.as9105.com ([88.109.34.80]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MAXbW-0001OP-1X
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 May 2009 00:04:42 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090530191647.GL23842@smtp.west.cox.net>
References: <20090522213142.GF23842@smtp.west.cox.net>
	<200905242049.30726.marcin@juszkiewicz.com.pl>
	<20090530191647.GL23842@smtp.west.cox.net>
Date: Sun, 31 May 2009 00:04:40 +0100
Message-Id: <1243724680.4869.91.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: Kernel recipes with broken PRs now
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
X-List-Received-Date: Sat, 30 May 2009 23:14:48 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2009-05-30 at 12:16 -0700, Tom Rini wrote:
> On Sun, May 24, 2009 at 08:49:29PM +0200, Marcin Juszkiewicz wrote:
> > Dnia pi??tek, 22 maja 2009 o 23:31:43 Tom Rini napisa??(a):
> > > Hey all.  With the MACHINE_KERNEL_PR stuff, the following recipes
> > > will now revert to r0 rather than:
> > 
> > One solution is to set PR after 'inherit kernel'. But thats workaround.
> 
> Perhaps this isn't so much a workaround but an opt-out ?  The more I
> think about it, while this is a useful mechanism for machines that need
> it, it's also a PITA for machines that don't (now you need to modify
> your kernel recipe and bump something in your machine.conf, meaning full
> cache rebuild just for a feature you aren't even using).  Comments?  I'm
> tempted to just do that re-org next weekend, if no one beats me to it.

Yes, I agree that this is a PITA for machines (or, maybe more
accurately, distros) that don't want it.  As I wrote before, the
underlying problem is a legitimate one but, as currently implemented,
MACHINE_KERNEL_PR seems like a fairly poor solution to it.

My personal preference would still be just to make MACHINE_KERNEL_PR be
an opt-in thing per DISTRO.  I guess angstrom wants this: are there any
other distros that do?

p.




