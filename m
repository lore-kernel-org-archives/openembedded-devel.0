Received: from [213.46.255.22] (helo=viefep23-int.chello.at)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mailinglist@miromico.ch>) id 1JN6XK-0004Q5-Is
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Feb 2008 14:11:30 +0100
Received: from [192.168.1.192] (really [77.57.15.173])
	by viefep23-int.chello.at
	(InterMail vM.7.08.02.00 201-2186-121-20061213) with ESMTP
	id <20080207131140.BEDH19244.viefep23-int.chello.at@[192.168.1.192]>
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 7 Feb 2008 14:11:40 +0100
Message-ID: <47AB02C4.4060202@miromico.ch>
Date: Thu, 07 Feb 2008 14:08:20 +0100
From: Alex <mailinglist@miromico.ch>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Init fails with segfault on AVR32
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
X-List-Received-Date: Thu, 07 Feb 2008 13:11:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi

I finally got minimal-image compiled in OE for AVR32 and the kernel can 
boot just to the point where it tries to load init.

This will fail with a segfault. Last messages on boot log:

VFS: Mounted root (jffs2 
filesystem).                                          
Freeing init memory: 68K (90000000 - 
90011000)                                 
init[1]: segfault at 00000008 pc 2aaabbe8 sp 7fabbf40 ecr 
24                   
init has generated signal 11 but has no handler for 
it                         
Kernel panic - not syncing: Attempted to kill init!   

I tried NFS boot and boot from flash which both produced the same 
result. I am using U-Boot 1.3.0.atmel.2 (from Atmel buildroot).

Anyone an idea what could be wrong?

To find the problem I did the following:

I have a working rootfs (from AVR buildroot). Booting with OE-Kernel and 
Buildroot rootfs works. I can mount OE-rootfs via NFS and then I can 
execute programs such as sbin/init => this seems to be valid AVR32 
binaries.

I copied init.sysvinit into my buildroot-rootfs. Now the system doesn't 
segfault anymore.

Thanks for any hint

Alex


