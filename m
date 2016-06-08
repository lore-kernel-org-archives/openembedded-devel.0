Return-Path: <praveenreddy.p@hcl.com>
Received: from GWS07.hcl.com (gws07.hcl.com [192.8.186.130])
	by mail.openembedded.org (Postfix) with ESMTP id BC6DE6FFE8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jun 2016 05:21:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.26,437,1459794600"; d="scan'208";a="50944716"
Received: from unknown (HELO CHN-CORP-HT01.CORP.HCL.IN) ([10.249.2.33])
	by GWS07.hcl.com with ESMTP/TLS/AES128-SHA; 08 Jun 2016 10:51:19 +0530
Received: from CHN-HCLT-CSHT07.HCLT.CORP.HCL.IN (10.150.12.32) by
	CHN-CORP-HT01.CORP.HCL.IN (10.249.2.33) with Microsoft SMTP Server
	(TLS) id 14.3.235.1; Wed, 8 Jun 2016 10:50:51 +0530
Received: from CHN-HCLT-MBS08.HCLT.CORP.HCL.IN ([10.150.12.23]) by
	CHN-HCLT-CSHT07.HCLT.CORP.HCL.IN ([::1]) with mapi id 14.03.0235.001;
	Wed, 8 Jun 2016 10:50:51 +0530
From: Praveenreddy Padamati <praveenreddy.p@hcl.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Reg: Yocto build error( gcc_4.8)
Thread-Index: AdHAxSJ9pKlPffvASgSwdBL23xQSuf//q0SAgAFUYZI=
Date: Wed, 8 Jun 2016 05:20:50 +0000
Message-ID: <09856974BCEE6F48AB378E52E4CAA73C230E9E59@chn-hclt-mbs08.HCLT.CORP.HCL.IN>
References: <09856974BCEE6F48AB378E52E4CAA73C230E93B3@chn-hclt-mbs08.HCLT.CORP.HCL.IN>,
	<5756DA11.6040509@mlbassoc.com>
In-Reply-To: <5756DA11.6040509@mlbassoc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.151.34.14]
MIME-Version: 1.0
Cc: "phani.kara@alstom.com" <phani.kara@alstom.com>
Subject: Re: Reg: Yocto build error( gcc_4.8)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Jun 2016 05:21:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

Please find the "gcc_4.8.bb, > do_compile failed with exit code".     error=
 log below


HCL-Desktop:~/fsl-release-bsp/build$ bitbake core-image-sato
Parsing recipes: 100% |####################################################=
###########################################| Time: 00:01:30
Parsing of 1748 .bb files complete (0 cached, 1748 parsed). 2192 targets, 8=
4 skipped, 1 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
NOTE: multiple providers are available for jpeg (jpeg, libjpeg-turbo)
NOTE: consider defining a PREFERRED_PROVIDER entry to match jpeg
NOTE: multiple providers are available for jpeg-native (jpeg-native, libjpe=
g-turbo-native)
NOTE: consider defining a PREFERRED_PROVIDER entry to match jpeg-native

Build Configuration:
BB_VERSION        =3D "1.22.0"
BUILD_SYS         =3D "x86_64-linux"
NATIVELSBSTRING   =3D "Ubuntu-14.04"
TARGET_SYS        =3D "arm-poky-linux-gnueabi"
MACHINE           =3D "imx6dlsabresd"
DISTRO            =3D "poky"
DISTRO_VERSION    =3D "1.6.2"
TUNE_FEATURES     =3D "armv7a vfp neon callconvention-hard cortexa9"
TARGET_FPU        =3D "vfp-neon"
meta              =

meta-yocto        =3D "(nobranch):30b8d9378b8260e452552b806610dc9b6fe0b69f"
meta-oe           =3D "(nobranch):8065dd8456913457a0114ddb2b4bd4842847b2a3"
meta-fsl-arm      =3D "(nobranch):9bc540eec9a7e280af13371ea70650fcc47ea627"
meta-fsl-arm-extra =3D "(nobranch):e1085deb3d915d2a95a65cceadc77c6de0dadfb6"
meta-fsl-demos    =3D "(nobranch):f141c7d1158b8addbd6f1ed047a1b47c2ed85f8f"
meta-fsl-arm      =

meta-fsl-demos    =3D "(nobranch):0c5367e963b5f7797ded59f835313466b896d7e9"
meta-browser      =3D "(nobranch):63963cc56c8d0291779693e62b66cb16e5c86883"
meta-gnome        =

meta-networking   =

meta-ruby         =3D "(nobranch):8065dd8456913457a0114ddb2b4bd4842847b2a3"
meta-qt5          =3D "(nobranch):c29c317e0f22202bfaa85329a580564bbc179089"
meta-fsl-qt5      =

meta-fsl-bluez    =3D "(nobranch):0c5367e963b5f7797ded59f835313466b896d7e9"

NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: Function failed: do_compile (log file is located at /home/kumarn/fsl=
-release-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/gcc/4.8.=
2-r0/temp/log.do_compile.4349)
ERROR: Logfile of failure stored in: /home/kumarn/fsl-release-bsp/build/tmp=
/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/gcc/4.8.2-r0/temp/log.do_compi=
le.4349
Log data follows:
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-linux=
', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| DEBUG: Executing shell function do_compile
| NOTE: make -j 2 ARCH_FLAGS_FOR_TARGET=3D -march=3Darmv7-a -mthumb-interwo=
rk -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a9 -isystem/home/kumarn/=
fsl-release-bsp/build/tmp/sysroots/imx6dlsabresd/usr/include -I/home/kumarn=
/fsl-release-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/gcc/=
4.8.2-r0/gcc-4.8.2/build.arm-poky-linux-gnueabi.arm-poky-linux-gnueabi/gcc/=
include/
| make[1]: Entering directory `/home/kumarn/fsl-release-bsp/build/tmp/work/=
cortexa9hf-vfp-neon-poky-linux-gnueabi/gcc/4.8.2-r0/gcc-4.8.2/build.arm-pok=
y-linux-gnueabi.arm-poky-linux-gnueabi'
| Configuring in ./libiberty
| Configuring in ./fixincludes
| configure: loading cache ./config.cache
| configure: loading cache ./config.cache
| configure: error: `CC' has changed since the previous run:
| configure:   former value:  `arm-poky-linux-gnueabi-gcc  -march=3Darmv7-a=
 -mthumb-interwork -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a9 --sys=
root=3D/home/kumarn/fsl-release-bsp/build/tmp/sysroots/imx6dlsabresd'
| configure:   current value: `arm-poky-linux-gnueabi-gcc  -march=3Darmv7-a=
 -mthumb-interwork -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a9 --sys=
root=3D/home/kumarn/fsl-release-bsp/build/tmp/sysroots/imx6qsabresd'
| configure: error: in `/home/kumarn/fsl-release-bsp/build/tmp/work/cortexa=
9hf-vfp-neon-poky-linux-gnueabi/gcc/4.8.2-r0/gcc-4.8.2/build.arm-poky-linux=
-gnueabi.arm-poky-linux-gnueabi/fixincludes':
| configure: error: changes in the environment can compromise the build
| configure: error: run `make distclean' and/or `rm ./config.cache' and sta=
rt over
| configure: error: `CC' has changed since the previous run:
| configure:   former value:  `arm-poky-linux-gnueabi-gcc  -march=3Darmv7-a=
 -mthumb-interwork -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a9 --sys=
root=3D/home/kumarn/fsl-release-bsp/build/tmp/sysroots/imx6dlsabresd'
| configure:   current value: `arm-poky-linux-gnueabi-gcc  -march=3Darmv7-a=
 -mthumb-interwork -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a9 --sys=
root=3D/home/kumarn/fsl-release-bsp/build/tmp/sysroots/imx6qsabresd'
| configure: error: in `/home/kumarn/fsl-release-bsp/build/tmp/work/cortexa=
9hf-vfp-neon-poky-linux-gnueabi/gcc/4.8.2-r0/gcc-4.8.2/build.arm-poky-linux=
-gnueabi.arm-poky-linux-gnueabi/libiberty':
| configure: error: changes in the environment can compromise the build
| configure: error: run `make distclean' and/or `rm ./config.cache' and sta=
rt over
| make[1]: *** [configure-fixincludes] Error 1
| make[1]: *** Waiting for unfinished jobs....
| make[1]: *** [configure-libiberty] Error 1
| make[1]: Leaving directory `/home/kumarn/fsl-release-bsp/build/tmp/work/c=
ortexa9hf-vfp-neon-poky-linux-gnueabi/gcc/4.8.2-r0/gcc-4.8.2/build.arm-poky=
-linux-gnueabi.arm-poky-linux-gnueabi'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/kumarn/f=
sl-release-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/gcc/4.=
8.2-r0/temp/log.do_compile.4349)
ERROR: Task 3578 (/home/kumarn/fsl-release-bsp/sources/poky/meta/recipes-de=
vtools/gcc/gcc_4.8.bb, do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 3317 tasks of which 3188 didn't need to be r=
erun and 1 failed.
Waiting for 0 running tasks to finish:

Summary: 1 task failed:
  /home/kumarn/fsl-release-bsp/sources/poky/meta/recipes-devtools/gcc/gcc_4=
.8.bb, do_compile
Summary: There was 1 ERROR message shown, returning a non-zero exit code.



Thanks & Regards
Praveen Reddy P
_  _______________________________________
From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel=
-bounces@lists.openembedded.org] on behalf of Gary Thomas [gary@mlbassoc.co=
m]
Sent: Tuesday, June 07, 2016 7:58 PM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] Reg: Yocto build error( gcc_4.8)

On 2016-06-07 16:03, Praveenreddy Padamati wrote:
> Hi all,
>  ""gccgccgcc_4.8.bb, > do_compile failed with exit code".  ""gccgccgcc_4.=
8.bb, > do_compile failed with exit code".  ""gccgccgcc_4.8.bb, > do_compil=
e failed with exit code".      ""gccgccgcc_4.8.bb, > do_compile failed with=
 exit code".""gccgccgcc_4.8.bb, > do_compile failed with exit code".""gccgc=
cgcc_4.8.bb, > do_compile failed with exit code".
> We are compiling the yocto build system with "bitbake core-image-sato" co=
mmand. We are facing one problem. It is not compiling, it is showing "gcc_4=
.8.bb, > do_compile failed with exit code".
> Please do the needful.

You'll need to provide a LOT more info to be able to get help.
What version of Yocto (OE-core, Poky, etc), along with any
extra layers you are using.  Also GCCCC/4.8 has been gone for
quite some time so you must be using a very old branch/release.
We'll also need to know your build host, $DISTRO, $MACHINE, etc.
These are all printed when you run bitbake.

A detailed log (send it to postbin if it's very big) will also
help you get the aid you need.

--
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------
--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel


::DISCLAIMER::
---------------------------------------------------------------------------=
-------------------------------------------------------------------------

The contents of this e-mail and any attachment(s) are confidential and inte=
nded for the named recipient(s) only.
E-mail transmission is not guaranteed to be secure or error-free as informa=
tion could be intercepted, corrupted,
lost, destroyed, arrive late or incomplete, or may contain viruses in trans=
mission. The e mail and its contents
(with or without referred errors) shall therefore not attach any liability =
on the originator or HCL or its affiliates.
Views or opinions, if any, presented in this email are solely those of the =
author and may not necessarily reflect the
views or opinions of HCL or its affiliates. Any form of reproduction, disse=
mination, copying, disclosure, modification,
distribution and / or publication of this message without the prior written=
 consent of authorized representative of
HCL is strictly prohibited. If you have received this email in error please=
 delete it and notify the sender immediately.
Before opening any email and/or attachments, please check them for viruses =
and other defects.

---------------------------------------------------------------------------=
-------------------------------------------------------------------------


