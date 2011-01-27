Received: from mail.cs.uni-potsdam.de ([141.89.48.7])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <akzare@cs.uni-potsdam.de>) id 1PiQn2-0002Br-Kq
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Jan 2011 13:17:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.cs.uni-potsdam.de (Postfix) with ESMTP id 6DD15100C5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jan 2011 13:08:21 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at cs.uni-potsdam.de
Received: from mail.cs.uni-potsdam.de ([127.0.0.1])
	by localhost (mail.cs.uni-potsdam.de [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 247Vzdglzz-B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jan 2011 13:08:15 +0100 (CET)
Received: from mail.cs.uni-potsdam.de (localhost [127.0.0.1])
	by mail.cs.uni-potsdam.de (Postfix) with ESMTP id 65CD01009F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jan 2011 13:08:15 +0100 (CET)
Received: from e177094118.adsl.alicedsl.de (e177094118.adsl.alicedsl.de
	[85.177.94.118]) by mail.cs.uni-potsdam.de (Horde MIME library) with
	HTTP; Thu, 27 Jan 2011 13:08:15 +0100
Message-ID: <20110127130815.h92lw4hoa9kwow0g@mail.cs.uni-potsdam.de>
Date: Thu, 27 Jan 2011 13:08:15 +0100
From: Ali Akbar Zarezadeh <akzare@cs.uni-potsdam.de>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) H3 (4.1.4)
Subject: Error in building OE for MicroBlaze!
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
X-List-Received-Date: Thu, 27 Jan 2011 12:17:28 -0000
Content-Type: text/plain;
	charset=ISO-8859-1;
	DelSp="Yes";
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I am trying to build a Linux framework for ML605 (Virtex6 FPGA) from =20
Xilinx. I took a look inside the OE, there are several complete =20
solutions for PowerPC, but nothing for MicroBlaze. Hence, based on =20
some useful notes from Mr. Adrian Alonso which I found in his blog, I =20
have started to build a Linux framework for MicroBlaze. After solving =20
several issues, now I get stuck at the compiling phase of gcc for =20
MicroBlaze. An error occurs when OE tries to patch gcc. It is listed =20
as follows:

----------------------------------------------------------------
akzare@notebook:/opt/local/oe_mb$ bitbake helloworld-image -f
NOTE: Handling BitBake files: \ (7075/7075) [100 %]
Parsing of 7075 .bb files complete (6643 cached, 432 parsed). 7337 =20
targets, 354 skipped, 0 masked, 0 errors.

Build Configuration:
BB_VERSION        =3D "1.10.2"
METADATA_BRANCH   =3D "master"
METADATA_REVISION =3D "c03c179"
TARGET_ARCH       =3D "microblaze"
TARGET_OS         =3D "linux"
MACHINE           =3D "xilinx-ml605"
DISTRO            =3D "angstrom"
DISTRO_VERSION    =3D "v20110127"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 254 of 832 (ID: 645, =20
virtual:native:/opt/local/oe_mb/openembedded/recipes/bison/bison_2.4.3.bb, =
=20
do_configure)
NOTE: package bison-native-2.4.3-r9.0: task do_configure: Started
NOTE: Running task 289 of 832 (ID: 707, =20
/opt/local/oe_mb/openembedded/recipes/gcc/gcc-cross-initial_4.5.bb, =20
do_patch)
NOTE: package gcc-cross-initial-4.5-r31.1+svnr168622: task do_patch: Started
NOTE: Applying patch 'gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch' =20
(openembedded/recipes/gcc/gcc-4.5/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch)
NOTE: Applying patch '100-uclibc-conf.patch' =20
(openembedded/recipes/gcc/gcc-4.5/100-uclibc-conf.patch)
NOTE: Applying patch 'gcc-uclibc-locale-ctype_touplow_t.patch' =20
(openembedded/recipes/gcc/gcc-4.5/gcc-uclibc-locale-ctype_touplow_t.patch)
NOTE: Applying patch 'cache-amnesia.patch' =20
(openembedded/recipes/gcc/gcc-4.5/cache-amnesia.patch)
NOTE: Applying patch 'gcc-flags-for-build.patch' =20
(openembedded/recipes/gcc/gcc-4.5/gcc-flags-for-build.patch)
FATAL: Execution of 'quilt =20
--quiltrc=3D/opt/local/oe_mb/tmp/sysroots/x86_64-linux/usr/bin/quiltrc =20
push' failed with exit code 1:
Applying patch gcc-flags-for-build.patch
patching file Makefile.def
patching file gcc/Makefile.in
Hunk #1 succeeded at 755 (offset -11 lines).
patching file gcc/configure.ac
Hunk #1 succeeded at 1774 (offset -24 lines).
patching file Makefile.in
patching file gcc/configure
Hunk #1 succeeded at 705 (offset -2 lines).
Hunk #2 succeeded at 10912 (offset -71 lines).
Hunk #3 succeeded at 10920 (offset -71 lines).
Hunk #4 FAILED at 17111.
Hunk #5 FAILED at 17217.
2 out of 5 hunks FAILED -- rejects in file gcc/configure
patching file Makefile.tpl
patching file configure
Hunk #2 succeeded at 7950 (offset -87 lines).
Hunk #3 succeeded at 8016 (offset -87 lines).
patching file configure.ac
Hunk #1 succeeded at 3053 (offset -36 lines).
Hunk #2 succeeded at 3120 (offset -36 lines).
Patch gcc-flags-for-build.patch does not apply (enforce with -f)

ERROR: Error in executing python function in: =20
/opt/local/oe_mb/openembedded/recipes/gcc/gcc-cross-initial_4.5.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Function patch_do_patch failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of =20
/opt/local/oe_mb/openembedded/recipes/gcc/gcc-cross-initial_4.5.bb =20
do_patch failed
ERROR: Task 707 =20
(/opt/local/oe_mb/openembedded/recipes/gcc/gcc-cross-initial_4.5.bb, =20
do_patch) failed with 256
FATAL: Execution of 'quilt =20
--quiltrc=3D/opt/local/oe_mb/tmp/sysroots/x86_64-linux/usr/bin/quiltrc =20
push' failed with exit code 1:
Applying patch gcc-flags-for-build.patch
patching file Makefile.def
patching file gcc/Makefile.in
Hunk #1 succeeded at 755 (offset -11 lines).
patching file gcc/configure.ac
Hunk #1 succeeded at 1774 (offset -24 lines).
patching file Makefile.in
patching file gcc/configure
Hunk #1 succeeded at 705 (offset -2 lines).
Hunk #2 succeeded at 10912 (offset -71 lines).
Hunk #3 succeeded at 10920 (offset -71 lines).
Hunk #4 FAILED at 17111.
Hunk #5 FAILED at 17217.
2 out of 5 hunks FAILED -- rejects in file gcc/configure
patching file Makefile.tpl
patching file configure
Hunk #2 succeeded at 7950 (offset -87 lines).
Hunk #3 succeeded at 8016 (offset -87 lines).
patching file configure.ac
Hunk #1 succeeded at 3053 (offset -36 lines).
Hunk #2 succeeded at 3120 (offset -36 lines).
Patch gcc-flags-for-build.patch does not apply (enforce with -f)

ERROR: TaskFailed event exception, aborting
ERROR: Build of =20
virtual:native:/opt/local/oe_mb/openembedded/recipes/bison/bison_2.4.3.bb =
=20
do_configure failed
----------------------------------------------------------------

Moreover, those are all things which I hacked in several files of OE =20
to get this point where I am:

local.conf ->
----------------------------------------------------------------
MACHINE =3D "xilinx-ml605"
TARGET_ARCH =3D "microblaze"
TARGET_CPU =3D "microblaze"
TARGET_TUNE =3D "microblaze"
XILINX_BSP_PATH =3D
XILINX_BOARD =3D "ml507"
...
----------------------------------------------------------------

xilinx-ml605.conf ->
----------------------------------------------------------------
TARGET_ARCH =3D "microblaze"
TARGET_CPU =3D "microblaze"
TARGET_TUNE =3D "microblaze"
TARGET_FPU =3D "soft"
#tune for the microblaze cpu
require conf/machine/include/tune-microblaze.inc
PREFERRED_PROVIDER_virtual/kernel =3D "linux-xilinx"
KERNEL_IMAGETYPE =3D "uImage"
MACHINE_FEATURES =3D "kernel26 apm ext2 vfat ethernet screen"
MACHINE_EXTRA_RECOMMENDS =3D "kernel-modules"
UBOOT_ENTRYPOINT ?=3D "0x00000000"
UBOOT_LOADADDRESS ?=3D "0x00000000"
PREFERRED_VERSION_u-boot_xilinx-virtex5 =3D "u-boot-xilinx"
...
----------------------------------------------------------------

siteinfo.bbclass ->
----------------------------------------------------------------
def siteinfo_data(d):
     archinfo =3D {
         ...
         "ppc64": "endian-big bit-64 powerpc-common powerpc64-linux",
         "microblaze": "endian-big bit-32 powerpc-common",
         "sh3": "endian-little bit-32 sh-common",
     }

...
----------------------------------------------------------------

xilinx-bsp.bbclass ->
----------------------------------------------------------------
def map_target(a, d):
=09import re
=09board =3D bb.data.getVar('XILINX_BOARD', d, 1)
=09cpu =3D bb.data.getVar('TARGET_CPU', d, 1)

=09if re.match('powerpc', a):
=09=09return 'ppc' + cpu + '-' + board
=09elif re.match('microblaze', a):
=09=09return 'microblaze' + '-' + board
=09else:
=09=09return 'system'

...
----------------------------------------------------------------

kernel-arch.bbclass ->
----------------------------------------------------------------
valid_archs =3D "alpha cris ia64 \
                ...
                m68knommu m68k ppc powerpc ppc64  \
                microblaze  \
                sparc sparc64 \
                ...
...
----------------------------------------------------------------

gcc-4.5.inc ->
----------------------------------------------------------------
# BRANCH =3D "gcc-4_5-branch"
BRANCH =3D "microblaze"
PR_append =3D "+svnr${SRCPV}"
...
----------------------------------------------------------------

Would you please let me know where the source of problem might be and =20
how I may supposed to resolve it?

Thanks in advanced.

Best regards,
Ali


----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.




