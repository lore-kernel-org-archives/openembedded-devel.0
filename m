Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 04EB675894
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 20:58:50 +0000 (UTC)
Received: by iofz202 with SMTP id z202so92482497iof.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 13:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=mqrCucLj1cTwyhV8lFt9dh73DUQXAL3OP22ey6kb1gg=;
	b=HDYEWI6LPY8rQYm2o/eUyNtQzw8tdeReTtU6d2PZ6O9bN8/5/u7pV15UEiJyjlDtT+
	RFEmtVIqAFjz/6+AU7sp6Y1pe41pabNi2CqlitBsFgeYn/w3l8LbBTBqaWD4c6ogZPvh
	6brpAL/ppCGXKFJumUBhKrVF/gE05S4ymIMED4ApXtGt95y1KmIkrSxkWL+D9u29m94o
	V7NUBKsdLp+jf+zNrSfM7ytXiJW5CfqyIlF6isTZD1lrrib7oAhDfRc3rVrh4m0qPfyw
	P5VmwCUUFU/w7+cybQsngzIlnFE4gkVklvnDlw8+Cv8M5xnM8YUvxifuE2Qekk5sV/1R
	b4Iw==
X-Received: by 10.107.3.77 with SMTP id 74mr11595754iod.49.1446238730562; Fri,
	30 Oct 2015 13:58:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.133 with HTTP; Fri, 30 Oct 2015 13:58:21 -0700 (PDT)
In-Reply-To: <CALbNGRTYMJ_Fwg3nj0Mwk1fGWLKGUjOZawSOfRU+9GZmbXMzaQ@mail.gmail.com>
References: <CALbNGRTYMJ_Fwg3nj0Mwk1fGWLKGUjOZawSOfRU+9GZmbXMzaQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Oct 2015 13:58:21 -0700
Message-ID: <CAMKF1spVurrY8f7Ato1yxprZ3L08p4Zc5ryFQxyKC7b3n8ipVg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: luajit fails to build
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
X-List-Received-Date: Fri, 30 Oct 2015 20:58:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2015 at 11:27 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> Hi with latest masters luajit fails to build. I did already test - it
> is the same for luajit 2.04. I get
>
> ERROR: oe_runmake failed
> ERROR: Function failed: do_compile (log file is located at
> /home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-vfp-vfpv4-neon-angstr=
om-linux-gnueabi/luajit/2.1-r0/temp/log.do_compile.9725)
> ERROR: Logfile of failure stored in:
> /home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-vfp-vfpv4-neon-angstr=
om-linux-gnueabi/luajit/2.1-r0/temp/log.do_compile.9725
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j8 CROSS=3Darm-angstrom-linux-gnueabi- TARGET_CFLAGS=3D
> --sysroot=3D/home/superandy/tmp/oe-core-glibc/sysroots/raspberrypi2
> -march=3Darmv7-a -mthumb  -mthumb-interwork -mfloat-abi=3Dhard
> -mfpu=3Dneon-vfpv4 -mtune=3Dcortex-a7 TARGET_LDFLAGS=3D
> --sysroot=3D/home/superandy/tmp/oe-core-glibc/sysroots/raspberrypi2
> TARGET_SHLDFLAGS=3D
> --sysroot=3D/home/superandy/tmp/oe-core-glibc/sysroots/raspberrypi2
> TARGET_STRIP=3D/bin/echo HOST_CC=3Dgcc  -m32
> | =3D=3D=3D=3D Building LuaJIT 2.1.0-beta1 =3D=3D=3D=3D
> | make -C src
> | make[1]: Entering directory
> '/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-vfp-vfpv4-neon-angst=
rom-linux-gnueabi/luajit/2.1-r0/git/src'
> | HOSTCC    host/buildvm_peobj.o
> | HOSTCC    host/minilua.o
> | HOSTCC    host/buildvm_asm.o
> | CC        lj_gc.o
> | HOSTCC    host/buildvm_fold.o
> | HOSTCC    host/buildvm_lib.o
> | CC        lj_char.o
> | CC        lj_obj.o
> | In file included from /usr/include/features.h:389:0,
> |                  from /usr/include/sys/types.h:25,
> |                  from host/buildvm.h:9,
> |                  from host/buildvm_peobj.c:9:
> | /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such
> file or directory
> |  # include <gnu/stubs-32.h>
> |                            ^
> | In file included from /usr/include/features.h:389:0,
> |                  from /usr/include/sys/types.h:25,
> |                  from host/buildvm.h:9,
> |                  from host/buildvm_lib.c:6:
> | /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such
> file or directory
> |  # include <gnu/stubs-32.h>
> |                            ^
> | In file included from /usr/include/features.h:389:0,
> |                  from /usr/include/sys/types.h:25,
> |                  from host/buildvm.h:9,
> |                  from host/buildvm_fold.c:6:
> | /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such
> file or directory
> |  # include <gnu/stubs-32.h>
> |                            ^
> | compilation terminated.
> | compilation terminated.
> | compilation terminated.
> | In file included from /usr/include/features.h:389:0,
> |                  from /usr/include/sys/types.h:25,
> |                  from host/buildvm.h:9,
> |                  from host/buildvm_asm.c:6:
> | /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such
> file or directory
> |  # include <gnu/stubs-32.h>
> |                            ^
> | compilation terminated.
> | In file included from /usr/include/features.h:389:0,
> |                  from /usr/include/limits.h:25,
> |                  from
> /usr/lib/gcc/x86_64-redhat-linux/4.9.2/include/limits.h:168,
> |                  from
> /usr/lib/gcc/x86_64-redhat-linux/4.9.2/include/syslimits.h:7,
> |                  from
> /usr/lib/gcc/x86_64-redhat-linux/4.9.2/include/limits.h:34,
> |                  from host/minilua.c:33:
> | /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such
> file or directory
> |  # include <gnu/stubs-32.h>
> |                            ^
> | compilation terminated.
> | Makefile:672: recipe for target 'host/buildvm_fold.o' failed
> | make[1]: *** [host/buildvm_fold.o] Error 1
> | make[1]: *** Waiting for unfinished jobs....
> | Makefile:672: recipe for target 'host/buildvm_lib.o' failed
> | make[1]: *** [host/buildvm_lib.o] Error 1
> | Makefile:672: recipe for target 'host/buildvm_peobj.o' failed
> | make[1]: *** [host/buildvm_peobj.o] Error 1
> | Makefile:672: recipe for target 'host/minilua.o' failed
> | make[1]: *** [host/minilua.o] Error 1
> | Makefile:672: recipe for target 'host/buildvm_asm.o' failed
> | make[1]: *** [host/buildvm_asm.o] Error 1
> | make[1]: Leaving directory
> '/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-vfp-vfpv4-neon-angst=
rom-linux-gnueabi/luajit/2.1-r0/git/src'
> | Makefile:105: recipe for target 'default' failed
> | make: *** [default] Error 2
> | WARNING: /home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-vfp-vfpv4-=
neon-angstrom-linux-gnueabi/luajit/2.1-r0/temp/run.do_compile.9725:1
> exit 1 from
> |   exit 1
> | ERROR: oe_runmake failed
> | ERROR: Function failed: do_compile (log file is located at
> /home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-vfp-vfpv4-neon-angstr=
om-linux-gnueabi/luajit/2.1-r0/temp/log.do_compile.9725)
> ERROR: Task 7633
> (/home/superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-d=
evtools/luajit/luajit_2.1.bb,
> do_compile) failed with exit code '1'
>
> Seems it tries to use my host headers. Anybody with an idea why it does t=
hat?

LuaJIT's cross build depends on  host compiler also being able to do
same bit length, which means for 32bit arches we need 32bit/i386
compiler
avaiable on host. So if your host is 64bit then installing
gcc-mulitliib package for your build host will be required.

>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

