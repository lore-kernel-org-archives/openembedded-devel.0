Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1M68lS-0003Tk-9k
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 21:44:46 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1M68eN-000CJr-69
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 23:37:27 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 May 2009 23:37:24 +0400
User-Agent: KMail/1.11.2 (Linux/2.6.29; KDE/4.2.2; x86_64; ; )
References: <20090517212442.6E35A1893E6@amethyst.openembedded.net>
	<200905182242.14829.khimov@altell.ru>
	<1242672893.4226.52.camel@lenovo.internal.reciva.com>
In-Reply-To: <1242672893.4226.52.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <200905182337.25460.khimov@altell.ru>
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
X-List-Received-Date: Mon, 18 May 2009 19:44:46 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 18 May 2009 22:54:53 Phil Blundell wrote:
> On Mon, 2009-05-18 at 22:42 +0400, Roman I Khimov wrote:
> > Now, I think that this should be fixed on target level. OLDEST_KERNEL
> > should be something sane. Global 2.4.0 from bitbake.conf is good enough
> > for most targets, but if we know that none of ARM EABI works with kernel
> > versions prior to 2.6.14, we should set OLDEST_KERNEL to 2.6.14 for that
> > targets. Or higher, of course, if target needs/wants that. If that's OK
> > with all, I'm doing a patch.
>
> ...
>
> I think it would be better to leave the semantics of OLDEST_KERNEL alone
> and just teach qemu to use either the same __LINUX_KERNEL_VERSION as
> glibc's configure script has settled on, or (perhaps better) just the
> newest version that it supports for the given target.

Well, from my point of view, any static version is bad, because it's magic 
thrown in. When I've stumbled upon this, I've scratched my head a bit on why 
the hell is it 2.6.16, not 2.6.10, not 2.6.20, not anything else but 2.6.16. 
Sure enough, it's just something that worked some time ago for someone and was 
hardcoded then.

Then, I think that OLDEST_KERNEL should be something sane, since this is what 
we try to configure glibc with. It properly warns that there is something 
wrong on our side if we try to configure glibc for 2.4.0 kernel with ARM EABI 
target, so why not fix it? And then, if there are updates to glibc or anything 
else, it's target-specific and the target should adjust its OLDEST_KERNEL 
appropriately.

Of course, we can take version from __LINUX_KERNEL_VERSION, but that's more 
work and it doesn't fix misconfiguration we have when glibc has to decide that 
it knows better its minimal requirements for target.


