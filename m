Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1M647c-0000Rl-Rm
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 16:47:21 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1M640Z-0006X2-LG
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 15:40:03 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1M640Z-0002QH-Ds
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 15:40:03 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200905181812.54222.khimov@altell.ru>
References: <20090517212442.6E35A1893E6@amethyst.openembedded.net>
	<200905181716.24601.khimov@altell.ru>
	<1242654089.9080.111.camel@mill.internal.reciva.com>
	<200905181812.54222.khimov@altell.ru>
Date: Mon, 18 May 2009 15:40:03 +0100
Message-Id: <1242657603.9080.122.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [oe-commits] Roman I Khimov : (e)glibc-package:	fix	kernel version passed to qemu
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
X-List-Received-Date: Mon, 18 May 2009 14:47:21 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-05-18 at 18:12 +0400, Roman I Khimov wrote:
> If any target device requires kernel version not less then $SMTH, it must set 
> it via OLDEST_KERNEL, isn't it?

No, this has never previously been a constraint.  ${OLDEST_KERNEL}
exists as a hint to say "there is no need to include support for kernels
older than this one", but it doesn't necessarily work the other way
around: there is no guarantee that ${OLDEST_KERNEL} is actually a
sufficient version for correct operation.

If OLDEST_KERNEL were to be interpreted more widely, as you propose, it
would not make much sense to have a global default of 2.4.0 since there
are all kinds of targets that won't run with such an old version.

p.




