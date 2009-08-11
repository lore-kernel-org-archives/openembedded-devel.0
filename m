Received: from [81.228.8.83] (helo=pne-smtpout1-sn2.hy.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Mawkk-0005Ye-5O
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Aug 2009 21:11:22 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout1-sn2.hy.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A7285AE000FF445 for openembedded-devel@lists.openembedded.org;
	Tue, 11 Aug 2009 20:55:01 +0200
Message-ID: <4A81BE84.6010607@atmel.com>
Date: Tue, 11 Aug 2009 20:55:00 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Contents of the "origin/ulf/linux-2.6.30.2" branch. Help with testing wanted.
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
X-List-Received-Date: Tue, 11 Aug 2009 19:11:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

The goal of this branch is to update the AT91 support.

1) Fix AT91bootstrap, which is currently non-functional
2) Update to the latest u-boot (2009.08-rc2)
3) Update the kernel (2.6.30.2)
   with many AT91 patches not yet in mainstream kernel.
   MCI patches still lacking...

I have so far managed to build everything and load
on an AT91SAM9263EK which has a dataflash
containing at91bootstrap, u-boot and linux.

0x0     at91bootstrap
0x8400  u-boot
0x84000 linux

The NAND flash is programmed with a root file system

0x400000 JFFS2 root file system.

AT91BOOTSTRAP
v2.10 was completely wrong due to bad linkaddr.
v2.12 and v2.13 boots properly from dataflash.

Supported boards:
afeb9260
cap9adk
cap9stk
sam9g10ek
sam9g20ek
sam9g45ekes
sam9rlek
sam9xeek
sam9260ek
sam9261ek
sam9263ek


df	dataflash
dfc	dataflashcard
nf	nandflash
f	parallel flash

No support for SD-Card boot yet

All boards compile, but only the SAM9263EK has been tested on H/W.
Only dataflashcard boot that is...
Boot from NAND flash not tested.

The updated at91bootstrap changes the recipe
so that the normal way to configure is to do

oe_runmake <board>_defconfig

instead of copying a defconfig file to the toplevel .config

Since AT91bootstrap-2.12 supports KConfig, it is easy to
create your own board support by entering the builddirectory
and run make menuconfig.

Copy the resulting .config to one of the board directories
and create a patch which will generate this file.
This way, supported boards will not need a defconfig file
in the recipies/at91bootstrap directory.

The at91bootstrap-2.13-rc1 will attempt to init the bus-matrix of
the sam9263, which is neccessary for large screens,
but I have no large screen to test on.
If the CONFIG_PSRAM is enabled (which it is), then
LCD access to the 32 bit bus has low priority which
can cause problems.

The priority is also set so that the MACB has
high priority to the 80 kB SRAM and the OHCI
has high priority to the 16 kB SRAM.

The LCD and 2DACC has high priority to the EBI1.

2.13-rc1 also adds support for the AFEB9260.
(Compiled, but not tested on a board)

U-BOOT
Updated to 2009.08-rc2 with patches.
I use the same patches as in Buildroot
so some are not 100% applicable.

Supported at91 boards in the atmel directory:
cap9adk
rm9200dk
rm9200ek
sam9g45ekes
sam9m10g45ek
sam9rlek
sam9260ek	used for 	sam9xeek	sam9g20ek
sam9261ek	used for	sam9g10ek
sam9263ek


Some patches:
Disables -msoftfloat
Adds some downloads tools for minicom (sx-at91/sx-raw)
Some extra commands to set up a scripts which
will make it easier for newbies.
"factory" command will generate the default environment
even if a newbie has overwritten the environment.
"ethinit" will init the ethernet mac
Support for commands handling the LEDs.
Update of configs
gcc-4.4 does not like the combination of weak and inline
Increase the area for u-boot to both sector 1 and 2.
A dataflash is divided mostly into sectors of 256 pages (1056 bytes)
but the first 256 pages are divided into an 8 page parameter area
and a 248 page sector for other things.
The patch adds another 256 page sector.
When compiling with late gcc compilers, which uses
their own libgcc, div0 calls "raise" which is
not part of libgcc, but rather part of glibc.
The patch adds a raise in libarm/board.c which
calls the "hang" routine.
Use -mabi=aapcs-linux instead of -mabi=apcs-gnu

In the tested configuration, U-BOOT 2009.08-rc2
is loaded by at91bootstrap and can tftp
down a kernel which is programmed to dataflash.
The kernel boots.

The last time I bitbaked this, U-Boot did not build
for some reason.
When I bitbaked u-boot directly, it built.
Will rebuild again and see if problem repeats.

LINUX
A kernel is generated, with the defconfig taken
from Marcin's 2.6.30, slightly updated.

Added a lot of patches from the ARM mailing list,
but the MCI is missing.
Hope to get that later.

linux boots and you can communicate with the console,
but gpe is not started properly.

I introduced the possibility to build linux using
make <board>_defconfig, instead of using a
defconfig in a board directory under linux.
LINUX26_DEFCONFIG needs to be defined.


BOARD SUPPORT
Since there are plenty of AT91 chips with more coming,
I decided to make two include files.
conf/machine/include/AT91.inc
conf/machine/include/AT91-LCD.inc

An AT91 board can include one of the two
files simplifying the maintenance.

The latter includes the former, and adds
some extra support for screens.

Since the sam9rl does not have an usbhost,
each board will have to supply this in the board support file.
Typically each file is now reduced to:

include conf/machine/include/AT91-LCD.inc
LINUX26_CONFIG = "at91sam9263ek_defconfig"
UBOOT_MACHINE = "at91sam9263ek_config"
AT91BOOTSTRAP_BOARD = "at91sam9263ek"
MACHINE_FEATURES += "usbhost"

There are board configs for:
cap9adk
cap9stk
sam9g10ek
sam9g20ek
sam9g45ekes
sam9m10ek
sam9rlek
sam9xeek
sam9260ek
sam9261ek
sam9263ek
at572d940hf (diopsis ARM9 + 1 Gflops Floating Point DSP)

Again, only the sam926e3k has been tested.

Checksums are updated of course.

I will spend some time testing this, but
I hope I will get some help from interested parties.

-- 
Best Regards
Ulf Samuelsson



