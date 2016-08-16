Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 61A7460123
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 17:47:07 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id vy10so5575213pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 10:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/jLo0CeTcKUHoMn5b5wlFwPsRF0/YL2V6Zt1sM30bM4=;
	b=B7nTsLsVSacMmkwLszv2TgpCMpa9qpQrWB1Hj/2beTB2pTcFe1tL+zVCSnqHpJEB5w
	2KO7Ir3DTFmjchG0kKfUF/ottzJYhbE4XfD+/OpiKgr/yWUJCCoj46U4CrXlgCHikq8H
	dv/ufyKComw5DWnMY97QkhVl8/V40cglnJri+cSZT1CvpmheyUgHOAy26hWoKQ56g6Kh
	FxNptLDRaY/uIBBZKliAMzM7WHlw0VhNnIL8qhrBSK7c2svYVzNh8Qxb9REnPv4Rp+KN
	4t2CEqdTT5Zu9wRCSRyhxrwRLxuzRIDyrtwN22bnmZqEtcA9TR+aPEcDhBHYONc4Xod+
	hDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/jLo0CeTcKUHoMn5b5wlFwPsRF0/YL2V6Zt1sM30bM4=;
	b=YaYXERWDjm398TORtcH3+M8BIuAt4t8TgjbVE+yr7zbadGEPLq5OS3qMjyf8X5znQO
	2q6LOxAP2egRcPr8VY1k90+PPjUdEEFCGQo+6Nmlf7vkFnVrKrz4KiG4ggtIlSZBf0eU
	vdunV8Rlb3tBEVSgPj9C/4Afaan+AbE7WKFdtclUOB+4hspjSJ294ogXfpIWhRkln8ko
	XpyK0/tHpXvxIGYFnmZ62/p+uxYTYG4+kjVHWfa7KeGs6BUlAbN8ktnAdpmt5qncQR6K
	uJoBMImCvhJ41EnPcGxqqCH1oZybzzRd62RhRMXtJuSziJuWt1bJW+OPj9JwsFpsKDPX
	AN3w==
X-Gm-Message-State: AEkoousLmtb+RRMuhncFd8e8pYXQv3YHvQMevLb2WA1cnQpdaKrh/EKcWCls8lLcgsU47Q==
X-Received: by 10.66.57.7 with SMTP id e7mr11813paq.101.1471369627925;
	Tue, 16 Aug 2016 10:47:07 -0700 (PDT)
Received: from Pahoa2.mvista.com ([50.233.148.156])
	by smtp.gmail.com with ESMTPSA id
	f6sm40890410pfa.17.2016.08.16.10.47.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Aug 2016 10:47:06 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Tue, 16 Aug 2016 10:46:04 -0700
Message-Id: <cover.1471369390.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
MIME-Version: 1.0
Subject: [PATCH 00/60] krogoth-next pull request
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
X-List-Received-Date: Tue, 16 Aug 2016 17:47:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please consider these changes for krogoth-next

Some packages where updated as they are bug/cve fixes. Noted in the commits.

multipath-tool: fix fetch error only affected krogoth. Did not see error on master.

dropped a few gcc6 fixes per Koon feedback.


The following changes since commit 6c02b9e3e78623dbeb858ba9a6d7bf588cbda8d9:

  breakpad: disable ppc from being built. (2016-08-10 13:42:14 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib akuster/krogoth-next
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=akuster/krogoth-next

Andre McCurdy (1):
  ntp: avoid floating dependency on mdns (aka mDNSResponder)

Andreas Müller (1):
  fontforge: add back gnulib to DEPENDS

Armin Kuster (10):
  python-numeric: Add LLNL license
  libxkbui: Fix license WARNING
  pytest: fix runtime issues.
  uim: Fix Warning
  netkit-rsh: fix build issue.
  dvd-apps: Fix several QA WARNINGS
  gnome-menus: Fix QA warnings.
  wireshark: update package to 2.0.3
  wireshark: update to 2.0.4
  multipath-tool: fix fetch error

Catalin Enache (1):
  squid: CVE-2016-4553

Christopher Larson (8):
  openlmi-networking: add missing dep on konkretcmpi-native
  networkmanager: add missing dep on intltool-native
  networkmanager: add missing dep on dbus-glib-native
  x11vnc: remove old libtool macros from acinclude.m4
  luajit: fix build issues, obey more vars
  plymouth: allow disabling the dracut dep
  vboxguestdrivers: obey LDFLAGS
  libebml: don't rely on make -e, obey LDFLAGS

Dai Caiyun (4):
  iptraf: Fix rootfs creation errors
  openct: Fix rootfs creation errors
  postfix: Fix rootfs creation errors
  esmtp: Fix rootfs creation errors

Daniel McGregor (1):
  krb5: fix uninitialized variable warning

Derek Straka (9):
  geos: use std::isnan to support gcc6
  tcsh: fix the wait definition to support gcc6
  fbreader: add cflags fix for fribidi 0.19.7
  fbreader: fix return code issue on gcc6
  curlpp: fix build with gcc-6 and remove blacklist
  iperf: resolve issues with gcc6
  faac: address gcc-6 narrowing errors via an explicit cast
  evince: fix build errors with gcc-6
  apache2: update to version 2.4.23

Dmitry Rozhkov (1):
  libxfce4ui: Use native intltool for building the lib

Frederico Cadete (2):
  efl e-module.inc: fix fetching in multi-lib configs
  gtest: fix installation in multilib

Hongxu Jia (1):
  x11vnc: remove redundant RPATH to fix QA issue

Jackie Huang (4):
  net-snmp: fix snmpd crash via AgentX connection
  php: update to 5.5.37 and 5.6.23
  libssh: upgrade to 0.7.3
  libssh2: upgrade to 1.7.0

Joe Slater (1):
  openconnect: PACKAGECONFIG certain dependencies

Jonathan Liu (4):
  libtevent: add missing libaio dependency
  libtdb: add missing libaio dependency
  libtalloc: add missing libaio dependency
  libldb: add missing libaio dependency

Kai Kang (1):
  mariadb: upgrade to 5.5.50

Khem Raj (1):
  initramfs-kexecboot-klibc-image: Skip for nios2

Kirill Esipov (1):
  apache2: fix libtool's path in apxs

Li Wang (1):
  net-snmp: initscripts are located in net-snmp-server-snmp package

Robert Yang (1):
  rrdtool: only unset PERLHOSTLIB in do_configure

Ross Burton (1):
  llvm: make llvm-config wrapper error message more understandable

S. Lockwood-Childs (1):
  cifs-utils: make samba conditional dependency

Shrikant Bobade (1):
  netcat-openbsd: fix qa warning

Vesa Jääskeläinen (1):
  nano: fix license to GPLv3.

Yi Zhao (1):
  gtksourceview2: fix build with gcc6

fan.xin (1):
  ntp: Security fixes via Upgrade to 4.2.8p8

mingli.yu@windriver.com (1):
  collectd: replace deprecated readdir_r() with readdir()

 meta-efl/recipes-efl/e17/e-module.inc              |  2 +-
 .../evince/evince/0002-fix-gcc6-errors.patch       | 39 ++++++++++
 meta-gnome/recipes-gnome/evince/evince_3.18.2.bb   |  4 +-
 .../gnome-menus/gnome-menus_2.30.5.bb              | 15 ++--
 .../suppress-string-format-literal-warning.patch   | 33 +++++++++
 .../gtksourceview/gtksourceview2_2.10.5.bb         |  1 +
 .../fbreader-0.12.10/fix-cflags-fribidi.patch      | 11 +++
 .../fbreader-0.12.10/fix-return-code-gcc6.patch    | 11 +++
 .../recipes-support/fbreader/fbreader_0.12.10.bb   |  4 +-
 .../images/initramfs-kexecboot-klibc-image.bb      |  6 ++
 .../recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb         | 10 +++
 .../recipes-mkv/libebml/libebml/ldflags.patch      | 57 ++++++++++++++
 .../libebml/libebml/override-uname.patch           | 42 +++++++++++
 .../recipes-mkv/libebml/libebml_1.3.0.bb           | 44 +++++++++--
 .../recipes-multimedia/faac/faac_1.28.bb           |  5 +-
 .../files/address-gcc-6-narrowing-errors.patch     | 47 ++++++++++++
 .../openconnect/openconnect_git.bb                 | 13 +++-
 .../recipes-daemons/postfix/postfix.inc            |  5 ++
 .../squid/files/CVE-2016-4553.patch                | 51 +++++++++++++
 .../recipes-daemons/squid/squid_3.5.7.bb           |  1 +
 .../netkit-rsh/fixup_wait3_api_change.patch        | 34 +++++++++
 .../recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb   |  1 +
 .../net-snmp/net-snmp/net-snmp-agentx-crash.patch  | 75 +++++++++++++++++++
 .../recipes-protocols/net-snmp/net-snmp_5.7.3.bb   |  7 +-
 .../recipes-support/cifs/cifs-utils_git.bb         |  4 +-
 .../recipes-support/curlpp/curlpp_0.7.3.bb         |  4 +
 meta-networking/recipes-support/esmtp/esmtp_1.2.bb |  5 ++
 .../recipes-support/libldb/libldb_1.1.26.bb        |  2 +-
 .../recipes-support/libtalloc/libtalloc_2.1.6.bb   |  2 +-
 .../recipes-support/libtdb/libtdb_1.3.8.bb         |  2 +
 .../recipes-support/libtevent/libtevent_0.9.28.bb  |  2 +-
 .../recipes-support/netcat/netcat-openbsd_1.105.bb |  2 +
 .../ntp/{ntp_4.2.8p7.bb => ntp_4.2.8p8.bb}         |  5 +-
 .../{wireshark_2.0.2.bb => wireshark_2.0.4.bb}     |  4 +-
 .../iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch  | 16 ++++
 meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb     |  1 +
 ...-around-uninitialized-warning-in-cc_kcm.c.patch | 37 ++++++++++
 meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb   |  1 +
 .../networkmanager/networkmanager_1.0.10.bb        |  2 +-
 meta-oe/recipes-core/llvm/llvm-common/llvm-config  |  7 +-
 meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb    | 18 +++--
 meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb    |  4 +
 meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb    | 56 ++++++++++----
 .../change-AC_TRY_RUN-to-AC_TRY_LINK.patch         |  0
 meta-oe/recipes-devtools/php/php_5.5.32.bb         |  6 --
 meta-oe/recipes-devtools/php/php_5.5.37.bb         |  6 ++
 .../php/{php_5.6.18.bb => php_5.6.23.bb}           |  4 +-
 ...replace-deprecated-readdir_r-with-readdir.patch | 66 +++++++++++++++++
 .../recipes-extended/collectd/collectd_5.5.0.bb    |  1 +
 .../openlmi/openlmi-networking_0.3.1.bb            |  2 +-
 meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb  |  2 +-
 .../tcsh/files/fix-gcc6-wait-union.patch           | 11 +++
 meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb      | 10 ++-
 .../fontforge/fontforge_20150824.bb                |  2 +-
 .../x11vnc/files/remove-redundant-RPATH.patch      | 86 ++++++++++++++++++++++
 meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb   | 10 ++-
 .../recipes-graphics/xorg-lib/libxkbui_1.0.2.bb    |  2 +-
 .../geos/files/fix-gcc6-isnan.patch                | 22 ++++++
 meta-oe/recipes-navigation/geos/geos_3.4.2.bb      |  3 +-
 .../libssh/{libssh_0.7.1.bb => libssh_0.7.3.bb}    |  2 +-
 .../libssh2/{libssh2_1.6.0.bb => libssh2_1.7.0.bb} |  4 +-
 .../multipath-tools/multipath-tools_git.bb         |  2 +-
 ...b-native_5.5.46.bb => mariadb-native_5.5.50.bb} |  0
 meta-oe/recipes-support/mysql/mariadb.inc          |  5 +-
 .../mysql/{mariadb_5.5.46.bb => mariadb_5.5.50.bb} |  0
 meta-oe/recipes-support/nano/nano.inc              |  2 +-
 meta-oe/recipes-support/openct/openct_0.6.20.bb    |  3 +
 meta-oe/recipes-support/uim/uim_1.8.6.bb           |  2 +-
 .../vboxguestdrivers/vboxguestdrivers_4.3.36.bb    |  2 +-
 ...install-command-for-libraries-and-headers.patch | 32 ++++++++
 ...test.pc.in-Add-pkg-config-support-to-gte.patch} | 24 +++---
 ...install-command-for-libraries-and-headers.patch | 39 ----------
 meta-oe/recipes-test/gtest/gtest_1.7.0.bb          |  4 +-
 meta-python/licenses/LLNL                          | 16 ++++
 .../recipes-devtools/python/python-pytest_2.9.1.bb |  2 +-
 ...2-native_2.4.20.bb => apache2-native_2.4.23.bb} |  4 +-
 .../{apache2_2.4.20.bb => apache2_2.4.23.bb}       |  6 +-
 .../recipes-xfce/libxfce4ui/libxfce4ui_4.12.1.bb   |  2 +-
 78 files changed, 937 insertions(+), 139 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/evince/evince/0002-fix-gcc6-errors.patch
 create mode 100644 meta-gnome/recipes-gnome/gtksourceview/gtksourceview2/suppress-string-format-literal-warning.patch
 create mode 100644 meta-gpe/recipes-support/fbreader/fbreader-0.12.10/fix-cflags-fribidi.patch
 create mode 100644 meta-gpe/recipes-support/fbreader/fbreader-0.12.10/fix-return-code-gcc6.patch
 create mode 100644 meta-multimedia/recipes-mkv/libebml/libebml/ldflags.patch
 create mode 100644 meta-multimedia/recipes-mkv/libebml/libebml/override-uname.patch
 create mode 100644 meta-multimedia/recipes-multimedia/faac/files/address-gcc-6-narrowing-errors.patch
 create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-2016-4553.patch
 create mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/fixup_wait3_api_change.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-agentx-crash.patch
 rename meta-networking/recipes-support/ntp/{ntp_4.2.8p7.bb => ntp_4.2.8p8.bb} (96%)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.0.2.bb => wireshark_2.0.4.bb} (94%)
 create mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.5/0002-fix-bool-size-m4.patch
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/0001-Work-around-uninitialized-warning-in-cc_kcm.c.patch
 rename meta-oe/recipes-devtools/php/{php-5.6.18 => php-5.6.23}/change-AC_TRY_RUN-to-AC_TRY_LINK.patch (100%)
 delete mode 100644 meta-oe/recipes-devtools/php/php_5.5.32.bb
 create mode 100644 meta-oe/recipes-devtools/php/php_5.5.37.bb
 rename meta-oe/recipes-devtools/php/{php_5.6.18.bb => php_5.6.23.bb} (51%)
 create mode 100644 meta-oe/recipes-extended/collectd/collectd/0001-collectd-replace-deprecated-readdir_r-with-readdir.patch
 create mode 100644 meta-oe/recipes-extended/tcsh/files/fix-gcc6-wait-union.patch
 create mode 100644 meta-oe/recipes-graphics/x11vnc/files/remove-redundant-RPATH.patch
 create mode 100644 meta-oe/recipes-navigation/geos/files/fix-gcc6-isnan.patch
 rename meta-oe/recipes-support/libssh/{libssh_0.7.1.bb => libssh_0.7.3.bb} (94%)
 rename meta-oe/recipes-support/libssh2/{libssh2_1.6.0.bb => libssh2_1.7.0.bb} (84%)
 rename meta-oe/recipes-support/mysql/{mariadb-native_5.5.46.bb => mariadb-native_5.5.50.bb} (100%)
 rename meta-oe/recipes-support/mysql/{mariadb_5.5.46.bb => mariadb_5.5.50.bb} (100%)
 create mode 100644 meta-oe/recipes-test/gtest/gtest/0001-Add-install-command-for-libraries-and-headers.patch
 rename meta-oe/recipes-test/gtest/gtest/{CMakeLists-gtest.pc.in-Add-pkg-config-support-to-gte.patch => 0002-CMakeLists-gtest.pc.in-Add-pkg-config-support-to-gte.patch} (68%)
 delete mode 100644 meta-oe/recipes-test/gtest/gtest/cmake-Add-install-command-for-libraries-and-headers.patch
 create mode 100644 meta-python/licenses/LLNL
 rename meta-webserver/recipes-httpd/apache2/{apache2-native_2.4.20.bb => apache2-native_2.4.23.bb} (91%)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.20.bb => apache2_2.4.23.bb} (97%)

-- 
2.3.5


