Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 4FC1770178
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jun 2016 05:32:47 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 1085868A01D; Wed,  8 Jun 2016 06:32:47 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=ALL_TRUSTED,BAYES_50,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id EECA168A019;
	Wed,  8 Jun 2016 06:32:46 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 356066740315;
	Wed,  8 Jun 2016 07:32:45 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <09856974BCEE6F48AB378E52E4CAA73C230E93B3@chn-hclt-mbs08.HCLT.CORP.HCL.IN>
	<5756DA11.6040509@mlbassoc.com>
	<09856974BCEE6F48AB378E52E4CAA73C230E9E59@chn-hclt-mbs08.HCLT.CORP.HCL.IN>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <5757ADF4.2080507@mlbassoc.com>
Date: Wed, 8 Jun 2016 07:32:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <09856974BCEE6F48AB378E52E4CAA73C230E9E59@chn-hclt-mbs08.HCLT.CORP.HCL.IN>
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
X-List-Received-Date: Wed, 08 Jun 2016 05:32:48 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-06-08 07:20, Praveenreddy Padamati wrote:
> Hi all,
>
> Please find the "gcc_4.8.bb, > do_compile failed with exit code".     error log below

Do you have any files using NFS (the Poky/Yocto tree, or the build tree)?
That's not supported because of issues like this.

Also as mentioned, you have really old version - you should consider updating.

>
>
> HCL-Desktop:~/fsl-release-bsp/build$ bitbake core-image-sato
> Parsing recipes: 100% |###############################################################################################| Time: 00:01:30
> Parsing of 1748 .bb files complete (0 cached, 1748 parsed). 2192 targets, 84 skipped, 1 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
> NOTE: multiple providers are available for jpeg (jpeg, libjpeg-turbo)
> NOTE: consider defining a PREFERRED_PROVIDER entry to match jpeg
> NOTE: multiple providers are available for jpeg-native (jpeg-native, libjpeg-turbo-native)
> NOTE: consider defining a PREFERRED_PROVIDER entry to match jpeg-native
>
> Build Configuration:
> BB_VERSION        = "1.22.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Ubuntu-14.04"
> TARGET_SYS        = "arm-poky-linux-gnueabi"
> MACHINE           = "imx6dlsabresd"
> DISTRO            = "poky"
> DISTRO_VERSION    = "1.6.2"
> TUNE_FEATURES     = "armv7a vfp neon callconvention-hard cortexa9"
> TARGET_FPU        = "vfp-neon"
> meta
> meta-yocto        = "(nobranch):30b8d9378b8260e452552b806610dc9b6fe0b69f"
> meta-oe           = "(nobranch):8065dd8456913457a0114ddb2b4bd4842847b2a3"
> meta-fsl-arm      = "(nobranch):9bc540eec9a7e280af13371ea70650fcc47ea627"
> meta-fsl-arm-extra = "(nobranch):e1085deb3d915d2a95a65cceadc77c6de0dadfb6"
> meta-fsl-demos    = "(nobranch):f141c7d1158b8addbd6f1ed047a1b47c2ed85f8f"
> meta-fsl-arm
> meta-fsl-demos    = "(nobranch):0c5367e963b5f7797ded59f835313466b896d7e9"
> meta-browser      = "(nobranch):63963cc56c8d0291779693e62b66cb16e5c86883"
> meta-gnome
> meta-networking
> meta-ruby         = "(nobranch):8065dd8456913457a0114ddb2b4bd4842847b2a3"
> meta-qt5          = "(nobranch):c29c317e0f22202bfaa85329a580564bbc179089"
> meta-fsl-qt5
> meta-fsl-bluez    = "(nobranch):0c5367e963b5f7797ded59f835313466b896d7e9"
>
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> ERROR: Function failed: do_compile (log file is located at /home/kumarn/fsl-release-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/gcc/4.8.2-r0/temp/log.do_compile.4349)
> ERROR: Logfile of failure stored in: /home/kumarn/fsl-release-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/gcc/4.8.2-r0/temp/log.do_compile.4349
> Log data follows:
> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j 2 ARCH_FLAGS_FOR_TARGET= -march=armv7-a -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a9 -isystem/home/kumarn/fsl-release-bsp/build/tmp/sysroots/imx6dlsabresd/usr/include -I/home/kumarn/fsl-release-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/gcc/4.8.2-r0/gcc-4.8.2/build.arm-poky-linux-gnueabi.arm-poky-linux-gnueabi/gcc/include/
> | make[1]: Entering directory `/home/kumarn/fsl-release-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/gcc/4.8.2-r0/gcc-4.8.2/build.arm-poky-linux-gnueabi.arm-poky-linux-gnueabi'
> | Configuring in ./libiberty
> | Configuring in ./fixincludes
> | configure: loading cache ./config.cache
> | configure: loading cache ./config.cache
> | configure: error: `CC' has changed since the previous run:
> | configure:   former value:  `arm-poky-linux-gnueabi-gcc  -march=armv7-a -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a9 --sysroot=/home/kumarn/fsl-release-bsp/build/tmp/sysroots/imx6dlsabresd'
> | configure:   current value: `arm-poky-linux-gnueabi-gcc  -march=armv7-a -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a9 --sysroot=/home/kumarn/fsl-release-bsp/build/tmp/sysroots/imx6qsabresd'
> | configure: error: in `/home/kumarn/fsl-release-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/gcc/4.8.2-r0/gcc-4.8.2/build.arm-poky-linux-gnueabi.arm-poky-linux-gnueabi/fixincludes':
> | configure: error: changes in the environment can compromise the build
> | configure: error: run `make distclean' and/or `rm ./config.cache' and start over
> | configure: error: `CC' has changed since the previous run:
> | configure:   former value:  `arm-poky-linux-gnueabi-gcc  -march=armv7-a -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a9 --sysroot=/home/kumarn/fsl-release-bsp/build/tmp/sysroots/imx6dlsabresd'
> | configure:   current value: `arm-poky-linux-gnueabi-gcc  -march=armv7-a -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a9 --sysroot=/home/kumarn/fsl-release-bsp/build/tmp/sysroots/imx6qsabresd'
> | configure: error: in `/home/kumarn/fsl-release-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/gcc/4.8.2-r0/gcc-4.8.2/build.arm-poky-linux-gnueabi.arm-poky-linux-gnueabi/libiberty':
> | configure: error: changes in the environment can compromise the build
> | configure: error: run `make distclean' and/or `rm ./config.cache' and start over
> | make[1]: *** [configure-fixincludes] Error 1
> | make[1]: *** Waiting for unfinished jobs....
> | make[1]: *** [configure-libiberty] Error 1
> | make[1]: Leaving directory `/home/kumarn/fsl-release-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/gcc/4.8.2-r0/gcc-4.8.2/build.arm-poky-linux-gnueabi.arm-poky-linux-gnueabi'
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at /home/kumarn/fsl-release-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/gcc/4.8.2-r0/temp/log.do_compile.4349)
> ERROR: Task 3578 (/home/kumarn/fsl-release-bsp/sources/poky/meta/recipes-devtools/gcc/gcc_4.8.bb, do_compile) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 3317 tasks of which 3188 didn't need to be rerun and 1 failed.
> Waiting for 0 running tasks to finish:
>
> Summary: 1 task failed:
>    /home/kumarn/fsl-release-bsp/sources/poky/meta/recipes-devtools/gcc/gcc_4.8.bb, do_compile
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>
>
>
> Thanks & Regards
> Praveen Reddy P
> _  _______________________________________
> From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel-bounces@lists.openembedded.org] on behalf of Gary Thomas [gary@mlbassoc.com]
> Sent: Tuesday, June 07, 2016 7:58 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] Reg: Yocto build error( gcc_4.8)
>
> On 2016-06-07 16:03, Praveenreddy Padamati wrote:
>> Hi all,
>>   ""gccgccgcc_4.8.bb, > do_compile failed with exit code".  ""gccgccgcc_4.8.bb, > do_compile failed with exit code".  ""gccgccgcc_4.8.bb, > do_compile failed with exit code".      ""gccgccgcc_4.8.bb, > do_compile failed with exit code".""gccgccgcc_4.8.bb, > do_compile failed with exit code".""gccgccgcc_4.8.bb, > do_compile failed with exit code".
>> We are compiling the yocto build system with "bitbake core-image-sato" command. We are facing one problem. It is not compiling, it is showing "gcc_4.8.bb, > do_compile failed with exit code".
>> Please do the needful.
>
> You'll need to provide a LOT more info to be able to get help.
> What version of Yocto (OE-core, Poky, etc), along with any
> extra layers you are using.  Also GCCCC/4.8 has been gone for
> quite some time so you must be using a very old branch/release.
> We'll also need to know your build host, $DISTRO, $MACHINE, etc.
> These are all printed when you run bitbake.
>
> A detailed log (send it to postbin if it's very big) will also
> help you get the aid you need.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

