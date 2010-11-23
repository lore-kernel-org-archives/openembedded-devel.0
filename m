Received: from smtp4.mundo-r.com ([212.51.32.151])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjaquez@igalia.com>) id 1PKuKC-0002q0-Jz
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 15:58:31 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApsEAEhl60xbdWOb/2dsb2JhbACjVb1vhUsEiW0
X-IronPort-AV: E=Sophos;i="4.59,242,1288566000"; d="scan'208";a="699743099"
Received: from 155.99.117.91.static.mundo-r.com (HELO fanzine.igalia.com)
	([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 23 Nov 2010 15:57:14 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim) id 1PKuJ0-0007d1-I7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 15:57:14 +0100
Received: from ip148.dynamic.igalia.com ([192.168.10.148]
	helo=lit.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim) id 1PKuJ0-0003kR-Db
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 15:57:14 +0100
Received: from vjaquez by lit.local.igalia.com with local (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>) id 1PKuJ0-00055H-4f
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 15:57:14 +0100
Date: Tue, 23 Nov 2010 15:57:14 +0100
From: =?iso-8859-1?Q?V=EDctor_M=2E_J=E1quez_L=2E?= <vjaquez@igalia.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101123145713.GA3032@lit.local.igalia.com>
References: <20101123113706.GA3533@lit.local.igalia.com>
	<4CEBD252.7000502@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4CEBD252.7000502@mentor.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 212.51.32.151
X-SA-Exim-Mail-From: vjaquez@igalia.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: external-toolchain-csl-1.0-r6 fails
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
X-List-Received-Date: Tue, 23 Nov 2010 14:58:31 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Nov 23, 2010 at 07:40:18AM -0700, Tom Rini wrote:
> On 11/23/2010 04:37 AM, Víctor M. Jáquez L. wrote:
> >I'm trying to build minimal-image with CSL toolchain, but I got this error:
> >
> >NOTE: package external-toolchain-csl-1.0-r6: task do_install: Started
> >ERROR: TaskFailed event exception, aborting
> >ERROR: Build of /media/DISK/vjaquez-angstrom-setup-scripts/sources/openembedded/recipes/meta/external-toolchain-csl.bb do_install failed
> >ERROR: Task 187 (/media/DISK/vjaquez-angstrom-setup-scripts/sources/openembedded/recipes/meta/external-toolchain-csl.bb, do_install) failed with 256
> >ERROR: '/media/DISK/vjaquez-angstrom-setup-scripts/sources/openembedded/recipes/meta/external-toolchain-csl.bb' failed
> >ERROR: Function do_install failed
> >NOTE: Task failed: ('function do_install failed', '/media/DISK/vjaquez-angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/external-toolchain-csl-1.0-r6/temp/log.do_install.22227')
> >ERROR: Logfile of failure stored in: /media/DISK/vjaquez-angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/external-toolchain-csl-1.0-r6/temp/log.do_install.22227
> >Log data follows:
> >| cp: cannot stat `/media/DISK/sgpp/arm-2010q1/arm-angstrom-linux-gnueabi/libc/lib/*': No such file or directory
> >| ERROR: Function do_install failed
> >NOTE: package external-toolchain-csl-1.0-r6: task do_install: Failed
> >ERROR: TaskFailed event exception, aborting
> >
> >For some reason the variable ${TARGET_SYS} is evaluated as
> >arm-angstrom-linux-gnueabi instead of arm-none-linux-gnueabi which is the
> >correct value.
> 
> Please post your local.conf settings as well as what version of
> openembedded (and what branch) you are using.

I'm using the openembedded's branch org.openembedded.dev (HEAD)

my local.conf

# Where to store sources
DL_DIR = "/media/DISK/meego/vjaquez-angstrom-setup-scripts/sources/downloads"

INHERIT += "rm_work"

# Which files do we want to parse:
BBMASK = ""

# Qemu 0.12.x is giving too much problems recently (2010.05), so disable it for users
ENABLE_BINARY_LOCALE_GENERATION = "0"

# What kind of images do we want?
IMAGE_FSTYPES += "tar.bz2"

# Make use of SMP:
#   PARALLEL_MAKE specifies how many concurrent compiler threads are spawned per bitbake process
#   BB_NUMBER_THREADS specifies how many concurrent bitbake tasks will be run
PARALLEL_MAKE     = "-j2"
#BB_NUMBER_THREADS = "2"

DISTRO   = "angstrom-2008.1"
MACHINE ?= "beagleboard"

# Set TMPDIR instead of defaulting it to /tmp
TMPDIR = "/media/DISK/meego/vjaquez-angstrom-setup-scripts/build/tmp-angstrom_2008_1"

# Don't generate the mirror tarball for SCM repos, the snapshot is enough
BB_GENERATE_MIRROR_TARBALLS = "0"

# Go through the Firewall
#HTTP_PROXY        = "http://:/"

# enable following line to use CodeSourcery Lite
TARGET_VENDOR := "-none"
TOOLCHAIN_TYPE := "external"
TOOLCHAIN_BRAND := "csl"

# please change me
TOOLCHAIN_PATH = "/media/DISK/meego/sgpp/arm-2010q1"

 # Don't include kernels in standard images
 RDEPENDS_kernel-base = ""


addendum:

If I apply this patch[1] the problem seems to be solved.

1. http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg11415.html

vmjl


