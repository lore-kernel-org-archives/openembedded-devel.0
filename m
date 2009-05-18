Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1M69NT-0001qz-UM
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 22:24:04 +0200
Received: from 88-109-251-122.dynamic.dsl.as9105.com ([88.109.251.122]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1M69GN-00046h-01
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 21:16:43 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200905182354.48480.khimov@altell.ru>
References: <20090517212442.6E35A1893E6@amethyst.openembedded.net>
	<1242672893.4226.52.camel@lenovo.internal.reciva.com>
	<1242675429.4226.56.camel@lenovo.internal.reciva.com>
	<200905182354.48480.khimov@altell.ru>
Date: Mon, 18 May 2009 21:16:29 +0100
Message-Id: <1242677789.4226.68.camel@lenovo.internal.reciva.com>
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
X-List-Received-Date: Mon, 18 May 2009 20:24:04 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-05-18 at 23:54 +0400, Roman I Khimov wrote:
> On Monday 18 May 2009 23:37:09 Phil Blundell wrote:
> > The other thing to say about OLDEST_KERNEL is that it was intended to be
> > controlled by the DISTRO, not by the MACHINE.  In other words, it's a
> > policy control ("kernel x.xx is the earliest one we care about; it's
> > okay to omit the compatibility bits for older ones") and not a target
> > attribute ("kernel x.xx is the minimum required for correct
> > functionality").  We don't currently have a variable with the latter
> > semantics and nor am I very convinced that it would be a good idea to
> > introduce one.
> 
> We can add soft 'sane' assignments to machines and then distros can override 
> that to whatever they want if they want to, or not?

No, the MACHINE doesn't know what version of libc is going to be
selected and hence what kernel version will be needed.  Even if it did,
this plan would lose if the DISTRO selected an older kernel than the
MACHINE requires, which in turn would make it difficult in practice for
DISTROs to do anything useful with this variable.

What is your objection to just selecting the highest kernel version that
qemu supports for the target architecture?  That seems like an easy fix
and one that makes this whole problem go away without requiring either
any extra variables or any semantic changes to existing variables.

p.




