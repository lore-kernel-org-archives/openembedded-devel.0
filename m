Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9E0r-0004H4-NZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 13:43:17 +0200
Received: from localhost ([127.0.0.1]:39107 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9Dos-0001JT-So
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 11:30:55 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=dwbTaTTA0ul4puLi7S2A1m3xat8=; b=aFDqjrE8gICphUVpQH5tUIOZOCkT
	hmskmVH6tRt/5GcYRX6IPWPM5YOBgFG2NOppciuUWO9X1GfSro3P6Gl12OBr/nRp
	8WtA6rm4kbhzJY9TxDN3GJ7JqlNx/P5pHgpZptgryWWeMttPEllbg2BHsHJ7hakr
	KYMCGMt23vj2kc0=
Received: from [195.171.99.130] (port=32366 helo=[192.168.0.33])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9Dos-0001JP-Cz
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 11:30:54 +0000
Message-ID: <50473834.3070407@communistcode.co.uk>
Date: Wed, 05 Sep 2012 12:32:04 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120828 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <50473603.4030708@communistcode.co.uk>
In-Reply-To: <50473603.4030708@communistcode.co.uk>
Subject: Re: Struggling with creating recipe liblockdev
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
X-List-Received-Date: Wed, 05 Sep 2012 11:43:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/12 12:22, Jack Mitchell wrote:
> snip
>

Ok, I got it working with the following:

DESCRIPTION = "Manage character and block device lockfiles."
HOMEPAGE = 
"http://anonscm.debian.org/gitweb/?p=lockdev/lockdev.git;a=summary"

LICENSE = "LGPLv2.1"
LIC_FILES_CHKSUM = "file://LICENSE;md5=d8045f3b8f929c1cb29a1e3fd737b499"

PR = "r1.4"
PV = "1.0.3"

SRC_URI = 
"http://ftp.de.debian.org/debian/pool/main/l/lockdev/lockdev_${PV}.orig.tar.gz 
\
            file://lockdev_1.0.3-1.4.patch \
"

SRC_URI[md5sum] = "64b9c1b87b125fc348e892e24625524a"
SRC_URI[sha256sum] = 
"ccae635d7ac3fdd50897eceb250872b3d9a191d298f213e7f0c836910d869f82"

S = "${WORKDIR}/lockdev-${PV}"

I had to set S to the correct source directory. However now it is 
failing cryptically with:

[jack@archHP raspberry]$ bitbake liblockdev
Loading cache: 100% 
|#################################################################################| 
ETA:  00:00:00
Loaded 1543 entries from dependency cache.
Parsing recipes: 100% 
|###############################################################################| 
Time: 00:00:00
Parsing of 1201 .bb files complete (1200 cached, 1 parsed). 1540 
targets, 39 skipped, 1 masked, 0 errors.
WARNING: Host distribution could not be determined; you may possibly 
experience unexpected failures. It is recommended that you use a tested 
distribution.

Build Configuration:
BB_VERSION        = "1.15.3"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "raspberrypi"
DISTRO            = "poky"
DISTRO_VERSION    = "1.2+snapshot-20120905"
TUNE_FEATURES     = "armv6 vfp arm1176jzfs"
TARGET_FPU        = "vfp"
meta
meta-yocto        = "master:01e519ef86abb5f6d8abbd5819a53011de0e6f83"
meta-raspberrypi  = "master:9a846961784a0c84d411d3494b1d5bc13cc42e45"
meta-oe
meta-multimedia   = "master:49e269ecc66adda341922cbd86167bbfa97c54ca"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: Function failed: do_compile (see 
/home/jack/Projects/poky-rasp/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/liblockdev-1.0.3-r1.4/temp/log.do_compile.29678 
for further information)
ERROR: Logfile of failure stored in: 
/home/jack/Projects/poky-rasp/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/liblockdev-1.0.3-r1.4/temp/log.do_compile.29678
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 7 -e MAKEFLAGS=
| arm-poky-linux-gnueabi-gcc  -march=armv6 -mthumb-interwork 
-mfloat-abi=softfp -mtune=arm1176jzf-s 
--sysroot=/home/jack/Projects/poky-rasp/raspberry/tmp/sysroots/raspberrypi 
-O2 -pipe -g -feliminate-unused-debug-types -c -fPIC -o src/lockdev.z 
src/lockdev.c
| arm-poky-linux-gnueabi-gcc  -march=armv6 -mthumb-interwork 
-mfloat-abi=softfp -mtune=arm1176jzf-s 
--sysroot=/home/jack/Projects/poky-rasp/raspberry/tmp/sysroots/raspberrypi 
-O2 -pipe -g -feliminate-unused-debug-types   -c -o src/lockdev.o 
src/lockdev.c
| arm-poky-linux-gnueabi-ar rv liblockdev.a src/lockdev.o
| arm-poky-linux-gnueabi-ar: creating liblockdev.a
| a - src/lockdev.o
| cd LockDev && perl Makefile.PL INSTALLDIRS=vendor
| arm-poky-linux-gnueabi-gcc  -march=armv6 -mthumb-interwork 
-mfloat-abi=softfp -mtune=arm1176jzf-s 
--sysroot=/home/jack/Projects/poky-rasp/raspberry/tmp/sysroots/raspberrypi 
-g -O2 -fPIC -Wall -pipe -D_REENTRANT  -shared 
-Wl,-soname,liblockdev.so.1 src/lockdev.z -lc -o liblockdev.1.0.3.so
| Checking if your kit is complete...
| Looks good
| Writing Makefile for LockDev
| Writing MYMETA.yml and MYMETA.json
| cd LockDev && make OPTIMIZE="-O2 -g -Wall"
| make[1]: Entering directory 
`/home/jack/Projects/poky-rasp/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/liblockdev-1.0.3-r1.4/lockdev-1.0.3/LockDev'
| cp LockDev.pm blib/lib/LockDev.pm
| /usr/bin/perl /usr/share/perl5/core_perl/ExtUtils/xsubpp -typemap 
/usr/share/perl5/core_perl/ExtUtils/typemap -typemap typemap  LockDev.xs 
 > LockDev.xsc && mv LockDev.xsc LockDev.c
| Please specify prototyping behavior for LockDev.xs (see perlxs manual)
| cc -c  -I../src -D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pipe 
-fstack-protector -I/usr/local/include -D_LARGEFILE_SOURCE 
-D_FILE_OFFSET_BITS=64 -O2 -g -Wall -DVERSION=\"1.0\" 
-DXS_VERSION=\"1.0\" -fPIC "-I/usr/lib/perl5/core_perl/CORE"   LockDev.c
| LockDev.xs: In function 'constant':
| LockDev.xs:32:1: warning: label 'not_there' defined but not used 
[-Wunused-label]
| LockDev.c: At top level:
| LockDev.xs:14:1: warning: 'not_here' defined but not used 
[-Wunused-function]
| Running Mkbootstrap for LockDev ()
| chmod 644 LockDev.bs
| rm -f blib/arch/auto/LockDev/LockDev.so
| cc  -shared -Wl,-O1,--sort-common,--as-needed,-z,relro 
-L/usr/local/lib -fstack-protector LockDev.o  -o 
blib/arch/auto/LockDev/LockDev.so ../src/lockdev.z    \
|          \
|
| /usr/bin/ld: ../src/lockdev.z: Relocations in generic ELF (EM: 40)
| /usr/bin/ld: ../src/lockdev.z: Relocations in generic ELF (EM: 40)
| /usr/bin/ld: ../src/lockdev.z: Relocations in generic ELF (EM: 40)
| /usr/bin/ld: ../src/lockdev.z: Relocations in generic ELF (EM: 40)
| /usr/bin/ld: ../src/lockdev.z: Relocations in generic ELF (EM: 40)
| ../src/lockdev.z: could not read symbols: File in wrong format
| collect2: error: ld returned 1 exit status
| make[1]: *** [blib/arch/auto/LockDev/LockDev.so] Error 1
| make[1]: Leaving directory 
`/home/jack/Projects/poky-rasp/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/liblockdev-1.0.3-r1.4/lockdev-1.0.3/LockDev'
| make: *** [perl-lib] Error 2
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (see 
/home/jack/Projects/poky-rasp/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/liblockdev-1.0.3-r1.4/temp/log.do_compile.29678 
for further information)
ERROR: Task 6 
(/home/jack/Projects/poky-rasp/meta-oe/meta-oe/recipes-extended/liblockdev/liblockdev_1.0.3.bb, 
do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 799 tasks of which 795 didn't need to be 
rerun and 1 failed.

Summary: 1 task failed:
/home/jack/Projects/poky-rasp/meta-oe/meta-oe/recipes-extended/liblockdev/liblockdev_1.0.3.bb, 
do_compile
Summary: There was 1 WARNING message shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.


Does this mean it is using the system LD rather than OE's?

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



