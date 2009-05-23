Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1M7u8M-00087E-5Y
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 May 2009 18:31:42 +0200
Received: from 88-109-34-80.dynamic.dsl.as9105.com ([88.109.34.80]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1M7u0n-0003YT-Hb
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 May 2009 17:23:53 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0905230606t48e57c58y658282e25c97fbee@mail.gmail.com>
References: <20090522213142.GF23842@smtp.west.cox.net>
	<c384c5ea0905230606t48e57c58y658282e25c97fbee@mail.gmail.com>
Date: Sat, 23 May 2009 17:23:52 +0100
Message-Id: <1243095832.4226.105.camel@lenovo.internal.reciva.com>
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
X-List-Received-Date: Sat, 23 May 2009 16:31:42 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2009-05-23 at 15:06 +0200, Leon Woestenberg wrote:
> I don't get the use case for MACHINE_KERNEL_PR, can someone explain?
> 
> Why would a machine or local.conf want to force rebuild by increasing
> this MACHINE_KERNEL_PR variable??

I think the idea is to rebuild all the module binaries if the kernel
configuration changes in some incompatible way.  However, this does seem
like a curious way of achieving it; I would have thought that the
existing "kernel-abiversion" mechanism, or some extension of that, would
solve the problem without the need to introduce a new user-controlled
global variable.

It does also seem fairly unfortunate that, judging from the first mail
in this thread, the patch in question has been landed in such a way as
to effectively (and silently) rewind PR to r0 for any kernel packages
that haven't been specifically adapted to work with it.

p.




