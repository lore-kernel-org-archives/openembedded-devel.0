Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9B33B6AC37
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Dec 2016 17:10:51 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id f188so119030198pgc.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Dec 2016 09:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cbK15fZpysWVXXWt6xaIzM/8PfiFOiB2FAZ3dVwtj+g=;
	b=x433iBo67fLz/vy706JOQOEdH3G9k24jFmgdFvunRstfAgaxaJfej/8Fj3q9IdmefY
	d3YzEiiUvI+g1a60ietxBMxoxfwFyUkfjj4uX1SPVyBtOZEzJL9TO2Gc7OOLvTIMEyTN
	PRRWiHFq6B+ekNpDASzjNcuFKops7BMRKM4QE4jCHLCTcyT9Qm1LuI7wzPyrIYOMNJv2
	bH8rGxFzZ+cM45UGS7xnmLF4mzSTFwtoMrclxXoMiGbkjtwcpYHbl8eVc7WLxp30Y6HA
	8BYZ/uBXa59CA28ErHy0H2u+hweDi893rLaxeLr2IYHU7BkYLQTHLdC5wFYjWGfUpUsR
	Mrxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cbK15fZpysWVXXWt6xaIzM/8PfiFOiB2FAZ3dVwtj+g=;
	b=TNaCOpVnPe2HqmkU+VQY9oNLAJGDGmWBow7cgWN4mSye1CIlHXf9nOUdCM/n+dmUp9
	9kfqz1qeDVGIuaY64XQBoKIq2Hc6KtchYth/rI6PzlhsLSHy912Z8Js64nkU6HN3ZaNz
	c5UUBQ0M5DH/INI6EktUkuC0711uMhUd15lUS5EQ46LRvzdEN/Ia0ySVa01rjXs3yU84
	qgP9oOg+h62uq/j0RSbyH12IGcctKJEEVA5ImKOc8UILVb3iYez7zdC31hMZ5A3ze2yg
	3ftlMbmEBktoezvAfPYABfLKgQsGBMivr9QCqxdP+DXaxsikLBE+17Hwi3WtczSbOBRZ
	JvcQ==
X-Gm-Message-State: AKaTC01ELSNAgRXt0WoIhNjcOdq38SmDRLlNYtcbGAIvvW5rxCjO0Ig2yO+iD3T4jIcLyg==
X-Received: by 10.99.2.142 with SMTP id 136mr89376534pgc.25.1480785052533;
	Sat, 03 Dec 2016 09:10:52 -0800 (PST)
Received: from Pahoa2.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:5aa:72a1:f3b6:20dc])
	by smtp.gmail.com with ESMTPSA id
	24sm16178153pfh.41.2016.12.03.09.10.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 03 Dec 2016 09:10:52 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  3 Dec 2016 09:09:39 -0800
Message-Id: <cover.1480784866.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
MIME-Version: 1.0
Subject: [PATCH 00/69] meta-oe pull request v3 morty
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
X-List-Received-Date: Sat, 03 Dec 2016 17:10:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Sending cover letter only.

Please consider this for Morty.

V2] 
removed two commits not needed.

v3] 
Added to additional patches per request.

The following changes since commit 659d9d3f52bad33d7aa1c63e25681d193416d76e:

  meta-openembedded: Add me to morty maintainer's list (2016-11-15 15:14:32 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib akuster/morty-next
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=akuster/morty-next

Andreas Müller (2):
  Revert "physfs: move to sources found at github/supertux"
  exo: unbreak Thunar's detailed file view

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

Nicolas Dechesne (1):
  gpsd: fix multilib build

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
 meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb       |  1 +
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
 ...e-fix-for-Thunar-detailed-view-Xfce-12916.patch | 36 ++++++++++
 meta-xfce/recipes-xfce/exo/exo_0.11.1.bb           |  6 +-
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
 83 files changed, 649 insertions(+), 152 deletions(-)
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
 create mode 100644 meta-xfce/recipes-xfce/exo/exo/0001-Probable-fix-for-Thunar-detailed-view-Xfce-12916.patch

-- 
2.3.5


