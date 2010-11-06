Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric.colleu@gmail.com>) id 1PEgfE-00030x-K9
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 12:10:30 +0100
Received: by vws17 with SMTP id 17so1478100vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Nov 2010 04:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=U8whdazVCgjkoQoyM6ZLpCJe4T7S1gCi7M3jIsUiYiU=;
	b=hwCNXRuaFCVSuU8mYPqS3PXYiVW7ARsJar3KbTIjcFMoGvsDes498udEXgqRkg6oor
	i2eByiOFC0nj67ONG5Z71MtHSFjsmIqr9bsmCpw7tLZTiRLA89hWJBG6PwUOUswBhIiz
	PW3b5MI448rFCvXyyQOynseNcAxbUHizQx0R8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=eXVb4UptKhopjcZo/vWeRqAhDZQq3YBOqq8FgHsKzeZnMgSOv9fPm/H8w8b9eX3H6M
	lQCZUQ9AZaX/QmugSr3aUpjbwMD69YCHpCrC2RWb1f+2frdMrZNQTQvXde28GMZ+Kpvt
	IHPoF95cag8hIXCGNY2XZSxo0JXKm3lZmj+Tk=
MIME-Version: 1.0
Received: by 10.220.194.131 with SMTP id dy3mr314929vcb.224.1289041770251;
	Sat, 06 Nov 2010 04:09:30 -0700 (PDT)
Received: by 10.220.203.1 with HTTP; Sat, 6 Nov 2010 04:09:30 -0700 (PDT)
Date: Sat, 6 Nov 2010 12:09:30 +0100
Message-ID: <AANLkTi=S8j1zwebV0fz=yUxbo0p_QzRUUpi37mwTO69A@mail.gmail.com>
From: Eric Colleu <eric.colleu@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: eric.colleu@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: problem building omap3-sgx-module
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
X-List-Received-Date: Sat, 06 Nov 2010 11:10:30 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Dear all,

I am trying to build an image including virtual/libgl package (i.e
libgles-omap3) for my igep0020 platform. libgles-omap3 depends on
omap3-sgx-modules and this one doesn't build.
I tried several kernel recipes (linux_2.6.36, linux_2.6.34, linux_2.6.32,
linux-igep2_2.6.33.7-0.bb).
I am on tag tested_2010-10-29.

I am stuck on this one for a while.
Thank you for your help.

Eric Colleu.

the build log is :
NOTE: package omap3-sgx-modules-1.4.14.2616-r90f: task do_compile: Started
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/ecolleu/dev/jkbx/oe/recipes/powervr-drivers/
omap3-sgx-modules_1.4.14.2616.bb do_compile failed
ERROR: Task 1680 (/home/ecolleu/dev/jkbx/oe/recipes/powervr-drivers/
omap3-sgx-modules_1.4.14.2616.bb, do_compile) failed with 256
ERROR: '/home/ecolleu/dev/jkbx/oe/recipes/powervr-drivers/
omap3-sgx-modules_1.4.14.2616.bb' failed
ERROR: Function do_compile failed
NOTE: Task failed: ('function do_compile failed',
'/home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap3-sgx-module=
s-1.4.14.2616-r90f/temp/log.do_compile.25013')
ERROR: Logfile of failure stored in:
/home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap3-sgx-modules=
-1.4.14.2616-r90f/temp/log.do_compile.25013
Log data follows:
| NOTE: make -e MAKEFLAGS=3D
KERNEL_PATH=3D/home/ecolleu/dev/jkbx/tmp/sysroots/igep0020-oe-linux-gnueabi=
/kernel
KERNEL_SRC=3D/home/ecolleu/dev/jkbx/tmp/sysroots/igep0020-oe-linux-gnueabi/=
kernel
KDIR=3D/home/ecolleu/dev/jkbx/tmp/sysroots/igep0020-oe-linux-gnueabi/kernel
KERNELDIR=3D/home/ecolleu/dev/jkbx/tmp/sysroots/igep0020-oe-linux-gnueabi/k=
ernel
KERNEL_DIR=3D/home/ecolleu/dev/jkbx/tmp/sysroots/igep0020-oe-linux-gnueabi/=
kernel
KERNEL_VERSION=3D2.6.36 CC=3Darm-oe-linux-gnueabi-gcc
 LD=3Darm-oe-linux-gnueabi-ld  AR=3Darm-oe-linux-gnueabi-ar  BUILD=3Dreleas=
e
TI_PLATFORM=3Domap3630
| make -C
/home/ecolleu/dev/jkbx/tmp/sysroots/igep0020-oe-linux-gnueabi/kernel M=3D`p=
wd`
| make[1]: Entering directory
`/home/ecolleu/dev/jkbx/tmp/sysroots/igep0020-oe-linux-gnueabi/kernel'
|   LD
 /home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap3-sgx-module=
s-1.4.14.2616-r90f/Graphics_SDK_4_00_00_01/GFX_Linux_KM/services4/3rdparty/=
bufferclass_ti/built-in.o
|   CC [M]
 /home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap3-sgx-module=
s-1.4.14.2616-r90f/Graphics_SDK_4_00_00_01/GFX_Linux_KM/services4/3rdparty/=
bufferclass_ti/bc_cat.o
|
/home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap3-sgx-modules=
-1.4.14.2616-r90f/Graphics_SDK_4_00_00_01/GFX_Linux_KM/services4/3rdparty/b=
ufferclass_ti/bc_cat.c:124:
erreur: unknown field =91ioctl=92 specified in initializer
|
/home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap3-sgx-modules=
-1.4.14.2616-r90f/Graphics_SDK_4_00_00_01/GFX_Linux_KM/services4/3rdparty/b=
ufferclass_ti/bc_cat.c:124:
attention : initialization from incompatible pointer type
|
/home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap3-sgx-modules=
-1.4.14.2616-r90f/Graphics_SDK_4_00_00_01/GFX_Linux_KM/services4/3rdparty/b=
ufferclass_ti/bc_cat.c:
In function =91bc_cat_init=92:
|
/home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap3-sgx-modules=
-1.4.14.2616-r90f/Graphics_SDK_4_00_00_01/GFX_Linux_KM/services4/3rdparty/b=
ufferclass_ti/bc_cat.c:495:
erreur: implicit declaration of function =91cpu_is_omap3530=92
|
/home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap3-sgx-modules=
-1.4.14.2616-r90f/Graphics_SDK_4_00_00_01/GFX_Linux_KM/services4/3rdparty/b=
ufferclass_ti/bc_cat.c:495:
erreur: implicit declaration of function =91omap_rev_lt_3_0=92
| make[3]: ***
[/home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap3-sgx-module=
s-1.4.14.2616-r90f/Graphics_SDK_4_00_00_01/GFX_Linux_KM/services4/3rdparty/=
bufferclass_ti/bc_cat.o]
Erreur 1
| make[2]: ***
[/home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap3-sgx-module=
s-1.4.14.2616-r90f/Graphics_SDK_4_00_00_01/GFX_Linux_KM/services4/3rdparty/=
bufferclass_ti]
Erreur 2
| make[1]: ***
[_module_/home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap3-sg=
x-modules-1.4.14.2616-r90f/Graphics_SDK_4_00_00_01/GFX_Linux_KM]
Error 2
| make[1]: Leaving directory
`/home/ecolleu/dev/jkbx/tmp/sysroots/igep0020-oe-linux-gnueabi/kernel'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
| ERROR: Function do_compile failed
NOTE: package omap3-sgx-modules-1.4.14.2616-r90f: task do_compile: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/ecolleu/dev/jkbx/oe/recipes/powervr-drivers/
omap3-sgx-modules_1.4.14.2616.bb do_compile failed
ERROR: Task 1680 (/home/ecolleu/dev/jkbx/oe/recipes/powervr-drivers/
omap3-sgx-modules_1.4.14.2616.bb, do_compile) failed with 256
ERROR: '/home/ecolleu/dev/jkbx/oe/recipes/powervr-drivers/
omap3-sgx-modules_1.4.14.2616.bb' failed
ERROR: '/home/ecolleu/dev/jkbx/oe/recipes/powervr-drivers/
omap3-sgx-modules_1.4.14.2616.bb' failed

