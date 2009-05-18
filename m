Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1M63hu-0002XH-7i
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 16:20:47 +0200
Received: from [UNAVAILABLE] ([80.246.246.162] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1M63aq-000Exd-LL
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 18:13:28 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 May 2009 18:12:53 +0400
User-Agent: KMail/1.11.2 (Linux/2.6.29; KDE/4.2.2; x86_64; ; )
References: <20090517212442.6E35A1893E6@amethyst.openembedded.net>
	<200905181716.24601.khimov@altell.ru>
	<1242654089.9080.111.camel@mill.internal.reciva.com>
In-Reply-To: <1242654089.9080.111.camel@mill.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <200905181812.54222.khimov@altell.ru>
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
X-List-Received-Date: Mon, 18 May 2009 14:20:48 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 18 May 2009 17:41:29 Phil Blundell wrote:
> On Mon, 2009-05-18 at 17:16 +0400, Roman I Khimov wrote:
> > On Monday 18 May 2009 16:15:33 Florian Boor wrote:
> > > Hi,
> > >
> > > GIT User account schrieb:
> > > > +		kernel_ver = bb.data.getVar("OLDEST_KERNEL", d, 1)
> > > > +		if kernel_ver is None:
> > > > +			qemu = "qemu-%s  -s 1048576" % target_arch
> > > > +		else:
> > > > +			qemu = "qemu-%s  -s 1048576 -r %s" % (target_arch, kernel_ver)
> > >
> > > are you sure this is a good idea?
> > > OLDEST_KERNEL defaults to "2.4.0", so this change is likely to break
> > > locale generation for every machine that doesn't have OLDEST_KERNEL
> > > set.
> >
> > I've not heard yet of this really breaking something. And frankly I don't
> > see any reason for that. If it actually does - feel free to shout and
> > scream of course, we'll think how to handle it better.
>
> I guess it'd break on targets where OLDEST_KERNEL isn't set (and hence
> defaults to 2.4.0) but you need a kernel newer than 2.4.0 for correct
> operation.  Presumably all ARM EABI targets fall into that latter
> category, since the TLS syscalls weren't in 2.4.x, and there might be
> some others where glibc's default setting for --enable-kernel is
> something newer than 2.4.0.

If any target device requires kernel version not less then $SMTH, it must set 
it via OLDEST_KERNEL, isn't it? So if target device doesn't specify any 
OLDEST_KERNEL, it should be OK with 2.4.0. And then if glibc is configured for 
2.4.0 it either runs on host's 2.6.smth or not (presumably runs fine), 
regardless of what it thinks about the kernel version. Or am I missing 
something?

> Incidentally, if there is a default value for OLDEST_KERNEL in
> bitbake.conf then checking the retrieved value against None seems fairly
> futile since that will never be true.

Well, things happen. We can change it to

if kernel_ver is None:
	bb.fatal("Your config is completely broken")
...

of course.


