Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JofjV-0001Hz-FP
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Apr 2008 16:14:01 +0200
X-ASG-Debug-ID: 1208960026-794100160000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP
	id D5E9149384; Wed, 23 Apr 2008 09:13:48 -0500 (CDT)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id pdkHwBo4sQjp5zA2; Wed, 23 Apr 2008 09:13:48 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Re: [oe] Getting started with AVR32
Date: Wed, 23 Apr 2008 09:13:50 -0500
User-Agent: KMail/1.9.7
References: <20080423110716.f4oj3azjkssc0co8@webmail.buarnada.ch>
In-Reply-To: <20080423110716.f4oj3azjkssc0co8@webmail.buarnada.ch>
MIME-Version: 1.0
Message-Id: <200804230913.51687.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1208960028
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Subject: Re: Getting started with AVR32
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Wed, 23 Apr 2008 14:14:02 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 23 April 2008 04:07:16 am list_2008@buarnada.ch wrote:

> I'd like to build OE for Atmel's ATNGW100 board.
>
> Can you give me some hints where to start?
> Which distro, branch, etc. should I use?

The org.openembedded.dev branch should be able to build an AVR32 image for 
you.  I submitted some patches which haven't been applied yet that will give 
you a newer toolchain.  See 
http://bugs.openembedded.net/show_bug.cgi?id=4178.  With these patches 
applied, I can build x11-image (haven't gotten a chance to try X out yet, 
though).

I had an AT32STK1000 board.  This board came with an ancient version of u-boot 
that had the wrong architecture number for the AVR32.  If the ATNGW100 ships 
the same way, you'll need to upgrade u-boot before it will boot any recent 
image.  The 2.0.0 BSP CD contains a bootloader that will work 
(http://www.atmel.com/dyn/resources/prod_documents/AVR32_Linux_BSP_CD_Image_2.0.0.zip).  
Beware, everything else on this CD is horribly outdated.

I'm writing the OE generated image to an SD card, and then having u-boot boot 
from the SD card.

Here's my local.conf file for my custom AVR32 board, minus comments and blank 
lines:
--begin--
DL_DIR = "${PRJROOT}/sources"
BBFILES = "${PRJROOT}/org.openembedded.dev/packages/*/*.bb"
BBMASK = ""
PREFERRED_PROVIDERS = "virtual/qte:qte virtual/libqpe:libqpe-opie"
PREFERRED_PROVIDERS += " virtual/libsdl:libsdl-x11"
PREFERRED_PROVIDERS += "virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"
PREFERRED_VERSION_linux = "2.6.23"
MACHINE = "at32stk1000"
TARGET_OS = "linux-uclibc"
DISTRO = "angstrom-2008.1"
ANGSTROM_MODE = "uclibc"
IMAGE_FSTYPES = "ext3 jffs2 tar"
BBDEBUG = "yes"
PARALLEL_MAKE = "-j 3"
BBINCLUDELOGS = "yes"
--end--

You'll need to change the MACHINE to "atngw100".  This also assumes you have 
PRJROOT defined in your environment.  Eiether edit out the references to 
PRJROOT, or export PRJROOT before you run bitbake.

Good luck!
---
Geoffrey


