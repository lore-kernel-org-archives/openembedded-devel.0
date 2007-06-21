Received: from [65.54.246.222] (helo=bay0-omc3-s22.bay0.hotmail.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pelle2004@hotmail.com>) id 1I1Swn-0004s2-Ob
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jun 2007 22:08:06 +0200
Received: from hotmail.com ([65.55.154.108]) by bay0-omc3-s22.bay0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.2668); 
	Thu, 21 Jun 2007 13:04:15 -0700
Received: from mail pickup service by hotmail.com with Microsoft SMTPSVC;
	Thu, 21 Jun 2007 13:04:14 -0700
Message-ID: <BAY143-F280B45CA74415F07F9FC8BB9100@phx.gbl>
Received: from 65.55.154.123 by by143fd.bay143.hotmail.msn.com with HTTP;
	Thu, 21 Jun 2007 20:04:11 GMT
X-Originating-IP: [83.227.74.206]
X-Originating-Email: [pelle2004@hotmail.com]
X-Sender: pelle2004@hotmail.com
From: "Pelle Svensson" <pelle2004@hotmail.com>
To: openembedded-devel@lists.openembedded.org
Bcc: 
Date: Thu, 21 Jun 2007 22:04:11 +0200
Mime-Version: 1.0
X-OriginalArrivalTime: 21 Jun 2007 20:04:14.0074 (UTC)
	FILETIME=[571BFDA0:01C7B43F]
Subject: I can't can't control selection of kernel.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jun 2007 20:08:06 -0000
Content-Type: text/plain; charset=iso-8859-1; format=flowed

Hi,

I can't control the kernel selection. I have tried addding following into 
conf/machine and local.conf .
I also have a bb file as 'packages/linux/test-linux.bb'

PREFERRED_PROVIDER_virtual/kernel = "test-linux"
PREFERRED_PROVIDER_kernel = "test-linux"

And still I get this running bitbake -v

NOTE: multiple providers are available for runtime kernel 
(poodle-kernel-2.4-embedix, linux-omap-2.6, linux-bast, 
husky-kernel-2.4-embedix, shepherd-kernel-2.4-embedix, linux, 
poodle255-kernel-2.4-embedix, corgi-kernel-2.4-embedix);
NOTE: consider defining a PREFERRED_PROVIDER entry to match runtime kernel

What is it inside these files are bitbake trigging on and why isn't it give 
med all?

/Pelle

test-linux.bb
==========
PROVIDES = "kernel"
PR = "r1"
SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
           file://defconfig \
	   "

_________________________________________________________________
Trött på att pendla? - Sök jobb där du bor! http://jobb.msn.monster.se/



