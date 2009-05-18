Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1M62ok-0003eB-P7
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 15:23:49 +0200
Received: from [UNAVAILABLE] ([80.246.246.162] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1M62hg-0000Xp-TQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 17:16:28 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 May 2009 17:16:24 +0400
User-Agent: KMail/1.11.2 (Linux/2.6.29; KDE/4.2.2; x86_64; ; )
References: <20090517212442.6E35A1893E6@amethyst.openembedded.net>
	<4A115165.9070300@kernelconcepts.de>
In-Reply-To: <4A115165.9070300@kernelconcepts.de>
MIME-Version: 1.0
Message-Id: <200905181716.24601.khimov@altell.ru>
Subject: Re: [oe-commits] Roman I Khimov : (e)glibc-package: fix kernel version passed to qemu
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
X-List-Received-Date: Mon, 18 May 2009 13:23:50 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 18 May 2009 16:15:33 Florian Boor wrote:
> Hi,
>
> GIT User account schrieb:
> > +		kernel_ver = bb.data.getVar("OLDEST_KERNEL", d, 1)
> > +		if kernel_ver is None:
> > +			qemu = "qemu-%s  -s 1048576" % target_arch
> > +		else:
> > +			qemu = "qemu-%s  -s 1048576 -r %s" % (target_arch, kernel_ver)
>
> are you sure this is a good idea?
> OLDEST_KERNEL defaults to "2.4.0", so this change is likely to break locale
> generation for every machine that doesn't have OLDEST_KERNEL set.

I've not heard yet of this really breaking something. And frankly I don't see 
any reason for that. If it actually does - feel free to shout and scream of 
course, we'll think how to handle it better.


