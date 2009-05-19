Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1M6K1g-00062s-PJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 May 2009 09:46:17 +0200
Received: from 88-109-251-122.dynamic.dsl.as9105.com ([88.109.251.122]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1M6JuW-0004AG-Uz
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 May 2009 08:38:53 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <877i0e2ejf.wl%peter@chubb.wattle.id.au>
References: <20090517212442.6E35A1893E6@amethyst.openembedded.net>
	<1242672893.4226.52.camel@lenovo.internal.reciva.com>
	<1242675429.4226.56.camel@lenovo.internal.reciva.com>
	<200905182354.48480.khimov@altell.ru>
	<1242677789.4226.68.camel@lenovo.internal.reciva.com>
	<877i0e2ejf.wl%peter@chubb.wattle.id.au>
Date: Tue, 19 May 2009 08:38:51 +0100
Message-Id: <1242718731.4226.72.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [oe-commits] Roman I Khimov	:	(e)	glibc-package:	fix	kernel version passed to qemu
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
X-List-Received-Date: Tue, 19 May 2009 07:46:17 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-05-19 at 09:10 +1000, Peter Chubb wrote:
> >>>>> "Phil" == Phil Blundell <philb@gnu.org> writes:
> 
> Phil> On Mon, 2009-05-18 at 23:54 +0400, Roman I Khimov wrote:
> 
> Phil> What is your objection to just selecting the highest kernel
> Phil> version that qemu supports for the target architecture?  That
> Phil> seems like an easy fix and one that makes this whole problem go
> Phil> away without requiring either any extra variables or any
> Phil> semantic changes to existing variables.
> 
> 
> That doesn't make sense for our case.  We're using openembedded to
> generate a rootfs for an embedded virtual environment whose Linux
> kernel is currently at 2.6.10.  Glibcs built for later kernels will
> not run on this (because of the changes for handling
> thread-local-storage introduced in the 2.6.11--2.6.12 timeframe)

I think you misunderstood what I was proposing.  Glibc would continue to
be configured just as it is now: the only difference would be that
_qemu_ would be set to emulate the newest kernel version that it
supports, rather than a fixed version as previously.

p.




