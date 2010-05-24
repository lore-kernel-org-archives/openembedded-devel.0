Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OGccz-0006Fh-7K
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 May 2010 20:43:54 +0200
Received: by iwn2 with SMTP id 2so3426414iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 May 2010 11:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=q9xTu8spb8mtdPv7VBFCwJcAEBG9VVvwF1PvITLQWOU=;
	b=R3biRrLNbA0vrYoaiC1mMTKR5Rk+wIJb4ennA39Q0ZNhPyUZK1oCsMLsEy5hiTp8Na
	6hwzGTQYUB7aAWaJG+/t1NmESmWBi+473096g4evssqvWb7asBrMa82LP9DOXsL+nBJW
	an3QTmCWXfsJMVtgyR9HP7ApCq1dlyFWCtHgg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=XwaodyRGrEdn34KwDma8ZufFnABLtv3PJ55aJnNa0O0CL9Fx3i9aGKGGPVpmheJglo
	mW6ShuTc7VqC5HDR9GudRBx6FgKVpIo6ZPEjQskaq1mp62SYQjh773cjoApMQdpqMSG3
	97wrObq9RVi0eab7EpyCPt9uAq/LtR1XGnRbo=
MIME-Version: 1.0
Received: by 10.231.176.74 with SMTP id bd10mr4657357ibb.38.1274726388352; 
	Mon, 24 May 2010 11:39:48 -0700 (PDT)
Received: by 10.231.37.139 with HTTP; Mon, 24 May 2010 11:39:48 -0700 (PDT)
Date: Mon, 24 May 2010 14:39:48 -0400
Message-ID: <AANLkTiku8kaw1qF7bC6-UOPQO0Ljeduj7HGr8KtGqspP@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: OE weekly changelog 2010-05-17 to 2010-05-24
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
X-List-Received-Date: Mon, 24 May 2010 18:43:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog for org.openembedded.dev, 2010-05-17 to 2010-05-24

Andrea Adami (4):
  linux-kexecboot: sed out conflicting getline in scripts/unifdef.c
  linux.inc: Rename getline in unifdef.c to parseline to avoid conflict.
  linux-rp: fix SRC_URI of poodle_pm-r7.patch
  linux-kexecboot: initial linux-kexecboot_2.6.34

Chris Larson (8):
  Fix a couple shell syntax errors in recipes
  python-dir: raise an Exception instance, not a string
  cherokee: use the bitbake BUILD_CC variable rather than the exported shel=
l v
  net-tools: use bitbake variables rather than shell variables in do_compil=
e
  amend.bbclass: load *all* available amend.inc files in FILESPATH, not the=
 fi
  bitbake.conf: add ${datadir}/gdb/autoload to the default paths included i=
n $
  oe.patch: kill long standing annoying messages from the non-quilt patch a=
ppl
  autotools.bbclass: drop 'cfgcmd' and 'Running ..' output

Denys Dmytriyenko (14):
  pointercal: set the LICENSE to MIT by default
  fbset-modes: set the LICENSE to MIT by default
  bluez4: set the LICENSE to more specific GPLv2/LGPLv2.1
  bluez-hcidump: set the LICENSE to more specific GPLv2
  openobex: set the LICENSE to more specific GPLv2/LGPLv2.2
  obexftp: set the LICENSE to more specific GPLv2/LGPLv2 (not 2.1?)
  external-toolchain-csl: set the individual licesnes for packages
  powervr-drivers: move GFX SDK bin from FILESPATH to DL_DIR
  matrix-gui: bump the rev, change LICENSE to BSD
  matrix-tui: bump the rev, change LICENSE to BSD
  am-benchmarks: bump the rev
  dm3730-am3715-evm: disable virtual console, set JFFS2 erase block
  alsa-utils: inherit gettext instead of adding it in DEPENDS

Enrico Scholz (1):
  packaged-staging: fixed deadlock

Eric Benard (1):
  libmimedir: add glib-2.0 dependency

Eric B=E9nard (8):
  cross.bbclass: fix build of meta-toolchain
  module-base.bbclass: keep PR if MACHINE_KERNEL_PR is not set
  elfutils_0.143: fix packages_split
  prelink_20090925: allow dynamic linking of prelink
  live555: add 20100409 and create packages for test programs
  orc-native: fix temporary files'path
  orc: add version 0.4.4
  firmware-marvell-sd8688: add recipe

Henning Heinold (1):
  jamvm: update to versiom 1.5.3

Henry von Tresckow (1):
  linux-rp: make 2.6.26 compile for poodle

Khem Raj (9):
  uclibc-git: Add libm.so to dummy shared objects
  gcc-4.4.4: Fix build failure on powerpc/uclibc.
  util-linux-ng.inc: Dont add -lintl when USE_NLS=3D"no"
  gnutls.inc: Obtain gettext in DEPENDS from inheriting gettext bbclass    =
 .
  uclibc-git: Update machine config for SH3 and SH4
  eglibc-2.12: Add new recipes for 2.12
  automake_1.11.1.bb: Remove DEFAULT_PREFERENCE =3D "-1"
  binutils-cross-sdk_cvs.bb: Use special do_install for cvs version.
  qemu: Fix running linux user programs on iWMMXt processors.

Klaus Kurzmann (4):
  fsonetworkd_git.bb: add RDEPENDS for iptables
  linux-openmoko-devel_git.bb: apply getline fix for scripts/unidef.c
  openbmap-logger_0.4.0.bb: add a patch to make it compatible with fsogsmd
  cornucopia.inc: bump rev to get working fsonetworkd connection sharing

Koen Kooi (14):
  extract-feedarch: script to extract machine and feedarch from angstrom-fe=
ed-
  angstrom feed sorter: add more machines
  angstrom feed sorter: sort more archs
  tcl: add 8.5.8
  tk: add 8.5.8
  tk 8.5.8: reintroduce .so workaround
  u-boot-mkimage: convert to new style staging and bbclassextend
  kernel bbclass: switch to u-boot-mkimage-native
  angstrom: fix java builds
  linux-omap-psp 2.6.32: tweak reported powervalue for MUSB on beagleboard
  tcl 8.5.8: fix header location
  pixman 0.18.0: add NEON fix     pixman 0.18.2: add recipe and rediff patc=
hes
  u-boot-mkimage: fix target build
  angstrom personal feed script: s/staging/sysroots/

Martin Jansa (7):
  linux-openmoko-2.6.32: add patches from gdrm-for-merging instead of gdrm-=
2.6
  freesmartphone: bump cornucopia SRCREV for fixed +CMT format and other fi=
xes
  linux-openmoko-2.6.34: add new version
  navit: bump SRCREV (also for navit-icons) and add new osd layout from und=
rwa
  shr: add tk to DISTRO_FEATURES for python-idle->python-tkinter fix
  xf86-video-glamo: bump SRCREV, remove pushed patch and -pedantic removal =
(al
  msmcommd: bump SRCREV to latest compatible with current cornucopia SRCREV

Michael Jones (1):
  docs/ spelling fixes

Michael Lippautz (2):
  gpsd: Add version 2.94
  python-xmpppy: Add recipe

Mike Westerhof (2):
  linux-ixp4xx: Add a patch to avoid a name clash with the C library on    =
 re
  SlugOS: preferred-slugos-versions.inc - use older version of tcl     Avoi=
ds

Roger Monk (7):
  ti-eula-unpack: Force Console Mode, add Error Prints
  xdotool: Add initial support for xdotool
  ti-msp430-chronos: Add initial recipe for msp430 chronos watch support
  linux-davinci: Fix Hawkboard RTC configuration causing hang
  linux-davinci: Update to latest kernel for DA8xx/OMAPL1xx
  xdotool: Change license to MIT
  ti-msp430-chronos: Add RDEPEND on tk, fix dos2unix

Tom Rini (1):
  sane-toolchain.inc: Don't hold ppc405 back to gcc 4.4.1


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
OE weekly changelog for holger/staging-branch, 2010-05-17 to 2010-05-24


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
Bugs fixed:
bug_id resolution        short_desc
5437 FIXED       packaged-staging freezes


