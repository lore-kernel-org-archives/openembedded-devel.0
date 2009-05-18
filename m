Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1M698V-0004JH-47
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 22:08:36 +0200
Received: from 88-109-251-122.dynamic.dsl.as9105.com ([88.109.251.122]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1M6917-0003Yg-DS
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 21:01:03 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200905182337.25460.khimov@altell.ru>
References: <20090517212442.6E35A1893E6@amethyst.openembedded.net>
	<200905182242.14829.khimov@altell.ru>
	<1242672893.4226.52.camel@lenovo.internal.reciva.com>
	<200905182337.25460.khimov@altell.ru>
Date: Mon, 18 May 2009 21:00:35 +0100
Message-Id: <1242676835.4226.59.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [oe-commits] Roman I Khimov : (e)	glibc-package:	fix	kernel version passed to qemu
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
X-List-Received-Date: Mon, 18 May 2009 20:08:37 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-05-18 at 23:37 +0400, Roman I Khimov wrote:
> On Monday 18 May 2009 22:54:53 Phil Blundell wrote:
> > I think it would be better to leave the semantics of OLDEST_KERNEL alone
> > and just teach qemu to use either the same __LINUX_KERNEL_VERSION as
> > glibc's configure script has settled on, or (perhaps better) just the
> > newest version that it supports for the given target.
> 
> Well, from my point of view, any static version is bad, because it's magic 
> thrown in. When I've stumbled upon this, I've scratched my head a bit on why 
> the hell is it 2.6.16, not 2.6.10, not 2.6.20, not anything else but 2.6.16. 
> Sure enough, it's just something that worked some time ago for someone and was 
> hardcoded then.

Agreed, a static version is clearly wrong.

> Of course, we can take version from __LINUX_KERNEL_VERSION, but that's more 
> work and it doesn't fix misconfiguration we have when glibc has to decide that 
> it knows better its minimal requirements for target.

I'm not sure what you're saying here.  __LINUX_KERNEL_VERSION (from
config.h) is precisely the version that glibc is compiled to expect (and
what dl-sysdep checks against).  So, if you run qemu as that same kernel
version, it is guaranteed to always be compatible with the glibc build
in question.

p.




