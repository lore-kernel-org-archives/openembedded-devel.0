Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 528376018F
	for <Openembedded-devel@lists.openembedded.org>;
	Mon,  2 Feb 2015 21:45:44 +0000 (UTC)
Received: by mail-qc0-f170.google.com with SMTP id p6so32485108qcv.1
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 02 Feb 2015 13:45:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=cDMH/JzcaTcZXSGCgT3p4TWoA2TdIsF6O+YUC/6ywnc=;
	b=gMkl3dr/H9NsMJJNt/qgLCxa9Whs9w6mngHHr3e2e/Zrngp1klM/rqZsFpb2SWQdWB
	84EK/gLhLxPUtMacOZT1GeRsJuP2CHt9GWvFBmyQChHLZXqyNcb+e4/YjdV3KF5pkPpw
	mqTg5rgdaSj7J7vemeVJYY6v0/ouDa38vnsfm+MF305EIpGuurFCwZJAmBqS2Jkv7QjQ
	9cbuFdvU8oI2/05/5dljs5K3fApP5HL0doeK56t+GRel7hVPofB3lZLoVn44qwHfJM9a
	IFubYNdi7L0tAWMLrPoGu2RqguqkMNPA89foQbod4C4lPmf14SLodM+ECAs9W4WURDvo
	eGjw==
X-Gm-Message-State: ALoCoQk9fAieWrkGbT/yj7bvC6vd2NbdMd/kNasOs7Q2vWkUH7uOwtWkRTJ+N/HaZc6RtoDoHP0z
X-Received: by 10.224.24.132 with SMTP id v4mr46830432qab.17.1422913545677;
	Mon, 02 Feb 2015 13:45:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Mon, 2 Feb 2015 13:45:25 -0800 (PST)
In-Reply-To: <80920FD0-CA08-45D7-9A41-3971FB2D58D7@gmail.com>
References: <CAMKF1souj1-FLTjkQb0y8myTiKMJyNeAa7wiM5-pW1fz0EtheA@mail.gmail.com>
	<CAJTo0LaN3HMhjrpii2pPbJw5zWbywgr1keZe=iQmuKFMFFf=gQ@mail.gmail.com>
	<CAMKF1sq8NsuNYZDQRPtXruBeRndOP+0qwBuTO2ahb6q-fS8XGw@mail.gmail.com>
	<CAJTo0LYpKbwOHg-DBMJycy+KNayTCsnhToJR8K-REKZ2jxhnhw@mail.gmail.com>
	<EA0C9DE9-9E5F-4B74-8464-138895268F2F@gmail.com>
	<CAJTo0LbSFesauhA_H39Znd07SR5JCs45izy2us=cFWVGXtW8hg@mail.gmail.com>
	<80920FD0-CA08-45D7-9A41-3971FB2D58D7@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 2 Feb 2015 21:45:25 +0000
Message-ID: <CAJTo0LbqTrQzk0KeHDxYnmtZrrFdZD12DWrjA=Y4RtbQzwM0ow@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [RFT] upcoming glibc 2.21 and gcc 4.9 upgrade
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Feb 2015 21:45:49 -0000
Content-Type: text/plain; charset=UTF-8

On 2 February 2015 at 18:33, Khem Raj <raj.khem@gmail.com> wrote:

> Yeah, I am on archlinux (the other end of spectrum). Nevertheless, I have
> updated the contrib tree which fixes cross-localedef-native compile time
> issue. So you should be good
> to go now.
>

Bad news, glibc is now failing:

| x86_64-poky-linux-gcc  -m64 -march=corei7 -mtune=corei7 -mfpmath=sse
-msse4.2
--sysroot=/data/poky-master/tmp/sysroots/intel-corei7-64-tcbootstrap
dl-open.c -c -std=gnu99 -fgnu89-inline  -O2 -Wall -Werror -Winline
-Wno-error=undef -Wundef -Wwrite-strings -feliminate-unused-debug-types
-fmerge-all-constants -frounding-math -g -pipe -Wstrict-prototypes   -fPIC
 -mno-sse -mno-mmx        -I../include
-I/data/poky-master/tmp/work/corei7-64-poky-linux/glibc/2.21-r0/build-x86_64-poky-linux/elf
 -I/data/poky-master/tmp/work/corei7-64-poky-linux/glibc/2.21-r0/build-x86_64-poky-linux
 -I../sysdeps/unix/sysv/linux/x86_64/64
 -I../sysdeps/unix/sysv/linux/x86_64  -I../sysdeps/unix/sysv/linux/x86
 -I../sysdeps/unix/sysv/linux/wordsize-64  -I../sysdeps/x86_64/nptl
 -I../sysdeps/unix/sysv/linux/include -I../sysdeps/unix/sysv/linux
 -I../sysdeps/nptl  -I../sysdeps/pthread  -I../sysdeps/gnu
 -I../sysdeps/unix/inet  -I../sysdeps/unix/sysv  -I../sysdeps/unix/x86_64
 -I../sysdeps/unix  -I../sysdeps/posix  -I../sysdeps/x86_64/64
 -I../sysdeps/x86_64/fpu/multiarch  -I../sysdeps/x86_64/fpu
 -I../sysdeps/x86/fpu/include -I../sysdeps/x86/fpu
 -I../sysdeps/x86_64/multiarch  -I../sysdeps/x86_64  -I../sysdeps/x86
 -I../sysdeps/ieee754/ldbl-96  -I../sysdeps/ieee754/dbl-64/wordsize-64
 -I../sysdeps/ieee754/dbl-64  -I../sysdeps/ieee754/flt-32
 -I../sysdeps/wordsize-64  -I../sysdeps/ieee754  -I../sysdeps/generic  -I..
-I../libio -I. -nostdinc -isystem
/data/poky-master/tmp/sysroots/x86_64-linux/usr/lib/x86_64-poky-linux.gcc-cross-initial-x86_64/gcc/x86_64-poky-linux/4.9.2/include
-isystem
/data/poky-master/tmp/sysroots/x86_64-linux/usr/lib/x86_64-poky-linux.gcc-cross-initial-x86_64/gcc/x86_64-poky-linux/4.9.2/include-fixed
-isystem /data/poky-master/tmp/sysroots/intel-corei7-64/usr/include
 -D_LIBC_REENTRANT -include
/data/poky-master/tmp/work/corei7-64-poky-linux/glibc/2.21-r0/build-x86_64-poky-linux/libc-modules.h
-DMODULE_NAME=rtld -include ../include/libc-symbols.h  -DPIC -DSHARED
-o
/data/poky-master/tmp/work/corei7-64-poky-linux/glibc/2.21-r0/build-x86_64-poky-linux/elf/dl-open.os
-MD -MP -MF
/data/poky-master/tmp/work/corei7-64-poky-linux/glibc/2.21-r0/build-x86_64-poky-linux/elf/dl-open.os.dt
-MT
/data/poky-master/tmp/work/corei7-64-poky-linux/glibc/2.21-r0/build-x86_64-poky-linux/elf/dl-open.os
| dl-caller.c:1:0: error: SSE instruction set disabled, using 387
arithmetics [-Werror]
|  /* Check whether caller comes from the right place.
|  ^
| dl-open.c:1:0: error: SSE instruction set disabled, using 387 arithmetics
[-Werror]
|  /* Load a shared object at runtime, relocate it, and run its initializer.
|  ^
| cc1: all warnings being treated as errors
| cc1: all warnings being treated as errors

Ross

