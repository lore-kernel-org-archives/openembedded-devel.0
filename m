Received: from [209.85.216.203] (helo=mail-px0-f203.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Mi9Y2-0007le-3k
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Aug 2009 18:16:05 +0200
Received: by pxi41 with SMTP id 41so158144pxi.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2009 08:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=Ng/g8zef6HpTTxj6EXMS+4N9XYwGN7SK5m7RA8FS9GA=;
	b=ESYUtrM6sCtSAJ/71FXrGo6iVsizSwblza1bHhGa/NU7PwAfa4Jdi82Y3a+i5dwV6k
	5zgKzBaG+17AaTb0nyLacBJE5oAHZwMyu67Dy7aTIjlsP5u0eDEgpzKO4HhHOh7isUZ4
	PfOAi8V0TBeMN8LMjQzla9oyaO1d7QW9nOYQ4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=jnbAvBG0zZQMGBpERw+3Xk937pIrvfRXr428u4Q4JjnSy1b37XF+kiOSDCLouZAlyz
	wu7G6lgS/Y+zwvcx766YvEZ1FbkPhutAK4B/HI6fxVqStL993q6Ywq1elyrXJARs7Jyl
	BMhlppk+rQOCUivAdEchqmUHhEshpM3lEaVWU=
MIME-Version: 1.0
Received: by 10.140.139.2 with SMTP id m2mr597184rvd.132.1251734248712; Mon, 
	31 Aug 2009 08:57:28 -0700 (PDT)
Date: Mon, 31 Aug 2009 11:57:28 -0400
Message-ID: <f96d234e0908310857q7e2380dcw2766b9de91fd09fd@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: OE weekly changelog 2009-08-24 to 2009-08-31
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
X-List-Received-Date: Mon, 31 Aug 2009 16:16:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2009-08-24 to 2009-08-31

Brian Pomerantz (1):
  net-tools: no parallel make

Brijesh Singh (2):
  cmem, sdma, lpm: add 2.24.01 release
  ti-lpm-module 2.24: update lpm src uri, it's in its own tarball now

Chris Larson (13):
  distutils-common-base.bbclass: only raise missing python-native
error if pyt
  kernel.bbclass: Install & package symvers as
/boot/Module.symvers-<ver>.
  package_ipk.bbclass: don't choke on empty SRC_URI.
  srctree.bbclass: add initial version.
  gitver.bbclass: add initial version.
  srctree.bbclass: Don't automatically use git clean.
  srctree: completely reimplement the task merging into
do_populate_staging.
  srctree, clean: cleanup & split out do_clean bits into
clean.bbclass.
  base.bbclass: add cleanall task.
  srctree: prefix messages with ${PF} and kill do_package hacks.
  nfs-utils: fix the broken /sbin/mount.nfs4 symlink.
  autofs: fix ldflags issue, missing debug info, duplicate opt flags.
  Add task-metadata-track.bbclass, for tracking task changes to
metadata.

Dale Farnsworth (2):
  kernel.bbclass: Set EXTRA_OEMAKE to null for kernel
  patch.bbclass: Add "git" patchtool mechanism, which uses git-apply

Elena Grandi (5):
  xapian-core: updated to version 1.0.14
  xapian-bindings-python: new recipe
  sugar-datastore: added runtime dependency on the xapian bindings
  xapian-core: moved common lines in xapian-core.inc
  sugar-base: fixed renamed dependency openssh-keygen

Evan Doiron (5):
  dmidecode: add v2.10
  nano: add v2.0.9
  rsync: add v3.0.6
  ppp: add v2.4.4
  openvpn: add v2.0.9+2.1rc19

Florian Boor (11):
  topas910.conf: Some defines to build valid uImages.
  linux: Add support for the Intel KIXRP435 reference board to 2.6.30
  kixrp435.conf: Machine description for the Intel KIXRP435 reference board=
.
  topas910.conf: No need for the lowlevel loader any more. But mtdutils are=
 us
  ixp4xx-npe: The KIXRP435 uses NPE too.
  pango: Add native pango 1.22.0
  atk: add 1.27.90 native atk
  libpixman: Add native 0.12.0
  cairo: add native 1.8.0
  gtk+: add simple native gtk+ 2.12.11 with all modules built in.
  checksums.ini: A lot of maemo checksums and some updated bits.

Holger Hans Peter Freyther (3):
  libmusicbrainz: Add version 3.0.2 and fix link error
  oprofile-0.9.5: Add oprofile version 0.9.5
  gdb: Make 6.8 packages match regarding patches and license

Jeremy Lain=E9 (1):
  linux-2.6.29: update lm73 driver for boc01

Jeremy Puhlman (4):
  bitbake.conf: Add export for cross NM.
  iptables: Add patch to use cross ar and ranlib.
  lsof: Fix misuse of system ranlib.
  groff: disable X11 support.

Khem Raj (24):
  base.bbclass: Remove redundant import of subprocess and signal.
  alix.conf, xo.conf: Use tune-geode.inc instead of tune-geodelx.inc
  tzdata_2007k.bb: Update SRC_URI
  diffstat_1.47.bb: Add recipe for new release
  dash_0.5.2.bb: Add recipe for latest dash.
  checksums.ini: Sort and remove duplicates.
  iputils: Make iputils_20071127 default.
  gcc-4.4.1: Disable libdecnumber for uclibc target.
  uclibc: Make 0.9.30.1 as default if not specified
  gcc-4.4.1.inc: Disable 128 bit long double for powerpc-*-uclibc
  gcc-4.4.1: Backport improved TLS detection patch in cross environment
  base.bbclass: Pass in PATH to popen.
  base.bbclass: Pass in PATH to popen.
  micro.conf: Remove PREFERRED_PROVIDER_virtual/libintl

Koen Kooi (18):
  linux-omap 2.6.29: update holes patch, make iommu modular for beagle
  octave: fix QA issues
  dvsdk: merge in new versions from arago and clean them up a bit
  dvsdk: rename to ti now that other things like bitblit live in that dir n=
ow
  angstrom feed sorter: skip base feeds if there aren't any packages to sor=
t
  ti-codec: add missing.inc
  libgles-omap3: catch up with dir rename
  julius: add commandpipe patch from TI to allow commands over a pipe to co=
ntr
  ti-codec-engine: make 2.24.1 default and fix the build
  erlang: start updating erlang to R13B01
  erlang: disable parallel make
  glib-2.0 2.21.4: fix pre armv6 builds
  erlang: also blacklist java 1.5
  erlang: fix packaging and QA errors
  python-pygobject 2.16: 2.14 sets PE=3D1, so set it in 2.16 as well

Marcin Juszkiewicz (7):
  openssh: make openssh-keygen conflict with ssh-keygen (old name of it)
  xf86-video-vesa: needs int10 X.org module to work
  matchbox-session: simple provider of Matchbox session for X11 startup
  vortex86sx: use X.org
  xserver-xorg-conf: provide one for Vortex86sx
  xserver-common 1.30: -screen option is only for Kdrive
  xserver-common 1.30: -screen option is only for Kdrive

Michael Smith (4):
  mesa-dri: set PACKAGE_ARCH to ${MACHINE}
  mesa-dri: move tls configure logic to a class
  xorg-xserver-common: pass --enable-glx-tls
  mesa-common.inc: avoid bashism

Philip Balister (1):
  erlang : Add recipe for erlang-R13B01

Pratheesh Gangadhar (1):
  glib-2.0 2.21.4: add armv6 atomic ops, this fixes 100% utilization hangs =
whe

Robert Schuster (1):
  libecj-bootstrap 3.5: Set DEFAULT_PREFERENCE to -1.

Roger Monk (1):
  gnome-games: fix previous bad patch -I/SDL error

Rolf Leggewie (1):
  intltool: move dependency on libxml-parser-perl-native to inc file

Stanislav Brabec (8):
  subversion: Updated to version 1.6.5. Deleted old unused versions.
  linux-libc-headers: Added headers for version 2.6.30.
  update-rc.d: INHIBIT_DEFAULT_DEPS to allow glibc to inherit update-rc.d.
  glibc: Install ld.so.conf, so ldconfig does not complain.
  glibc: nscd: Make it working.
  glibc-package.bbclass: Reverted 056a67f6070c5ea561acb65049b551e24f3b7eb6.

Steffen Sledz (2):
  linux-2.6.24: enable initrd support for hipox machine
  checksums.ini: add missing entry for diffstat 1.47

Tushar Gohad (1):
  tcpdump: obey distro for the ipv6 support

Bugs fixed:

bug_id resolution        short_desc
5310 FIXED       bitbake does not seem to honor umask when creating
directories in tmp area
5307 FIXED       mesa 7.2 fails on do_install
4578 FIXED       uicmoc4-native_4.4.0 does not compile
5036 FIXED       tzdata2007k.tar.gz no longer downloadable
5044 FIXED       The source archive for dash 0.5.2 is no longer downloadabl=
e
5096 INVALID     Testbug for cdbot2
5140 FIXED       diffstat SRC_URI needs an update
5141 FIXED       iputils does not build
5296 FIXED       libfsobasics_git.bb fails to configure
5297 FIXED       python-pyqt fails do_compile
5305 FIXED       x11-gpe-image do_rootfs opkg permission denied
5306 WORKSFORME  x11-gpe-image do_rootfs failed
5308 FIXED       conf/machine/include/tune-geodelx.inc is missing

Bugs opened:

bug_id resolution        short_desc


