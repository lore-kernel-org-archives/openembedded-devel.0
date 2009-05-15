Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1M52vz-0003O8-3c
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 May 2009 21:19:07 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1M52pC-000HUV-Er
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 May 2009 23:12:06 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 May 2009 23:12:04 +0400
User-Agent: KMail/1.11.2 (Linux/2.6.29; KDE/4.2.2; x86_64; ; )
References: <1242390849-28989-1-git-send-email-khimov@altell.ru>
	<200905152146.52710.khimov@altell.ru>
	<1242410289.4514.81.camel@lenovo.internal.reciva.com>
In-Reply-To: <1242410289.4514.81.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <200905152312.05026.khimov@altell.ru>
Subject: Re: [PATCH 1/2] glibc-package: fix kernel version passed	to	qemu
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
X-List-Received-Date: Fri, 15 May 2009 19:19:07 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 15 May 2009 21:58:09 Phil Blundell wrote:
> On Fri, 2009-05-15 at 21:46 +0400, Roman I Khimov wrote:
> > On Friday 15 May 2009 19:26:26 Tom Rini wrote:
> > > On Fri, May 15, 2009 at 04:34:08PM +0400, Roman I Khimov wrote:
> > > > Binary locale generation fails with
> > > >
> > > > FATAL: kernel too old
> > > >
> > > > if glibc is configured for kernels newer then 2.6.16.
> > > >
> > > > Fix qemu "-r" parameter to match OLDEST_KERNEL.
> > >
> > > Just to be sure, this is happy with 2.4.0 too, right?
> >
> > Hmmm. It's untested on 2.4, obviously. But OLDEST_KERNEL is the kernel
> > glibc built against, so whatever it is, it should be a perfect match.
>
> Do you know what the reason is for passing this -r parameter in the
> first place?  It seems like we should just be letting qemu use the most
> recent kernel emulation that it knows about, since a glibc compiled
> against any given kernel version should always run with newer versions.

It was brought by commit f4f7920d6131d1245436783139e3a77581d6264f, with the 
message of

=============================================================================
glibc-package.bbclass: Add supersecret -r switch to qemu userspace emulator,
which allows to override kernel version report to guest apps (otherwise,
host kernel version is used, which causes "Kernel too old" errors in glibc
startup code in guess, if host kernel is older than 2.6.14-something).
Tested with qemu 0.8.2 (and yes, I couldn't find -r switch in qemu doc,
taken from a mail by Paul Brook, qemu co-maintainer).
=============================================================================

If I understand this correctly the problem is that glibc checks kernel version 
and if that's older than the version glibc compiled against (--enable-
kernel=...), it fails with "kernel too old" (see sysdeps/unix/sysv/linux/dl-
osinfo.h).

But there is no magic 2.6.14 or 2.6.16 or whatever, and the goal is really not 
to set the latest version (which you'll need to bump every time new release 
goes out), but anything that glibc would agree to work with. Sure enough it 
will agree to work with the version it's been built against.


