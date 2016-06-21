Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id B435360761
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jun 2016 22:10:42 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id a186so41447348qkf.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jun 2016 15:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Rt0X4M9YFyu79yiwJCHFj4I6IyJJ3aLht1ZP4hXv/Os=;
	b=DZ/SmUhNRy1IfBJ5bpfcD1scgRMe6s8dvYBObk90YgRu7VUMBxpYuFRvS3kXKaV4tv
	Xd2EXcZtit9T9fzrJ4R+9wuf31tEfO/eg5u+LhuXdptayvhELIwISzt1UF2mKbVQHhlb
	Be39NpxqncfmsLTQcZ8usilklLD4scGfLXvtOEmVD+p1fDopNxjfaGIGdf4IPXU6jfmq
	G6GN0JgJvrhLxWgdzY3gZ3CF4Sd02ntyx5XQ0mbbEUvrZAOUsXT/ZzMOIMn3ML85Yd2v
	BybC1/Kl1fq7Do+6qtjrIy6dQyXW+cOjJy16YCfiJ96OcxVIr40QGz5DwJTTQb17M1hn
	exBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Rt0X4M9YFyu79yiwJCHFj4I6IyJJ3aLht1ZP4hXv/Os=;
	b=Rb0hOcqvjgeZx9k5FYUlLORz7tvdCemTDeaHZ7Sv0C3MLG9v2owEgeTMfLcdspcDwk
	mqcogMjopggaAckj/5IS5KipMfJw8QjnCryWoKY5lbhviweqs8mQgmarSNJ1gfQ+vHOW
	rXJtDyOpWUkO2aVxioVt5gsZGjMkELX7NB+WgqFwoeMWSCvVdiMHqAjDLRkiMiItT7iz
	EtDi/OAoZD5wND8bR+oIMm4DzWfiqsJ/VBg05ctXjVo5/aHmGQdwZLXuQiZpETIaJ7ct
	nu8hFt4Be90IdsW5hyDN8ZUm1/X0oPgRlH1nm3OJqkniTVLwsijAtasOTr3Z/yWjWhu1
	vtuQ==
X-Gm-Message-State: ALyK8tKcjOaD8wDAtLgqdoc/nafBHfts1fblGd9xxIN/7XnWMcmYuazDke67k3NZSlEApUJOEXLTptnEHlG7Hg==
X-Received: by 10.200.33.172 with SMTP id 41mr33355531qty.26.1466547040875;
	Tue, 21 Jun 2016 15:10:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.8.133 with HTTP; Tue, 21 Jun 2016 15:10:11 -0700 (PDT)
In-Reply-To: <09856974BCEE6F48AB378E52E4CAA73C230E9E59@chn-hclt-mbs08.HCLT.CORP.HCL.IN>
References: <09856974BCEE6F48AB378E52E4CAA73C230E93B3@chn-hclt-mbs08.HCLT.CORP.HCL.IN>
	<5756DA11.6040509@mlbassoc.com>
	<09856974BCEE6F48AB378E52E4CAA73C230E9E59@chn-hclt-mbs08.HCLT.CORP.HCL.IN>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Jun 2016 15:10:11 -0700
Message-ID: <CAMKF1sqRRJ2V=GCKFEpTUykmic43EP_JyjVYRiosvQXy2Bvx4w@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Tue, 21 Jun 2016 22:10:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 7, 2016 at 10:20 PM, Praveenreddy Padamati
<praveenreddy.p@hcl.com> wrote:
> Hi all,
>
> Please find the "gcc_4.8.bb, > do_compile failed with exit code".     err=
or log below
>
>
> HCL-Desktop:~/fsl-release-bsp/build$ bitbake core-image-sato
> Parsing recipes: 100% |##################################################=
#############################################| Time: 00:01:30
> Parsing of 1748 .bb files complete (0 cached, 1748 parsed). 2192 targets,=
 84 skipped, 1 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
> NOTE: multiple providers are available for jpeg (jpeg, libjpeg-turbo)
> NOTE: consider defining a PREFERRED_PROVIDER entry to match jpeg
> NOTE: multiple providers are available for jpeg-native (jpeg-native, libj=
peg-turbo-native)
> NOTE: consider defining a PREFERRED_PROVIDER entry to match jpeg-native
>
> Build Configuration:
> BB_VERSION        =3D "1.22.0"
> BUILD_SYS         =3D "x86_64-linux"
> NATIVELSBSTRING   =3D "Ubuntu-14.04"
> TARGET_SYS        =3D "arm-poky-linux-gnueabi"
> MACHINE           =3D "imx6dlsabresd"
> DISTRO            =3D "poky"
> DISTRO_VERSION    =3D "1.6.2"
> TUNE_FEATURES     =3D "armv7a vfp neon callconvention-hard cortexa9"
> TARGET_FPU        =3D "vfp-neon"
> meta
> meta-yocto        =3D "(nobranch):30b8d9378b8260e452552b806610dc9b6fe0b69=
f"
> meta-oe           =3D "(nobranch):8065dd8456913457a0114ddb2b4bd4842847b2a=
3"
> meta-fsl-arm      =3D "(nobranch):9bc540eec9a7e280af13371ea70650fcc47ea62=
7"
> meta-fsl-arm-extra =3D "(nobranch):e1085deb3d915d2a95a65cceadc77c6de0dadf=
b6"
> meta-fsl-demos    =3D "(nobranch):f141c7d1158b8addbd6f1ed047a1b47c2ed85f8=
f"
> meta-fsl-arm
> meta-fsl-demos    =3D "(nobranch):0c5367e963b5f7797ded59f835313466b896d7e=
9"
> meta-browser      =3D "(nobranch):63963cc56c8d0291779693e62b66cb16e5c8688=
3"
> meta-gnome
> meta-networking
> meta-ruby         =3D "(nobranch):8065dd8456913457a0114ddb2b4bd4842847b2a=
3"
> meta-qt5          =3D "(nobranch):c29c317e0f22202bfaa85329a580564bbc17908=
9"
> meta-fsl-qt5
> meta-fsl-bluez    =3D "(nobranch):0c5367e963b5f7797ded59f835313466b896d7e=
9"
>
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> ERROR: Function failed: do_compile (log file is located at /home/kumarn/f=
sl-release-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/gcc/4.=
8.2-r0/temp/log.do_compile.4349)
> ERROR: Logfile of failure stored in: /home/kumarn/fsl-release-bsp/build/t=
mp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/gcc/4.8.2-r0/temp/log.do_com=
pile.4349
> Log data follows:
> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-lin=
ux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j 2 ARCH_FLAGS_FOR_TARGET=3D -march=3Darmv7-a -mthumb-inter=
work -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a9 -isystem/home/kumar=
n/fsl-release-bsp/build/tmp/sysroots/imx6dlsabresd/usr/include -I/home/kuma=
rn/fsl-release-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/gc=
c/4.8.2-r0/gcc-4.8.2/build.arm-poky-linux-gnueabi.arm-poky-linux-gnueabi/gc=
c/include/
> | make[1]: Entering directory `/home/kumarn/fsl-release-bsp/build/tmp/wor=
k/cortexa9hf-vfp-neon-poky-linux-gnueabi/gcc/4.8.2-r0/gcc-4.8.2/build.arm-p=
oky-linux-gnueabi.arm-poky-linux-gnueabi'
> | Configuring in ./libiberty
> | Configuring in ./fixincludes
> | configure: loading cache ./config.cache
> | configure: loading cache ./config.cache
> | configure: error: `CC' has changed since the previous run:
> | configure:   former value:  `arm-poky-linux-gnueabi-gcc  -march=3Darmv7=
-a -mthumb-interwork -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a9 --s=
ysroot=3D/home/kumarn/fsl-release-bsp/build/tmp/sysroots/imx6dlsabresd'
> | configure:   current value: `arm-poky-linux-gnueabi-gcc  -march=3Darmv7=
-a -mthumb-interwork -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a9 --s=
ysroot=3D/home/kumarn/fsl-release-bsp/build/tmp/sysroots/imx6qsabresd'
> | configure: error: in `/home/kumarn/fsl-release-bsp/build/tmp/work/corte=
xa9hf-vfp-neon-poky-linux-gnueabi/gcc/4.8.2-r0/gcc-4.8.2/build.arm-poky-lin=
ux-gnueabi.arm-poky-linux-gnueabi/fixincludes':
> | configure: error: changes in the environment can compromise the build
> | configure: error: run `make distclean' and/or `rm ./config.cache' and s=
tart over
> | configure: error: `CC' has changed since the previous run:
> | configure:   former value:  `arm-poky-linux-gnueabi-gcc  -march=3Darmv7=
-a -mthumb-interwork -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a9 --s=
ysroot=3D/home/kumarn/fsl-release-bsp/build/tmp/sysroots/imx6dlsabresd'
> | configure:   current value: `arm-poky-linux-gnueabi-gcc  -march=3Darmv7=
-a -mthumb-interwork -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a9 --s=
ysroot=3D/home/kumarn/fsl-release-bsp/build/tmp/sysroots/imx6qsabresd'
> | configure: error: in `/home/kumarn/fsl-release-bsp/build/tmp/work/corte=
xa9hf-vfp-neon-poky-linux-gnueabi/gcc/4.8.2-r0/gcc-4.8.2/build.arm-poky-lin=
ux-gnueabi.arm-poky-linux-gnueabi/libiberty':
> | configure: error: changes in the environment can compromise the build
> | configure: error: run `make distclean' and/or `rm ./config.cache' and s=
tart over


this seems a race condition. Does

bitbake -ccleansstate gcc
bitbake gcc

work ?

> | make[1]: *** [configure-fixincludes] Error 1
> | make[1]: *** Waiting for unfinished jobs....
> | make[1]: *** [configure-libiberty] Error 1
> | make[1]: Leaving directory `/home/kumarn/fsl-release-bsp/build/tmp/work=
/cortexa9hf-vfp-neon-poky-linux-gnueabi/gcc/4.8.2-r0/gcc-4.8.2/build.arm-po=
ky-linux-gnueabi.arm-poky-linux-gnueabi'
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at /home/kumarn=
/fsl-release-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/gcc/=
4.8.2-r0/temp/log.do_compile.4349)
> ERROR: Task 3578 (/home/kumarn/fsl-release-bsp/sources/poky/meta/recipes-=
devtools/gcc/gcc_4.8.bb, do_compile) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 3317 tasks of which 3188 didn't need to be=
 rerun and 1 failed.
> Waiting for 0 running tasks to finish:
>
> Summary: 1 task failed:
>   /home/kumarn/fsl-release-bsp/sources/poky/meta/recipes-devtools/gcc/gcc=
_4.8.bb, do_compile
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>
>
>
> Thanks & Regards
> Praveen Reddy P
> _  _______________________________________
> From: openembedded-devel-bounces@lists.openembedded.org [openembedded-dev=
el-bounces@lists.openembedded.org] on behalf of Gary Thomas [gary@mlbassoc.=
com]
> Sent: Tuesday, June 07, 2016 7:58 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] Reg: Yocto build error( gcc_4.8)
>
> On 2016-06-07 16:03, Praveenreddy Padamati wrote:
>> Hi all,
>>  ""gccgccgcc_4.8.bb, > do_compile failed with exit code".  ""gccgccgcc_4=
.8.bb, > do_compile failed with exit code".  ""gccgccgcc_4.8.bb, > do_compi=
le failed with exit code".      ""gccgccgcc_4.8.bb, > do_compile failed wit=
h exit code".""gccgccgcc_4.8.bb, > do_compile failed with exit code".""gccg=
ccgcc_4.8.bb, > do_compile failed with exit code".
>> We are compiling the yocto build system with "bitbake core-image-sato" c=
ommand. We are facing one problem. It is not compiling, it is showing "gcc_=
4.8.bb, > do_compile failed with exit code".
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
>
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
> ::DISCLAIMER::
> -------------------------------------------------------------------------=
---------------------------------------------------------------------------
>
> The contents of this e-mail and any attachment(s) are confidential and in=
tended for the named recipient(s) only.
> E-mail transmission is not guaranteed to be secure or error-free as infor=
mation could be intercepted, corrupted,
> lost, destroyed, arrive late or incomplete, or may contain viruses in tra=
nsmission. The e mail and its contents
> (with or without referred errors) shall therefore not attach any liabilit=
y on the originator or HCL or its affiliates.
> Views or opinions, if any, presented in this email are solely those of th=
e author and may not necessarily reflect the
> views or opinions of HCL or its affiliates. Any form of reproduction, dis=
semination, copying, disclosure, modification,
> distribution and / or publication of this message without the prior writt=
en consent of authorized representative of
> HCL is strictly prohibited. If you have received this email in error plea=
se delete it and notify the sender immediately.
> Before opening any email and/or attachments, please check them for viruse=
s and other defects.
>
> -------------------------------------------------------------------------=
---------------------------------------------------------------------------
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

