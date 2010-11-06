Received: from usps2.crhc.illinois.edu ([130.126.143.231]
	helo=usps.crhc.uiuc.edu) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <johnso87@crhc.illinois.edu>) id 1PEmVM-0000jE-7k
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 18:24:41 +0100
Received: from usps.crhc.uiuc.edu (localhost [127.0.0.1])
	by usps.crhc.uiuc.edu (Postfix) with ESMTP id 34891340056A
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Nov 2010 12:23:47 -0500 (CDT)
Received: from [192.168.1.198] (unknown [63.252.64.254])
	(using SSLv3 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: johnso87)
	by usps.crhc.uiuc.edu (Postfix) with ESMTPSA id 2300F3400091
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Nov 2010 12:23:47 -0500 (CDT)
Message-ID: <4CD58F23.5060700@crhc.illinois.edu>
Date: Sat, 06 Nov 2010 12:23:47 -0500
From: Matt Johnson <johnso87@crhc.illinois.edu>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9pre) Gecko/20100217 Lightning/1.0b1 Shredder/3.0.3pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTi=S8j1zwebV0fz=yUxbo0p_QzRUUpi37mwTO69A@mail.gmail.com>
In-Reply-To: <AANLkTi=S8j1zwebV0fz=yUxbo0p_QzRUUpi37mwTO69A@mail.gmail.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 130.126.143.231
X-SA-Exim-Mail-From: johnso87@crhc.illinois.edu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: problem building omap3-sgx-module
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
X-List-Received-Date: Sat, 06 Nov 2010 17:24:44 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable

On 11/06/2010 06:09 AM, Eric Colleu wrote:
> Dear all,
>
> I am trying to build an image including virtual/libgl package (i.e
> libgles-omap3) for my igep0020 platform. libgles-omap3 depends on
> omap3-sgx-modules and this one doesn't build.
> I tried several kernel recipes (linux_2.6.36, linux_2.6.34, linux_2.6.3=
2,
> linux-igep2_2.6.33.7-0.bb).
>   =20

Eric,
     The only recipe I know omap3-sgx-modules to work with is=20
linux-omap-psp_2.6.32.
-Matt

> I am on tag tested_2010-10-29.
>
> I am stuck on this one for a while.
> Thank you for your help.
>
> Eric Colleu.
>
> the build log is :
> NOTE: package omap3-sgx-modules-1.4.14.2616-r90f: task do_compile: Star=
ted
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /home/ecolleu/dev/jkbx/oe/recipes/powervr-drivers/
> omap3-sgx-modules_1.4.14.2616.bb do_compile failed
> ERROR: Task 1680 (/home/ecolleu/dev/jkbx/oe/recipes/powervr-drivers/
> omap3-sgx-modules_1.4.14.2616.bb, do_compile) failed with 256
> ERROR: '/home/ecolleu/dev/jkbx/oe/recipes/powervr-drivers/
> omap3-sgx-modules_1.4.14.2616.bb' failed
> ERROR: Function do_compile failed
> NOTE: Task failed: ('function do_compile failed',
> '/home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap3-sgx-mo=
dules-1.4.14.2616-r90f/temp/log.do_compile.25013')
> ERROR: Logfile of failure stored in:
> /home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap3-sgx-mod=
ules-1.4.14.2616-r90f/temp/log.do_compile.25013
> Log data follows:
> | NOTE: make -e MAKEFLAGS=3D
> KERNEL_PATH=3D/home/ecolleu/dev/jkbx/tmp/sysroots/igep0020-oe-linux-gnu=
eabi/kernel
> KERNEL_SRC=3D/home/ecolleu/dev/jkbx/tmp/sysroots/igep0020-oe-linux-gnue=
abi/kernel
> KDIR=3D/home/ecolleu/dev/jkbx/tmp/sysroots/igep0020-oe-linux-gnueabi/ke=
rnel
> KERNELDIR=3D/home/ecolleu/dev/jkbx/tmp/sysroots/igep0020-oe-linux-gnuea=
bi/kernel
> KERNEL_DIR=3D/home/ecolleu/dev/jkbx/tmp/sysroots/igep0020-oe-linux-gnue=
abi/kernel
> KERNEL_VERSION=3D2.6.36 CC=3Darm-oe-linux-gnueabi-gcc
>   LD=3Darm-oe-linux-gnueabi-ld  AR=3Darm-oe-linux-gnueabi-ar  BUILD=3Dr=
elease
> TI_PLATFORM=3Domap3630
> | make -C
> /home/ecolleu/dev/jkbx/tmp/sysroots/igep0020-oe-linux-gnueabi/kernel M=3D=
`pwd`
> | make[1]: Entering directory
> `/home/ecolleu/dev/jkbx/tmp/sysroots/igep0020-oe-linux-gnueabi/kernel'
> |   LD
>   /home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap3-sgx-m=
odules-1.4.14.2616-r90f/Graphics_SDK_4_00_00_01/GFX_Linux_KM/services4/3r=
dparty/bufferclass_ti/built-in.o
> |   CC [M]
>   /home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap3-sgx-m=
odules-1.4.14.2616-r90f/Graphics_SDK_4_00_00_01/GFX_Linux_KM/services4/3r=
dparty/bufferclass_ti/bc_cat.o
> |
> /home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap3-sgx-mod=
ules-1.4.14.2616-r90f/Graphics_SDK_4_00_00_01/GFX_Linux_KM/services4/3rdp=
arty/bufferclass_ti/bc_cat.c:124:
> erreur: unknown field =91ioctl=92 specified in initializer
> |
> /home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap3-sgx-mod=
ules-1.4.14.2616-r90f/Graphics_SDK_4_00_00_01/GFX_Linux_KM/services4/3rdp=
arty/bufferclass_ti/bc_cat.c:124:
> attention : initialization from incompatible pointer type
> |
> /home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap3-sgx-mod=
ules-1.4.14.2616-r90f/Graphics_SDK_4_00_00_01/GFX_Linux_KM/services4/3rdp=
arty/bufferclass_ti/bc_cat.c:
> In function =91bc_cat_init=92:
> |
> /home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap3-sgx-mod=
ules-1.4.14.2616-r90f/Graphics_SDK_4_00_00_01/GFX_Linux_KM/services4/3rdp=
arty/bufferclass_ti/bc_cat.c:495:
> erreur: implicit declaration of function =91cpu_is_omap3530=92
> |
> /home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap3-sgx-mod=
ules-1.4.14.2616-r90f/Graphics_SDK_4_00_00_01/GFX_Linux_KM/services4/3rdp=
arty/bufferclass_ti/bc_cat.c:495:
> erreur: implicit declaration of function =91omap_rev_lt_3_0=92
> | make[3]: ***
> [/home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap3-sgx-mo=
dules-1.4.14.2616-r90f/Graphics_SDK_4_00_00_01/GFX_Linux_KM/services4/3rd=
party/bufferclass_ti/bc_cat.o]
> Erreur 1
> | make[2]: ***
> [/home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap3-sgx-mo=
dules-1.4.14.2616-r90f/Graphics_SDK_4_00_00_01/GFX_Linux_KM/services4/3rd=
party/bufferclass_ti]
> Erreur 2
> | make[1]: ***
> [_module_/home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap=
3-sgx-modules-1.4.14.2616-r90f/Graphics_SDK_4_00_00_01/GFX_Linux_KM]
> Error 2
> | make[1]: Leaving directory
> `/home/ecolleu/dev/jkbx/tmp/sysroots/igep0020-oe-linux-gnueabi/kernel'
> | make: *** [all] Error 2
> | FATAL: oe_runmake failed
> | ERROR: Function do_compile failed
> NOTE: package omap3-sgx-modules-1.4.14.2616-r90f: task do_compile: Fail=
ed
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /home/ecolleu/dev/jkbx/oe/recipes/powervr-drivers/
> omap3-sgx-modules_1.4.14.2616.bb do_compile failed
> ERROR: Task 1680 (/home/ecolleu/dev/jkbx/oe/recipes/powervr-drivers/
> omap3-sgx-modules_1.4.14.2616.bb, do_compile) failed with 256
> ERROR: '/home/ecolleu/dev/jkbx/oe/recipes/powervr-drivers/
> omap3-sgx-modules_1.4.14.2616.bb' failed
> ERROR: '/home/ecolleu/dev/jkbx/oe/recipes/powervr-drivers/
> omap3-sgx-modules_1.4.14.2616.bb' failed
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>   =20

--=20
Matt Johnson
Graduate Student
University of Illinois at Urbana-Champaign, Dept. of ECE
Coordinated Science Lab, Rm. 213



