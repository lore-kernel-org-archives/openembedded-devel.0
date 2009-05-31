Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MAhy7-0008WC-3G
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 May 2009 12:08:43 +0200
Received: from 88-109-34-80.dynamic.dsl.as9105.com ([88.109.34.80]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MAhpl-0005a1-C1
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 May 2009 11:00:05 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <be7a9f3d0905301749u6a92f2ey59a96d2cde6069a2@mail.gmail.com>
References: <20090522213142.GF23842@smtp.west.cox.net>
	<200905242049.30726.marcin@juszkiewicz.com.pl>
	<20090530191647.GL23842@smtp.west.cox.net>
	<1243724680.4869.91.camel@lenovo.internal.reciva.com>
	<be7a9f3d0905301749u6a92f2ey59a96d2cde6069a2@mail.gmail.com>
Date: Sun, 31 May 2009 11:00:03 +0100
Message-Id: <1243764003.4869.130.camel@lenovo.internal.reciva.com>
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
X-List-Received-Date: Sun, 31 May 2009 10:08:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2009-05-30 at 21:49 -0300, Otavio Salvador wrote:
> Hello,
> 
> On Sat, May 30, 2009 at 8:04 PM, Phil Blundell <philb@gnu.org> wrote:
> > My personal preference would still be just to make MACHINE_KERNEL_PR be
> > an opt-in thing per DISTRO.  I guess angstrom wants this: are there any
> > other distros that do?
> 
> My understand is that every distro that uses anything that needs ABI
> compatibility with kernel needs it, or is suppose to use it.

As I understand it, the situation that MACHINE_KERNEL_PR is meant to fix
is where both the following are true:

1) you have an external package (be that an out-of-tree module or some
other binary) which depends on some detail of the kernel ABI; and

2) the ABI in question is in fact changing, necessitating a rebuild,
even though the advertised ABI version (what we save in
kernel-abiversion) isn't

Emperically, since most DISTROs have been managing fine without
MACHINE_KERNEL_PR until now, it seems that either this situation isn't
arising very often in practice or the maintainers are managing to work
around it in some other way.  Whichever of those is the case, the need
for a solution to this problem doesn't seem to be very acute right
now.  

Further, it seems clear that the MACHINE_KERNEL_PR approach, as
currently implemented, has at least a few deficiencies:

a) it will cause PR to go backwards for kernel packages which haven't
been updated to match, and this will happen silently so the maintainers
may not realise at first what is going on;

b) it doesn't scale very well to the situation where you have either a
single kernel used by multiple MACHINEs, or a single MACHINE with
multiple kernels.  I suspect the former might be the case for some of
the ipaqs, and I'm fairly sure that the latter can be the case for some
models of zaurus.

c) it causes the kernel metadata to be scattered around the tree in a
slightly weird way, rather than localised to the kernel's own .bb file
where it arguably belongs.

d) it requires a rebuild of all out-of-tree modules for any kernel
change at all, even if the ABI was unaffected.

Now, none of these deficiencies are absolutely intolerable, and it's
perfectly understandable that some distro maintainers might decide to
put up with them in order to gain the perceived benefits of
MACHINE_KERNEL_PR.  But, for DISTROs and/or MACHINEs that weren't
suffering from the original problem in the first place, this patch will
simply introduce annoyances with no compensating benefits.

I think it would be quite possible to write a patch to fix the original
problems without introducing the deficiencies above, and if that were
done then there should be no downsides to enabling the patch globally.
But, as it stands today, I don't think that MACHINE_KERNEL_PR is
something that should be foisted on folks who don't want or need it.

p.




