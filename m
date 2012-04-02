Received: from mx194.callplus.net.nz ([202.180.66.194]
	helo=mxi2.callplus.net.nz) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <roystonvasey@slingshot.co.nz>) id 1SEWXz-0004o3-Tb
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Apr 2012 03:59:09 +0200
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ap4EAKcEeU/LYgoS/2dsb2JhbABEugOCCQEBAQEDAQEBBQIeEjQXAQMCBgMRBAEBKAcZDgEeCQgCBBMLBYd4DLlOE4JBjkgEkzaDPI8egnw
X-IronPort-AV: E=Sophos;i="4.75,354,1330858800"; d="scan'208";a="255471975"
Received: from smtp.connexionz.co.nz (HELO mikepad) ([203.98.10.18])
	by ismtp2.tranzpeer.net with ESMTP; 02 Apr 2012 13:49:58 +1200
From: "R U Local" <roystonvasey@slingshot.co.nz>
To: <openembedded-devel@lists.openembedded.org>
References: <CABMxt4hhGnOdqfqK8GfS1tg9pTS=3o3z4PULj+feY9e=of7xdA@mail.gmail.com>
In-Reply-To: <CABMxt4hhGnOdqfqK8GfS1tg9pTS=3o3z4PULj+feY9e=of7xdA@mail.gmail.com>
Date: Mon, 2 Apr 2012 13:49:57 +1200
Message-ID: <00c301cd1072$e8c62bb0$ba528310$@slingshot.co.nz>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQL9lYz4b+cQcwVN+nZ82JmhvJ6e8ZQlte2Q
Subject: Re: [OpenEmbedded] [SocketCan] compiling error on mcp251x
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
X-List-Received-Date: Mon, 02 Apr 2012 01:59:09 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-nz

The svn 917 modules are very old now. I think they are only useful for
kernels that don't have IP link support pre 2.6.28 I think.
SocketCan and its associated drivers were moved into the mainline kernel so
you need to select the drivers in the kernel .config
I'm surprised that you are using the MCP251x as the AM3517 has native
High-End Can Controller (HECC) that performs significantly better than the
MCP251x part.

To get SocketCAN support select:
CONFIG_CAN=y
CONFIG_CAN_RAW=y
CONFIG_CAN_DEV=y
CONFIG_CAN_CALC_BITTIMING=y
For the HECC drivers
CONFIG_CAN_TI_HECC=y
For MCP251x drivers
CONFIG_CAN_MCP251X=y

In your kernel config and rebuild your kernel.

Cheers Mike.

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
Mohamed HAMZAOUI
Sent: Sunday, 1 April 2012 23:55
To: openembedded-devel@lists.openembedded.org
Subject: [oe] [OpenEmbedded] [SocketCan] compiling error on mcp251x

Hi,

I tried to bitbake the socketcan-modules with this command :
bitbake socketcan-modules

i have a compiling problem and the building failed.
Can you help me on this issue please ?

the compiling trace :

Loading cache: 100%
|#######################################################################
|#######################################################################
|#################|
Time: 00:00:01
Loaded 7086 entries from dependency cache.
NOTE: angstrom DOES NOT support bash-noemu because doesn't work on the
target
                                  | ETA:  --:--:--
NOTE: angstrom DOES NOT support linux-hotplug because hotplug functionality
is provided by udev
NOTE: angstrom DOES NOT support bluez-utils because bluez-utils 3.x has been
replaced by bluez4
NOTE: angstrom DOES NOT support linux-hotplug because hotplug functionality
is provided by udev
NOTE: angstrom DOES NOT support xcursor-watchonly-theme because
xcursor-transparent-theme is good enough
NOTE: angstrom DOES NOT support libiconv because the glibc builtin iconv
replacement is used
NOTE: angstrom DOES NOT support libiconv because the glibc builtin iconv
replacement is used
NOTE: angstrom DOES NOT support ffmpeg because libav is the preferred
multimedia library
NOTE: angstrom DOES NOT support hotplug2 because hotplug functionality is
provided by udev
NOTE: angstrom DOES NOT support ipkg because ipkg has been superseded by
opkg
NOTE: angstrom DOES NOT support libiconv because the glibc builtin iconv
replacement is used
NOTE: angstrom DOES NOT support bluez-utils because bluez-utils 3.x has been
replaced by bluez4
NOTE: angstrom DOES NOT support ffmpeg because libav is the preferred
multimedia library
NOTE: angstrom DOES NOT support ffmpeg because libav is the preferred
multimedia library
NOTE: angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been
replaced by bluez4
NOTE: angstrom DOES NOT support hotplug-ng because hotplug functionality is
provided by udev
NOTE: angstrom DOES NOT support ffmpeg because libav is the preferred
multimedia library
NOTE: angstrom DOES NOT support fso-apm because regular apmd is good
enough#######
                                   | ETA:  00:00:09
NOTE: angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been
replaced by bluez4
                              | ETA:  00:00:07
NOTE: angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been
replaced by bluez4###################################################
                             | ETA:  00:00:01
NOTE: angstrom DOES NOT support hotplug-ng because hotplug functionality is
provided by udev Parsing recipes: 100%
|#######################################################################
|#######################################################################
|###############|
Time: 00:00:07
Parsing of 7216 .bb files complete (6437 cached, 779 parsed). 7884 targets,
328 skipped, 0 masked, 0 errors.

Build Configuration:
BB_VERSION        = "1.12.0"
METADATA_BRANCH   = "master"
METADATA_REVISION = "4e75705"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "am3517-crane"
DISTRO            = "angstrom"
DISTRO_VERSION    = "v2012.04"
TARGET_FPU        = "hard"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing RunQueue Tasks
NOTE: Running task 498 of 752 (ID: 13,
/media/dev/stuff/openembedded/recipes/socketcan/socketcan-modules_svn.bb,
do_compile)
NOTE: package socketcan-modules-0.0+svnr917-r102: task do_compile: Started
ERROR: Logfile of failure stored in:
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modu
les-0.0+svnr917-r102/temp/log.do_compile.31020
Log data follows:
| + do_compile
| + module_do_compile
| + unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS oe_runmake
KERNEL_PATH=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueab
i/kernel
KERNEL_SRC=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi
/kernel
KDIR=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/kerne
l
KERNELDIR=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/
kernel
KERNEL_DIR=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi
/kernel
KERNEL_VERSION=2.6.32 'CC=arm-angstrom-linux-gnueabi-gcc
 -mno-thumb-interwork -mno-thumb' 'LD=arm-angstrom-linux-gnueabi-ld
--sysroot=/media/dev/stuff/tmp/sysroots/armv7a-angstrom-linux-gnueabi '
'AR=arm-angstrom-linux-gnueabi-ar '
| + oenote make -e MAKEFLAGS=
KERNEL_PATH=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueab
i/kernel
KERNEL_SRC=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi
/kernel
KDIR=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/kerne
l
KERNELDIR=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/
kernel
KERNEL_DIR=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi
/kernel
KERNEL_VERSION=2.6.32 'CC=arm-angstrom-linux-gnueabi-gcc
 -mno-thumb-interwork -mno-thumb' 'LD=arm-angstrom-linux-gnueabi-ld
--sysroot=/media/dev/stuff/tmp/sysroots/armv7a-angstrom-linux-gnueabi '
'AR=arm-angstrom-linux-gnueabi-ar '
| + echo NOTE: 'make -e MAKEFLAGS=
KERNEL_PATH=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueab
i/kernel
KERNEL_SRC=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi
/kernel
KDIR=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/kerne
l
KERNELDIR=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/
kernel
KERNEL_DIR=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi
/kernel
KERNEL_VERSION=2.6.32 CC=arm-angstrom-linux-gnueabi-gcc
-mno-thumb-interwork -mno-thumb LD=arm-angstrom-linux-gnueabi-ld
--sysroot=/media/dev/stuff/tmp/sysroots/armv7a-angstrom-linux-gnueabi
 AR=arm-angstrom-linux-gnueabi-ar '
| NOTE: make -e MAKEFLAGS=
KERNEL_PATH=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueab
i/kernel
KERNEL_SRC=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi
/kernel
KDIR=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/kerne
l
KERNELDIR=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/
kernel
KERNEL_DIR=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi
/kernel
KERNEL_VERSION=2.6.32 CC=arm-angstrom-linux-gnueabi-gcc
-mno-thumb-interwork -mno-thumb LD=arm-angstrom-linux-gnueabi-ld
--sysroot=/media/dev/stuff/tmp/sysroots/armv7a-angstrom-linux-gnueabi
 AR=arm-angstrom-linux-gnueabi-ar
| + make -e MAKEFLAGS=
KERNEL_PATH=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueab
i/kernel
KERNEL_SRC=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi
/kernel
KDIR=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/kerne
l
KERNELDIR=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/
kernel
KERNEL_DIR=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi
/kernel
KERNEL_VERSION=2.6.32 'CC=arm-angstrom-linux-gnueabi-gcc
 -mno-thumb-interwork -mno-thumb' 'LD=arm-angstrom-linux-gnueabi-ld
--sysroot=/media/dev/stuff/tmp/sysroots/armv7a-angstrom-linux-gnueabi '
'AR=arm-angstrom-linux-gnueabi-ar '
| make -C
/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/kernel
M=/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-mo
dules-0.0+svnr917-r102/trunk/kernel/2.6
modules
TOPDIR=/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketc
an-modules-0.0+svnr917-r102/trunk/kernel/2.6
| make[1]: Entering directory
`/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/kernel'
|   CC [M]
 
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modu
les-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.o
|
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modu
les-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.c:
In function 'mcp251x_setup':
|
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modu
les-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.c:652:2:
error: implicit declaration of function 'can_set_bittiming'
|
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modu
les-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.c:
In function 'mcp251x_do_get_state':
|
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modu
les-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.c:771:12:
error: 'CAN_STATE_BUS_PASSIVE' undeclared (first use in this function)
|
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modu
les-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.c:771:12:
note: each undeclared identifier is reported only once for each function it
appears in
|
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modu
les-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.c:773:12:
error: 'CAN_STATE_BUS_WARNING' undeclared (first use in this function)
|
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modu
les-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.c:775:12:
error: 'CAN_STATE_ACTIVE' undeclared (first use in this function)
|
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modu
les-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.c:
In function 'alloc_mcp251x_netdev':
|
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modu
les-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.c:994:2:
error: too few arguments to function 'alloc_candev'
| include/linux/can/dev.h:63:20: note: declared here
|
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modu
les-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.c:1000:5:
error: 'struct net_device' has no member named 'open'
|
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modu
les-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.c:1001:5:
error: 'struct net_device' has no member named 'stop'
|
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modu
les-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.c:1002:5:
error: 'struct net_device' has no member named 'hard_start_xmit'
|
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modu
les-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.c:1003:5:
error: 'struct net_device' has no member named 'tx_timeout'
|
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modu
les-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.c:1007:27:
warning: assignment from incompatible pointer type
|
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modu
les-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.c:
In function 'mcp251x_can_probe':
|
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modu
les-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.c:1040:21:
error: 'struct can_bittiming' has no member named 'clock'
|
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modu
les-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.c:1044:3:
warning: 'DMA_nnBIT_MASK' is deprecated
| make[3]: ***
[/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-mod
ules-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.o]
Error 1
| make[2]: ***
[/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-mod
ules-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can]
Error 2
| make[1]: ***
[_module_/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socke
tcan-modules-0.0+svnr917-r102/trunk/kernel/2.6]
Error 2
| make[1]: Leaving directory
`/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/kernel'
| make: *** [modules] Error 2
| + die 'oe_runmake failed'
| + oefatal 'oe_runmake failed'
| + echo FATAL: 'oe_runmake failed'
| FATAL: oe_runmake failed
| + exit 1
NOTE: package socketcan-modules-0.0+svnr917-r102: task do_compile: Failed
ERROR: Function 'do_compile' failed (see
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modu
les-0.0+svnr917-r102/temp/log.do_compile.31020
for further information)
ERROR: Task 13 (/media/dev/stuff/openembedded/recipes/socketcan/
socketcan-modules_svn.bb, do_compile) failed with exit code '1'
ERROR: '/media/dev/stuff/openembedded/recipes/socketcan/
socketcan-modules_svn.bb' failed
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

__________ Information from ESET NOD32 Antivirus, version of virus signature
database 7018 (20120401) __________

The message was checked by ESET NOD32 Antivirus.

http://www.eset.com





