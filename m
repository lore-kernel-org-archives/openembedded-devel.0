Received: from [216.182.48.170] (helo=beastbox.kfctristate.com)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <tom@openhardware.net>) id 1I6JY2-000588-CB
	for openembedded-devel@openembedded.org; Thu, 05 Jul 2007 07:06:36 +0200
Received: (qmail 7226 invoked from network); 5 Jul 2007 05:00:46 -0000
Received: from unknown (HELO ?172.30.107.2?) (172.30.107.2)
	by beastbox.kfctristate.com with SMTP; 5 Jul 2007 05:00:46 -0000
Message-ID: <468C7B11.8050809@openhardware.net>
Date: Thu, 05 Jul 2007 01:01:05 -0400
From: Tom Walsh <tom@openhardware.net>
User-Agent: Thunderbird 1.5.0.10 (X11/20070305)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: howto? Build something but not deploy in root image
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
X-List-Received-Date: Thu, 05 Jul 2007 05:06:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I know, this has come up before.  Reading through some of the old 
messages I see this discussed, but, I do not see any solution(s) mentioned?

I have several parts to this project that must be built during the 
bitbake process (bootstrap-image), but are not part of the target 
filesystem image.  The total system parts are:

* bootloader - ARM - resides in Flash.
* kernel - ARM - resides in Flash.
* target rootfs image - ARM - resides on MMC card.
* Flash Utility - native (x86) - runs on host computer.

The concept for the system is that the bootloader starts the RAM and 
other hardware up.  It then copies the kernel image into RAM and 
launches it.  The kernel is configured to look for its root filesystem 
on the MMC card.  Essentially, I boot the kernel from Flash, but the 
kernel boots from the MMC card.

The only thing that I need in the root filesystem (tmp/rootfs/) is the 
packages I named from the local conf files.  The kernel does need to be 
there, it soaks up space uselessly.

As to the bootloader, it comes in two sections (files), these are 
programmed by the Flash Utility into the target system.  The bootloader 
is not needed in the root filesystem.

The problem is not getting these things built, but preventing them from 
being installed in the tmp/rootfs/ filesystem or tarball.  They should 
only go into tmp/deploy/image/, which  I currently have them going 
into...  However, the bitbake system assumes that anything that is 
packaged, must be deployed into the root filesystem!?

How do you build a bootloader that resides in Flash and doesn't get 
stuck into the filesystem image?  The same would hold true for the 
native (linux PC) app which flashes the target memory.

Regards,

TomW

-- 
Tom Walsh - WN3L - Embedded Systems Consultant
http://openhardware.net http://cyberiansoftware.com http://openzipit.org
"Windows? No thanks, I have work to do..."
----------------------------------------------------




