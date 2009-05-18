Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1M68lB-0003Sk-QI
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 21:44:29 +0200
Received: from 88-109-251-122.dynamic.dsl.as9105.com ([88.109.251.122]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1M68e6-0002bp-Nx
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 20:37:12 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1242672893.4226.52.camel@lenovo.internal.reciva.com>
References: <20090517212442.6E35A1893E6@amethyst.openembedded.net>
	<200905181812.54222.khimov@altell.ru>
	<1242657603.9080.122.camel@mill.internal.reciva.com>
	<200905182242.14829.khimov@altell.ru>
	<1242672893.4226.52.camel@lenovo.internal.reciva.com>
Date: Mon, 18 May 2009 20:37:09 +0100
Message-Id: <1242675429.4226.56.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [oe-commits] Roman I Khimov :	(e)	glibc-package:	fix	kernel version passed to qemu
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
X-List-Received-Date: Mon, 18 May 2009 19:44:30 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-05-18 at 19:54 +0100, Phil Blundell wrote:
> On Mon, 2009-05-18 at 22:42 +0400, Roman I Khimov wrote:
> > Now, I think that this should be fixed on target level. OLDEST_KERNEL should 
> > be something sane. Global 2.4.0 from bitbake.conf is good enough for most 
> > targets, but if we know that none of ARM EABI works with kernel versions prior 
> > to 2.6.14, we should set OLDEST_KERNEL to 2.6.14 for that targets. Or higher, 
> > of course, if target needs/wants that. If that's OK with all, I'm doing a 
> > patch.
> 
> I'm still not convinced this is either practical or desirable.  The
> kernel versions you mentioned are the minimum required for the
> particular version of glibc you were looking at, but different libcs or
> different versions of the same libc will have different minimum kernel
> requirements even for the same target.  (As an obvious example, the m68k
> port has been supported in glibc since its inception and clearly didn't
> require a 2.6.18 kernel to start with.)

The other thing to say about OLDEST_KERNEL is that it was intended to be
controlled by the DISTRO, not by the MACHINE.  In other words, it's a
policy control ("kernel x.xx is the earliest one we care about; it's
okay to omit the compatibility bits for older ones") and not a target
attribute ("kernel x.xx is the minimum required for correct
functionality").  We don't currently have a variable with the latter
semantics and nor am I very convinced that it would be a good idea to
introduce one.

p.




