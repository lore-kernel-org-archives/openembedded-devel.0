Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1M67u7-0004h4-NX
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 20:49:40 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1M67n2-000G7O-A1
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 22:42:20 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 May 2009 22:42:13 +0400
User-Agent: KMail/1.11.2 (Linux/2.6.29; KDE/4.2.2; x86_64; ; )
References: <20090517212442.6E35A1893E6@amethyst.openembedded.net>
	<200905181812.54222.khimov@altell.ru>
	<1242657603.9080.122.camel@mill.internal.reciva.com>
In-Reply-To: <1242657603.9080.122.camel@mill.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <200905182242.14829.khimov@altell.ru>
Subject: Re: [oe-commits] Roman I Khimov : (e) glibc-package:	fix	kernel version passed to qemu
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
X-List-Received-Date: Mon, 18 May 2009 18:49:40 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 18 May 2009 18:40:03 Phil Blundell wrote:
> On Mon, 2009-05-18 at 18:12 +0400, Roman I Khimov wrote:
> > If any target device requires kernel version not less then $SMTH, it must
> > set it via OLDEST_KERNEL, isn't it?
>
> No, this has never previously been a constraint.  ${OLDEST_KERNEL}
> exists as a hint to say "there is no need to include support for kernels
> older than this one", but it doesn't necessarily work the other way
> around: there is no guarantee that ${OLDEST_KERNEL} is actually a
> sufficient version for correct operation.

That seems strange to me. 

I've tried locale generation for qemuarm that doesn't set any OLDEST_KERNEL 
and it really is broken with

FATAL: kernel too old

The problem is, glibc configuration started with "--enable-kernel=2.4.0" gets 
reconfigured to 2.6.14:

checking installed Linux kernel header files... 2.0.10 or later
configure: WARNING: minimum kernel version reset to 2.6.14
checking for kernel header at least 2.6.14... ok

and the reason is in ports/sysdeps/unix/sysv/linux/arm/eabi/configure.in.

ARM EABI has highest requirements, m68k wants at least 2.6.10, then 
sparc/sparc64 wants 2.4.21 and then hppa and ppc/ppc64 wants 2.4.19. Anything 
else is OK with 2.4.0.

Now, I think that this should be fixed on target level. OLDEST_KERNEL should 
be something sane. Global 2.4.0 from bitbake.conf is good enough for most 
targets, but if we know that none of ARM EABI works with kernel versions prior 
to 2.6.14, we should set OLDEST_KERNEL to 2.6.14 for that targets. Or higher, 
of course, if target needs/wants that. If that's OK with all, I'm doing a 
patch.


