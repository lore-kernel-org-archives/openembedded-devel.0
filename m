Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f53.google.com (mail-pg0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id BEAD778238
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2017 14:42:13 +0000 (UTC)
Received: by mail-pg0-f53.google.com with SMTP id m30so225855pgn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Sep 2017 07:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=D/b3IhKL3C1x0qLktTXgKM38hLGK+wOZo16cMVK+M5U=;
	b=T8fTZ6SF5e/Uw5v+Q4VFhfzA8XikyOg9r81I3kYE+fZDbrqH1TdvTGR74XeVsV50CE
	XUgmaGDFJ+6aImKYIgBVUQfETg+FGdF+naxGcQGcR+OuhE3VIa346lcWAmUgyFvXrSvm
	LI7aD/hCKEIVJzQ6O12MFjorS9I5oUQUky2mGgGza053pO4ilnRjld/UoX6xNiKVR43f
	ZL6fzqWIFOJx/xVsJwCa8qVfdI54Qk2iPiTCFV2v1wjvGdz3sEQCR2WySEC41TbPwzE1
	qSukNeWhhWGd8gCcBnl0jBB4hvBhXt0BPKsKWfe8DHhKhz5S9mH6qL3KF7HeZ2U+RAp8
	/KRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=D/b3IhKL3C1x0qLktTXgKM38hLGK+wOZo16cMVK+M5U=;
	b=lj2jHiMPD/5lviaeK52Fw0wV5afWp/F/3CILooWY1Z4NeBfsyTHSRnGybcnsWwa5of
	sR9oZ+RgGK8KfYd9MSokzN4Egc2z5ZHavADI+Q1t63ydfuGNPJCuF7xTx59UCVNTIRqk
	xBGn6rDIEwtJcfE5gWkPUuBpWEsfFMFV2kcT/dSwDjmUf4xRf7arRxdVW5laEeeHM+Th
	lUHjOXFXWIQVLX45F+yYK9o61kEHjC7XVr+tBygLJhqXGAfAZYyX+Og6oQPXvAquHrFW
	S37cfqsM5rpm9gBk2mTiMnAii4Tk/8qSY0NjzBpXxwgPmmVPYgvNtb9yBKXx6+jZ9z+D
	JWKA==
X-Gm-Message-State: AHPjjUjrZlDiVeKVDiC+lKViszecpwuoBriDJGvEYUi4RoanYw3ppDQ2
	9lU87os1OSZaUw==
X-Google-Smtp-Source: ADKCNb5e8DsKINdJ5NUpls7u9QjjGpPl4zrY9CX/CD++k1FlTablBYErUpVQQyGd/AaX4fj3ygLxYw==
X-Received: by 10.99.99.197 with SMTP id x188mr32967297pgb.421.1505745734382; 
	Mon, 18 Sep 2017 07:42:14 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:6473:8160:c9a8:5cd3])
	by smtp.gmail.com with ESMTPSA id
	c30sm13984992pgn.33.2017.09.18.07.42.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Sep 2017 07:42:14 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Mon, 18 Sep 2017 07:39:52 -0700
Message-Id: <cover.1505745422.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 000/138] [v2] Pyro pull request
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Sep 2017 14:42:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Cover letter only

v2] Removed daq patch
    Backported a few more fixes
    Fixed a few more new build issues

The following changes since commit 5e82995148a2844c6f483ae5ddd1438d87ea9fb7:

  opencv: disable broken Intel FP16 detection (2017-05-09 16:00:31 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib akuster/pyro-next
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=akuster/pyro-next

Alejandro Mery (3):
  gitver: extend class to use EXTERNALSRC if set
  gitver: fix broken ${GITSHA} and recursion in S when PV="${GITVER}"
  gitver: skip packages instead of panic()ing if ${GITVER} fails to
    expand

Alex Stewart (1):
  fuse: Correct runlevels and startup order

Andreas Müller (1):
  kodi: fix build with latest gcc

Andrej Valek (1):
  srecord: add collection of tools for manipulating EPROM load files

André Draszik (1):
  nftables: backport a few ICMP & ICMPv6 fixes

Armin Kuster (4):
  libmtp: fix build issue
  libexecinfo: fix complie issue
  synergy: update SRC_URI
  tbb: fix compile issue

Catalin Enache (1):
  gd : CVE-2016-6906

Frederico Cadete (1):
  python-pyudev: correct LICENSE from GPLv2 to LGPLv2.1+

Gianfranco Costamagna (4):
  wxstreams: fix build with gcc-6 (patch from Debian). Remove blacklists
    for wvstreams and wvdial
  wvdial: inherit pkgconfig Missing pkgconfig does not let build the
    package.
  libndp: switch to github uri. libndp.org is unstable
  libndp: Update patch with upstream version.

Hongxu Jia (1):
  gnome-themes: remove PNBLACKLIST

Huang Qiyu (1):
  opencv: Make opencv-ts create share library intead of static

Ioan-Adrian Ratiu (1):
  openldap: fix native LDFLAGS build error

Ismo Puustinen (2):
  opencv: fix building with PACKAGECONFIG "dnn" enabled.
  gflags: change download name.

Jackie Huang (8):
  umip: fix for parallel compilation
  umip: add systemd and sysvinit support
  umip: fix EXTRA_OECONF and add RRECOMMENDS
  drbd-utils: remove /var/lock to avoid conflict
  snort: fix for snort.conf
  adduser: use get_perl_version instead of PERLVERSION
  gflags: add runtime dependency on bash
  corosync: fixes for sysvinit and systemd

Joe Slater (1):
  iscsi-initiator-utils: do not regenerate prom_lex.c

Kai Kang (2):
  gflags: update SRC_URI with git fetcher
  krb5: fix CVE-2017-11368

Khem Raj (76):
  gnome-bluetooth: Look for x11 in distro features
  libsdl2-ttf: Check for x11 and opengl in distro features
  kodi: Fix build when x11 is disabled
  meta-perl: Make glibc-gconv deps apply for glibc based systems alone
  audiofile: Inherit pkgconfig instead of binconfig
  caps: Fix buld with -pie
  python-numeric: Fix build with musl
  openipmi: Fix build with musl
  libdc1394: Add X11 and opengl deps if distro has them in policy
  makedumpfile: Fix build with hardening
  sqlite: Fix build with hardening flags
  nopoll: Disable doc generation
  samba: Fix build with musl
  vlan: Fix build with security flags turned on
  linux-atm: Fix build with hardening flags
  ruli: Fix build with hardening flags
  ruli: FIx build with hardening flags
  umip: Fix buid with hardening
  gtkperf: Fix build with hardening flags
  wmiconfig: Fix build with hardening flags
  lmbench: Fix build with hardening flags
  wv: Fix build with hardening flags
  cdrkit: Fix build with hardening flags
  orrery: Fix build with hardening flags
  crash: Pass optimization flags to configure via CC
  libsrtp: Fix build on mips
  libtorrent: Implement 64bit atomics for mips32
  uim: Add support for aarch64
  tinymembench: Disable on mips64
  libtorrent: Link in 64bit atomics for ppc
  gperftools: Fix build on ppc
  libdbus-c++: Fix build with gcc7 and unblacklist
  ltrace: Add mips64 support
  ltrace: Fix build on musl
  libdbus-c++: Add -pthread to linker flags
  klibc: Fix build with musl
  ubi-utils-klibc: Pass TUNE_CCARGS into CFLAGS
  klibc: Fix linking by using bfd linker when default linker is gold
  klibc: Fix build issue when default ISA is not thumb
  sox: Fix build with musl
  cdparanoia: Fix build with security flags
  cdparanoia: Fix build with musl
  lightmediascanner: Define comparison_fn_t if undefined
  lmbench: Fix build with musl
  xfce4-netload-plugin: Do not include sys/sysctl.h
  imsettings: Fix build with musl
  gedit: Define ACCESSPERMS if not defined already
  libgtop: Fix build with musl
  kexec-tools-klibc: Fix build with musl
  yaffs2-utils: Fix build with musl
  logfsprogs: Rename setkey API to _setkey to not conflict with libc
  metacity: Fix build with musl by defining _GNU_SOURCE
  monkey: Link in libexecinfo on musl
  iperf3: Fix missing stdint.h and do not link with -pg
  v4l-utils: Fix build with musl
  a2jmidid: Link with libexecinfo on musl
  php7: upgrade to 7.1.7
  fbida: Fix build with libjpeg-turbo
  libbonobo: Pass PERL_PATH to do_configure
  wvstreams: Fix build with musl
  wvstreams: Fix parallel build
  gedit: Fix with with hardening flags and clang
  libbonoboui: Fix with with hardening and clang
  glade: Fix format string warnings with clang
  freerdp: Fix build on mips
  sblim-sfcb: Add stdint.h for 'UINT16_MAX'
  sblim-sfcb: Fix build with musl
  corosync: Fix build with musl
  netkit-rwho: Fix build with musl
  netkit-tftp: Fix build with musl
  netkit-rpc: Fix build with hardening flags
  netkit-telnet: Fix build with hardening
  zeroconf: Fix build with musl
  openflow: Fix build with musl
  netkit-ftp: Include sys/types.h for u_long definition
  netkit-rpc: Link libtirpc on musl

Li Zhou (1):
  traceroute: Move manual pages from mandir to man8 under it

Martin Jansa (1):
  Revert "rrdtool: add gettext-native dependency"

Max Krummenacher (1):
  gpsd: don't compile with gold

Mikko Rapeli (3):
  udisks2_2.1.8.bb: set CVE_PRODUCT to udisks
  fribidi_0.19.7.bb: set CVE_PRODUCT to gnu_fribidi
  krb5_1.15.1.bb: set CVE_PRODUCT to kerberos

Ming Liu (2):
  xerces-c: fix a wrong PACKAGECONFIG option
  json-spirit: Add -latomic to LDFLAGS

Mingli Yu (2):
  netcat-openbsd: correct subdir for SRC_URI
  opensaf: Add -latomic to LDFLAGS

Pascal Bach (2):
  nginx: use consistent pid file location accross recipe and init
    scripts
  poco: make cmake packages relocatable

Qi.Chen@windriver.com (2):
  open-isns: fix QA issue
  dante: fix unknown-configure-option QA issue

Randy MacLeod (1):
  rrdtool: add gettext-native dependency

Ricardo Ribalda Delgado (2):
  meson: Suport for c++ cross-compilation
  meson: Use pkgconfig-native for the native tools

Stanley Cheong Kwan, Phoong (1):
  xstdcmap: Change libxmu from RDEPENDS -> DEPENDS and unblacklist
    xstdcmap

Stefano Babic (1):
  fbida: inherit pkgconfig and unblacklist

Tomas Novotny (1):
  ltrace: fix build failure under icecream

Wenlin Kang (1):
  net-snmp: supported cross compile for the perl embedded and perl
    modules

Yadi.hu (1):
  drbd-utils: fix dependency for perl under small-fs

Yi Zhao (1):
  python-pycrypto: Security fix CVE-2013-7459

Yusuke Mitsuki (1):
  uim: Modified the order of package definition.

Zhixiong Chi (1):
  mercurial: CVE-2017-9462

dengke.du@windriver.com (2):
  crash: fix build failure with mips
  php: fix install error for libphp*.so

fan.xin (1):
  wireshark: Upgrade to 2.2.7

jobol@nonadev.net (1):
  libmicrohttpd: Fix a segmentation fault on upgrade error

 ...ine-comparison_fn_t-for-non-glibc-systems.patch |   33 +
 .../lightmediascanner/lightmediascanner_0.5.1.bb   |    1 +
 ...-conflicts-with-libc-namespace-about-setk.patch |  135 ++
 .../logfsprogs/logfsprogs_git.bb                   |    3 +-
 ...0001-define-loff_t-if-not-already-defined.patch |   30 +
 .../recipes-filesystems/yaffs2/yaffs2-utils_git.bb |    3 +-
 .../recipes-support/fuse/fuse_2.9.4.bb             |    1 +
 ...node-qualify-functions-with-G_GNUC_PRINTF.patch |   49 +
 meta-gnome/recipes-gnome/bonobo/libbonobo.inc      |    1 +
 .../recipes-gnome/bonobo/libbonoboui_2.24.5.bb     |    4 +-
 ...-qualify-handle_builder_error-with-format.patch |   31 +
 ...ent-saver.c-Define-ACCESSPERMS-if-not-def.patch |   31 +
 meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb     |   12 +-
 .../gnome-bluetooth/gnome-bluetooth_3.18.2.bb      |    3 +-
 ...-Include-libc-net-headers-unconditionally.patch |   46 +
 meta-gnome/recipes-gnome/libgtop/libgtop_2.30.0.bb |    3 +
 .../metacity/0001-ui-Define-_GNU_SOURCE.patch      |   27 +
 .../recipes-gnome/metacity/metacity_2.34.13.bb     |    5 +-
 .../recipes-gnome/themes/gnome-themes_2.32.1.bb    |    6 +-
 ...vRTF.c-Specify-print-format-in-rtf_output.patch |   26 +
 meta-gnome/recipes-gnome/wv/wv_1.2.4.bb            |    3 +-
 ...ine-in_-structs-for-non-glibc-system-libs.patch |   85 +
 .../klibc-2.0.4/0001-always-use-bfd-linker.patch   |   30 +
 ...0001-dash-Specify-format-string-in-fmtstr.patch |   31 +
 .../0001-include-linux-sysinfo.h-directly.patch    |   32 +
 .../klibc-2.0.4/0001-mkfifo-Implement-mkfifo.patch |   29 +
 meta-initramfs/recipes-devtools/klibc/klibc.inc    |   35 +-
 .../recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb  |    1 +
 ...he-order-of-headers-to-fix-build-for-musl.patch |   30 +
 .../kexec/kexec-tools-klibc_2.0.2.bb               |    1 +
 ...ge-order-of-detecting-libegl-and-libgles2.patch |   32 +
 .../kodi-17/0013-FTPParse.cpp-use-std-string.patch |   96 +
 .../recipes-mediacenter/kodi/kodi_17.bb            |   11 +-
 .../caps/caps/append_ldflags.patch                 |   18 +
 .../recipes-multimedia/caps/caps_0.9.24.bb         |    1 +
 .../cdparanoia/cdparanoia_10.2.bb                  |    5 +-
 ...-for-null-buffer-before-trying-a-byteswap.patch |   31 +
 ...-utils-Use-c99-compiler-independent-types.patch |   49 +
 .../files/0002-Fix-printf-format-errors.patch      |   32 +
 .../recipes-multimedia/libdc1394/libdc1394_git.bb  |    5 +-
 ...error-line-and-live-without-file-type-det.patch |   28 +
 .../recipes-multimedia/sox/sox_14.4.0.bb           |    4 +-
 .../0001-Rename-conflicting-variable-mips.patch    |   73 +
 .../recipes-support/libsrtp/libsrtp_1.5.2.bb       |    4 +-
 .../samba/samba/glibc_only.patch                   |   15 +
 .../samba/samba/netdb_defines.patch                |   19 +
 .../recipes-connectivity/samba/samba_4.6.2.bb      |    2 +
 .../recipes-connectivity/snort/snort_2.9.7.5.bb    |   11 +
 ...format-and-silence-format-security-warnin.patch |   34 +
 .../recipes-connectivity/vlan/vlan_1.9.bb          |    6 +-
 .../iscsi-initiator-utils_2.0.874.bb               |    2 +
 .../recipes-daemons/opensaf/opensaf_5.2.0.bb       |    2 +
 ...licit-network-ctx-assignment-for-icmp-icm.patch |  323 ++++
 .../0002-proto-Add-some-exotic-ICMPv6-types.patch  |  147 ++
 ...oad-split-ll-proto-dependency-into-helper.patch |   62 +
 ...update-of-net-base-w.-meta-l4proto-icmpv6.patch |   65 +
 ...itch-implicit-dependencies-to-meta-l4prot.patch |   98 ++
 ...orce-ip-ip6-protocol-depending-on-icmp-or.patch |   84 +
 ...ch-implicit-dependencies-to-meta-l4proto-.patch |   86 +
 .../recipes-filter/nftables/nftables_0.7.bb        |    9 +
 .../0001-ftp-include-sys-types.h-for-u_long.patch  |   30 +
 .../recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb   |    7 +-
 .../0001-rpcgen-Fix-printf-formats.patch           |   51 +
 .../recipes-netkit/netkit-rpc/netkit-rpc_0.17.bb   |    8 +-
 ...001-Add-missing-include-path-to-I-options.patch |   46 +
 .../0002-Fix-build-issues-found-with-musl.patch    |   71 +
 .../recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb |    4 +-
 ...1-telnet-telnetd-Fix-print-format-strings.patch |   66 +
 .../netkit-telnet/netkit-telnet_0.17.bb            |   11 +-
 .../0001-tftp-Include-missing-fcntl.h.patch        |   27 +
 .../recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb |    7 +-
 .../recipes-protocols/dante/dante_1.4.1.bb         |    2 +-
 ...igure-fix-check-for-enable-perl-cc-checks.patch |   31 +
 .../0002-configure-fix-a-cc-check-issue.patch      |   30 +
 ...NGES-BUG-2712-Fix-Perl-module-compilation.patch |  186 ++
 .../0004-configure-fix-incorrect-variable.patch    |   30 +
 .../recipes-protocols/net-snmp/net-snmp_5.7.3.bb   |   55 +-
 .../recipes-protocols/nopoll/nopoll_0.4.2.b297.bb  |    2 +
 .../recipes-protocols/openflow/openflow.inc        |    3 +-
 ...use-strlcpy-from-libc-before-defining-own.patch |   64 +
 ...lib-netdev-Adjust-header-include-sequence.patch |   59 +
 .../recipes-protocols/openflow/openflow_git.bb     |    5 +
 ...name-arp_op-to-avoid-namespace-conflicts-.patch |   69 +
 .../recipes-protocols/zeroconf/zeroconf_0.9.bb     |    4 +-
 .../recipes-support/drbd/drbd-utils_8.9.6.bb       |    7 +-
 .../0001-ttcp-Add-printf-format-string.patch       |   34 +
 ...0002-sigd-Replace-on_exit-API-with-atexit.patch |   30 +
 ...p-old-hack-to-compile-with-very-old-glibc.patch |   37 +
 .../recipes-support/linux-atm/linux-atm_2.5.2.bb   |    3 +
 .../recipes-support/netcat/netcat-openbsd_1.105.bb |    2 +-
 .../recipes-support/open-isns/open-isns_0.97.bb    |    3 +-
 .../0001-Fix-build-with-format-string-checks.patch |   33 +
 ...src-ruli_addr.c-Add-missing-format-string.patch |   35 +
 meta-networking/recipes-support/ruli/ruli_0.36.bb  |    7 +-
 .../recipes-support/traceroute/traceroute_2.1.0.bb |    8 +-
 .../{wireshark_2.2.6.bb => wireshark_2.2.7.bb}     |    4 +-
 meta-oe/classes/gitver.bbclass                     |   47 +-
 meta-oe/classes/meson.bbclass                      |    2 +
 ...de-stdint.h-for-various-std-c99-int-types.patch |   39 +
 .../0002-Remove-pg-from-profile_CFLAGS.patch       |   31 +
 meta-oe/recipes-benchmark/iperf3/iperf3_git.bb     |   11 +-
 ...usl-define-guard-before-redefining-sockle.patch |   29 +
 .../0001-lat_http.c-Add-printf-format.patch        |   26 +
 ...t-CFLAGS-LDFLAGS-to-append-values-passed-.patch |   76 +
 .../recipes-benchmark/lmbench/lmbench_3.0-a9.bb    |   11 +-
 .../tinymembench/tinymembench_git.bb               |    4 +
 .../krb5/krb5/fix-CVE-2017-11368.patch             |  116 ++
 meta-oe/recipes-connectivity/krb5/krb5_1.15.1.bb   |    3 +
 .../recipes-connectivity/libmtp/libmtp_1.1.5.bb    |    3 -
 ...-include-sys-select.h-for-fd_-definitions.patch |   32 +-
 meta-oe/recipes-connectivity/libndp/libndp_1.6.bb  |    7 +-
 ...efine-64bit-atomic-helpers-for-ppc-32-bit.patch |   30 +
 .../0001-implement-64bit-atomic-for-mips.patch     |  263 +++
 .../libtorrent/libtorrent_git.bb                   |    6 +-
 .../0001-Add-format-string-to-fprintf-call.patch   |   26 +
 ...ependency-to-support-parallel-compilation.patch |   23 +
 meta-oe/recipes-connectivity/umip/files/mip6d      |  112 ++
 .../recipes-connectivity/umip/files/mip6d.service  |   10 +
 meta-oe/recipes-connectivity/umip/umip_1.0.bb      |   28 +-
 meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb |    4 +-
 .../0001-Check-for-limits.h-during-configure.patch |   26 +
 .../wvstreams/0001-build-fix-parallel-make.patch   |   76 +
 .../0002-wvrules.mk-Use-_DEFAULT_SOURCE.patch      |   29 +
 ...sk-Dont-use-ucontext-on-non-glibc-systems.patch |  135 ++
 ...k-for-HAVE_LIBC_STACK_END-only-on-glibc-s.patch |   27 +
 .../0004-wvcrash-Replace-use-of-basename-API.patch |   28 +
 ...05-check-for-libexecinfo-during-configure.patch |   30 +
 .../wvdial/wvstreams/argp.patch                    |   37 +
 .../wvdial/wvstreams/gcc-6.patch                   |   42 +
 .../recipes-connectivity/wvdial/wvstreams_4.6.1.bb |   17 +-
 .../0001-pipe.c-Use-a-string-instead-of-char.patch |   27 +
 meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb     |   21 +-
 ...C_PRINTF-on-functions-with-format-strings.patch |   62 +
 meta-oe/recipes-devtools/glade/glade3_3.8.5.bb     |   10 +-
 .../json-spirit/json-spirit_4.08.bb                |    2 +
 .../recipes-devtools/libfribidi/fribidi_0.19.7.bb  |    2 +
 .../0001-Add-support-for-mips64-n32-n64.patch      | 1148 ++++++++++++
 .../0001-Fix-tautological-compare-warning.patch    |  261 +++
 ...nfigure-Recognise-linux-musl-as-a-host-OS.patch |   25 +
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb      |    3 +
 .../mercurial/files/mercurial-CVE-2017-9462.patch  |  135 ++
 .../mercurial/mercurial-native_4.0.1.bb            |    4 +-
 .../meson/meson/native_bindir.patch                |   52 +
 meta-oe/recipes-devtools/meson/meson_0.37.1.bb     |    5 +-
 .../php/php-5.6.26/0001-Add-lpthread-to-link.patch |   38 +
 .../php-7.1.7/0001-Specify-tag-with-libtool.patch  |   62 +
 .../change-AC_TRY_RUN-to-AC_TRY_LINK.patch         |    0
 meta-oe/recipes-devtools/php/php.inc               |   18 +-
 meta-oe/recipes-devtools/php/php/70_mod_php7.conf  |    9 +
 meta-oe/recipes-devtools/php/php_5.6.26.bb         |    1 +
 .../php/{php_7.1.0.bb => php_7.1.7.bb}             |   10 +-
 .../recipes-devtools/xerces-c/xerces-c_3.1.4.bb    |    4 +-
 ...001-Include-fcntl.h-for-F_-and-O_-defines.patch |   28 +
 .../recipes-extended/corosync/corosync_2.4.2.bb    |   28 +-
 .../libexecinfo/libexecinfo_1.1.bb                 |    1 +
 ...e-need-for-error.h-when-it-does-not-exist.patch |  124 ++
 ...ude-stdint.h-system-header-for-UINT16_MAX.patch |   29 +
 .../sblim-sfcb/sblim-sfcb_1.4.9.bb                 |    5 +-
 meta-oe/recipes-graphics/fbida/fbida_2.10.bb       |    9 +-
 .../fbida/files/fix-preprocessor.patch             |   14 +
 .../fbida/files/support-jpeg-turbo.patch           | 1854 ++++++++++++++++++++
 .../fbida/files/use-jpeg-turbo.patch               |   13 +
 .../0001-Include-stdlib.h-for-exit-API.patch       |   34 +
 .../0002-timing.c-Fix-format-security-errors.patch |   42 +
 meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb   |    5 +-
 .../recipes-graphics/xorg-app/xstdcmap_1.0.3.bb    |    3 +-
 .../0004-crash-fix-build-failure-with-mips.patch   |   87 +
 meta-oe/recipes-kernel/crash/crash_7.1.8.bb        |    2 +
 ...e-Add-proper-format-string-to-print-a-str.patch |   35 +
 .../makedumpfile/makedumpfile_1.6.1.bb             |    7 +-
 .../audiofile/audiofile_0.3.6.bb                   |    2 +-
 meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb |    8 +-
 ...001-genisoimage-Fix-fprintf-format-errors.patch |   49 +
 meta-oe/recipes-multimedia/jack/a2jmidid_8.bb      |    3 +
 ...tl-Define-TEMP_FAILURE_RETRY-if-undefined.patch |   55 +
 ...t-Link-mc_nextgen_test-with-libargp-if-ne.patch |   28 +
 .../0003-v4l2-ctl-Do-not-use-getsubopt.patch       |   49 +
 .../v4l2apps/v4l-utils_1.12.3.bb                   |    5 +-
 meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb       |    2 +
 .../orrery/0001-orrery-Fix-sprintf-format.patch    |   26 +
 meta-oe/recipes-navigation/orrery/orrery_2.7.bb    |    3 +-
 .../freerdp/freerdp/0003-add-missing-define.patch  |   45 +
 meta-oe/recipes-support/freerdp/freerdp_git.bb     |    1 +
 .../gd/gd/.gitignore-the-new-test-case.patch       |   24 +
 .../recipes-support/gd/gd/CVE-2016-6906-1.patch    |  167 ++
 .../recipes-support/gd/gd/CVE-2016-6906-2.patch    |  135 ++
 .../gd/gd/Fix-290-TGA-RLE-decoding-is-broken.patch |  359 ++++
 meta-oe/recipes-support/gd/gd_2.2.3.bb             |   19 +-
 meta-oe/recipes-support/gflags/gflags_2.2.0.bb     |    9 +-
 ...Use-ucontext_t-instead-of-struct-ucontext.patch |   36 +
 .../recipes-support/gperftools/gperftools_2.5.bb   |    3 +-
 .../Check-response-existence-on-upgrade.patch      |   49 +
 .../libmicrohttpd/libmicrohttpd_0.9.53.bb          |    3 +
 .../libsdl-ttf/files/automake_foreign.patch        |   13 +
 .../libsdl-ttf/libsdl2-ttf_2.0.14.bb               |   11 +-
 ...-ts-create-share-library-intead-of-static.patch |   26 +
 .../opencv/0001-To-fix-errors-as-following.patch   |   53 +
 ...cking-make-opencv_dnn-dependancy-optional.patch |  243 +++
 meta-oe/recipes-support/opencv/opencv_3.2.bb       |    5 +-
 .../openipmi/files/include_sys_types.patch         |   17 +
 .../recipes-support/openipmi/openipmi_2.0.22.bb    |    1 +
 .../recipes-support/openldap/openldap_2.4.44.bb    |    2 +-
 meta-oe/recipes-support/poco/poco_1.7.8.bb         |   11 +-
 ...c-Fix-format-not-a-string-literal-warning.patch |   32 +
 meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb    |    8 +-
 .../srecord/files/add-option-to-remove-docs.patch  |   57 +
 meta-oe/recipes-support/srecord/srecord_1.64.bb    |   23 +
 meta-oe/recipes-support/synergy/synergy_git.bb     |    2 +-
 meta-oe/recipes-support/tbb/tbb.bb                 |    1 +
 meta-oe/recipes-support/udisks/udisks2_2.1.7.bb    |    2 +
 .../uim/uim/0001-Add-support-for-aarch64.patch     |   82 +
 meta-oe/recipes-support/uim/uim_1.8.6.bb           |    3 +-
 .../0001-makefile-Pass-CFLAGS-to-compile.patch     |   26 +
 .../0002-fix-err-API-to-have-format-string.patch   |  656 +++++++
 meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb |    5 +-
 meta-perl/recipes-perl/adduser/adduser_3.115.bb    |    3 +-
 .../recipes-perl/libnet/libnet-libidn-perl_0.12.bb |    2 +-
 .../recipes-perl/libtext/libtext-iconv-perl_1.7.bb |    2 +-
 ...-define-this-function-differently-than-it.patch |   30 +
 .../recipes-devtools/python/python-numeric_24.2.bb |    4 +-
 .../python/python-pycrypto/CVE-2013-7459.patch     |   98 ++
 .../python/python-pycrypto_2.6.1.bb                |    4 +-
 .../python/python-pyudev_0.21.0.bb                 |    2 +-
 ...-configure-Respect-LIBS-variable-from-env.patch |   29 +
 .../recipes-httpd/monkey/monkey_1.5.6.bb           |    9 +
 .../recipes-httpd/nginx/files/nginx.init           |    2 +-
 meta-webserver/recipes-php/xdebug/xdebug_2.5.1.bb  |    4 +-
 .../0001-Rename-use-of-stdout-and-stderr.patch     |   72 +
 .../imsettings/imsettings_1.7.1.bb                 |    4 +-
 ...ude-sys-sysctl.h-its-unused-on-linux-port.patch |   25 +
 .../netload/xfce4-netload-plugin_1.3.1.bb          |    3 +
 231 files changed, 11184 insertions(+), 225 deletions(-)
 create mode 100644 meta-efl/recipes-multimedia/lightmediascanner/files/0001-Define-comparison_fn_t-for-non-glibc-systems.patch
 create mode 100644 meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs/0001-btree-Avoid-conflicts-with-libc-namespace-about-setk.patch
 create mode 100644 meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/0001-define-loff_t-if-not-already-defined.patch
 create mode 100644 meta-gnome/recipes-gnome/bonobo/files/0001-bonobo-ui-node-qualify-functions-with-G_GNUC_PRINTF.patch
 create mode 100644 meta-gnome/recipes-gnome/gedit/files/0001-gedit-utils-qualify-handle_builder_error-with-format.patch
 create mode 100644 meta-gnome/recipes-gnome/gedit/files/0001-tests-document-saver.c-Define-ACCESSPERMS-if-not-def.patch
 create mode 100644 meta-gnome/recipes-gnome/libgtop/libgtop/0001-netload-Include-libc-net-headers-unconditionally.patch
 create mode 100644 meta-gnome/recipes-gnome/metacity/metacity/0001-ui-Define-_GNU_SOURCE.patch
 create mode 100644 meta-gnome/recipes-gnome/wv/wv-1.2.4/0001-wvRTF.c-Specify-print-format-in-rtf_output.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Define-in_-structs-for-non-glibc-system-libs.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-always-use-bfd-linker.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-dash-Specify-format-string-in-fmtstr.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-include-linux-sysinfo.h-directly.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-mkfifo-Implement-mkfifo.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/0001-Adjust-the-order-of-headers-to-fix-build-for-musl.patch
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-17/0001-change-order-of-detecting-libegl-and-libgles2.patch
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-17/0013-FTPParse.cpp-use-std-string.patch
 create mode 100644 meta-multimedia/recipes-multimedia/caps/caps/append_ldflags.patch
 create mode 100644 meta-multimedia/recipes-multimedia/cdparanoia/files/0001-check-for-null-buffer-before-trying-a-byteswap.patch
 create mode 100644 meta-multimedia/recipes-multimedia/cdparanoia/files/0001-utils-Use-c99-compiler-independent-types.patch
 create mode 100644 meta-multimedia/recipes-multimedia/cdparanoia/files/0002-Fix-printf-format-errors.patch
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/0001-remove-the-error-line-and-live-without-file-type-det.patch
 create mode 100644 meta-multimedia/recipes-support/libsrtp/libsrtp/0001-Rename-conflicting-variable-mips.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/glibc_only.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/netdb_defines.patch
 create mode 100644 meta-networking/recipes-connectivity/vlan/vlan-1.9/0001-Add-printf-format-and-silence-format-security-warnin.patch
 create mode 100644 meta-networking/recipes-filter/nftables/files/0001-payload-explicit-network-ctx-assignment-for-icmp-icm.patch
 create mode 100644 meta-networking/recipes-filter/nftables/files/0002-proto-Add-some-exotic-ICMPv6-types.patch
 create mode 100644 meta-networking/recipes-filter/nftables/files/0003-payload-split-ll-proto-dependency-into-helper.patch
 create mode 100644 meta-networking/recipes-filter/nftables/files/0004-src-allow-update-of-net-base-w.-meta-l4proto-icmpv6.patch
 create mode 100644 meta-networking/recipes-filter/nftables/files/0005-src-ipv6-switch-implicit-dependencies-to-meta-l4prot.patch
 create mode 100644 meta-networking/recipes-filter/nftables/files/0006-payload-enforce-ip-ip6-protocol-depending-on-icmp-or.patch
 create mode 100644 meta-networking/recipes-filter/nftables/files/0007-src-ip-switch-implicit-dependencies-to-meta-l4proto-.patch
 create mode 100644 meta-networking/recipes-netkit/netkit-ftp/netkit-ftp/0001-ftp-include-sys-types.h-for-u_long.patch
 create mode 100644 meta-networking/recipes-netkit/netkit-rpc/netkit-rpc/0001-rpcgen-Fix-printf-formats.patch
 create mode 100644 meta-networking/recipes-netkit/netkit-rwho/netkit-rwho/0001-Add-missing-include-path-to-I-options.patch
 create mode 100644 meta-networking/recipes-netkit/netkit-rwho/netkit-rwho/0002-Fix-build-issues-found-with-musl.patch
 create mode 100644 meta-networking/recipes-netkit/netkit-telnet/files/0001-telnet-telnetd-Fix-print-format-strings.patch
 create mode 100644 meta-networking/recipes-netkit/netkit-tftp/netkit-tftp/0001-tftp-Include-missing-fcntl.h.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-configure-fix-check-for-enable-perl-cc-checks.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0002-configure-fix-a-cc-check-issue.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0003-CHANGES-BUG-2712-Fix-Perl-module-compilation.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0004-configure-fix-incorrect-variable.patch
 create mode 100644 meta-networking/recipes-protocols/openflow/openflow/0001-Check-and-use-strlcpy-from-libc-before-defining-own.patch
 create mode 100644 meta-networking/recipes-protocols/openflow/openflow/0002-lib-netdev-Adjust-header-include-sequence.patch
 create mode 100644 meta-networking/recipes-protocols/zeroconf/zeroconf/0001-zeroconf-Rename-arp_op-to-avoid-namespace-conflicts-.patch
 create mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/0001-ttcp-Add-printf-format-string.patch
 create mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/0002-sigd-Replace-on_exit-API-with-atexit.patch
 create mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/0003-mpoad-Drop-old-hack-to-compile-with-very-old-glibc.patch
 create mode 100644 meta-networking/recipes-support/ruli/files/0001-Fix-build-with-format-string-checks.patch
 create mode 100644 meta-networking/recipes-support/ruli/files/0001-src-ruli_addr.c-Add-missing-format-string.patch
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.6.bb => wireshark_2.2.7.bb} (95%)
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/0001-include-stdint.h-for-various-std-c99-int-types.patch
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/0002-Remove-pg-from-profile_CFLAGS.patch
 create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-Check-for-musl-define-guard-before-redefining-sockle.patch
 create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-lat_http.c-Add-printf-format.patch
 create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0002-build-Adjust-CFLAGS-LDFLAGS-to-append-values-passed-.patch
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/fix-CVE-2017-11368.patch
 create mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-Define-64bit-atomic-helpers-for-ppc-32-bit.patch
 create mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-implement-64bit-atomic-for-mips.patch
 create mode 100644 meta-oe/recipes-connectivity/umip/files/0001-Add-format-string-to-fprintf-call.patch
 create mode 100644 meta-oe/recipes-connectivity/umip/files/add-dependency-to-support-parallel-compilation.patch
 create mode 100755 meta-oe/recipes-connectivity/umip/files/mip6d
 create mode 100644 meta-oe/recipes-connectivity/umip/files/mip6d.service
 create mode 100644 meta-oe/recipes-connectivity/wvdial/wvstreams/0001-Check-for-limits.h-during-configure.patch
 create mode 100644 meta-oe/recipes-connectivity/wvdial/wvstreams/0001-build-fix-parallel-make.patch
 create mode 100644 meta-oe/recipes-connectivity/wvdial/wvstreams/0002-wvrules.mk-Use-_DEFAULT_SOURCE.patch
 create mode 100644 meta-oe/recipes-connectivity/wvdial/wvstreams/0002-wvtask-Dont-use-ucontext-on-non-glibc-systems.patch
 create mode 100644 meta-oe/recipes-connectivity/wvdial/wvstreams/0003-wvtask-Check-for-HAVE_LIBC_STACK_END-only-on-glibc-s.patch
 create mode 100644 meta-oe/recipes-connectivity/wvdial/wvstreams/0004-wvcrash-Replace-use-of-basename-API.patch
 create mode 100644 meta-oe/recipes-connectivity/wvdial/wvstreams/0005-check-for-libexecinfo-during-configure.patch
 create mode 100644 meta-oe/recipes-connectivity/wvdial/wvstreams/argp.patch
 create mode 100644 meta-oe/recipes-connectivity/wvdial/wvstreams/gcc-6.patch
 create mode 100644 meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0001-pipe.c-Use-a-string-instead-of-char.patch
 create mode 100644 meta-oe/recipes-devtools/glade/glade3/0001-Add-G_GNUC_PRINTF-on-functions-with-format-strings.patch
 create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-Add-support-for-mips64-n32-n64.patch
 create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-Fix-tautological-compare-warning.patch
 create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-configure-Recognise-linux-musl-as-a-host-OS.patch
 create mode 100644 meta-oe/recipes-devtools/mercurial/files/mercurial-CVE-2017-9462.patch
 create mode 100644 meta-oe/recipes-devtools/meson/meson/native_bindir.patch
 create mode 100644 meta-oe/recipes-devtools/php/php-5.6.26/0001-Add-lpthread-to-link.patch
 create mode 100644 meta-oe/recipes-devtools/php/php-7.1.7/0001-Specify-tag-with-libtool.patch
 rename meta-oe/recipes-devtools/php/{php-7.1.0 => php-7.1.7}/change-AC_TRY_RUN-to-AC_TRY_LINK.patch (100%)
 create mode 100644 meta-oe/recipes-devtools/php/php/70_mod_php7.conf
 rename meta-oe/recipes-devtools/php/{php_7.1.0.bb => php_7.1.7.bb} (49%)
 create mode 100644 meta-oe/recipes-extended/corosync/corosync/0001-Include-fcntl.h-for-F_-and-O_-defines.patch
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/0001-Replace-need-for-error.h-when-it-does-not-exist.patch
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/0001-include-stdint.h-system-header-for-UINT16_MAX.patch
 create mode 100644 meta-oe/recipes-graphics/fbida/files/fix-preprocessor.patch
 create mode 100644 meta-oe/recipes-graphics/fbida/files/support-jpeg-turbo.patch
 create mode 100644 meta-oe/recipes-graphics/fbida/files/use-jpeg-turbo.patch
 create mode 100644 meta-oe/recipes-graphics/gtkperf/gtkperf/0001-Include-stdlib.h-for-exit-API.patch
 create mode 100644 meta-oe/recipes-graphics/gtkperf/gtkperf/0002-timing.c-Fix-format-security-errors.patch
 create mode 100644 meta-oe/recipes-kernel/crash/crash/0004-crash-fix-build-failure-with-mips.patch
 create mode 100644 meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-Add-proper-format-string-to-print-a-str.patch
 create mode 100644 meta-oe/recipes-multimedia/cdrkit/files/0001-genisoimage-Fix-fprintf-format-errors.patch
 create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-ir-ctl-Define-TEMP_FAILURE_RETRY-if-undefined.patch
 create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-contrib-test-Link-mc_nextgen_test-with-libargp-if-ne.patch
 create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0003-v4l2-ctl-Do-not-use-getsubopt.patch
 create mode 100644 meta-oe/recipes-navigation/orrery/orrery/0001-orrery-Fix-sprintf-format.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/0003-add-missing-define.patch
 create mode 100644 meta-oe/recipes-support/gd/gd/.gitignore-the-new-test-case.patch
 create mode 100644 meta-oe/recipes-support/gd/gd/CVE-2016-6906-1.patch
 create mode 100644 meta-oe/recipes-support/gd/gd/CVE-2016-6906-2.patch
 create mode 100644 meta-oe/recipes-support/gd/gd/Fix-290-TGA-RLE-decoding-is-broken.patch
 create mode 100644 meta-oe/recipes-support/gperftools/gperftools/0001-Use-ucontext_t-instead-of-struct-ucontext.patch
 create mode 100644 meta-oe/recipes-support/libmicrohttpd/libmicrohttpd/Check-response-existence-on-upgrade.patch
 create mode 100644 meta-oe/recipes-support/libsdl-ttf/files/automake_foreign.patch
 create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-Make-opencv-ts-create-share-library-intead-of-static.patch
 create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-To-fix-errors-as-following.patch
 create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-tracking-make-opencv_dnn-dependancy-optional.patch
 create mode 100644 meta-oe/recipes-support/openipmi/files/include_sys_types.patch
 create mode 100644 meta-oe/recipes-support/sqlite/sqlite-2.8.17/0001-shell.c-Fix-format-not-a-string-literal-warning.patch
 create mode 100644 meta-oe/recipes-support/srecord/files/add-option-to-remove-docs.patch
 create mode 100644 meta-oe/recipes-support/srecord/srecord_1.64.bb
 create mode 100644 meta-oe/recipes-support/uim/uim/0001-Add-support-for-aarch64.patch
 create mode 100644 meta-oe/recipes-support/wmiconfig/wmiconfig/0001-makefile-Pass-CFLAGS-to-compile.patch
 create mode 100644 meta-oe/recipes-support/wmiconfig/wmiconfig/0002-fix-err-API-to-have-format-string.patch
 create mode 100644 meta-python/recipes-devtools/python/python-numeric/0001-it-tries-to-define-this-function-differently-than-it.patch
 create mode 100644 meta-python/recipes-devtools/python/python-pycrypto/CVE-2013-7459.patch
 create mode 100644 meta-webserver/recipes-httpd/monkey/files/0001-configure-Respect-LIBS-variable-from-env.patch
 mode change 100755 => 100644 meta-webserver/recipes-httpd/nginx/files/nginx.init
 create mode 100644 meta-xfce/recipes-extended/imsettings/imsettings/0001-Rename-use-of-stdout-and-stderr.patch
 create mode 100644 meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin/0001-Do-not-include-sys-sysctl.h-its-unused-on-linux-port.patch

-- 
2.7.4


