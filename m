Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M6HSG-0006S5-Tc
	for openembedded-devel@openembedded.org; Tue, 19 May 2009 07:01:33 +0200
Received: (qmail 788 invoked from network); 19 May 2009 04:54:12 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 18 May 2009 21:54:12 -0700
Date: Mon, 18 May 2009 21:54:11 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090519045411.GN23842@smtp.west.cox.net>
References: <20090517212442.6E35A1893E6@amethyst.openembedded.net>
	<200905181812.54222.khimov@altell.ru>
	<1242657603.9080.122.camel@mill.internal.reciva.com>
	<200905182242.14829.khimov@altell.ru>
	<1242672893.4226.52.camel@lenovo.internal.reciva.com>
	<1242675429.4226.56.camel@lenovo.internal.reciva.com>
	<20090519034417.GM23842@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20090519034417.GM23842@smtp.west.cox.net>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [oe-commits] Roman I Khimov : (e) glibc-package: fix	kernel version passed to qemu
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
X-List-Received-Date: Tue, 19 May 2009 05:01:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 18, 2009 at 08:44:17PM -0700, Tom Rini wrote:
> On Mon, May 18, 2009 at 08:37:09PM +0100, Phil Blundell wrote:
> > On Mon, 2009-05-18 at 19:54 +0100, Phil Blundell wrote:
> > > On Mon, 2009-05-18 at 22:42 +0400, Roman I Khimov wrote:
> > > > Now, I think that this should be fixed on target level. OLDEST_KERNEL should 
> > > > be something sane. Global 2.4.0 from bitbake.conf is good enough for most 
> > > > targets, but if we know that none of ARM EABI works with kernel versions prior 
> > > > to 2.6.14, we should set OLDEST_KERNEL to 2.6.14 for that targets. Or higher, 
> > > > of course, if target needs/wants that. If that's OK with all, I'm doing a 
> > > > patch.
> > > 
> > > I'm still not convinced this is either practical or desirable.  The
> > > kernel versions you mentioned are the minimum required for the
> > > particular version of glibc you were looking at, but different libcs or
> > > different versions of the same libc will have different minimum kernel
> > > requirements even for the same target.  (As an obvious example, the m68k
> > > port has been supported in glibc since its inception and clearly didn't
> > > require a 2.6.18 kernel to start with.)
> > 
> > The other thing to say about OLDEST_KERNEL is that it was intended to be
> > controlled by the DISTRO, not by the MACHINE.  In other words, it's a
> > policy control ("kernel x.xx is the earliest one we care about; it's
> > okay to omit the compatibility bits for older ones") and not a target
> > attribute ("kernel x.xx is the minimum required for correct
> > functionality").  We don't currently have a variable with the latter
> > semantics and nor am I very convinced that it would be a good idea to
> > introduce one.
> 
> I've re-read most of the thread, and I think what we need to do is:
> 
> - Acknowledge we've not set OLDEST_KERNEL in a sane way for a while.
>   Except in some _machines_ we just use the 2.4.0 default, and glibc
>   corrects it up.
> 
> - Acknowledge this is a GLIBC / EGLIBC only variable and move it over,
>   with weak assignments to sane values in glibc.inc / eglibc.inc.  We
>   might have to have some other possibilities commented out explaining
>   what they do.  For example, arm-linux (oabi), non-nptl x86, etc.

Oh! And since this is glibc/eglibc only, we can pass qemu the min
version the libc was compiled for.

-- 
Tom Rini


