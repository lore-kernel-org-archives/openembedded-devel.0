Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4FB526010B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Dec 2016 16:09:19 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id i88so46694621pfk.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Dec 2016 08:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9yZ+tz3aih7vk45bPTZzNmnJF9xXPRQKhZr1HzjyrKg=;
	b=QJAidHQf0c+KrREmkIXHeIKQXXeveCrgT6KESJdsITO5FlvzT3i6/tChamhbfiJ2MZ
	wLHDBvGscK7lwIIty9NcPz90XfRqPodb1Am6BCl1jEny/i/5i97pd3kA6MyFtjoz79sq
	AIq0AHmXT0AYWVsKwaiefnilzinwSKuxK8VgGb5dQ81D424q2ygQZPH3hcRjEc9tLbYv
	rcYN3Akp2lkojWkgHtIpPJAdbYSxRlhonOvafQOcy8X2n1OFBmxaIU4bna3IZyWi5++o
	294PQalQHZqBT8DWS9oWWEwcJxLM/NcuYAVfKZK/oGZhGCTVQk6Uw90bJVE8W2LSqI7U
	iucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9yZ+tz3aih7vk45bPTZzNmnJF9xXPRQKhZr1HzjyrKg=;
	b=Ydh3W9t/CPGxbVaToiphtA7waEWCAKbJ42u2TlhYHYwfgDw5rXMDInW72A7CzadQMS
	OeJ/16sehH7Kt/X/XdEscTKy89s9YzCdo3leKYkfN5FLwyR4s6b4EskNMGiN9x8SlufX
	tdG8FKnYhUMsYjo54RV7CydmFabKucFlaXCVqb6R6iYtoW/GX/zwZUB1emQ7uK34wC6n
	b+S/h5/v6LXG/+dU+XpYTE89qlc3UXLfSW5bts339SFvKpkfUXSF+A2TkMk8O4emmwYy
	8BuhvVvRuJbAvcmFMK3kXMkiBCbavgFhlPNfL8QLY2vdFGrNV93Vm8xef4v66X8yEDEE
	eiWw==
X-Gm-Message-State: AKaTC017nsKzOBq4y8zEtricgc6wQ5Tkb93udJcJ8AzT1XkUjYIr8cE6Oh52JxPeh57AEg==
X-Received: by 10.99.207.17 with SMTP id j17mr68581042pgg.57.1480608561381;
	Thu, 01 Dec 2016 08:09:21 -0800 (PST)
Received: from Pahoa2.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:4575:d94e:4fdf:d5ef])
	by smtp.gmail.com with ESMTPSA id
	f81sm1244409pfd.71.2016.12.01.08.09.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 01 Dec 2016 08:09:20 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Thu,  1 Dec 2016 08:08:06 -0800
Message-Id: <cover.1480608365.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
MIME-Version: 1.0
Subject: [PATCH 00/67] meta-oe pull request v2 morty
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
X-List-Received-Date: Thu, 01 Dec 2016 16:09:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please consider these changes for meta-oe Morty.

removed two commits not needed.

The following changes since commit 659d9d3f52bad33d7aa1c63e25681d193416d76e:

  meta-openembedded: Add me to morty maintainer's list (2016-11-15 15:14:32 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib akuster/morty-next
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=akuster/morty-next

Andreas Müller (1):
  Revert "physfs: move to sources found at github/supertux"

André Draszik (2):
  asio: DEPENDS on openssl
  asio: fix a musl compilation warning

Armin Kuster (1):
  wireshark: install missing header files

Hongxu Jia (1):
  ttf-abyssinica: update SRC_URI

Jackie Huang (28):
  openjpeg: rename the download file
  gtkmm: add x11 to REQUIRED_DISTRO_FEATURES
  pavucontrol: add x11 to REQUIRED_DISTRO_FEATURES
  libunique: add x11 to REQUIRED_DISTRO_FEATURES
  dconf: add x11 to REQUIRED_DISTRO_FEATURES
  evince: add x11 to REQUIRED_DISTRO_FEATURES
  gnome-disk-utility: add x11 to REQUIRED_DISTRO_FEATURES
  gtksourceview2: add x11 to REQUIRED_DISTRO_FEATURES
  libwnck: add x11 to REQUIRED_DISTRO_FEATURES
  libxklavier: add x11 to REQUIRED_DISTRO_FEATURES
  packagegroup-xfce-base: add x11 to REQUIRED_DISTRO_FEATURES
  xfce4-pulseaudio-plugin: add x11 to REQUIRED_DISTRO_FEATURES
  thunar-plugin.bbclass: add x11 to REQUIRED_DISTRO_FEATURES
  xfce-panel-plugin.bbclass: add x11 to REQUIRED_DISTRO_FEATURES
  xfce-app.bbclass: add x11 to REQUIRED_DISTRO_FEATURES
  exo: add x11 to REQUIRED_DISTRO_FEATURES
  garcon: add x11 to REQUIRED_DISTRO_FEATURES
  gtk-xfce-engine: add x11 to REQUIRED_DISTRO_FEATURES
  libxfce4ui: add x11 to REQUIRED_DISTRO_FEATURES
  thunar: add x11 to REQUIRED_DISTRO_FEATURES
  thunar-volman: add x11 to REQUIRED_DISTRO_FEATURES
  xfce4-appfinder: add x11 to REQUIRED_DISTRO_FEATURES
  xfce4-panel: add x11 to REQUIRED_DISTRO_FEATURES
  xfce4-power-manager: add x11 to REQUIRED_DISTRO_FEATURES
  xfce4-session: add x11 to REQUIRED_DISTRO_FEATURES
  xfce4-settings: add x11 to REQUIRED_DISTRO_FEATURES
  xfdesktop: add x11 to REQUIRED_DISTRO_FEATURES
  xfwm4: add x11 to REQUIRED_DISTRO_FEATURES

Junxian.Xiao (1):
  apache2: include .load files in modules.d

Kai Kang (1):
  python-m2crypto: inherit siteinfo

Khem Raj (12):
  meta_oe_security_flags: Disable PIE for
    s3c64xx-gpio/s3c24xx-gpio/cpufrequtils
  meta_oe_security_flags.inc: Add libcec, libmodplug, libcdio
  krb5: Add -fPIC to compile flags
  libplist: Remove rpaths surgically
  lockdev: Pretend GNU libc on musl
  libqmi: Fix build with clang
  openldap: Fix Build error due to missing -fPIC
  md5deep: Fix build with clang
  flashrom: Remove redundant const qualifier
  fribidi: Fix build with security flags turned on
  libmad: Fix build with clang
  modemmanager: Fix build with clang

Koen Kooi (1):
  android-tools: fix do_install

Philip Balister (1):
  fftw: Remove the fftw-dev package dependency on non-existent fftw
    package.

Qi.Chen@windriver.com (2):
  iscsi-initiator-utils: fix postinstall and systemd service file
  edac-utils: fix systemd service

Robert Yang (1):
  lftp: fix PACKAGECONFIG[readline]

Tim Orling (1):
  mariadb: use faster download URL

Ting Liu (1):
  xterm: package /usr/lib/X11 to avoid installed-vs-shipped error on
    ppc64

Wang Xin (2):
  lksctp-tools: 1.0.16 -> 1.0.17
  drbd-utils: 8.9.3 -> 8.9.6

Wenzong Fan (4):
  opencv: fix QA issue
  libeigen: set tarball name as ${BP}.tar.bz2
  opencv: checking existence of /usr/lib
  rsnapshot: fix host path in rsnapshot.conf.default

Yi Zhao (6):
  aoetools: fix QA warning for GNU_HASH
  nuttcp: fix QA warning for GNU_HASH
  zeroconf: fix QA warning for GNU_HASH
  tsocks: fix QA warning for GNU_HASH
  vblade: fix QA warning for GNU_HASH
  tunctl: fix QA warning for GNU_HASH

dengke.du@windriver.com (1):
  augeas: fix QA warning

 .../physfs/files/0001-fix-build-with-gcc-6.patch   | 52 --------------
 .../recipes-support/physfs/physfs_2.0.3.bb         | 13 ++++
 .../recipes-support/physfs/physfs_git.bb           | 15 ----
 meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb     |  4 +-
 meta-gnome/recipes-gnome/evince/evince_3.18.2.bb   |  4 +-
 .../gnome-disk-utility_2.32.0.bb                   |  5 +-
 .../gtksourceview/gtksourceview2_2.10.5.bb         |  4 +-
 meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb |  4 +-
 .../recipes-gnome/libxklavier/libxklavier_5.3.bb   |  3 +
 .../recipes-connectivity/lftp/lftp_4.7.3.bb        |  2 +-
 .../files/iscsi-initiator.service                  |  1 +
 .../iscsi-initiator-utils/files/set_initiatorname  | 12 ++++
 .../iscsi-initiator-utils_2.0-873.bb               | 27 +++----
 .../vblade/files/makefile-add-ldflags.patch        | 19 +++++
 .../recipes-daemons/vblade/vblade_20.bb            |  4 +-
 .../tsocks/tsocks/makefile-add-ldflags.patch       | 19 +++++
 .../recipes-protocols/tsocks/tsocks_1.8beta5.bb    |  4 +-
 .../zeroconf/zeroconf/makefile-add-ldflags.patch   | 19 +++++
 .../recipes-protocols/zeroconf/zeroconf_0.9.bb     |  1 +
 .../aoetools/aoetools/makefile-add-ldflags.patch   | 31 ++++++++
 .../recipes-support/aoetools/aoetools_36.bb        |  1 +
 .../{drbd-utils_8.9.3.bb => drbd-utils_8.9.6.bb}   |  6 +-
 ...sctp-tools_1.0.16.bb => lksctp-tools_1.0.17.bb} |  4 +-
 .../recipes-support/nuttcp/nuttcp_7.2.1.bb         |  2 +-
 meta-networking/recipes-support/tunctl/tunctl.inc  |  4 +-
 .../tunctl/tunctl/makefile-add-ldflags.patch       | 19 +++++
 .../recipes-support/wireshark/wireshark_2.2.1.bb   | 31 ++++++--
 .../conf/distro/include/meta_oe_security_flags.inc |  6 ++
 meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb   |  4 +-
 .../libqmi/libqmi/0001-Detect-clang.patch          | 84 ++++++++++++++++++++++
 .../recipes-connectivity/libqmi/libqmi_1.16.0.bb   |  4 +-
 .../modemmanager/enum-conversion.patch             | 21 ++++++
 ...modemmanager_1.6.0.bb => modemmanager_1.6.4.bb} |  8 ++-
 .../android-tools/android-tools_5.1.1.r37.bb       | 24 ++++---
 .../recipes-devtools/libfribidi/fribidi_0.19.7.bb  |  1 +
 .../0001-ichspi.c-Fix-build-with-clang.patch       | 29 ++++++++
 .../recipes-extended/flashrom/flashrom_0.9.6.1.bb  |  1 +
 .../libimobiledevice/libplist_1.8.bb               | 10 ++-
 .../files/0001-Fix-errors-found-by-clang.patch     | 32 +++++++++
 meta-oe/recipes-extended/md5deep/md5deep_4.4.bb    |  1 +
 meta-oe/recipes-gnome/gtk+/gtkmm_2.24.3.bb         |  4 +-
 meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb |  4 +-
 .../recipes-graphics/openjpeg/openjpeg_2.1.1.bb    |  2 +-
 .../ttf-fonts/ttf-abyssinica_1.500.bb              |  2 +-
 meta-oe/recipes-graphics/xorg-app/xterm_325.bb     |  2 +-
 ...4-Remove-clang-unsupported-compiler-flags.patch | 43 +++++++++++
 .../recipes-multimedia/libmad/libmad_0.15.1b.bb    |  1 +
 .../pulseaudio/pavucontrol_3.0.bb                  |  4 +-
 meta-oe/recipes-support/asio/asio.inc              |  2 +-
 ...01-use-POSIX-poll.h-instead-of-sys-poll.h.patch | 64 +++++++++++++++++
 meta-oe/recipes-support/asio/asio_1.10.6.bb        |  5 +-
 meta-oe/recipes-support/augeas/augeas.inc          |  3 +
 .../recipes-support/edac-utils/edac-utils_git.bb   |  1 +
 .../recipes-support/edac-utils/files/edac.service  |  1 -
 meta-oe/recipes-support/fftw/fftw_3.3.4.bb         |  2 +
 meta-oe/recipes-support/libeigen/libeigen_3.2.8.bb |  2 +-
 meta-oe/recipes-support/lockdev/lockdev_git.bb     |  2 +
 meta-oe/recipes-support/mysql/mariadb.inc          |  2 +-
 meta-oe/recipes-support/opencv/opencv_3.1.bb       |  4 +-
 .../recipes-support/openldap/openldap_2.4.44.bb    |  2 +-
 meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb |  2 +
 .../python/python-m2crypto_0.23.0.bb               |  2 +-
 .../recipes-httpd/apache2/apache2_2.4.23.bb        |  1 +
 meta-xfce/classes/thunar-plugin.bbclass            |  4 +-
 meta-xfce/classes/xfce-app.bbclass                 |  4 +-
 meta-xfce/classes/xfce-panel-plugin.bbclass        |  4 +-
 .../pulseaudio/xfce4-pulseaudio-plugin_0.2.4.bb    |  2 +-
 meta-xfce/recipes-xfce/exo/exo_0.11.1.bb           |  5 +-
 meta-xfce/recipes-xfce/garcon/garcon_0.4.0.bb      |  4 +-
 .../gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb       |  4 +-
 .../recipes-xfce/libxfce4ui/libxfce4ui_4.12.1.bb   |  4 +-
 .../packagegroups/packagegroup-xfce-base.bb        |  4 +-
 .../thunar-volman/thunar-volman_0.8.1.bb           |  4 +-
 meta-xfce/recipes-xfce/thunar/thunar_1.6.10.bb     |  4 +-
 .../xfce4-appfinder/xfce4-appfinder_4.12.0.bb      |  4 +-
 .../recipes-xfce/xfce4-panel/xfce4-panel_4.12.0.bb |  4 +-
 .../xfce4-power-manager_1.6.0.bb                   |  4 +-
 .../xfce4-session/xfce4-session_4.12.1.bb          |  4 +-
 .../xfce4-settings/xfce4-settings_git.bb           |  4 +-
 .../recipes-xfce/xfdesktop/xfdesktop_4.12.3.bb     |  4 +-
 meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.3.bb       |  4 +-
 81 files changed, 611 insertions(+), 152 deletions(-)
 delete mode 100644 meta-filesystems/recipes-support/physfs/files/0001-fix-build-with-gcc-6.patch
 create mode 100644 meta-filesystems/recipes-support/physfs/physfs_2.0.3.bb
 delete mode 100644 meta-filesystems/recipes-support/physfs/physfs_git.bb
 create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/set_initiatorname
 create mode 100644 meta-networking/recipes-daemons/vblade/files/makefile-add-ldflags.patch
 create mode 100644 meta-networking/recipes-protocols/tsocks/tsocks/makefile-add-ldflags.patch
 create mode 100644 meta-networking/recipes-protocols/zeroconf/zeroconf/makefile-add-ldflags.patch
 create mode 100644 meta-networking/recipes-support/aoetools/aoetools/makefile-add-ldflags.patch
 rename meta-networking/recipes-support/drbd/{drbd-utils_8.9.3.bb => drbd-utils_8.9.6.bb} (86%)
 rename meta-networking/recipes-support/lksctp-tools/{lksctp-tools_1.0.16.bb => lksctp-tools_1.0.17.bb} (94%)
 create mode 100644 meta-networking/recipes-support/tunctl/tunctl/makefile-add-ldflags.patch
 create mode 100644 meta-oe/recipes-connectivity/libqmi/libqmi/0001-Detect-clang.patch
 create mode 100644 meta-oe/recipes-connectivity/modemmanager/modemmanager/enum-conversion.patch
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.6.0.bb => modemmanager_1.6.4.bb} (88%)
 create mode 100644 meta-oe/recipes-extended/flashrom/flashrom/0001-ichspi.c-Fix-build-with-clang.patch
 create mode 100644 meta-oe/recipes-extended/md5deep/files/0001-Fix-errors-found-by-clang.patch
 create mode 100644 meta-oe/recipes-multimedia/libmad/libmad/0004-Remove-clang-unsupported-compiler-flags.patch
 create mode 100644 meta-oe/recipes-support/asio/asio/0001-use-POSIX-poll.h-instead-of-sys-poll.h.patch

-- 
2.3.5


