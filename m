Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 197D275D4A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 21:22:20 +0000 (UTC)
Received: by igpw7 with SMTP id w7so18475991igp.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 14:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=Q50MAhyqppKQym8p2ggya/aCst3BtMQUAQXQ2o/QOBw=;
	b=pcTPEDtMlohF3Cj2/k42D+77fBns1dSC5tsjRdaSXgBYUBWL7Z5HBNfxdGAcaPgzvR
	Y9MuSTdOg3KSvZjfXps0ZIoE4tRmBBnvujVQ0FE9vkgMTOtJPmasn/4XBJLDa1YPWS8u
	Vu0weBhb9lBfspHNaiTOy/pChJ4F+evzWJL7UH3wpb5+qejzw2dfvA73qIjC1dz5QVfK
	P5WXUMiORcpHLJaHjphXUwdStPJ8ITXe+2o47yEh/kb5HKVyOVSMWdDQJWODTzSnjDYk
	2rN4/QYxZma70J/PB4CRyKwHriiNjLyWpq7+xIXJUScau/iya61ohLJ9BkwZseAfldWw
	ydbA==
MIME-Version: 1.0
X-Received: by 10.50.43.161 with SMTP id x1mr431409igl.64.1446240140337; Fri,
	30 Oct 2015 14:22:20 -0700 (PDT)
Received: by 10.36.31.131 with HTTP; Fri, 30 Oct 2015 14:22:20 -0700 (PDT)
In-Reply-To: <CAMKF1spVurrY8f7Ato1yxprZ3L08p4Zc5ryFQxyKC7b3n8ipVg@mail.gmail.com>
References: <CALbNGRTYMJ_Fwg3nj0Mwk1fGWLKGUjOZawSOfRU+9GZmbXMzaQ@mail.gmail.com>
	<CAMKF1spVurrY8f7Ato1yxprZ3L08p4Zc5ryFQxyKC7b3n8ipVg@mail.gmail.com>
Date: Fri, 30 Oct 2015 22:22:20 +0100
Message-ID: <CALbNGRSFqHA5gLgnK11ZYZpHX=3p5tH1mFOOPtE2F32vqD9-ow@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Fri, 30 Oct 2015 21:22:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2015 at 9:58 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Oct 29, 2015 at 11:27 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> Hi with latest masters luajit fails to build. I did already test - it
>> is the same for luajit 2.04. I get
>>
>> ERROR: oe_runmake failed
>> ERROR: Function failed: do_compile (log file is located at
>> /home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-vfp-vfpv4-neon-angst=
rom-linux-gnueabi/luajit/2.1-r0/temp/log.do_compile.9725)
>> ERROR: Logfile of failure stored in:
>> /home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-vfp-vfpv4-neon-angst=
rom-linux-gnueabi/luajit/2.1-r0/temp/log.do_compile.9725
>> Log data follows:
>> | DEBUG: Executing shell function do_compile
>> | NOTE: make -j8 CROSS=3Darm-angstrom-linux-gnueabi- TARGET_CFLAGS=3D
>> --sysroot=3D/home/superandy/tmp/oe-core-glibc/sysroots/raspberrypi2
>> -march=3Darmv7-a -mthumb  -mthumb-interwork -mfloat-abi=3Dhard
>> -mfpu=3Dneon-vfpv4 -mtune=3Dcortex-a7 TARGET_LDFLAGS=3D
>> --sysroot=3D/home/superandy/tmp/oe-core-glibc/sysroots/raspberrypi2
>> TARGET_SHLDFLAGS=3D
>> --sysroot=3D/home/superandy/tmp/oe-core-glibc/sysroots/raspberrypi2
>> TARGET_STRIP=3D/bin/echo HOST_CC=3Dgcc  -m32
>> | =3D=3D=3D=3D Building LuaJIT 2.1.0-beta1 =3D=3D=3D=3D
>> | make -C src
>> | make[1]: Entering directory
>> '/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-vfp-vfpv4-neon-angs=
trom-linux-gnueabi/luajit/2.1-r0/git/src'
>> | HOSTCC    host/buildvm_peobj.o
>> | HOSTCC    host/minilua.o
>> | HOSTCC    host/buildvm_asm.o
>> | CC        lj_gc.o
>> | HOSTCC    host/buildvm_fold.o
>> | HOSTCC    host/buildvm_lib.o
>> | CC        lj_char.o
>> | CC        lj_obj.o
>> | In file included from /usr/include/features.h:389:0,
>> |                  from /usr/include/sys/types.h:25,
>> |                  from host/buildvm.h:9,
>> |                  from host/buildvm_peobj.c:9:
>> | /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such
>> file or directory
>> |  # include <gnu/stubs-32.h>
>> |                            ^
>> | In file included from /usr/include/features.h:389:0,
>> |                  from /usr/include/sys/types.h:25,
>> |                  from host/buildvm.h:9,
>> |                  from host/buildvm_lib.c:6:
>> | /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such
>> file or directory
>> |  # include <gnu/stubs-32.h>
>> |                            ^
>> | In file included from /usr/include/features.h:389:0,
>> |                  from /usr/include/sys/types.h:25,
>> |                  from host/buildvm.h:9,
>> |                  from host/buildvm_fold.c:6:
>> | /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such
>> file or directory
>> |  # include <gnu/stubs-32.h>
>> |                            ^
>> | compilation terminated.
>> | compilation terminated.
>> | compilation terminated.
>> | In file included from /usr/include/features.h:389:0,
>> |                  from /usr/include/sys/types.h:25,
>> |                  from host/buildvm.h:9,
>> |                  from host/buildvm_asm.c:6:
>> | /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such
>> file or directory
>> |  # include <gnu/stubs-32.h>
>> |                            ^
>> | compilation terminated.
>> | In file included from /usr/include/features.h:389:0,
>> |                  from /usr/include/limits.h:25,
>> |                  from
>> /usr/lib/gcc/x86_64-redhat-linux/4.9.2/include/limits.h:168,
>> |                  from
>> /usr/lib/gcc/x86_64-redhat-linux/4.9.2/include/syslimits.h:7,
>> |                  from
>> /usr/lib/gcc/x86_64-redhat-linux/4.9.2/include/limits.h:34,
>> |                  from host/minilua.c:33:
>> | /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such
>> file or directory
>> |  # include <gnu/stubs-32.h>
>> |                            ^
>> | compilation terminated.
>> | Makefile:672: recipe for target 'host/buildvm_fold.o' failed
>> | make[1]: *** [host/buildvm_fold.o] Error 1
>> | make[1]: *** Waiting for unfinished jobs....
>> | Makefile:672: recipe for target 'host/buildvm_lib.o' failed
>> | make[1]: *** [host/buildvm_lib.o] Error 1
>> | Makefile:672: recipe for target 'host/buildvm_peobj.o' failed
>> | make[1]: *** [host/buildvm_peobj.o] Error 1
>> | Makefile:672: recipe for target 'host/minilua.o' failed
>> | make[1]: *** [host/minilua.o] Error 1
>> | Makefile:672: recipe for target 'host/buildvm_asm.o' failed
>> | make[1]: *** [host/buildvm_asm.o] Error 1
>> | make[1]: Leaving directory
>> '/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-vfp-vfpv4-neon-angs=
trom-linux-gnueabi/luajit/2.1-r0/git/src'
>> | Makefile:105: recipe for target 'default' failed
>> | make: *** [default] Error 2
>> | WARNING: /home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-vfp-vfpv4=
-neon-angstrom-linux-gnueabi/luajit/2.1-r0/temp/run.do_compile.9725:1
>> exit 1 from
>> |   exit 1
>> | ERROR: oe_runmake failed
>> | ERROR: Function failed: do_compile (log file is located at
>> /home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-vfp-vfpv4-neon-angst=
rom-linux-gnueabi/luajit/2.1-r0/temp/log.do_compile.9725)
>> ERROR: Task 7633
>> (/home/superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-=
devtools/luajit/luajit_2.1.bb,
>> do_compile) failed with exit code '1'
>>
>> Seems it tries to use my host headers. Anybody with an idea why it does =
that?
>
> LuaJIT's cross build depends on  host compiler also being able to do
> same bit length, which means for 32bit arches we need 32bit/i386
> compiler
> avaiable on host. So if your host is 64bit then installing
> gcc-mulitliib package for your build host will be required.
>
Ahh that explains why it works on one of my machines - thanks. Is
there a chance to add a check for this and drop a note if host won't
match requirements?

Andreas

