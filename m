Return-Path: <akuster808@gmail.com>
Received: from mail-it1-f171.google.com (mail-it1-f171.google.com
	[209.85.166.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9D2B76C589
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 15:14:16 +0000 (UTC)
Received: by mail-it1-f171.google.com with SMTP id p197so2653668itp.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 07:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:from:date:subject:to;
	bh=3jMukwBYai2gP4qSXY9KNdmKhDZt/sYICHq+bq6qUzk=;
	b=fhtVksY2TYOANfl2BbxrXnORWTM8g8+A56gHkwYJ+dq7fMKgbVSTQ0LGmIuM9zlJIF
	1uxa3XWKN/GCK29jR2rS2R+ZJinjqjRvGdkq3HqOZ3B6rc6fkrj+jP83KO70EYUXvhGt
	qxU0kOvUtFfM8xFO16EpEwDiNkwRwNGQDRPb3JVG9jUOKAxv9smYGVj0+o0qGjKET9vM
	/hTEB8gl/XgVocdT3TfIdvGxW+p+kruLXnrgQM3FUn461LxrReedtkAIg1hqK9E3iV29
	2cUmOOwPXFRe3hmlaNkYUsC+coL4RqSe0Nja5fRb8lqogSv2IdYk0jQUaT3Sp6hyiSGQ
	QYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:from:date:subject:to;
	bh=3jMukwBYai2gP4qSXY9KNdmKhDZt/sYICHq+bq6qUzk=;
	b=iaFBZmmlNuRFhdptcxT5SW2hTcDKiRlqAkyjhBdAYxUMA60gv+YEUExmGH4Ipn5VcV
	/7zL4Dhcv8FtXcUGhp74NwM4kG0qooZqj5Th6WKMuU0ZWogI4X31cdRAFAIIsoVtfbvd
	acvifm2yey9JB8xAYaJ1UIKVQ8Znb/SpPloMwlChCROAoXP9849TNwNXxiG77M5C9qGg
	wOl3RZUO7Q2NVHdYPDCFa6zvM5y3tEy7bmHUM7qwrsE40Mjz8rmRZfdwwxgUsjk+LIIX
	o9qoAgfuwZdd8YnsTOWh3e4lmNza5xMOFSOUMtjA8zrh6DYU1cUedwSh2Rm4XaJ3ErM7
	bs/Q==
X-Gm-Message-State: AA+aEWaYQO5Ig29qL206cqPvcc0Yr6VNLuXG5BQb1oQU4birxm5qnmsc
	y5csIRpdikpmnp/eNEpw3MIlQpmL
X-Google-Smtp-Source: AFSGD/UCvFu3vWLUalBn38IDqqOitrCwBuHmJYniFTLt7KSxq0Ej47kjm3x5CpmiVS6PufkCRFSpIw==
X-Received: by 2002:a02:a003:: with SMTP id a3mr284592jah.8.1543245257027;
	Mon, 26 Nov 2018 07:14:17 -0800 (PST)
Received: from akuster-ThinkPad-T460s (174-24-96-92.clsp.qwest.net.
	[174.24.96.92])
	by smtp.gmail.com with ESMTPSA id w13sm566534itb.10.2018.11.26.07.14.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Nov 2018 07:14:16 -0800 (PST)
Message-ID: <5bfc0dc8.1c69fb81.2a011.3841@mx.google.com>
From: Armin Kuster <akuster808@gmail.com>
X-Google-Original-From: "Armin Kuster" <akuster@akuster-ThinkPad-T460s>
Received: by akuster-ThinkPad-T460s (sSMTP sendmail emulation);
	Mon, 26 Nov 2018 08:14:14 -0700
Date: Mon, 26 Nov 2018 08:14:14 -0700
To: <openembedded-devel@lists.openembedded.org>
X-Mailer: mail (GNU Mailutils 2.99.99)
Subject: thud][meta-oe]Pull request
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
X-List-Received-Date: Mon, 26 Nov 2018 15:14:16 -0000

The following changes since commit f1511d254632a34c1deb51f4bf8b8c21e7423f51:

  libssh: Do not use thumb-1 ISA on armv5 (2018-10-27 18:29:32 -0700)

are available in the git repository at:

  http://cgit.openembedded.org/meta-openembedded thud-next

for you to fetch changes up to a15d7f6ebcb0ed76c83c28f854d55e3f9d5b3677:

  sblim-sfc-common: use official SPDX license for EPL (2018-11-22 11:34:44 -0700)

----------------------------------------------------------------
Alex Kiernan (2):
      libnftnl: Upgrade to 1.1.1
      nftables: Upgrade to 0.9.0

Alexandru Vasiu (2):
      python-pyiface: Upgrade to 0.0.11
      python-configparser.inc: Fix SUMMARY

Andreas Müller (2):
      xfce4-settings: upgrade 4.12.3 -> 4.12.4
      networkmanager: upgrade 1.10.10 -> 1.14.4

Armin Kuster (7):
      README: updated Maintainers list for Thud
      ptest: add addition packagegroups and image for ptests
      meta-oe: add selftest for sources.oe.org
      opensc: 0.18.0 version fix fetch error
      ndctl: fix compile issue
      packagegroup-meta-oe: fix build issues
      sblim-sfc-common: use official SPDX license for EPL

Bartosz Golaszewski (1):
      libgpiod: bump version to v1.2

Binghua Guan (1):
      imagemagick: add PACKAGECONFIG[rsvg]

Brad Bishop (1):
      dbus-broker: fetch submodules too

Changqing Li (7):
      geoip: update md5sum and sha256sum
      vlan: update SRC_URI
      netkit-telnet: update SRC_URI
      netcat-openbsd: update SRC_URI
      network-manager-applet: change default buildclass
      network-manager-applet: move GNOMEBASEBUILDCLASS to correct position
      geoip: update GeoLite Database checksum

Gianfranco Costamagna (2):
      brotli: add initial recipe, based on meta-webkit layer
      cpprest: upgrade to version 2.10.7 and add support for brotli library

Joshua Watt (1):
      rapidjson: Allow empty package

Kai Kang (10):
      netkit-telnet: fix qa warnings of alternative target
      xfconf: 4.13.5 -> 4.13.6
      xfce4-clipman-plugin: 1.4.2 -> 1.4.3
      xfce4-notifyd: 0.4.2 -> 0.4.3
      thunar: 1.8.1 -> 1.8.2
      libwnck3: 3.24.1 -> 3.30.0
      gvfs: 1.36.2 -> 1.39.1
      libio-socket-ssl-perl: 2.059 -> 2.060
      adduser: 3.117 -> 3.118
      libunique: fix installed-vs-shipped qa issue

Khem Raj (1):
      networkmanager: Fix build with musl

Mark Asselstine (3):
      python-twisted: Add more python-twisted-* packages to the "meta" package
      meta-xfce: xfconf: fixup installed-vs-shipped QA issue
      networkmanager: package additional .la files

Martin Jansa (3):
      pcsc-lite: fix SRC_URI
      xscreensaver: fix indentation and use BPN/BP in SRC_URI
      xscreensaver: add distro_features_check for x11

Mingli Yu (12):
      lvm2: update SRC_URI
      apache2: Fix CVE-2018-11763
      mariadb: Upgrade to 5.5.62
      tk: extend to nativesdk
      hwloc: Update the SRC_URI
      tk: update the parameter for --with-tcl
      tk: export TK_LIBRARY='${libdir}/tk${VER}'
      libestr: Upgrade to 0.1.11
      mcelog: Upgrade to 161
      iozone3: Upgrade to 484
      log4cplus: Upgrade to 2.0.2
      fio: Upgrade to 3.12

Parthiban Nallathambi (1):
      Adding support for xscreensaver-5.39

Pascal Bach (4):
      civetweb: remove redundant EXTRA_OECMAKE_class-native
      civetweb: disable tests
      libyui: make resulting cmake config relocatable
      libyui-ncurses: fix ncurses find module

Peter Kjellerstedt (1):
      lvm2.inc: Correct the license (LGPL-2.0 -> LGPL-2.1)

Primoz Fiser (1):
      sedutil: Add recipe

Randy MacLeod (1):
      stress-ng: Upgrade from 0.09.37 to 0.09.45

Ricardo Salveti (2):
      modemmanager: set udev base dir to ${nonarch_base_libdir}/udev
      vim-tiny: remove alternative for xxd

Robert Tiemann (1):
      curlpp: Fix packaging and reference to license

Ryan Harkin (1):
      v4l-utils: update to 1.16.0

Sam Nobs (1):
      uriparser: Allow native build

Vincent Prince (1):
      lcov: Fix perl module dependencies

Vyacheslav Yurkov (1):
      glog: updated libunwind look up function

Yi-Soo An (1):
      uftrace: Support x86

douglas.royds (2):
      ntp: Reproducible build: Respect SOURCE_DATE_EPOCH
      ntp: Reproducible build: Use fixed path to posix shell

 README                                             |    2 +-
 meta-filesystems/README                            |   12 +-
 meta-gnome/README                                  |   10 +-
 .../network-manager-applet_1.8.18.bb               |    1 +
 .../networkmanager/networkmanager_%.bbappend       |    3 +
 .../gvfs/{gvfs_1.36.2.bb => gvfs_1.39.1.bb}        |   44 +-
 .../{libwnck3_3.24.1.bb => libwnck3_3.30.0.bb}     |    4 +-
 meta-initramfs/README                              |    8 +-
 meta-multimedia/README                             |   10 +-
 meta-networking/MAINTAINERS                        |   32 +-
 meta-networking/README                             |    6 +-
 .../recipes-connectivity/civetweb/civetweb_git.bb  |    7 +-
 ...clude-net-ethernet.h-and-linux-if_ether.h.patch |   53 +
 ...emove-net-ethernet.h-seems-to-be-over-spe.patch |    7 +-
 ...figure.ac-Fix-pkgconfig-sysroot-locations.patch |    4 +-
 ...te-settings-settings-property-documentati.patch |   51 +-
 .../networkmanager/musl/0001-musl-basic.patch      |   13 +-
 .../musl/0002-musl-dlopen-configure-ac.patch       |    4 +-
 .../musl/0003-musl-network-support.patch           |   14 +-
 .../musl/0004-musl-process-util.patch              |   32 +-
 ...further-conflicts-by-including-net-ethern.patch |   20 +-
 .../0006-Add-a-strndupa-replacement-for-musl.patch |    4 +-
 ...manager_1.10.10.bb => networkmanager_1.14.4.bb} |   20 +-
 .../recipes-connectivity/vlan/vlan_1.9.bb          |    2 +-
 ...-the-define-visivility-attribute-together.patch | 2949 --------------------
 ...001-Move-exports-before-symbol-definition.patch |  289 ++
 ...g-local-function-as-one-of-printf-family.patch} |  263 +-
 .../{libnftnl_1.0.7.bb => libnftnl_1.1.1.bb}       |    8 +-
 ...licit-network-ctx-assignment-for-icmp-icm.patch |  323 ---
 .../0002-proto-Add-some-exotic-ICMPv6-types.patch  |  147 -
 ...oad-split-ll-proto-dependency-into-helper.patch |   62 -
 ...update-of-net-base-w.-meta-l4proto-icmpv6.patch |   65 -
 ...itch-implicit-dependencies-to-meta-l4prot.patch |   98 -
 ...orce-ip-ip6-protocol-depending-on-icmp-or.patch |   84 -
 ...ch-implicit-dependencies-to-meta-l4proto-.patch |   86 -
 .../nftables/files/fix-to-generate-ntf.8.patch     |   26 -
 .../recipes-filter/nftables/nftables_0.7.bb        |   27 -
 .../recipes-filter/nftables/nftables_0.9.0.bb      |   20 +
 .../netkit-telnet/netkit-telnet_0.17.bb            |    3 +-
 .../recipes-support/curlpp/curlpp_0.8.1.bb         |   17 +-
 .../recipes-support/geoip/geoip_1.6.12.bb          |   16 +-
 .../recipes-support/netcat/netcat-openbsd_1.190.bb |    4 +-
 ...reproducibility-fixed-path-to-posix-shell.patch |   15 +
 ...reproducibility-respect-source-date-epoch.patch |   16 +
 .../recipes-support/ntp/ntp_4.2.8p12.bb            |    2 +
 meta-oe/README                                     |    8 +-
 meta-oe/conf/layer.conf                            |    2 +
 meta-oe/lib/oeqa/selftest/cases/meta_oe_sources.py |   30 +
 .../files/0001-update-the-interpreter-paths.patch  |    8 +-
 .../fio/{fio_3.8.bb => fio_3.12.bb}                |    2 +-
 .../iozone3/{iozone3_482.bb => iozone3_484.bb}     |    4 +-
 .../modemmanager/modemmanager_1.8.2.bb             |    4 +
 meta-oe/recipes-core/dbus/dbus-broker_git.bb       |    2 +-
 meta-oe/recipes-core/images/meta-oe-image-base.bb  |    7 +
 meta-oe/recipes-core/images/meta-oe-image.bb       |    5 +
 meta-oe/recipes-core/images/meta-oe-ptest-image.bb |    5 +
 meta-oe/recipes-core/ndctl/ndctl_git.bb            |    3 +
 .../packagegroups/packagegroup-meta-oe.bb          |  253 ++
 ...b-native_5.5.61.bb => mariadb-native_5.5.62.bb} |    0
 meta-oe/recipes-dbs/mysql/mariadb.inc              |    4 +-
 .../mysql/{mariadb_5.5.61.bb => mariadb_5.5.62.bb} |    0
 .../{log4cplus_2.0.1.bb => log4cplus_2.0.2.bb}     |    4 +-
 .../recipes-devtools/rapidjson/rapidjson_git.bb    |    2 +-
 meta-oe/recipes-devtools/tcltk/tk_8.6.8.bb         |   14 +-
 meta-oe/recipes-devtools/uftrace/uftrace_0.8.3.bb  |   13 +-
 meta-oe/recipes-extended/brotli/brotli_1.0.7.bb    |   14 +
 meta-oe/recipes-extended/hwloc/hwloc_1.11.10.bb    |    2 +-
 .../sblim-sfc-common/sblim-sfc-common_1.0.1.bb     |    2 +-
 meta-oe/recipes-extended/sedutil/sedutil_git.bb    |   17 +
 .../0003-Simplify-ncurses-finding-module.patch     |   35 +
 .../recipes-graphics/libyui/libyui-ncurses_git.bb  |    1 +
 ...0001-Use-relative-install-paths-for-CMake.patch |  130 +
 meta-oe/recipes-graphics/libyui/libyui_git.bb      |    1 +
 .../xscreensaver/files/fix-buildscripts.patch      |  116 +
 .../xscreensaver/files/tweak-app-defaults.patch    |  273 ++
 .../xscreensaver/files/xscreensaver.service        |   14 +
 .../xscreensaver/xscreensaver_5.39.bb              |   29 +
 ...tem-do-not-assume-building-in-source-tree.patch |  108 -
 ...tl-Define-TEMP_FAILURE_RETRY-if-undefined.patch |   53 -
 ...t-Link-mc_nextgen_test-with-libargp-if-ne.patch |   10 +-
 .../{v4l-utils_1.12.3.bb => v4l-utils_1.16.0.bb}   |    6 +-
 meta-oe/recipes-support/cpprest/cpprest/845.patch  |   42 -
 .../recipes-support/cpprest/cpprest/950-fix.patch  |   26 +
 .../cpprest/cpprest/disable-outside-tests.patch    |    6 +-
 .../cpprest/cpprest/system-brotli.patch            |   38 +
 .../{cpprest_2.10.6.bb => cpprest_2.10.7.bb}       |   11 +-
 .../0001-find-libunwind-during-configure.patch     |   30 -
 .../0002-Find-Libunwind-during-configure.patch     |  113 +
 meta-oe/recipes-support/glog/glog_0.3.5.bb         |    6 +-
 .../imagemagick/imagemagick_7.0.7.bb               |    3 +-
 meta-oe/recipes-support/lcov/lcov_1.11.bb          |   25 +
 .../{libestr_0.1.10.bb => libestr_0.1.11.bb}       |    4 +-
 .../{libgpiod_1.1.1.bb => libgpiod_1.2.bb}         |    4 +-
 meta-oe/recipes-support/lvm2/lvm2.inc              |    4 +-
 .../mcelog/{mcelog_160.bb => mcelog_161.bb}        |    2 +-
 meta-oe/recipes-support/opensc/opensc_0.18.0.bb    |    2 +-
 .../recipes-support/pcsc-lite/pcsc-lite_1.8.22.bb  |    2 +-
 .../recipes-support/uriparser/uriparser_0.8.4.bb   |    2 +
 meta-oe/recipes-support/vim/vim-tiny_8.1.0347.bb   |    1 +
 ...file-force-sync-after-build-in-case-reboo.patch |   21 +-
 .../0001-Several-changes-to-fix-musl-build.patch   |   47 +-
 ...ss-ng-don-t-enable-TARGET_CLONES-for-musl.patch |   30 -
 .../{stress-ng_0.09.37.bb => stress-ng_0.09.45.bb} |    6 +-
 meta-perl/README                                   |   10 +-
 .../adduser/{adduser_3.117.bb => adduser_3.118.bb} |    6 +-
 ...erl_2.059.bb => libio-socket-ssl-perl_2.060.bb} |    4 +-
 meta-python/README                                 |   12 +-
 .../python/python-configparser.inc                 |    2 +-
 .../recipes-devtools/python/python-pyiface.inc     |    4 +-
 ...-pyiface_0.0.10.bb => python-pyiface_0.0.11.bb} |    0
 .../recipes-devtools/python/python-twisted.inc     |    3 +
 .../python/python-twisted_18.4.0.bb                |    4 +
 ...pyiface_0.0.10.bb => python3-pyiface_0.0.11.bb} |    0
 meta-webserver/README                              |    8 +-
 .../recipes-httpd/apache2/apache2-native_2.4.34.bb |    1 +
 .../apache2/apache2/CVE-2018-11763.patch           |  512 ++++
 .../recipes-httpd/apache2/apache2_2.4.34.bb        |    1 +
 meta-xfce/README                                   |   10 +-
 ...ce4-notifyd_0.4.2.bb => xfce4-notifyd_0.4.3.bb} |    4 +-
 .../recipes-extended/libunique/libunique_1.1.6.bb  |    4 +
 ...ugin_1.4.2.bb => xfce4-clipman-plugin_1.4.3.bb} |    4 +-
 .../thunar/{thunar_1.8.1.bb => thunar_1.8.2.bb}    |    4 +-
 .../xfce4-settings/xfce4-settings_git.bb           |    6 +-
 .../xfconf/{xfconf_4.13.5.bb => xfconf_4.13.6.bb}  |    7 +-
 124 files changed, 2510 insertions(+), 4585 deletions(-)
 create mode 100644 meta-gnome/recipes-connectivity/networkmanager/networkmanager_%.bbappend
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.36.2.bb => gvfs_1.39.1.bb} (53%)
 rename meta-gnome/recipes-gnome/libwnck/{libwnck3_3.24.1.bb => libwnck3_3.30.0.bb} (78%)
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-Do-not-include-net-ethernet.h-and-linux-if_ether.h.patch
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.10.10.bb => networkmanager_1.14.4.bb} (89%)
 delete mode 100644 meta-networking/recipes-filter/libnftnl/libnftnl/0001-Declare-the-define-visivility-attribute-together.patch
 create mode 100644 meta-networking/recipes-filter/libnftnl/libnftnl/0001-Move-exports-before-symbol-definition.patch
 rename meta-networking/recipes-filter/libnftnl/libnftnl/{0001-avoid-naming-local-function-as-one-of-printf-family.patch => 0002-avoid-naming-local-function-as-one-of-printf-family.patch} (71%)
 rename meta-networking/recipes-filter/libnftnl/{libnftnl_1.0.7.bb => libnftnl_1.1.1.bb} (51%)
 delete mode 100644 meta-networking/recipes-filter/nftables/files/0001-payload-explicit-network-ctx-assignment-for-icmp-icm.patch
 delete mode 100644 meta-networking/recipes-filter/nftables/files/0002-proto-Add-some-exotic-ICMPv6-types.patch
 delete mode 100644 meta-networking/recipes-filter/nftables/files/0003-payload-split-ll-proto-dependency-into-helper.patch
 delete mode 100644 meta-networking/recipes-filter/nftables/files/0004-src-allow-update-of-net-base-w.-meta-l4proto-icmpv6.patch
 delete mode 100644 meta-networking/recipes-filter/nftables/files/0005-src-ipv6-switch-implicit-dependencies-to-meta-l4prot.patch
 delete mode 100644 meta-networking/recipes-filter/nftables/files/0006-payload-enforce-ip-ip6-protocol-depending-on-icmp-or.patch
 delete mode 100644 meta-networking/recipes-filter/nftables/files/0007-src-ip-switch-implicit-dependencies-to-meta-l4proto-.patch
 delete mode 100644 meta-networking/recipes-filter/nftables/files/fix-to-generate-ntf.8.patch
 delete mode 100644 meta-networking/recipes-filter/nftables/nftables_0.7.bb
 create mode 100644 meta-networking/recipes-filter/nftables/nftables_0.9.0.bb
 create mode 100644 meta-networking/recipes-support/ntp/ntp/reproducibility-fixed-path-to-posix-shell.patch
 create mode 100644 meta-networking/recipes-support/ntp/ntp/reproducibility-respect-source-date-epoch.patch
 create mode 100644 meta-oe/lib/oeqa/selftest/cases/meta_oe_sources.py
 rename meta-oe/recipes-benchmark/fio/{fio_3.8.bb => fio_3.12.bb} (96%)
 rename meta-oe/recipes-benchmark/iozone3/{iozone3_482.bb => iozone3_484.bb} (96%)
 create mode 100644 meta-oe/recipes-core/images/meta-oe-image-base.bb
 create mode 100644 meta-oe/recipes-core/images/meta-oe-image.bb
 create mode 100644 meta-oe/recipes-core/images/meta-oe-ptest-image.bb
 create mode 100644 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_5.5.61.bb => mariadb-native_5.5.62.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_5.5.61.bb => mariadb_5.5.62.bb} (100%)
 rename meta-oe/recipes-devtools/log4cplus/{log4cplus_2.0.1.bb => log4cplus_2.0.2.bb} (81%)
 create mode 100644 meta-oe/recipes-extended/brotli/brotli_1.0.7.bb
 create mode 100644 meta-oe/recipes-extended/sedutil/sedutil_git.bb
 create mode 100644 meta-oe/recipes-graphics/libyui/libyui-ncurses/0003-Simplify-ncurses-finding-module.patch
 create mode 100644 meta-oe/recipes-graphics/libyui/libyui/0001-Use-relative-install-paths-for-CMake.patch
 create mode 100644 meta-oe/recipes-graphics/xscreensaver/files/fix-buildscripts.patch
 create mode 100644 meta-oe/recipes-graphics/xscreensaver/files/tweak-app-defaults.patch
 create mode 100755 meta-oe/recipes-graphics/xscreensaver/files/xscreensaver.service
 create mode 100644 meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
 delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-buildsystem-do-not-assume-building-in-source-tree.patch
 delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-ir-ctl-Define-TEMP_FAILURE_RETRY-if-undefined.patch
 rename meta-oe/recipes-multimedia/v4l2apps/{v4l-utils_1.12.3.bb => v4l-utils_1.16.0.bb} (87%)
 delete mode 100644 meta-oe/recipes-support/cpprest/cpprest/845.patch
 create mode 100644 meta-oe/recipes-support/cpprest/cpprest/950-fix.patch
 create mode 100644 meta-oe/recipes-support/cpprest/cpprest/system-brotli.patch
 rename meta-oe/recipes-support/cpprest/{cpprest_2.10.6.bb => cpprest_2.10.7.bb} (69%)
 delete mode 100644 meta-oe/recipes-support/glog/glog/0001-find-libunwind-during-configure.patch
 create mode 100644 meta-oe/recipes-support/glog/glog/0002-Find-Libunwind-during-configure.patch
 rename meta-oe/recipes-support/libestr/{libestr_0.1.10.bb => libestr_0.1.11.bb} (71%)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_1.1.1.bb => libgpiod_1.2.bb} (78%)
 rename meta-oe/recipes-support/mcelog/{mcelog_160.bb => mcelog_161.bb} (95%)
 delete mode 100644 meta-oe/recipes-test/stress-ng/stress-ng/0001-stress-ng-don-t-enable-TARGET_CLONES-for-musl.patch
 rename meta-oe/recipes-test/stress-ng/{stress-ng_0.09.37.bb => stress-ng_0.09.45.bb} (78%)
 rename meta-perl/recipes-perl/adduser/{adduser_3.117.bb => adduser_3.118.bb} (91%)
 rename meta-perl/recipes-perl/libio/{libio-socket-ssl-perl_2.059.bb => libio-socket-ssl-perl_2.060.bb} (91%)
 rename meta-python/recipes-devtools/python/{python-pyiface_0.0.10.bb => python-pyiface_0.0.11.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyiface_0.0.10.bb => python3-pyiface_0.0.11.bb} (100%)
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/CVE-2018-11763.patch
 rename meta-xfce/recipes-apps/xfce4-notifyd/{xfce4-notifyd_0.4.2.bb => xfce4-notifyd_0.4.3.bb} (84%)
 rename meta-xfce/recipes-panel-plugins/clipman/{xfce4-clipman-plugin_1.4.2.bb => xfce4-clipman-plugin_1.4.3.bb} (76%)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.8.1.bb => thunar_1.8.2.bb} (86%)
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.13.5.bb => xfconf_4.13.6.bb} (60%)

