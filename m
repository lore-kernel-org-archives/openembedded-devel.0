Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1M69NP-0001qs-WC
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 22:24:00 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1M69GK-00018Z-MN
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 May 2009 00:16:40 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 May 2009 00:16:39 +0400
User-Agent: KMail/1.11.2 (Linux/2.6.29; KDE/4.2.2; x86_64; ; )
References: <20090517212442.6E35A1893E6@amethyst.openembedded.net>
	<200905182337.25460.khimov@altell.ru>
	<1242676835.4226.59.camel@lenovo.internal.reciva.com>
In-Reply-To: <1242676835.4226.59.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <200905190016.39266.khimov@altell.ru>
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
X-List-Received-Date: Mon, 18 May 2009 20:24:00 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday 19 May 2009 00:00:35 Phil Blundell wrote:
> On Mon, 2009-05-18 at 23:37 +0400, Roman I Khimov wrote:
> > Of course, we can take version from __LINUX_KERNEL_VERSION, but that's
> > more work and it doesn't fix misconfiguration we have when glibc has to
> > decide that it knows better its minimal requirements for target.
>
> I'm not sure what you're saying here.  __LINUX_KERNEL_VERSION (from
> config.h) is precisely the version that glibc is compiled to expect (and
> what dl-sysdep checks against).  So, if you run qemu as that same kernel
> version, it is guaranteed to always be compatible with the glibc build
> in question.

Yep, sure. What's bugging me is that we try to configure glibc for wrong 
kernel in first place. And if we switch to proper configuration, then there 
will be no need to dig into config.h to get __LINUX_KERNEL_VERSION (is its 
format reliable enough across all versions of glibc?).


