Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1PEqDP-0007Ry-S8
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 22:22:26 +0100
Received: by qwd6 with SMTP id 6so3478806qwd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Nov 2010 14:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=TqYOteLW4WZLuRpMWz7QMBkmRh2JVeKFZhA2t1ixYWU=;
	b=jdWfA4TRXDMqna79CRHtBuywZ9l3YPSJgWuxcbq6q9GzVvVoW+ahTh3ds3Kv9mdowA
	89O+BiWdKBdz69w/WgogVVxZZMJqzbwu0X+TRPNOoOjl4E0lrDgHEovDUA6oRziXfyD8
	vc8MsAjUh2DIkTSGe5ohJ+sq4pt6cgNiXmJ1E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Ih19F4mKl8UXfsjZ2GMIGuBFTjc9Awc8QKuuCa+bO4PlMF3Bd+N2XLso96CdVLhBdH
	LX4F+24ZM2GtIL10dtIePKq2H4z1tlynkM+vRZMZhP/zFfsIVod/RQ+l5n/XluKmWZ05
	hWAUM4lC5L+z/s/MDp7DOsJWaiCIut04Wxn9g=
MIME-Version: 1.0
Received: by 10.229.233.196 with SMTP id jz4mr3457168qcb.138.1289078486997;
	Sat, 06 Nov 2010 14:21:26 -0700 (PDT)
Received: by 10.229.8.210 with HTTP; Sat, 6 Nov 2010 14:21:26 -0700 (PDT)
In-Reply-To: <4CD58F23.5060700@crhc.illinois.edu>
References: <AANLkTi=S8j1zwebV0fz=yUxbo0p_QzRUUpi37mwTO69A@mail.gmail.com>
	<4CD58F23.5060700@crhc.illinois.edu>
Date: Sat, 6 Nov 2010 14:21:26 -0700
Message-ID: <AANLkTin1z3p8B-nvSuP-UxRRuiQbqUqmeH9n=bXWBhsC@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
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
X-List-Received-Date: Sat, 06 Nov 2010 21:22:27 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 6, 2010 at 10:23 AM, Matt Johnson
<johnso87@crhc.illinois.edu> wrote:
> On 11/06/2010 06:09 AM, Eric Colleu wrote:
>>
>> Dear all,
>>
>> I am trying to build an image including virtual/libgl package (i.e
>> libgles-omap3) for my igep0020 platform. libgles-omap3 depends on
>> omap3-sgx-modules and this one doesn't build.
>> I tried several kernel recipes (linux_2.6.36, linux_2.6.34, linux_2.6.32=
,
>> linux-igep2_2.6.33.7-0.bb).
>>
>
> Eric,
> =A0 =A0The only recipe I know omap3-sgx-modules to work with is
> linux-omap-psp_2.6.32.
> -Matt
>
>> I am on tag tested_2010-10-29.
>>
>> I am stuck on this one for a while.
>> Thank you for your help.
>>
>> Eric Colleu.
>>
>> the build log is :
>> NOTE: package omap3-sgx-modules-1.4.14.2616-r90f: task do_compile: Start=
ed
>> ERROR: TaskFailed event exception, aborting
>> ERROR: Build of /home/ecolleu/dev/jkbx/oe/recipes/powervr-drivers/
>> omap3-sgx-modules_1.4.14.2616.bb do_compile failed
>> ERROR: Task 1680 (/home/ecolleu/dev/jkbx/oe/recipes/powervr-drivers/
>> omap3-sgx-modules_1.4.14.2616.bb, do_compile) failed with 256
>> ERROR: '/home/ecolleu/dev/jkbx/oe/recipes/powervr-drivers/
>> omap3-sgx-modules_1.4.14.2616.bb' failed
>> ERROR: Function do_compile failed
>> NOTE: Task failed: ('function do_compile failed',
>>
>> '/home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap3-sgx-mod=
ules-1.4.14.2616-r90f/temp/log.do_compile.25013')
>> ERROR: Logfile of failure stored in:
>>
>> /home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap3-sgx-modu=
les-1.4.14.2616-r90f/temp/log.do_compile.25013
>> Log data follows:
>> | NOTE: make -e MAKEFLAGS=3D
>>
>> KERNEL_PATH=3D/home/ecolleu/dev/jkbx/tmp/sysroots/igep0020-oe-linux-gnue=
abi/kernel
>>
>> KERNEL_SRC=3D/home/ecolleu/dev/jkbx/tmp/sysroots/igep0020-oe-linux-gnuea=
bi/kernel
>> KDIR=3D/home/ecolleu/dev/jkbx/tmp/sysroots/igep0020-oe-linux-gnueabi/ker=
nel
>>
>> KERNELDIR=3D/home/ecolleu/dev/jkbx/tmp/sysroots/igep0020-oe-linux-gnueab=
i/kernel
>>
>> KERNEL_DIR=3D/home/ecolleu/dev/jkbx/tmp/sysroots/igep0020-oe-linux-gnuea=
bi/kernel
>> KERNEL_VERSION=3D2.6.36 CC=3Darm-oe-linux-gnueabi-gcc
>> =A0LD=3Darm-oe-linux-gnueabi-ld =A0AR=3Darm-oe-linux-gnueabi-ar =A0BUILD=
=3Drelease
>> TI_PLATFORM=3Domap3630
>> | make -C
>> /home/ecolleu/dev/jkbx/tmp/sysroots/igep0020-oe-linux-gnueabi/kernel
>> M=3D`pwd`
>> | make[1]: Entering directory
>> `/home/ecolleu/dev/jkbx/tmp/sysroots/igep0020-oe-linux-gnueabi/kernel'
>> | =A0 LD
>>
>> =A0/home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap3-sgx-m=
odules-1.4.14.2616-r90f/Graphics_SDK_4_00_00_01/GFX_Linux_KM/services4/3rdp=
arty/bufferclass_ti/built-in.o
>> | =A0 CC [M]
>>
>> =A0/home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap3-sgx-m=
odules-1.4.14.2616-r90f/Graphics_SDK_4_00_00_01/GFX_Linux_KM/services4/3rdp=
arty/bufferclass_ti/bc_cat.o
>> |
>>
>> /home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap3-sgx-modu=
les-1.4.14.2616-r90f/Graphics_SDK_4_00_00_01/GFX_Linux_KM/services4/3rdpart=
y/bufferclass_ti/bc_cat.c:124:
>> erreur: unknown field =91ioctl=92 specified in initializer
>> |
>>
>> /home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap3-sgx-modu=
les-1.4.14.2616-r90f/Graphics_SDK_4_00_00_01/GFX_Linux_KM/services4/3rdpart=
y/bufferclass_ti/bc_cat.c:124:
>> attention : initialization from incompatible pointer type
>> |
>>
>> /home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap3-sgx-modu=
les-1.4.14.2616-r90f/Graphics_SDK_4_00_00_01/GFX_Linux_KM/services4/3rdpart=
y/bufferclass_ti/bc_cat.c:
>> In function =91bc_cat_init=92:
>> |
>>
>> /home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap3-sgx-modu=
les-1.4.14.2616-r90f/Graphics_SDK_4_00_00_01/GFX_Linux_KM/services4/3rdpart=
y/bufferclass_ti/bc_cat.c:495:
>> erreur: implicit declaration of function =91cpu_is_omap3530=92
>> |
>>
>> /home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap3-sgx-modu=
les-1.4.14.2616-r90f/Graphics_SDK_4_00_00_01/GFX_Linux_KM/services4/3rdpart=
y/bufferclass_ti/bc_cat.c:495:
>> erreur: implicit declaration of function =91omap_rev_lt_3_0=92
>> | make[3]: ***
>>
>> [/home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap3-sgx-mod=
ules-1.4.14.2616-r90f/Graphics_SDK_4_00_00_01/GFX_Linux_KM/services4/3rdpar=
ty/bufferclass_ti/bc_cat.o]
>> Erreur 1
>> | make[2]: ***
>>
>> [/home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap3-sgx-mod=
ules-1.4.14.2616-r90f/Graphics_SDK_4_00_00_01/GFX_Linux_KM/services4/3rdpar=
ty/bufferclass_ti]
>> Erreur 2
>> | make[1]: ***
>>
>> [_module_/home/ecolleu/dev/jkbx/tmp/work/igep0020-oe-linux-gnueabi/omap3=
-sgx-modules-1.4.14.2616-r90f/Graphics_SDK_4_00_00_01/GFX_Linux_KM]
>> Error 2
>> | make[1]: Leaving directory
>> `/home/ecolleu/dev/jkbx/tmp/sysroots/igep0020-oe-linux-gnueabi/kernel'
>> | make: *** [all] Error 2
>> | FATAL: oe_runmake failed
>> | ERROR: Function do_compile failed
>> NOTE: package omap3-sgx-modules-1.4.14.2616-r90f: task do_compile: Faile=
d
>> ERROR: TaskFailed event exception, aborting
>> ERROR: Build of /home/ecolleu/dev/jkbx/oe/recipes/powervr-drivers/
>> omap3-sgx-modules_1.4.14.2616.bb do_compile failed
>> ERROR: Task 1680 (/home/ecolleu/dev/jkbx/oe/recipes/powervr-drivers/
>> omap3-sgx-modules_1.4.14.2616.bb, do_compile) failed with 256
>> ERROR: '/home/ecolleu/dev/jkbx/oe/recipes/powervr-drivers/
>> omap3-sgx-modules_1.4.14.2616.bb' failed
>> ERROR: '/home/ecolleu/dev/jkbx/oe/recipes/powervr-drivers/
>> omap3-sgx-modules_1.4.14.2616.bb' failed
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> --
> Matt Johnson
> Graduate Student
> University of Illinois at Urbana-Champaign, Dept. of ECE
> Coordinated Science Lab, Rm. 213
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



Builds on linux-omap3-2.6.34 for me on the overo-branch.


