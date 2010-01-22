Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NYFVS-0004fN-G1
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 10:08:45 +0100
Received: from 88-109-44-56.dynamic.dsl.as9105.com ([88.109.44.56]
	helo=[192.168.2.155])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NYFTF-00068i-J8
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 09:06:25 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ec1f3d401001212332i6062141ej86abe243cd7858d4@mail.gmail.com>
References: <ec1f3d400911270337wbbbcae8gab291075d242c9d9@mail.gmail.com>
	<19c1b8a90912100944g4b405319v6e121ebf03449f0b@mail.gmail.com>
	<ec1f3d400912110347x365c0873i9d03b58d02cbf735@mail.gmail.com>
	<19c1b8a90912110925k5e8063b7wdc160af7eb29fb2a@mail.gmail.com>
	<ec1f3d401001050143o2cdfb989x119ea3dd6352f4ed@mail.gmail.com>
	<19c1b8a91001050954m5f002c66s7a282c1382a2dcea@mail.gmail.com>
	<ec1f3d401001200350g9fb8480h1ed53a8ee4a90e0@mail.gmail.com>
	<19c1b8a91001201656g6fd1751bvc2a478b2d4c9ef8c@mail.gmail.com>
	<ec1f3d401001210353j1802eb6am9d931438e3db1302@mail.gmail.com>
	<1264075631.9743.178.camel@mill.internal.reciva.com>
	<ec1f3d401001212332i6062141ej86abe243cd7858d4@mail.gmail.com>
Date: Fri, 22 Jan 2010 09:06:00 +0000
Message-ID: <1264151160.457.1101.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: cortex-a9 build failure at glibc
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
X-List-Received-Date: Fri, 22 Jan 2010 09:08:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-01-22 at 13:02 +0530, RK Raggit wrote:
> You are right Phil. I have a Neon FPU but it was disabled in the kernel
> configuration.I am able to boot and get a shell now.

Very good!

> Just for my knowledge, how did you translate "pc=4000673c" ,which could be
> an address in a shared library, to an exact instruction like "ldcl 11, cr0,
> [fp, #-140]" ?

You're right, 0x4000673c does look like a shared library address, and is
not particularly illuminating unless you have access to the binary for
the library in question (which, obviously, I don't in this case).  

However, the next line of your crash dump contains the opcode sequence
around that address:

Code: 1a000002 e594e060 e35e0000 1a0001d0 (ed5b0b23)

The instruction in brackets is the actual one at which the fault
occurred.  So, armed with that opcode 0xed5b0b23, you can then just feed
it into the disassembler and see what happens.

The GNU tools don't actually have a direct equivalent to the ADS
"disass" program, so the easiest way to convert the opcode into an
instruction is along the lines of:

$ arm-linux-as
.word 0xed5b0b23
^D
$ arm-linux-objdump -d a.out

p.




