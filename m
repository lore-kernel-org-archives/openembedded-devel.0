Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1M692E-00047Q-K4
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 22:02:06 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1M68v9-000J5L-ES
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 23:54:47 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 May 2009 23:54:48 +0400
User-Agent: KMail/1.11.2 (Linux/2.6.29; KDE/4.2.2; x86_64; ; )
References: <20090517212442.6E35A1893E6@amethyst.openembedded.net>
	<1242672893.4226.52.camel@lenovo.internal.reciva.com>
	<1242675429.4226.56.camel@lenovo.internal.reciva.com>
In-Reply-To: <1242675429.4226.56.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <200905182354.48480.khimov@altell.ru>
Subject: Re: [oe-commits] Roman I Khimov : (e) 	glibc-package:	fix	kernel version passed to qemu
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
X-List-Received-Date: Mon, 18 May 2009 20:02:07 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 18 May 2009 23:37:09 Phil Blundell wrote:
> On Mon, 2009-05-18 at 19:54 +0100, Phil Blundell wrote:
> > On Mon, 2009-05-18 at 22:42 +0400, Roman I Khimov wrote:
> > > Now, I think that this should be fixed on target level. OLDEST_KERNEL
> > > should be something sane. Global 2.4.0 from bitbake.conf is good enough
> > > for most targets, but if we know that none of ARM EABI works with
> > > kernel versions prior to 2.6.14, we should set OLDEST_KERNEL to 2.6.14
> > > for that targets. Or higher, of course, if target needs/wants that. If
> > > that's OK with all, I'm doing a patch.
> >
> > I'm still not convinced this is either practical or desirable.  The
> > kernel versions you mentioned are the minimum required for the
> > particular version of glibc you were looking at, but different libcs or
> > different versions of the same libc will have different minimum kernel
> > requirements even for the same target.  (As an obvious example, the m68k
> > port has been supported in glibc since its inception and clearly didn't
> > require a 2.6.18 kernel to start with.)
>
> The other thing to say about OLDEST_KERNEL is that it was intended to be
> controlled by the DISTRO, not by the MACHINE.  In other words, it's a
> policy control ("kernel x.xx is the earliest one we care about; it's
> okay to omit the compatibility bits for older ones") and not a target
> attribute ("kernel x.xx is the minimum required for correct
> functionality").  We don't currently have a variable with the latter
> semantics and nor am I very convinced that it would be a good idea to
> introduce one.

We can add soft 'sane' assignments to machines and then distros can override 
that to whatever they want if they want to, or not?


