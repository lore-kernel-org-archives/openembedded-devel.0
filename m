Received: from [83.223.64.65] (helo=eric-weiss.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric@eric-weiss.de>) id 1O4cW5-0005xT-6o
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Apr 2010 18:11:09 +0200
Received: by eric-weiss.de (Postfix, from userid 1022)
	id 1E27A57854; Wed, 21 Apr 2010 20:07:34 +0200 (CEST)
Received: from [10.128.0.1] (0132900044.0.fullrate.dk [90.185.120.221])
	by eric-weiss.de (Postfix) with ESMTP id F350D57843
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Apr 2010 20:07:32 +0200 (CEST)
Message-ID: <4BCF22C6.6090109@eric-weiss.de>
Date: Wed, 21 Apr 2010 18:07:34 +0200
From: eric weiss <eric@eric-weiss.de>
User-Agent: Mozilla-Thunderbird 2.0.0.22 (X11/20090701)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 83.223.64.65
X-SA-Exim-Mail-From: eric@eric-weiss.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Support for SHARP Netwalker -PCZ1
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
X-List-Received-Date: Wed, 21 Apr 2010 16:11:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

hi

My netwalker arrived.
So i created a new MACHINE for supporting it with OE.

conf/machine/netwinder.conf
--------------------
#@TYPE: Machine
#@NAME: netwinder
#@DESCRIPTION: Machine configuration for the sharp-z1
TARGET_ARCH = "arm"

PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
XSERVER = "xserver-xorg \
          xf86-input-evdev \
          xf86-input-mouse \
          xf86-input-keyboard"

GUI_MACHINE_CLASS = "bigscreen"

require conf/machine/include/tune-cortexa8.inc
IMAGE_FSTYPES += "tar.bz2 ubi"
EXTRA_IMAGECMD_jffs2 = "-lnp "

# Guesswork
SERIAL_CONSOLE = "115200 ttyS2"
MACHINE_KERNEL_VERSION = "2.6"

PREFERRED_PROVIDER_virtual/kernel = "linux-netwalker"
MKUBIFS_ARGS = "-m 8192 -e 1032192 -c 4085"
UBINIZE_ARGS = "-m 8192 -p 1024KiB"

MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa"
--------------------

i created successfully an ubi image by hand with these UBI  parameters
but did not tested is for OE.



greetings

eric



