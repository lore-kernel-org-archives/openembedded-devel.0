Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <requinham@gmail.com>) id 1SEJVs-0003ds-Ml
	for openembedded-devel@lists.openembedded.org;
	Sun, 01 Apr 2012 14:04:05 +0200
Received: by iaag37 with SMTP id g37so2958496iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Apr 2012 04:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=mnj3/hxXL6O8N2jK6lReG3gEoM+3Lfl6kuJnWOpegrw=;
	b=a1mWjaOd0AHtPqIZXwzbEYv9je9fTR0y0VMigc8xMA1RzVSngaVP3HxwO4xZ5TlX2I
	KUa/XaC1mIARix48ZUUZK+BpnPeVN0zkLebtiGqAg9/yzpqQH5W+/gu48ZyJNkV0i3UK
	r3Ndto4zajR8ZNlfLxihXMRCUb3aU3W+y/yPNy0SpB8emw0gVlSvDsHOdySZDcyeTV4I
	ep9yQ6kAPLB/hac5fKGMyfay5odEEfrd7yEgTCe9MQb/lJGSLixYSgj0D2O9D9vTjvgV
	5QoWf5GsXjU2WXbXGfVhvNTW94GHe/e1r+MXcUFor7WNGn8d1DQpge05BSTY9c8WwTxr
	V9PQ==
MIME-Version: 1.0
Received: by 10.42.152.68 with SMTP id h4mr2462524icw.15.1333281297155; Sun,
	01 Apr 2012 04:54:57 -0700 (PDT)
Received: by 10.64.9.142 with HTTP; Sun, 1 Apr 2012 04:54:57 -0700 (PDT)
Date: Sun, 1 Apr 2012 13:54:57 +0200
Message-ID: <CABMxt4hhGnOdqfqK8GfS1tg9pTS=3o3z4PULj+feY9e=of7xdA@mail.gmail.com>
From: Mohamed HAMZAOUI <requinham@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [OpenEmbedded] [SocketCan] compiling error on mcp251x
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
X-List-Received-Date: Sun, 01 Apr 2012 12:04:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I tried to bitbake the socketcan-modules with this command :
bitbake socketcan-modules

i have a compiling problem and the building failed.
Can you help me on this issue please ?

the compiling trace :

Loading cache: 100%
|###############################################################################################################################################################|
Time: 00:00:01
Loaded 7086 entries from dependency cache.
NOTE: angstrom DOES NOT support bash-noemu because doesn't work on the
target
                                  | ETA:  --:--:--
NOTE: angstrom DOES NOT support linux-hotplug because hotplug functionality
is provided by udev
NOTE: angstrom DOES NOT support bluez-utils because bluez-utils 3.x has
been replaced by bluez4
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
NOTE: angstrom DOES NOT support bluez-utils because bluez-utils 3.x has
been replaced by bluez4
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
provided by udev
Parsing recipes: 100%
|#############################################################################################################################################################|
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
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modules-0.0+svnr917-r102/temp/log.do_compile.31020
Log data follows:
| + do_compile
| + module_do_compile
| + unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
| + oe_runmake
KERNEL_PATH=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/kernel
KERNEL_SRC=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/kernel
KDIR=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/kernel
KERNELDIR=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/kernel
KERNEL_DIR=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/kernel
KERNEL_VERSION=2.6.32 'CC=arm-angstrom-linux-gnueabi-gcc
 -mno-thumb-interwork -mno-thumb' 'LD=arm-angstrom-linux-gnueabi-ld
--sysroot=/media/dev/stuff/tmp/sysroots/armv7a-angstrom-linux-gnueabi '
'AR=arm-angstrom-linux-gnueabi-ar '
| + oenote make -e MAKEFLAGS=
KERNEL_PATH=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/kernel
KERNEL_SRC=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/kernel
KDIR=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/kernel
KERNELDIR=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/kernel
KERNEL_DIR=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/kernel
KERNEL_VERSION=2.6.32 'CC=arm-angstrom-linux-gnueabi-gcc
 -mno-thumb-interwork -mno-thumb' 'LD=arm-angstrom-linux-gnueabi-ld
--sysroot=/media/dev/stuff/tmp/sysroots/armv7a-angstrom-linux-gnueabi '
'AR=arm-angstrom-linux-gnueabi-ar '
| + echo NOTE: 'make -e MAKEFLAGS=
KERNEL_PATH=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/kernel
KERNEL_SRC=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/kernel
KDIR=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/kernel
KERNELDIR=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/kernel
KERNEL_DIR=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/kernel
KERNEL_VERSION=2.6.32 CC=arm-angstrom-linux-gnueabi-gcc
 -mno-thumb-interwork -mno-thumb LD=arm-angstrom-linux-gnueabi-ld
--sysroot=/media/dev/stuff/tmp/sysroots/armv7a-angstrom-linux-gnueabi
 AR=arm-angstrom-linux-gnueabi-ar '
| NOTE: make -e MAKEFLAGS=
KERNEL_PATH=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/kernel
KERNEL_SRC=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/kernel
KDIR=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/kernel
KERNELDIR=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/kernel
KERNEL_DIR=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/kernel
KERNEL_VERSION=2.6.32 CC=arm-angstrom-linux-gnueabi-gcc
 -mno-thumb-interwork -mno-thumb LD=arm-angstrom-linux-gnueabi-ld
--sysroot=/media/dev/stuff/tmp/sysroots/armv7a-angstrom-linux-gnueabi
 AR=arm-angstrom-linux-gnueabi-ar
| + make -e MAKEFLAGS=
KERNEL_PATH=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/kernel
KERNEL_SRC=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/kernel
KDIR=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/kernel
KERNELDIR=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/kernel
KERNEL_DIR=/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/kernel
KERNEL_VERSION=2.6.32 'CC=arm-angstrom-linux-gnueabi-gcc
 -mno-thumb-interwork -mno-thumb' 'LD=arm-angstrom-linux-gnueabi-ld
--sysroot=/media/dev/stuff/tmp/sysroots/armv7a-angstrom-linux-gnueabi '
'AR=arm-angstrom-linux-gnueabi-ar '
| make -C
/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/kernel
M=/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modules-0.0+svnr917-r102/trunk/kernel/2.6
modules
TOPDIR=/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modules-0.0+svnr917-r102/trunk/kernel/2.6
| make[1]: Entering directory
`/media/dev/stuff/tmp/sysroots/am3517-crane-angstrom-linux-gnueabi/kernel'
|   CC [M]
 /media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modules-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.o
|
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modules-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.c:
In function 'mcp251x_setup':
|
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modules-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.c:652:2:
error: implicit declaration of function 'can_set_bittiming'
|
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modules-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.c:
In function 'mcp251x_do_get_state':
|
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modules-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.c:771:12:
error: 'CAN_STATE_BUS_PASSIVE' undeclared (first use in this function)
|
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modules-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.c:771:12:
note: each undeclared identifier is reported only once for each function it
appears in
|
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modules-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.c:773:12:
error: 'CAN_STATE_BUS_WARNING' undeclared (first use in this function)
|
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modules-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.c:775:12:
error: 'CAN_STATE_ACTIVE' undeclared (first use in this function)
|
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modules-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.c:
In function 'alloc_mcp251x_netdev':
|
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modules-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.c:994:2:
error: too few arguments to function 'alloc_candev'
| include/linux/can/dev.h:63:20: note: declared here
|
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modules-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.c:1000:5:
error: 'struct net_device' has no member named 'open'
|
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modules-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.c:1001:5:
error: 'struct net_device' has no member named 'stop'
|
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modules-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.c:1002:5:
error: 'struct net_device' has no member named 'hard_start_xmit'
|
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modules-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.c:1003:5:
error: 'struct net_device' has no member named 'tx_timeout'
|
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modules-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.c:1007:27:
warning: assignment from incompatible pointer type
|
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modules-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.c:
In function 'mcp251x_can_probe':
|
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modules-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.c:1040:21:
error: 'struct can_bittiming' has no member named 'clock'
|
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modules-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.c:1044:3:
warning: 'DMA_nnBIT_MASK' is deprecated
| make[3]: ***
[/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modules-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can/mcp251x.o]
Error 1
| make[2]: ***
[/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modules-0.0+svnr917-r102/trunk/kernel/2.6/drivers/net/can]
Error 2
| make[1]: ***
[_module_/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modules-0.0+svnr917-r102/trunk/kernel/2.6]
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
/media/dev/stuff/tmp/work/am3517-crane-angstrom-linux-gnueabi/socketcan-modules-0.0+svnr917-r102/temp/log.do_compile.31020
for further information)
ERROR: Task 13 (/media/dev/stuff/openembedded/recipes/socketcan/
socketcan-modules_svn.bb, do_compile) failed with exit code '1'
ERROR: '/media/dev/stuff/openembedded/recipes/socketcan/
socketcan-modules_svn.bb' failed

