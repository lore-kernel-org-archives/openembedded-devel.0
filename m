Received: from mail-pa0-f51.google.com ([209.85.220.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1ULeBc-0006Mp-9r
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Mar 2013 19:38:00 +0100
Received: by mail-pa0-f51.google.com with SMTP id jh10so445446pab.38
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Mar 2013 11:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:content-type:subject:message-id:date:to
	:mime-version:x-mailer;
	bh=kZxTbcaDKmY7aOAsnqQY3n2fFp/Kqcfg4XGI/Ue7fgc=;
	b=buzP2SHVmFzSZvzuuC5chSS/hv7t46kRE5x1M+IDBMWHr8Uj09ULjuthCK74oMQknd
	msxzT0UIug4knZWyAhFn7OBZ53U6ctD9YBVrPEqTqIzFi9Xdbk2aizr0+7Zm1/pkSOnK
	TTtCygb5ya8UjgMBvlIhw5fMsGXHEm0HEppDBhQhz65+8CgrILCRc+836jfYh49Mi7nm
	+Alx6b5XuRPaJWCbRsS5LIFG8jtHZqWLY6+D2HrH5tSIhiaBaZVwN70KZ1bODNpn//0T
	QEswZSTzOcQGnQyAoT28Lf2V0Q+LlK/CQcEnZJ5gFQEHZw+FPO+t5SIZhEomerwnYY2S
	T8lg==
X-Received: by 10.68.20.8 with SMTP id j8mr5196990pbe.15.1364581255096;
	Fri, 29 Mar 2013 11:20:55 -0700 (PDT)
Received: from [192.168.1.100] ([94.205.105.6])
	by mx.google.com with ESMTPS id kb3sm3642552pbc.21.2013.03.29.11.20.49
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 29 Mar 2013 11:20:54 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Message-Id: <B50A14F0-C069-4F7A-94C5-4333819E775E@gmail.com>
Date: Fri, 29 Mar 2013 22:20:46 +0400
To: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
X-Mailer: Apple Mail (2.1503)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: microblazeel-nf tune: ERROR: Unable to determine endianness for architecture
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
X-List-Received-Date: Fri, 29 Mar 2013 18:38:00 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,
       I'm trying to update the tune files for MicroBlaze, specifically =
the microblazeel (little endian) with soft-float.

I get the following error while trying to build:

ERROR: Unable to determine endianness for architecture ''
ERROR: Unable to determine endianness for architecture ''
ERROR: Please add your architecture to siteinfo.bbclass
ERROR: Please add your architecture to siteinfo.bbclass
ERROR: Unable to parse =
/tool/yocto/meta-openembedded/toolchain-layer/recipes-devtools/gcc/libgcc_=
4.6.bb: Exited with "1"--:--
ERROR: Unable to determine endianness for architecture ''
ERROR: Please add your architecture to siteinfo.bbclass
ERROR: Command execution failed: Exited with 1

The site info.bbclass already has the appropriate endian definitions for =
microblaze and microblazeel defined:

def siteinfo_data(d):
    archinfo =3D {
        "allarch": "endian-little bit-32", # bogus, but better than =
special-casing the checks below for allarch
        "aarch64": "endian-little bit-64 arm-common",
        "arm": "endian-little bit-32 arm-common",
        "armeb": "endian-big bit-32 arm-common",
        "avr32": "endian-big bit-32 avr32-common",
        "bfin": "endian-little bit-32 bfin-common",
        "i386": "endian-little bit-32 ix86-common",
        "i486": "endian-little bit-32 ix86-common",
        "i586": "endian-little bit-32 ix86-common",
        "i686": "endian-little bit-32 ix86-common",
        "ia64": "endian-little bit-64",
        "microblaze": "endian-big bit-32 microblaze-common",
        "microblazeel": "endian-little bit-32 microblaze-common",

This is the contents of my arch-microblaze.inc file:

# Microblaze ABI interface definition
# Four defined ABIs, all combinations of:
# *) Hard/Soft Floating Point
# *) Big Endian (PLB System) / Little Endian (AXI System)

DEFAULTTUNE ?=3D "microblaze"

TUNE_PKGARCH =3D "${TUNE_PKGARCH_tune-${DEFAULTTUNE}}"
ABIEXTENSION ?=3D ""

TUNEVALID[fpu-hard] =3D "Use hardware FPU."
TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard", =
"-mhard-float", "", d)}"
TUNE_ARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard", =
"microblaze", "", d)}"

TUNEVALID[fpu-soft] =3D "Use software FPU."
TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", =
"-msoft-float", "", d)}"
TARGET_FPU .=3D "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", =
"soft", "", d)}"

TUNEVALID[mbig-endian] =3D "Microblaze Big Endian processor"
TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "mbig-endian", =
"-mbig-endian", "", d)}"

TUNEVALID[mlittle-endian] =3D "Microblaze Little Endian processor"
TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", =
"mlittle-endian", "-mlittle-endian", "", d)}"

# Basic tune definitions
AVAILTUNES +=3D "microblaze"

TUNE_FEATURES_tune-microblaze ?=3D "fpu-hard"
BASE_LIB_tune-microblaze =3D "lib"
TUNE_PKGARCH_tune-microblaze =3D "microblaze"
PACKAGE_EXTRA_ARCHS_tune-microblaze =3D "microblaze"

# Tune options for MicroBlaze little endian soft-float
DEFAULTTUNE ?=3D "microblazeel-nf"


This is the contents of my tune-microblazeel-nf.inc file:

require conf/machine/include/microblaze/arch-microblaze.inc

TUNEVALID[microblazeel-nf] =3D "Enable MicroBlaze little endian =
soft-float optimizations"
TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", =
"microblazeel-nf", "-mcpu=3Dv8.40b", "", d)}"
TUNE_PKGARCH =3D "${@bb.utils.contains("TUNE_FEATURES", =
"microblazeel-nf", "microblazeel-nf", "microblazeel-nf", d)}"

AVAILTUNES +=3D "microblazeel-nf"
TUNE_FEATURES_tune-microblazeel-nf ?=3D "mlittle-endian fpu-soft"
BASE_LIB_tune-microblazeel-nf =3D "lib"
TUNE_PKGARCH_tune-microblazeel-nf =3D "microblazeel-nf"
PACKAGE_EXTRA_ARCHS_tune-microblazeel-nf =3D "microblazeel-nf"

What am I missing that is causing this error ?

Elvis Dowson


