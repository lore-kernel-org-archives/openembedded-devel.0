Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MhJyM-0002dD-1m
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Aug 2009 11:11:46 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MhJge-0007Uj-Sx
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Aug 2009 09:53:28 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1MhJge-0008HS-Me
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Aug 2009 09:53:28 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <19c1b8a90908290133l36f791b2lfe8db1a1c6f333b2@mail.gmail.com>
References: <1251504044-2315-1-git-send-email-raj.khem@gmail.com>
	<1251533696.4215.623.camel@lenovo.internal.reciva.com>
	<19c1b8a90908290133l36f791b2lfe8db1a1c6f333b2@mail.gmail.com>
Date: Sat, 29 Aug 2009 09:53:24 +0100
Message-Id: <1251536004.27780.75.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
Subject: Re: [PATCH] sane-toolchain-eglibc.inc: Set TARGET_OS = linux-gnuspe for e500
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
X-List-Received-Date: Sat, 29 Aug 2009 09:11:46 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2009-08-29 at 01:33 -0700, Khem Raj wrote:
> TARGET_OS is really equivalent of TARGET_TRIPLET here and it is tied
> to system C library you choose.
> so logically it seems ok to me. You can also define it in distro confs but then
> you have to check like if LIBC == uclibc do one thing  else LIBC =
> glibc do other thing

Well, I dunno.  It seems like there are three parts to this
determination, really:

1) does the target hardware support SPE?
2) does the toolchain support it?
3) does the distro want to use it?

Of those, it seems fairly clear that (1) belongs in MACHINE.conf or some
similar place, and (3) belongs in DISTRO.conf or some part of it.  The
only one of these that's really tied to the C library would seem to be
(2), and even there I would have thought it would be better for the libc
to just raise an error if it doesn't support the selected options rather
than trying to guess what they should be.

The same thing applies to the ARM EABI, incidentally: the choice of
whether to use EABI or the old ABI ought to be one that's made primarily
(or entirely) by the DISTRO.  The current situation where parts of the
toolchain are guessing whether or not the EABI is wanted, based on
${MACHINE}, is somewhat unsatisfactory: it'd be perfectly legitimate,
for example, for a DISTRO to want to use eabi on h3900.  The current
EABI logic that resides in sane-toolchain-xxx.inc seems like it is
really a misplaced piece of Angstrom policy.

p.




