Received: from [74.125.44.152] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dank2340@gmail.com>) id 1MAPKe-0005vR-Ny
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 May 2009 16:14:45 +0200
Received: by yx-out-1718.google.com with SMTP id 36so3284153yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 May 2009 07:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=uctWoyd1AgUwkrySyWYzcQpgRdh/z7AKOSEhut1Lv/E=;
	b=MG3E9sHgLApvbU+jFrqJ+iNAekAfXFxcDW2IL+3vyGqkbT62JnCp7RnUcDnfbozo4h
	5j9WRJamEAZgX/H8d4qrJTSTS8o8jVSZkIEakA7Ff0KP+/c5ITB+4j2UrSICbDVD7Ext
	mHdtSKLOfpoxxmgrJOxKtTgBxAUm3HQNki9eE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=n8c4J95XaCDGSL0ZGfh5b+cighNa9iSWP5+lEOgFYpgO95VMcPZdorDS0WiXRP4DuC
	gTb+2o/7nYlVWn8pJ4KeXP04sS5bcB4ED8h5GJ4FZnZYLjSWGkQUeddN/GbRdv7vKHzM
	Ijs+PCqaUtW1zVzqW8IcU39waRRym5l24eqIc=
Received: by 10.90.116.15 with SMTP id o15mr3169962agc.76.1243692372712;
	Sat, 30 May 2009 07:06:12 -0700 (PDT)
Received: from ?192.168.1.101? (r63h48.res.gatech.edu [128.61.63.48])
	by mx.google.com with ESMTPS id 39sm4187665agb.71.2009.05.30.07.06.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 30 May 2009 07:06:11 -0700 (PDT)
Message-ID: <4A213D52.8050802@gmail.com>
Date: Sat, 30 May 2009 10:06:10 -0400
From: Dan <dank2340@gmail.com>
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Trying to build cmake in OE for BeagleBoard (errors)
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
X-List-Received-Date: Sat, 30 May 2009 14:14:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I'm trying to build cmake in OE for the Beagle Board from Angstrom stable/2009. I can build
cmake-native correctly, but that's for my host. When I try $bitbake
cmake, I get errors. The recipe that comes in the OE repository is for
version 2.4.8. I tried copying and pasting the .bb and renaming to the
latest version 2.6.4 and get the same exact errors. I am able to build other packages like console-image correctly.

Here's my errors from cmake-2.6.4:



$ bitbake cmake
NOTE: Handling BitBake files: | (6657/6657) [100 %]
NOTE: Parsing finished. 6376 cached, 0 parsed, 281 skipped, 0 masked.
NOTE: Cache is clean, not saving.
NOTE: build 200905170304: started

OE Build Configuration:
BB_VERSION        = "1.8.13"
METADATA_BRANCH   = "stable/2009"
METADATA_REVISION = "9ab5e002541d9c3dabbe8ba584305681cabf61b4"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "beagleboard"
DISTRO            = "angstrom"
DISTRO_VERSION    = "2009.X-test-20090517"
TARGET_FPU        = "hard"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 261 of 422 (ID: 1, /oe/openembedded/recipes/cmake/
cmake_2.6.4.bb, do_setscene)
NOTE: package cmake-2.6.4-r1: task do_setscene: started
NOTE: Checking if staging package installed
NOTE: No. Manually removing any installed files
NOTE: package cmake-2.6.4-r1: task do_setscene: completed
NOTE: Running task 407 of 422 (ID: 2, /oe/openembedded/recipes/cmake/
cmake_2.6.4.bb, do_fetch)
NOTE: package cmake-2.6.4-r1: task do_fetch: started
NOTE: package cmake-2.6.4-r1: task do_fetch: completed
NOTE: Running task 408 of 422 (ID: 3, /oe/openembedded/recipes/cmake/
cmake_2.6.4.bb, do_unpack)
NOTE: Running task 409 of 422 (ID: 13, /oe/openembedded/recipes/cmake/
cmake_2.6.4.bb, do_distribute_sources)
NOTE: package cmake-2.6.4-r1: task do_unpack: started
NOTE: Unpacking /oe/tmp/downloads/cmake-2.6.4.tar.gz to /oe/tmp/work/
armv7a-angstrom-linux-gnueabi/cmake-2.6.4-r1/
NOTE: package cmake-2.6.4-r1: task do_distribute_sources: started
NOTE: package cmake-2.6.4-r1: task do_distribute_sources: completed
NOTE: package cmake-2.6.4-r1: task do_unpack: completed
NOTE: Running task 410 of 422 (ID: 4, /oe/openembedded/recipes/cmake/
cmake_2.6.4.bb, do_patch)
NOTE: package cmake-2.6.4-r1: task do_patch: started
NOTE: package cmake-2.6.4-r1: task do_patch: completed
NOTE: Running task 411 of 422 (ID: 5, /oe/openembedded/recipes/cmake/
cmake_2.6.4.bb, do_configure)
NOTE: package cmake-2.6.4-r1: task do_configure: started
ERROR: function do_configure failed
ERROR: see log in /oe/tmp/work/armv7a-angstrom-linux-gnueabi/
cmake-2.6.4-r1/temp/log.do_configure.31049
NOTE: Task failed: /oe/tmp/work/armv7a-angstrom-linux-gnueabi/
cmake-2.6.4-r1/temp/log.do_configure.31049
NOTE: package cmake-2.6.4-r1: task do_configure: failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of /oe/openembedded/recipes/cmake/cmake_2.6.4.bb
do_configure failed
ERROR: Task 5 (/oe/openembedded/recipes/cmake/cmake_2.6.4.bb,
do_configure) failed
NOTE: Tasks Summary: Attempted 410 tasks of which 405 didn't need to
be rerun and 1 failed.
ERROR: '/oe/openembedded/recipes/cmake/cmake_2.6.4.bb' failed
NOTE: build 200905170304: completed






The log.do_configure.31049 says this:

NOTE: Running /oe/tmp/work/armv7a-angstrom-linux-gnueabi/cmake-2.6.4-
r1/cmake-2.6.4/configure 		    --build=i686-linux 		    --host=arm-
angstrom-linux-gnueabi 		    --target=arm-angstrom-linux-gnueabi
--prefix=/usr 		    --exec_prefix=/usr 		    --bindir=/usr/bin 		    --
sbindir=/usr/sbin 		    --libexecdir=/usr/libexec 		    --datadir=/usr/
share 		    --sysconfdir=/etc 		    --sharedstatedir=/usr/com 		    --
localstatedir=/var 		    --libdir=/usr/lib 		    --includedir=/usr/
include 		    --oldincludedir=/usr/include 		    --infodir=/usr/share/
info 		    --mandir=/usr/share/man 			 		    ...
---------------------------------------------
CMake 2.6-4, Copyright (c) 2007 Kitware, Inc., Insight Consortium
---------------------------------------------
Error when bootstrapping CMake:
Cannot find appropriate C compiler on this system.
Please specify one using environment variable CC.
See cmake_bootstrap.log for compilers attempted.

---------------------------------------------
Log of errors: /oe/tmp/work/armv7a-angstrom-linux-gnueabi/cmake-2.6.4-
r1/cmake-2.6.4/Bootstrap.cmk/cmake_bootstrap.log
---------------------------------------------
FATAL: oe_runconf failed








The cmake_bootstrap.log says this:

Try: ccache
Line: ccache -isystem/oe/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/
include -fexpensive-optimizations -frename-registers -fomit-frame-
pointer -O2 cmake_bootstrap_31053.test.c -o cmake_bootstrap_31053.test
----------  file   -----------------------
#ifdef __cplusplus
# error "The CMAKE_C_COMPILER is set to a C++ compiler"
#endif

#include<stdio.h>

#if defined(__CLASSIC_C__)
int main(argc, argv)
 int argc;
 char* argv[];
#else
int main(int argc, char* argv[])
#endif
{
 printf("%d\n", (argv != 0));
 return argc-1;
}
------------------------------------------
ccache: invalid option -- 'i'
ccache, a compiler cache. Version 2.4
Copyright Andrew Tridgell, 2002

Usage:
	ccache [options]
	ccache compiler [compile options]
	compiler [compile options]    (via symbolic link)

Options:
-s, --show-stats         show statistics summary
-z, --zero-stats         zero statistics
-c, --cleanup            run a cache cleanup
-C, --clear              clear the cache completely
-F <n>, --max-files=<n>  set maximum files in cache
-M <n>, --max-size=<n>   set maximum size of cache (use G, M or K)
-h, --help               this help page
-V, --version            print version number
Test failed to compile
Try: arm-angstrom-linux-gnueabi-gcc
Line: arm-angstrom-linux-gnueabi-gcc -isystem/oe/tmp/staging/armv7a-
angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -frename-
registers -fomit-frame-pointer -O2 cmake_bootstrap_31053.test.c -o
cmake_bootstrap_31053.test
----------  file   -----------------------
#ifdef __cplusplus
# error "The CMAKE_C_COMPILER is set to a C++ compiler"
#endif

#include<stdio.h>

#if defined(__CLASSIC_C__)
int main(argc, argv)
 int argc;
 char* argv[];
#else
int main(int argc, char* argv[])
#endif
{
 printf("%d\n", (argv != 0));
 return argc-1;
}
------------------------------------------
/oe/tmp/work/armv7a-angstrom-linux-gnueabi/cmake-2.6.4-r1/cmake-2.6.4/
bootstrap: line 439: ./cmake_bootstrap_31053.test: cannot execute
binary file
Test produced non-zero return code
Try: -march=armv7-a
Line: -march=armv7-a -isystem/oe/tmp/staging/armv7a-angstrom-linux-
gnueabi/usr/include -fexpensive-optimizations -frename-registers -
fomit-frame-pointer -O2 cmake_bootstrap_31053.test.c -o
cmake_bootstrap_31053.test
----------  file   -----------------------
#ifdef __cplusplus
# error "The CMAKE_C_COMPILER is set to a C++ compiler"
#endif

#include<stdio.h>

#if defined(__CLASSIC_C__)
int main(argc, argv)
 int argc;
 char* argv[];
#else
int main(int argc, char* argv[])
#endif
{
 printf("%d\n", (argv != 0));
 return argc-1;
}
------------------------------------------
/oe/tmp/work/armv7a-angstrom-linux-gnueabi/cmake-2.6.4-r1/cmake-2.6.4/
bootstrap: line 429: -march=armv7-a: command not found
Test failed to compile
Try: -mtune=cortex-a8
Line: -mtune=cortex-a8 -isystem/oe/tmp/staging/armv7a-angstrom-linux-
gnueabi/usr/include -fexpensive-optimizations -frename-registers -
fomit-frame-pointer -O2 cmake_bootstrap_31053.test.c -o
cmake_bootstrap_31053.test
----------  file   -----------------------
#ifdef __cplusplus
# error "The CMAKE_C_COMPILER is set to a C++ compiler"
#endif

#include<stdio.h>

#if defined(__CLASSIC_C__)
int main(argc, argv)
 int argc;
 char* argv[];
#else
int main(int argc, char* argv[])
#endif
{
 printf("%d\n", (argv != 0));
 return argc-1;
}
------------------------------------------
/oe/tmp/work/armv7a-angstrom-linux-gnueabi/cmake-2.6.4-r1/cmake-2.6.4/
bootstrap: line 429: -mtune=cortex-a8: command not found
Test failed to compile
Try: -mfpu=neon
Line: -mfpu=neon -isystem/oe/tmp/staging/armv7a-angstrom-linux-gnueabi/
usr/include -fexpensive-optimizations -frename-registers -fomit-frame-
pointer -O2 cmake_bootstrap_31053.test.c -o cmake_bootstrap_31053.test
----------  file   -----------------------
#ifdef __cplusplus
# error "The CMAKE_C_COMPILER is set to a C++ compiler"
#endif

#include<stdio.h>

#if defined(__CLASSIC_C__)
int main(argc, argv)
 int argc;
 char* argv[];
#else
int main(int argc, char* argv[])
#endif
{
 printf("%d\n", (argv != 0));
 return argc-1;
}
------------------------------------------
/oe/tmp/work/armv7a-angstrom-linux-gnueabi/cmake-2.6.4-r1/cmake-2.6.4/
bootstrap: line 429: -mfpu=neon: command not found
Test failed to compile
Try: -mfloat-abi=softfp
Line: -mfloat-abi=softfp -isystem/oe/tmp/staging/armv7a-angstrom-linux-
gnueabi/usr/include -fexpensive-optimizations -frename-registers -
fomit-frame-pointer -O2 cmake_bootstrap_31053.test.c -o
cmake_bootstrap_31053.test
----------  file   -----------------------
#ifdef __cplusplus
# error "The CMAKE_C_COMPILER is set to a C++ compiler"
#endif

#include<stdio.h>

#if defined(__CLASSIC_C__)
int main(argc, argv)
 int argc;
 char* argv[];
#else
int main(int argc, char* argv[])
#endif
{
 printf("%d\n", (argv != 0));
 return argc-1;
}
------------------------------------------
/oe/tmp/work/armv7a-angstrom-linux-gnueabi/cmake-2.6.4-r1/cmake-2.6.4/
bootstrap: line 429: -mfloat-abi=softfp: command not found
Test failed to compile





My cmake_2.6.4.bb:

require cmake2.inc



My cmake2.inc:

# Copyright (C) 2005, Koninklijke Philips Electronics NV.  All Rights
Reserved
# Released under the MIT license (see packages/COPYING)

DESCRIPTION = "A cross-platform, open-source make system"
HOMEPAGE = "http://www.cmake.org/"
LICENSE = "Berkeley-style license"
SECTION = "console/utils"
PR = "r1"

CMAKE_MAJOR_VERSION = "${@bb.data.getVar('PV',d,1).split('.')[0]}.$
{@bb.data.getVar('PV',d,1).split('.')[1]}"
SRC_URI = "http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-$
{PV}.tar.gz"

inherit autotools

S = "${WORKDIR}/cmake-${PV}"

do_configure () {
	./configure --prefix=${prefix} || die "./bootstrap failed"
}






Any suggestions? Thanks.

-Dan




