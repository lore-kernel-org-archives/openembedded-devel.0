Received: from smtp-out112.alice.it ([85.37.17.112])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1NRuSV-0004SW-T3
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jan 2010 22:27:30 +0100
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-out112.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 4 Jan 2010 22:25:24 +0100
Received: from FBCMCL01B04.fbc.local ([192.168.69.85]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 4 Jan 2010 22:25:25 +0100
Received: from [192.168.10.100] ([79.11.151.179]) by FBCMCL01B04.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 4 Jan 2010 22:25:24 +0100
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 04 Jan 2010 22:25:17 +0100
Message-Id: <1262640317.3767.6.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-OriginalArrivalTime: 04 Jan 2010 21:25:24.0131 (UTC)
	FILETIME=[6D3BB730:01CA8D84]
X-SA-Exim-Connect-IP: 85.37.17.112
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: ro/rw boot order
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
X-List-Received-Date: Mon, 04 Jan 2010 21:27:31 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,
I used that combinaison:
MACHINE = "eee701"
DISTRO = "angstrom-2008.1"

eee701 beeing that file:
#-----------------------------------------------------------------------------
#@TYPE: Machine
#@NAME: eeepc 701
#@DESCRIPTION: Machine configuration for the eeepc 701 netbook
#-----------------------------------------------------------------------------

require i686-generic.conf

PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
PREFERRED_PROVIDER_virtual/libgl = "mesa-dri"
MACHINE_DRI_MODULES = "i915"

XSERVER = "xserver-xorg xf86-video-intel xf86-input-evdev
xf86-input-keyboard xf86-input-mouse"

MACHINE_FEATURES +=" wifi alsa "
MACHINE_DISPLAY_WIDTH_PIXELS = "800"
MACHINE_DISPLAY_HEIGHT_PIXELS = "480"
MACHINE_DISPLAY_ORIENTATION = "0"
XSERVER ?= "xserver-xorg \
           xf86-video-intel \
           xf86-input-evdev \
	   xf86-input-keyboard \
	   xf86-input-mouse"

IMAGE_FSTYPES += "tar.gz"

PREFERRED_PROVIDER_virtual/kernel ?= "linux"
PREFERRED_VERSION_linux ?= "2.6.32"

so I use a BIOS and grub-0.97 on top of it

and menu.lst says root=/dev/hda1 ro
(it should be /dev/sda1 but that's another problem I should fix for my
machine(with a new overriden menu.lst))

and in angstrom /etc/rcS.d there is:
S03udev
S10checkroot

And when booting it freeze unless you change udev/checkroot order or put
rw to the kernel command line.

I bet that some people already started working arround the issue:
CMDLINE = "root=/dev/sda1 rw init=/sbin/init console=ttyS2,115200n8
mem=128M nohz=off"
can be found in the archos5 machine config

what's the best fix for that?

Denis.




