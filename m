Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1M63DB-0001FU-NR
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 15:49:03 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1M635x-0003oY-0A
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 14:41:33 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1M635t-0001vf-Pt
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 14:41:29 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200905181716.24601.khimov@altell.ru>
References: <20090517212442.6E35A1893E6@amethyst.openembedded.net>
	<4A115165.9070300@kernelconcepts.de>
	<200905181716.24601.khimov@altell.ru>
Date: Mon, 18 May 2009 14:41:29 +0100
Message-Id: <1242654089.9080.111.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [oe-commits] Roman I Khimov : (e)glibc-package: fix	kernel version passed to qemu
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
X-List-Received-Date: Mon, 18 May 2009 13:49:04 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-05-18 at 17:16 +0400, Roman I Khimov wrote:
> On Monday 18 May 2009 16:15:33 Florian Boor wrote:
> > Hi,
> >
> > GIT User account schrieb:
> > > +		kernel_ver = bb.data.getVar("OLDEST_KERNEL", d, 1)
> > > +		if kernel_ver is None:
> > > +			qemu = "qemu-%s  -s 1048576" % target_arch
> > > +		else:
> > > +			qemu = "qemu-%s  -s 1048576 -r %s" % (target_arch, kernel_ver)
> >
> > are you sure this is a good idea?
> > OLDEST_KERNEL defaults to "2.4.0", so this change is likely to break locale
> > generation for every machine that doesn't have OLDEST_KERNEL set.
> 
> I've not heard yet of this really breaking something. And frankly I don't see 
> any reason for that. If it actually does - feel free to shout and scream of 
> course, we'll think how to handle it better.

I guess it'd break on targets where OLDEST_KERNEL isn't set (and hence
defaults to 2.4.0) but you need a kernel newer than 2.4.0 for correct
operation.  Presumably all ARM EABI targets fall into that latter
category, since the TLS syscalls weren't in 2.4.x, and there might be
some others where glibc's default setting for --enable-kernel is
something newer than 2.4.0.

All in all I'd be happier with this change if it enforced a minimum
kernel version of 2.6.16 (i.e. what it used to be) so that there is no
possibility of versions going backwards for any target.

Incidentally, if there is a default value for OLDEST_KERNEL in
bitbake.conf then checking the retrieved value against None seems fairly
futile since that will never be true.

p.




