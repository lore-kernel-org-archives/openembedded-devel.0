Received: from [141.89.48.7] (helo=mail.cs.uni-potsdam.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <akzare@cs.uni-potsdam.de>) id 1MtJvH-000216-QF
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Oct 2009 13:34:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.cs.uni-potsdam.de (Postfix) with ESMTP id 159E410EDA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2009 13:34:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at cs.uni-potsdam.de
Received: from mail.cs.uni-potsdam.de ([127.0.0.1])
	by localhost (mail.cs.uni-potsdam.de [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id Tiy0BoqregDZ
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2009 13:34:06 +0200 (CEST)
Received: from [141.89.52.43] (orest.ift.cs.uni-potsdam.de [141.89.52.43])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.cs.uni-potsdam.de (Postfix) with ESMTPSA id 258FA10EC4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2009 13:34:06 +0200 (CEST)
From: Ali Akbar Zarezadeh <akzare@cs.uni-potsdam.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1254173087.29003.54.camel@orest.ift.cs.uni-potsdam.de>
References: <1254173087.29003.54.camel@orest.ift.cs.uni-potsdam.de>
Date: Thu, 01 Oct 2009 13:33:23 +0200
Message-Id: <1254396803.21355.48.camel@orest.ift.cs.uni-potsdam.de>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 141.89.48.7
X-SA-Exim-Mail-From: akzare@cs.uni-potsdam.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: How do I build OE for PPC-405 inside Virtex 4?
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
X-List-Received-Date: Thu, 01 Oct 2009 11:34:15 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

Many thanks to Philip, Elvis and Khem for their reply. Now, our PICSY
platform is running with the generated ramdisk based on OpenEmbedded.

For your information, first I've read OE usermanual (it is helpful but
please check the spelling and grammar of the document to improve the
communication with reader). Secondly, I tried to prepare our own image
bb file. As starting point minimal-image.bb and base-image.bb inspired
me such as easy approach. Afterwards again I hit with another issue
related to the size of RAMDISK. To solve this problem, those following
lines were put in our local.conf file to override the same parameters in
the bitbake.conf:

IMAGE_ROOTFS_SIZE = "35840"
IMAGE_ROOTFS_SIZE_ext2 = "35840"
IMAGE_ROOTFS_SIZE_ext2.gz = "35840"
IMAGE_ROOTFS_SIZE_ext3 = "35840"
IMAGE_ROOTFS_SIZE_ext3.gz = "35840"

Then, after some days challenging I boot up the PICSY with combination
of OE ramdisk and the the Xilinx Open Source Linux structure. 
However, still there are some issues which maybe somebody could help me
to overcome:

1) If I would increase the size of ramdisk more than approximately 25%
of total installed physical memory size, I will hit with another problem
in the boots up time which complains for exceeding the threshold size.
It seems somewhere should be a limitation or setting for it. Is there
any idea where?

2) More often in our development and debug process, ftp would be desired
to copy the new application binary through network. As I checked there
is no ftp tool already installed in the ramdisk (only there is tftp from
busybox-1.13.2-r18). Would you let me know how I should put ftp in the
generated image file?

Thanks in advanced.

CIAO
Ali
        

 




