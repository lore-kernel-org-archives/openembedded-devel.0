Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <embedded@gmx.net>) id 1QZ0Hz-0002IQ-3C
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Jun 2011 14:42:43 +0200
Received: (qmail invoked by alias); 21 Jun 2011 12:32:26 -0000
Received: from mx.3alitydigital.de (EHLO gport016linuxx64.localnet)
	[212.144.240.82]
	by mail.gmx.net (mp009) with SMTP; 21 Jun 2011 14:32:26 +0200
X-Authenticated: #118086913
X-Provags-ID: V01U2FsdGVkX1+hHW04gZqhNUUCLVxLUkwlh90mqL9GabUK2YMoJp
	A2J0QGnp8MunPF
From: "A. Schallenberg" <embedded@gmx.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Jun 2011 14:32:22 +0200
User-Agent: KMail/1.13.5 (Linux/2.6.35-28-generic; KDE/4.5.5; x86_64; ; )
MIME-Version: 1.0
Message-Id: <201106211432.22700.embedded@gmx.net>
X-Y-GMX-Trusted: 0
Subject: openssl-native-1.0.0d-r14.0 compile fails
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
X-List-Received-Date: Tue, 21 Jun 2011 12:42:43 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

I tried to compile Angstrom (which is based on openembedded). 
Unfortunately it fails with a message that is very similar to the
one Robert Schuster reported on 07 Mar 2011.
(Since I wasn't subscribed to this list back then I cannot reply
to his mail now.)

Here is what I get:

Log data follows:
| + do_compile
| + oe_runmake
| + oenote make -e MAKEFLAGS=
| + echo NOTE: 'make -e MAKEFLAGS='
| NOTE: make -e MAKEFLAGS=
| + make -e MAKEFLAGS=
| make: *** No targets specified and no makefile found.  Stop.
| + die 'oe_runmake failed'
| + oefatal 'oe_runmake failed'
| + echo FATAL: 'oe_runmake failed'
| FATAL: oe_runmake failed
| + exit 1
NOTE: package openssl-native-1.0.0d-r14.0: task do_compile: Failed

I didn't find any Makefile that "touch"ing would make it compile.

Has anybody an idea what I am doing wrong?
Wrong toolchain? Wrong distro version selection?

Some additional information about the system:

Build Configuration:
BB_VERSION        = "1.12.0"
METADATA_BRANCH   = "master"
METADATA_REVISION = "1b9260e"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "beagleboard"
DISTRO            = "angstrom"
DISTRO_VERSION    = "v2011.06"
TARGET_FPU        = "hard"

> arm-none-eabi-gcc -v
Using built-in specs.
COLLECT_GCC=arm-none-eabi-gcc
COLLECT_LTO_WRAPPER=/opt/arm-2011.03/bin/../libexec/gcc/arm-none-
eabi/4.5.2/lto-wrapper
Target: arm-none-eabi
...
Thread model: single
gcc version 4.5.2 (Sourcery G++ Lite 2011.03-42) 


My ./build/conf/local.conf is:
-------------------------------------------------------
# Where to store sources
DL_DIR = "/home/aschallenberg/3wm-devel/manual-distro-build/setup-
scripts/sources/downloads"

INHERIT += "rm_work"

# Which files do we want to parse:
BBFILES ?= "/home/aschallenberg/3wm-devel/manual-distro-build/setup-
scripts/sources/openembedded/recipes/*/*.bb"
BBMASK = ""

# Qemu 0.12.x is giving too much problems recently (2010.05), so disable it 
for users
ENABLE_BINARY_LOCALE_GENERATION = "0"

# What kind of images do we want?
IMAGE_FSTYPES += "tar.bz2"

# Make use of SMP:
#   PARALLEL_MAKE specifies how many concurrent compiler threads are spawned 
per bitbake process
#   BB_NUMBER_THREADS specifies how many concurrent bitbake tasks will be run
PARALLEL_MAKE     = "-j3"
BB_NUMBER_THREADS = "2"

#DISTRO   = "angstrom-2011.3"
DISTRO   = "angstrom-2010.x"
#DISTRO   = "angstrom-2008.1"
MACHINE ?= "beagleboard"

# Set TMPDIR instead of defaulting it to /tmp
TMPDIR = "/home/aschallenberg/3wm-devel/manual-distro-build/setup-
scripts/build/tmp-angstrom_2011_3"

# Don't generate the mirror tarball for SCM repos, the snapshot is enough
BB_GENERATE_MIRROR_TARBALLS = "0"

# Go through the Firewall
#HTTP_PROXY        = "http://:/"


IMAGE_PKGTYPE = "ipk"
----------------------------------------------------------

Best,
Andreas


