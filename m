Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1M6LRz-0006c3-Kt
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 May 2009 11:17:31 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1M6LKs-0007fb-RN
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 May 2009 10:10:10 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1M6LKs-0004WD-Am
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 May 2009 10:10:10 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200905191255.23223.khimov@altell.ru>
References: <20090517212442.6E35A1893E6@amethyst.openembedded.net>
	<877i0e2ejf.wl%peter@chubb.wattle.id.au>
	<1242718731.4226.72.camel@lenovo.internal.reciva.com>
	<200905191255.23223.khimov@altell.ru>
Date: Tue, 19 May 2009 10:10:09 +0100
Message-Id: <1242724209.9080.172.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [oe-commits] Roman I Khimov	: (e)	glibc-package:	fix	kernel version passed to qemu
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
X-List-Received-Date: Tue, 19 May 2009 09:17:32 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-05-19 at 12:55 +0400, Roman I Khimov wrote:
> As I can tell from a quick glance, there is no special handling for different 
> kernel versions in QEMU. It translates syscalls from target application to 
> host kernel and if we tell it to fake kernel version reported to application 
> it does so and nothing more (linux-user/syscall.c in qemu). So I don't think 
> there is any newest kernel version supported by QEMU for any target, it just 
> doesn't care.

Oh right.  Well, in that case, it's very easy: we can just tell qemu to
report itself as 9999.9999.9999 or something.  Or have a NEWEST_KERNEL
variable that's set (globally in bitbake.conf or somesuch) to the newest
kernel that might conceivably be used.

p.




