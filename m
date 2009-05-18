Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1M68mv-0003WW-4i
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 21:46:17 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1M68fq-000CnH-8T
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 May 2009 23:38:58 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 May 2009 23:38:58 +0400
User-Agent: KMail/1.11.2 (Linux/2.6.29; KDE/4.2.2; x86_64; ; )
References: <20090517212442.6E35A1893E6@amethyst.openembedded.net>
	<200905181716.24601.khimov@altell.ru>
	<4A11B5B4.8040804@kernelconcepts.de>
In-Reply-To: <4A11B5B4.8040804@kernelconcepts.de>
MIME-Version: 1.0
Message-Id: <200905182338.59187.khimov@altell.ru>
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
X-List-Received-Date: Mon, 18 May 2009 19:46:17 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 18 May 2009 23:23:32 Florian Boor wrote:
> Hi,
>
> Roman I Khimov schrieb:
> > I've not heard yet of this really breaking something. And frankly I don't
> > see any reason for that. If it actually does - feel free to shout and
> > scream of course, we'll think how to handle it better.
>
> I assume it breaks for everyone using qemu 0.9.x. I see it failing with
> this message now:
>
> NOTE: Running task 635 of 6760 (ID: 194,
> /disk/d2/dev/recipes/glibc/glibc_2.6.1.bb, do_package)
> NOTE: preparing tree for binary locale generation
> NOTE: generating locale de_DE (UTF-8)
> qemu-arm version 0.9.1, Copyright (c) 2003-2008 Fabrice Bellard
> usage: qemu-arm [options] program [arguments...]
> Linux CPU emulator (compiled for arm emulation)
> [...]
>
> This happens building Angstrom for both armv4 and armv5 targets and even
> with the latest OLDEST_KERNEL changes Koen made some hours ago.

Hmm. Did it say anything else? In my case it's been failing with "FATAL: 
kernel too old". But that was host qemu (0.10.3).


