Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1Onymr-0008BR-BM
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 21:04:12 +0200
Received: by ewy7 with SMTP id 7so3626207ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Aug 2010 12:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=SLneGvGC06WYkFQxkW+G6fCkr6yO57w4ap9/BfZwzHw=;
	b=nxJkVIIyHmQ2h4NOv7MADFuYSaqSz2B42Co8h+J0KZ7kDy2cIlK4BK0dB+IxKcTgr8
	BlAqNmJKDxScHWO1Y/Af4IeZkZjRprzzOqySBzN/MEpBGh381YW/pLfdTxzuve4QO+3H
	0cWkzozy0wWJZRNggdKdnvMmURtq1IWWpXeJg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=G98VZljwj7Xlp59MLB/UHD++5/1QkPL+sIoTbpvZ3Plo2uNt20mqOX81vBaHaCoQzk
	RZ4yonX3aJ9MFc8KC2I2JJMYCgL9ark9CJSg9Vm5esMfwy3TTIO1wk+5l83kOT9V534D
	mwAKSqniY+9ktwIfr3B3R8gTsYWI+VbIJ9ACU=
MIME-Version: 1.0
Received: by 10.216.180.200 with SMTP id j50mr1202171wem.36.1282676605824;
	Tue, 24 Aug 2010 12:03:25 -0700 (PDT)
Received: by 10.216.179.76 with HTTP; Tue, 24 Aug 2010 12:03:25 -0700 (PDT)
Date: Tue, 24 Aug 2010 12:03:25 -0700
Message-ID: <AANLkTinrjKxnsOsjHGCGK_H2O7vSUc1Y8wXMR4G4x5z3@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: "General mailing list for gumstix users."
	<gumstix-users@lists.sourceforge.net>
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: omap3-sgx-modules do_compile failed
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
X-List-Received-Date: Tue, 24 Aug 2010 19:04:12 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

I have been able to build this for awhile with no issues and now its
failing on the do_compile part. Is there something I am missing with
this one? The error is below, and I have tried cleaning the recipe and
rebuilding it separately from my image and still same issues.


NOTE: Running task 891 of 907 (ID: 0,
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/powervr-drivers/omap3-=
sgx-modules_1.4.14.2616.bb,
do_unpack)
NOTE: Unpacking sources/OMAP35x_Graphics_SDK_setuplinux_3_01_00_06.bin
to tmp/work/overo-angstrom-linux-gnueabi/omap3-sgx-modules-1.4.14.2616-r88/

This will install TI OMAP35xx/37xx Graphics SDK on your computer.  Continue=
?
[n/Y]

This will install TI OMAP35xx/37xx Graphics SDK on your computer.  Continue=
?
[n/Y]

OMAP3530 / OMAP3515 / AM3517 / AM3715 / DM3730

Graphics Software License Agreement

IMPORTANT - PLEASE READ THE FOLLOWING LICENSE AGREEMENT CAREFULLY.  THIS IS=
 A
LEGALLY BINDING AGREEMENT.  AFTER YOU READ THIS LICENSE AGREEMENT, YOU WILL=
 BE
ASKED WHETHER YOU ACCEPT AND AGREE TO THE TERMS OF THIS LICENSE AGREEMENT. =
 DO
NOT CLICK "I HAVE READ AND AGREE" UNLESS: (1) YOU ARE AUTHORIZED TO ACCEPT =
AND
AGREE TO THE TERMS OF THIS LICENSE AGREEMENT ON BEHALF OF YOURSELF AND YOUR
COMPANY; AND (2) YOU INTEND TO ENTER INTO AND TO BE BOUND BY THE TERMS OF T=
HIS
LEGALLY BINDING AGREEMENT ON BEHALF OF YOURSELF AND YOUR COMPANY.




Important - Read carefully:  This OMAP3530 / OMAP3515 / AM3517 / AM3715 / D=
M3730
Graphics Software License Agreement ("Agreement") is a legal agreement betw=
een
you (either an individual or entity) and Texas Instruments Incorporated ("T=
I").
The "Licensed Materials" subject to this Agreement include the software pro=
grams
(in whole or in part) that accompany this Agreement and that TI has granted=
 you
access to download and any "on-line" or electronic documentation (in whole =
or in
part) associated with these programs, as well as any updates or upgrades to=
 such
-- Press space to continue or 'q' to quit --
software programs and documentation, if any, provided to you at TI's sole
discretion.  The Licensed Materials are specifically designed and licensed =
for
use solely and exclusively with OMAP3530, OMAP3515, AM3517, AM3715, and DM3=
730
processing devices manufactured by or for TI ("TI Devices").



By installing, copying or otherwise using the Licensed Materials you agree =
to
abide by the provisions set forth herein.  If you choose not to accept or a=
gree
with these provisions, do not download or install the Licensed Materials.  =
If
you have already paid for the Licensed Materials, you may return them for a=
 full
refund.



Note Regarding Access to Open Source Software:  The Licensed Materials are =
be
bundled with Open Source Software.  "Open Source Software" means any softwa=
re
licensed under terms requiring that (A) other software ("Proprietary Softwa=
re")
incorporated, combined or distributed with such software or developed using=
 such
software: (i) be disclosed or distributed in source code form; or (ii) othe=
rwise
be licensed on terms inconsistent with the terms of this Agreement, includi=
ng
but not limited to permitting use of the Proprietary Software on or with de=
vices
other than TI Devices, or (B) require the owner of Proprietary Software to
-- Press space to continue or 'q' to quit --
Do you agree to the licensing terms [n/Y]

Where do you want to install TI OMAP35xx/37xx Graphics SDK?
[/home/vdubhack/overo-oe/tmp/work/overo-angstrom-linux-gnueabi/omap3-sgx-mo=
dules-1.4.14.2616-r88/OMAP35x_Graphics_SDK_3_01_00_06]
Installing TI OMAP35xx/37xx Graphics SDK...

Installing Program Files...
[=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D] 100%
Installation complete.
NOTE: Running task 892 of 907 (ID: 1,
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/powervr-drivers/omap3-=
sgx-modules_1.4.14.2616.bb,
do_patch)
NOTE: Running task 893 of 907 (ID: 8,
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/powervr-drivers/omap3-=
sgx-modules_1.4.14.2616.bb,
do_configure)
NOTE: Running task 894 of 907 (ID: 9,
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/powervr-drivers/omap3-=
sgx-modules_1.4.14.2616.bb,
do_qa_configure)
NOTE: Running task 895 of 907 (ID: 10,
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/powervr-drivers/omap3-=
sgx-modules_1.4.14.2616.bb,
do_compile)
ERROR: function do_compile failed
ERROR: log data follows
(/home/vdubhack/overo-oe/tmp/work/overo-angstrom-linux-gnueabi/omap3-sgx-mo=
dules-1.4.14.2616-r88/temp/log.do_compile.23035)
| NOTE: make -e MAKEFLAGS=3D
KERNEL_PATH=3D/home/vdubhack/overo-oe/tmp/sysroots/overo-angstrom-linux-gnu=
eabi/kernel
KERNEL_SRC=3D/home/vdubhack/overo-oe/tmp/sysroots/overo-angstrom-linux-gnue=
abi/kernel
KDIR=3D/home/vdubhack/overo-oe/tmp/sysroots/overo-angstrom-linux-gnueabi/ke=
rnel
KERNELDIR=3D/home/vdubhack/overo-oe/tmp/sysroots/overo-angstrom-linux-gnuea=
bi/kernel
KERNEL_VERSION=3D2.6.33 CC=3Darm-angstrom-linux-gnueabi-gcc
-mno-thumb-interwork -mno-thumb LD=3Darm-angstrom-linux-gnueabi-ld
AR=3Darm-angstrom-linux-gnueabi-ar  BUILD=3Drelease TI_PLATFORM=3Domap3630
| make -C /home/vdubhack/overo-oe/tmp/sysroots/overo-angstrom-linux-gnueabi=
/kernel
M=3D`pwd`
| make[1]: Entering directory
`/home/vdubhack/overo-oe/tmp/sysroots/overo-angstrom-linux-gnueabi/kernel'
|   LD      /home/vdubhack/overo-oe/tmp/work/overo-angstrom-linux-gnueabi/o=
map3-sgx-modules-1.4.14.2616-r88/OMAP35x_Graphics_SDK_3_01_00_06/GFX_Linux_=
KM/services4/3rdparty/bufferclass_ti/built-in.o
|   CC [M]  /home/vdubhack/overo-oe/tmp/work/overo-angstrom-linux-gnueabi/o=
map3-sgx-modules-1.4.14.2616-r88/OMAP35x_Graphics_SDK_3_01_00_06/GFX_Linux_=
KM/services4/3rdparty/bufferclass_ti/bc_cat.o
| /home/vdubhack/overo-oe/tmp/work/overo-angstrom-linux-gnueabi/omap3-sgx-m=
odules-1.4.14.2616-r88/OMAP35x_Graphics_SDK_3_01_00_06/GFX_Linux_KM/service=
s4/3rdparty/bufferclass_ti/bc_cat.c:
In function =91bc_cat_init=92:
| /home/vdubhack/overo-oe/tmp/work/overo-angstrom-linux-gnueabi/omap3-sgx-m=
odules-1.4.14.2616-r88/OMAP35x_Graphics_SDK_3_01_00_06/GFX_Linux_KM/service=
s4/3rdparty/bufferclass_ti/bc_cat.c:490:
error: implicit declaration of function =91omap_rev_lt_3_0=92
| make[3]: *** [/home/vdubhack/overo-oe/tmp/work/overo-angstrom-linux-gnuea=
bi/omap3-sgx-modules-1.4.14.2616-r88/OMAP35x_Graphics_SDK_3_01_00_06/GFX_Li=
nux_KM/services4/3rdparty/bufferclass_ti/bc_cat.o]
Error 1
| make[2]: *** [/home/vdubhack/overo-oe/tmp/work/overo-angstrom-linux-gnuea=
bi/omap3-sgx-modules-1.4.14.2616-r88/OMAP35x_Graphics_SDK_3_01_00_06/GFX_Li=
nux_KM/services4/3rdparty/bufferclass_ti]
Error 2
| make[1]: *** [_module_/home/vdubhack/overo-oe/tmp/work/overo-angstrom-lin=
ux-gnueabi/omap3-sgx-modules-1.4.14.2616-r88/OMAP35x_Graphics_SDK_3_01_00_0=
6/GFX_Linux_KM]
Error 2
| make[1]: Leaving directory
`/home/vdubhack/overo-oe/tmp/sysroots/overo-angstrom-linux-gnueabi/kernel'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed:
/home/vdubhack/overo-oe/tmp/work/overo-angstrom-linux-gnueabi/omap3-sgx-mod=
ules-1.4.14.2616-r88/temp/log.do_compile.23035
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/powervr-drivers/omap3-=
sgx-modules_1.4.14.2616.bb
do_compile failed
ERROR: Task 10 (/home/vdubhack/overo-oe/org.openembedded.dev/recipes/powerv=
r-drivers/omap3-sgx-modules_1.4.14.2616.bb,
do_compile) failed
NOTE: Tasks Summary: Attempted 894 tasks of which 888 didn't need to
be rerun and 1 failed.
ERROR: '/home/vdubhack/overo-oe/org.openembedded.dev/recipes/powervr-driver=
s/omap3-sgx-modules_1.4.14.2616.bb'
failed


Thanks for any help or tips on this one


