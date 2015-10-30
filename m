Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7A73676E3F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 06:27:00 +0000 (UTC)
Received: by iodd200 with SMTP id d200so70034171iod.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 23:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=PPFPThMAXBIxPUMTywR79to4R/b09AraSnLr3mbTAoE=;
	b=xfZch8cizETvM+BfZ8zFYhScYCR22pll+8u17YggG9owo/DY2S44RTBzBKEzqWBhTj
	Kz4hoSbIdrfal/FK7becHsv7Y3R89dUzV46TjQ3+PRbLsEVoUUcp0crP3dT+eLcprMPO
	SrWvYgOgrMMEhxCXCw5R/OB2dPIj3fQOzJWvokJmuglguuIIIMtb7fNvS0XLFqzkctj/
	AYuNe9pHVN9I/sNTaBZRQhjr7y+pzEt+6OIhJexk/rpq2O4GHeoZVVUTSZ5tFJEtWMw1
	8g8u+N7TTfGClmWUeo9AIGe62xQG1ZPzkfwU88VBHs4wK72+nhztyTKpiSp8SkZZnkYD
	B6Mg==
MIME-Version: 1.0
X-Received: by 10.107.160.70 with SMTP id j67mr8680305ioe.133.1446186420214;
	Thu, 29 Oct 2015 23:27:00 -0700 (PDT)
Received: by 10.36.31.131 with HTTP; Thu, 29 Oct 2015 23:27:00 -0700 (PDT)
Date: Fri, 30 Oct 2015 07:27:00 +0100
Message-ID: <CALbNGRTYMJ_Fwg3nj0Mwk1fGWLKGUjOZawSOfRU+9GZmbXMzaQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: luajit fails to build
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
X-List-Received-Date: Fri, 30 Oct 2015 06:27:02 -0000
Content-Type: text/plain; charset=UTF-8

Hi with latest masters luajit fails to build. I did already test - it
is the same for luajit 2.04. I get

ERROR: oe_runmake failed
ERROR: Function failed: do_compile (log file is located at
/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-vfp-vfpv4-neon-angstrom-linux-gnueabi/luajit/2.1-r0/temp/log.do_compile.9725)
ERROR: Logfile of failure stored in:
/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-vfp-vfpv4-neon-angstrom-linux-gnueabi/luajit/2.1-r0/temp/log.do_compile.9725
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j8 CROSS=arm-angstrom-linux-gnueabi- TARGET_CFLAGS=
--sysroot=/home/superandy/tmp/oe-core-glibc/sysroots/raspberrypi2
-march=armv7-a -mthumb  -mthumb-interwork -mfloat-abi=hard
-mfpu=neon-vfpv4 -mtune=cortex-a7 TARGET_LDFLAGS=
--sysroot=/home/superandy/tmp/oe-core-glibc/sysroots/raspberrypi2
TARGET_SHLDFLAGS=
--sysroot=/home/superandy/tmp/oe-core-glibc/sysroots/raspberrypi2
TARGET_STRIP=/bin/echo HOST_CC=gcc  -m32
| ==== Building LuaJIT 2.1.0-beta1 ====
| make -C src
| make[1]: Entering directory
'/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-vfp-vfpv4-neon-angstrom-linux-gnueabi/luajit/2.1-r0/git/src'
| HOSTCC    host/buildvm_peobj.o
| HOSTCC    host/minilua.o
| HOSTCC    host/buildvm_asm.o
| CC        lj_gc.o
| HOSTCC    host/buildvm_fold.o
| HOSTCC    host/buildvm_lib.o
| CC        lj_char.o
| CC        lj_obj.o
| In file included from /usr/include/features.h:389:0,
|                  from /usr/include/sys/types.h:25,
|                  from host/buildvm.h:9,
|                  from host/buildvm_peobj.c:9:
| /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such
file or directory
|  # include <gnu/stubs-32.h>
|                            ^
| In file included from /usr/include/features.h:389:0,
|                  from /usr/include/sys/types.h:25,
|                  from host/buildvm.h:9,
|                  from host/buildvm_lib.c:6:
| /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such
file or directory
|  # include <gnu/stubs-32.h>
|                            ^
| In file included from /usr/include/features.h:389:0,
|                  from /usr/include/sys/types.h:25,
|                  from host/buildvm.h:9,
|                  from host/buildvm_fold.c:6:
| /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such
file or directory
|  # include <gnu/stubs-32.h>
|                            ^
| compilation terminated.
| compilation terminated.
| compilation terminated.
| In file included from /usr/include/features.h:389:0,
|                  from /usr/include/sys/types.h:25,
|                  from host/buildvm.h:9,
|                  from host/buildvm_asm.c:6:
| /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such
file or directory
|  # include <gnu/stubs-32.h>
|                            ^
| compilation terminated.
| In file included from /usr/include/features.h:389:0,
|                  from /usr/include/limits.h:25,
|                  from
/usr/lib/gcc/x86_64-redhat-linux/4.9.2/include/limits.h:168,
|                  from
/usr/lib/gcc/x86_64-redhat-linux/4.9.2/include/syslimits.h:7,
|                  from
/usr/lib/gcc/x86_64-redhat-linux/4.9.2/include/limits.h:34,
|                  from host/minilua.c:33:
| /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such
file or directory
|  # include <gnu/stubs-32.h>
|                            ^
| compilation terminated.
| Makefile:672: recipe for target 'host/buildvm_fold.o' failed
| make[1]: *** [host/buildvm_fold.o] Error 1
| make[1]: *** Waiting for unfinished jobs....
| Makefile:672: recipe for target 'host/buildvm_lib.o' failed
| make[1]: *** [host/buildvm_lib.o] Error 1
| Makefile:672: recipe for target 'host/buildvm_peobj.o' failed
| make[1]: *** [host/buildvm_peobj.o] Error 1
| Makefile:672: recipe for target 'host/minilua.o' failed
| make[1]: *** [host/minilua.o] Error 1
| Makefile:672: recipe for target 'host/buildvm_asm.o' failed
| make[1]: *** [host/buildvm_asm.o] Error 1
| make[1]: Leaving directory
'/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-vfp-vfpv4-neon-angstrom-linux-gnueabi/luajit/2.1-r0/git/src'
| Makefile:105: recipe for target 'default' failed
| make: *** [default] Error 2
| WARNING: /home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-vfp-vfpv4-neon-angstrom-linux-gnueabi/luajit/2.1-r0/temp/run.do_compile.9725:1
exit 1 from
|   exit 1
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (log file is located at
/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-vfp-vfpv4-neon-angstrom-linux-gnueabi/luajit/2.1-r0/temp/log.do_compile.9725)
ERROR: Task 7633
(/home/superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-devtools/luajit/luajit_2.1.bb,
do_compile) failed with exit code '1'

Seems it tries to use my host headers. Anybody with an idea why it does that?

Andreas

