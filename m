Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1NIk7n-0008La-3n
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Dec 2009 15:36:14 +0100
Received: from hiob.intern.dresearch.de (unknown [10.32.0.138])
	by mail.dresearch.de (Postfix) with ESMTP id AC998491278
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Dec 2009 15:34:29 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Thu, 10 Dec 2009 15:35:42 +0100
Message-ID: <4B2106ED.6050302@dresearch.de>
Date: Thu, 10 Dec 2009 15:34:21 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B1FAC54.9070709@dresearch.de>
In-Reply-To: <4B1FAC54.9070709@dresearch.de>
X-OriginalArrivalTime: 10 Dec 2009 14:35:43.0084 (UTC)
	FILETIME=[0D75DAC0:01CA79A6]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: howto add external built kernel modules to an image?
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
X-List-Received-Date: Thu, 10 Dec 2009 14:36:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Steffen Sledz schrieb:
> I'd like to build a kernel module (let's say it's named drpnx) outside
> the kernel sources and add the resulting drpnx.ko to an rootfs image.
> 
> I created a bitbake recipe using
> recipes/minifo/minifo-modules_0.6.1-pre1.bb as a sample and i'm able
> to bitbake this recipe using the -b option.
> 
> But now i'm out of ideas. How to add drpnx.ko to a rootfs image? I tried
> 
> IMAGE_INSTALL += " drpnx "
> IMAGE_INSTALL += " kernel-module-drpnx "
> IMAGE_INSTALL += " drpnx-module "
> 
> but none of them worked. :(

All clear. Was a typo or something like it.

IMAGE_INSTALL += " drpnx "

works well. :)




