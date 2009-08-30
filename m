Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MhmBo-0004E7-5J
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 17:19:32 +0200
Received: from 212-139-92-236.dynamic.dsl.as9105.com ([212.139.92.236]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1Mhlty-0003qK-IV
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 16:01:06 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <f96d234e0908291338i2fe06f6fkfc52b57cccd28fe6@mail.gmail.com>
References: <f96d234e0908251411s5ac89a67v223cb2240b81fe39@mail.gmail.com>
	<20090826020342.GB5705@gmail.com>
	<f96d234e0908291338i2fe06f6fkfc52b57cccd28fe6@mail.gmail.com>
Date: Sun, 30 Aug 2009 16:01:03 +0100
Message-Id: <1251644463.4215.695.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: problem building uclibc + udev
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
X-List-Received-Date: Sun, 30 Aug 2009 15:19:32 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2009-08-29 at 16:38 -0400, Cliff Brake wrote:
> There are several solutions to this problem:
> 
> 1) patch the kernel and linux-libc-headers with the attached patch
> files (2.6.29 kernel, and 2.6.23 headers)
> 2) use the micro-base-image which uses mdev instead of udev.
> 
> Unfortunately, the linux-libc-headers patch is probably not distro
> friendly as it modifies a non-machine specific package.  So there does
> not seem to be a clear path forward.

I think the only real way ahead with the ppoll thing is to get that
patch landed in the upstream kernel (if it isn't there already) and then
rev all the appropriate packages to include the fix.

Or, given that the syscall numbers were already reserved anyway and
hence unlikely to collide with anything else, it should be safe enough
to just apply those patches in OE.  It doesn't matter that the
linux-libc-headers package is used on multiple machines: if somebody
builds against the patched linux-libc-headers and then tries to run on
an unpatched kernel, ppoll() will just return -ENOSYS which is the same
thing it would have done anyway.

p.




