Received: from [69.16.195.231] (helo=external.redrocketcomputing.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <stephen@streetfiresound.com>) id 1GwklR-0007vj-Gb
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Dec 2006 20:36:37 +0100
Received: from dsl027-185-227.sfo1.dsl.speakeasy.net ([216.27.185.227]
	helo=ststephen.streetfiresound.com)
	by external.redrocketcomputing.com with esmtpsa (SSLv3:RC4-MD5:128)
	(Exim 4.52) id 1GwkjC-0004vH-4o
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Dec 2006 14:34:18 -0500
From: Stephen Street <stephen@streetfiresound.com>
To: openembedded-devel@lists.openembedded.org
Organization: StreetFire Sound Labs
Date: Tue, 19 Dec 2006 11:39:27 -0800
Message-Id: <1166557167.14412.32.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - external.redrocketcomputing.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - streetfiresound.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Problem building installable toolchain
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Dec 2006 19:36:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

I'm new to the openembedded project and I'm having problems building an
installable toolchain (i.e. bitbake meta-toolchain).  I have
successfully integrated a new machine and distro configuration (see
below).  I can build this configuration using bitbake task-base and
everything appear to works.  When I try to build a toolchain using
"bitbake meta-toolchain" or "bitbake meta-sdk" the "gcc-cross-sdk-4.1.1"
package fails to build.  These following snippet show the error:

 In file included
from /home/stephen/workspace/openembedded/build/work/i686-linux/gcc-cross-s=
dk-4.1.1-r9/gcc-4.1.1/libiberty/regex.c:51:
| /home/stephen/workspace/openembedded/build/staging/arm-linux/include/sys/=
types.h:100: error: two or more data types in declaration specifiers
| /home/stephen/workspace/openembedded/build/staging/arm-linux/include/sys/=
types.h:100: warning: useless type name in empty declaration
| /home/stephen/workspace/openembedded/build/work/i686-linux/gcc-cross-sdk-=
4.1.1-r9/gcc-4.1.1/libiberty/regex.c:130: warning: function declaration isn=
=E2=80=99t a prototype
| /home/stephen/workspace/openembedded/build/work/i686-linux/gcc-cross-sdk-=
4.1.1-r9/gcc-4.1.1/libiberty/regex.c:130: warning: conflicting types for bu=
ilt-in function =E2=80=98malloc=E2=80=99
| /home/stephen/workspace/openembedded/build/work/i686-linux/gcc-cross-sdk-=
4.1.1-r9/gcc-4.1.1/libiberty/regex.c:131: warning: function declaration isn=
=E2=80=99t a prototype
| In file included
from /home/stephen/workspace/openembedded/build/work/i686-linux/gcc-cross-s=
dk-4.1.1-r9/gcc-4.1.1/libiberty/regex.c:185

This appears to be a problem with the header configuration but I'm a not
a toolchain expert.  Has anyone encountered this problem before?  How
should I approach resolving this problem?

Following are my configuration files and attached is the full log

=3D=3D=3D local.conf =3D=3D=3D

DL_DIR =3D "${PROJECT_ROOT}/sources"
BBFILES =3D "${PROJECT_ROOT}/org.openembedded.dev/packages/*/*.bb
${PROJECT_ROOT}/com.streetfiresound.rbx1600/packages/*/*.bb"
BBMASK =3D ""
TMPDIR =3D "${PROJECT_ROOT}/build"

MACHINE =3D "rbx1600"
DISTRO =3D "StreetRacerLinux"

IMAGE_FSTYPES =3D "jffs2 tar"

BBDEBUG =3D "yes"
# DEBUG_BUILD =3D "1"
INHIBIT_PACKAGE_STRIP =3D "1"
PARALLEL_MAKE =3D "-j 4"

BBINCLUDELOGS =3D "yes"

=3D=3D=3D distro.conf =3D=3D=3D

#--------------------------------------------------------------------------=
---
#@TYPE: Distribution
#@NAME: StreetRacerLinux
#@DESCRIPTION: StreetFire Sound Embedded Linux Distribution
Configuration
#
#--------------------------------------------------------------------------=
---

#
# Header
#
DISTRO_NAME =3D "StreetRacerLinux"
DISTRO_VERSION =3D "0.1-debug"
#DISTRO_TYPE =3D "release"
DISTRO_TYPE =3D "debug"

#
# Naming schemes
#
PARALLEL_INSTALL_MODULES =3D "1"
INHERIT +=3D "debian multimachine"

#
# Packaging and output format
#
INHERIT +=3D "package_ipk"
IMAGE_FSTYPES =3D "tar.gz jffs2"

#
# Kernel
#
KERNEL =3D "kernel26"
MACHINE_KERNEL_VERSION =3D "2.6"

#
# Binutils & Compiler
#
PREFERRED_PROVIDERS +=3D "
virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc:gcc-cross"
PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}g++:gcc-cross"
PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}-libc-for-gcc =3D
"glibc-intermediate"
PREFERRED_PROVIDER_virtual/arm-linux-libc-for-gcc =3D "glibc-intermediate"

PREFERRED_PROVIDER_virtual/libiconv =3D "glibc"
PREFERRED_PROVIDER_virtual/libintl =3D "glibc"

PREFERRED_VERSION_gcc ?=3D "4.1.1"
PREFERRED_VERSION_gcc-cross ?=3D "4.1.1"
PREFERRED_VERSION_gcc-cross-initial ?=3D "4.1.1"
PREFERRED_VERSION_gcc-cross-sdk ?=3D "4.1.1"

PREFERRED_VERSION_binutils ?=3D "2.17.50.0.5"
PREFERRED_VERSION_binutils-cross ?=3D "2.17.50.0.5"

TARGET_OS =3D "linux"
TARGET_FPU_arm =3D "soft"
TARGET_FPU_armeb =3D "soft"

PREFERRED_VERSION_linux-libc-headers ?=3D "2.6.18"

PREFERRED_VERSION_glibc =3D "2.5"
PREFERRED_VERSION_glibc-initial =3D "2.5"
PREFERRED_VERSION_glibc-intermediate =3D "2.5"

DISTRO_FEATURES =3D "alsa"

PREFERRED_VERSION_linux-rbx1600 ?=3D "2.6.17"

=3D=3D=3D rbx1600.conf =3D=3D=3D

#@TYPE: Machine
#@Name: RBX1600
#@DESCRIPTION: Machine configuration StreetFire Sound Labs RBX1600=20

TARGET_ARCH =3D "arm"
PACKAGE_EXTRA_ARCHS =3D "armv5te"

PREFERRED_PROVIDER_virtual/kernel =3D "linux-rbx1600"
PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-rbx1600"
PREFERRED_PROVIDERS +=3D
"virtual/${TARGET_PREFIX}depmod:module-init-tools-cross"

include conf/machine/include/tune-xscale.conf

MACHINE_FEATURES =3D "kernel26 alsa"

MACHINE_TASK_PROVIDER =3D "task-base"




