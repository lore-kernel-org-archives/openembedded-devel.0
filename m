Received: from [64.233.184.229] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <andrew.paulsen@gmail.com>) id 1GmuZM-0003iV-AW
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Nov 2006 17:03:28 +0100
Received: by wr-out-0506.google.com with SMTP id i32so47537wra
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Nov 2006 08:00:36 -0800 (PST)
Received: by 10.78.32.14 with SMTP id f14mr7893301huf.1164211235112;
	Wed, 22 Nov 2006 08:00:35 -0800 (PST)
Received: by 10.78.159.2 with HTTP; Wed, 22 Nov 2006 08:00:35 -0800 (PST)
Message-ID: <d46153c40611220800m4e715362v713c24f5853238@mail.gmail.com>
Date: Wed, 22 Nov 2006 10:00:35 -0600
From: "Andrew Paulsen" <andrew.paulsen@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Angstrom, compulab-pxa270, and gpe-image
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
X-List-Received-Date: Wed, 22 Nov 2006 16:03:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I'm trying to "bitbake gpe-image" using the Angstrom distribution and
the computlab-pxa270 machine.

The error I'm getting is:

NOTE: build 200611220923: started

OE Build Configuration:
BB_VERSION     = "1.6.3"
OE_REVISION    = "2735a1770517f8ac5497ef178efb990839a57508"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux-gnueabi"
MACHINE        = "compulab-pxa270"
DISTRO         = "angstrom"
DISTRO_VERSION = "test-20061122"
TARGET_FPU     = "soft"

<snip>

| make[2]: Entering directory
`/home/packet/OpenEmbedded/build/tmp/work/compulab-pxa270-angstrom-linux-gnueabi/compulab-pxa270-2.6.16-r2/linux-2.6.16'
|   CC      drivers/block/rd.o
|   CC      drivers/block/loop.o
| make[3]: Entering directory
`/home/packet/OpenEmbedded/build/tmp/work/compulab-pxa270-angstrom-linux-gnueabi/compulab-pxa270-2.6.16-r2/linux-2.6.16'
|   CC      drivers/block/cl_flash/cl_nordev.o
| drivers/block/cl_flash/cl_nordev.c:359: warning: initialization from
incompatible pointer type
| drivers/block/cl_flash/cl_nordev.c:29: warning: 'major' defined but not used
| drivers/block/cl_flash/cl_nordev.c:163: warning: 'do_flash_request'
defined but not used
| drivers/block/cl_flash/cl_nordev.c:76: warning: 'flash_fops' defined
but not used
| drivers/block/cl_flash/cl_nordev.c:86: warning: 'flash_gendisk'
defined but not used
| drivers/block/cl_flash/cl_nordev.c:87: warning: 'flash_lock' defined
but not used
| drivers/block/cl_flash/cl_nordev.c:88: warning: 'flash_queue'
defined but not used
|   CC      drivers/block/cl_flash/cl_blkdev.o
| drivers/block/cl_flash/cl_blkdev.c: In function 'cl_nand_ioctl':
| drivers/block/cl_flash/cl_blkdev.c:529: warning: ISO C90 forbids
mixed declarations and code
|   CC      drivers/block/cl_flash/cl_nanddev_x270.o
|   LD      drivers/block/cl_flash/fdrv.o
| arm-angstrom-linux-gnueabi-ld: ERROR:
drivers/block/cl_flash/CL_FlashDrv uses FPA instructions, whereas
drivers/block/cl_flash/fdrv.o does not
| arm-angstrom-linux-gnueabi-ld: failed to merge target specific data
of file drivers/block/cl_flash/CL_FlashDrv
| make[3]: *** [drivers/block/cl_flash/fdrv.o] Error 1
| make[3]: Leaving directory
`/home/packet/OpenEmbedded/build/tmp/work/compulab-pxa270-angstrom-linux-gnueabi/compulab-pxa270-2.6.16-r2/linux-2.6.16'
| make[2]: *** [drivers/block/cl_flash] Error 2
| make[2]: Leaving directory
`/home/packet/OpenEmbedded/build/tmp/work/compulab-pxa270-angstrom-linux-gnueabi/compulab-pxa270-2.6.16-r2/linux-2.6.16'
| make[1]: *** [drivers/block] Error 2
| make[1]: Leaving directory
`/home/packet/OpenEmbedded/build/tmp/work/compulab-pxa270-angstrom-linux-gnueabi/compulab-pxa270-2.6.16-r2/linux-2.6.16'
| make: *** [drivers] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed:
/home/packet/OpenEmbedded/build/tmp/work/compulab-pxa270-angstrom-linux-gnueabi/compulab-pxa270-2.6.16-r2/temp/log.do_compile.22708
NOTE: package compulab-pxa270-2.6.16-r2: task do_compile: failed


