Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7CC4D785B8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 12:35:32 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id d1so4209139wrj.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 05:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ezh8QsbBGEuXbV1iW1tz6NKESNh4l3bZ6XbeleDZoNA=;
	b=Z8SLBhLtE0EG11CNCJBLRo/s6YdQkGhh60q4HNlzpQC0h5CrdmKhLBh77AN7WFuzFL
	GEgzdskEbxp/NK8HkYFB+ub0yYRPZUQQbTdkKY/wBFOU3Ab+NpoxNIpVb6ZwldxndUB6
	fCyw3iQfV+m7xF1XiBBFN4ahQQEiBg0zCNh6x5cIyycooHWvIkUwKI8omL1to2upi4z9
	G6jjsjNXfFwpENvnG1HbQBy8BH1NTT51TQTxJ89xJiAAvx08ekOBlIwe6Hq+e5F7xAsd
	IrpbPiozdi9nKs8yYQ/do3xCNUIJDbz43uECNo1c9iCLF7YfaW0TmMpevQwWlO3HIjuJ
	dAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ezh8QsbBGEuXbV1iW1tz6NKESNh4l3bZ6XbeleDZoNA=;
	b=M6qVl0MJfwrvNyAHIvaYLvNxH0dU6dC4qC6tooUd8SXOB/ttQbAnYu4IITJKlitul8
	yWdc1tOSszjxVe2TOrbXuQnUHTJA4DYhZFwkq5UbjIHisCldrWfuL1F8pK6oa5QRMmVI
	InlLqe8GgukLk9Uaab4pLJ9zQLhgyAMLidfNwyI2eSY4BdUhpz9Q36CjhtMHCIyQsT0L
	I+yUA61eW/BwwxO52Lt1BFlCVNQlz5w5E8/LWQGIFru/gd/PhN6GBv3qvuJjfrB+7J/r
	9TM/NdbgZnruFaYCLrcif+RFJuaQYzZkidrGF+I7hWHLJS+YZ6O8iIOJPQB348bNE+J5
	WvTQ==
X-Gm-Message-State: AElRT7Hz5vR1RCdyqZoCBQiO5N/9Qj2U/zz8B4sn2tcQKru6hHqcDHsZ
	LNKWp2CILkO6fKc2losoEXc17A==
X-Google-Smtp-Source: AG47ELsIIQzTS6cQ4PrCEmVQ57HksgZVLJZ44067cc2w2zxD9WMFJRE5MVHBOFhRvMTKwMwPydxjaw==
X-Received: by 10.223.197.139 with SMTP id m11mr27121926wrg.198.1521981332670; 
	Sun, 25 Mar 2018 05:35:32 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BCB3D681E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bcb:3d68:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	v23sm11174719wmh.30.2018.03.25.05.35.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 25 Mar 2018 05:35:31 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Mar 2018 14:35:00 +0200
Message-Id: <20180325123520.16452-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Subject: [PATCH 00/20] updates
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
X-List-Received-Date: Sun, 25 Mar 2018 12:35:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hope these make it into sumo

The following changes since commit 2a3bc6d719068bd71b7c6daae200fce2c0958ead:

  gnuplot: update 5.0.5 -> 5.2.2 and rework (2018-03-21 18:45:10 -0700)

are available in the Git repository at:

  https://github.com/schnitzeltony/meta-openembedded.git updates

for you to fetch changes up to cc73ab67354951ff968abce928afbbd6aabea59a:

  xdg-user-dirs: 0.15 -> 0.17 (2018-03-25 14:31:27 +0200)

----------------------------------------------------------------
Andreas Müller (20):
      gtkmm3: add initial 3.22.2
      gtkmm: minor cleanup
      libgtop: update 2.30.0 -> 2.38.0
      gnome-system-monitor: re-add 3.26.0
      metacity: remove
      xfce4-pulseaudio-plugin: update 0.3.5 -> 0.4.0
      xfce4-settings: update 4.12.2 -> 4.12.3
      gnome-keyring: update 2.32.1 -> 3.20.0
      upower: update 0.99.5 -> 0.99.7
      libblockdev: update 2.10 -> 2.16
      udisks2: update 2.1.8 -> 2.7.6
      gvfs: update 1.34.1 -> 1.36.0
      gparted: update 0.30.0 -> 0.31.0
      hunspell: update 1.6.1 -> 1.6.2
      libgphoto2: 2.5.14 -> 2.5.16
      libass: update 0.13.6 -> 0.14.0
      mm-common: update 0.9.10 -> 0.9.11
      mpd: update 0.19.21 -> 0.20.18
      libupnp1.6: remove
      xdg-user-dirs: 0.15 -> 0.17

 meta-gnome/recipes-extended/gparted/{gparted_0.30.0.bb => gparted_0.31.0.bb}                                      |  4 ++--
 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/egg-asn1x.patch                                              | 55 -------------------------------------------------------
 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb                                                    | 58 ----------------------------------------------------------
 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.20.0.bb                                                    | 42 ++++++++++++++++++++++++++++++++++++++++++
 meta-gnome/recipes-gnome/gnome-system-monitor/files/0001-help-remove-YELP-macro.patch                             | 28 ++++++++++++++++++++++++++++
 meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.26.0.bb                                      | 32 ++++++++++++++++++++++++++++++++
 meta-gnome/recipes-gnome/gvfs/{gvfs_1.34.1.bb => gvfs_1.36.0.bb}                                                  |  9 +++++++--
 meta-gnome/recipes-gnome/libgtop/libgtop_2.30.0.bb                                                                | 15 ---------------
 meta-gnome/recipes-gnome/libgtop/libgtop_2.38.0.bb                                                                | 13 +++++++++++++
 meta-gnome/recipes-gnome/metacity/metacity/0001-ui-Define-_GNU_SOURCE.patch                                       | 27 ---------------------------
 meta-gnome/recipes-gnome/metacity/metacity/remove-yelp-help-rules-var.patch                                       | 28 ----------------------------
 meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb                                                             | 35 -----------------------------------
 meta-multimedia/recipes-connectivity/libupnp/libupnp1.6/sepbuildfix.patch                                         | 34 ----------------------------------
 meta-multimedia/recipes-connectivity/libupnp/libupnp1.6_1.6.21.bb                                                 | 20 --------------------
 meta-multimedia/recipes-multimedia/musicpd/{mpd_0.19.21.bb => mpd_0.20.18.bb}                                     | 10 +++++-----
 meta-oe/recipes-core/mm-common/mm-common_0.9.10.bb                                                                | 12 ------------
 meta-oe/recipes-core/mm-common/mm-common_0.9.11.bb                                                                |  9 +++++++++
 meta-oe/recipes-extended/libblockdev/files/0001-fix-configure-and-compile-failures.patch                          | 14 +++++++-------
 meta-oe/recipes-extended/libblockdev/files/0003-remove-dmraid-while-compiling-with-with-dm.patch                  | 66 ++++++++++++++++++++++++++++++++++++++++++++----------------------
 meta-oe/recipes-extended/libblockdev/files/0004-fix-compile-failure-against-musl-C-library.patch                  | 12 ++++++------
 meta-oe/recipes-extended/libblockdev/files/0005-fix-a-clang-compiling-issue.patch                                 | 36 ++++++++++++++++++------------------
 meta-oe/recipes-extended/libblockdev/{libblockdev_2.10.bb => libblockdev_2.16.bb}                                 | 30 +++++++++++++++---------------
 meta-oe/recipes-gnome/gtk+/gtkmm3_3.22.2.bb                                                                       | 22 ++++++++++++++++++++++
 meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb                                                                        |  4 +---
 meta-oe/recipes-graphics/gphoto2/{libgphoto2_2.5.14.bb => libgphoto2_2.5.16.bb}                                   |  4 ++--
 meta-oe/recipes-multimedia/libass/libass_0.13.6.bb                                                                |  4 ----
 meta-oe/recipes-multimedia/libass/{libass.inc => libass_0.14.0.bb}                                                |  4 +++-
 meta-oe/recipes-support/hunspell/{hunspell_1.6.1.bb => hunspell_1.6.2.bb}                                         |  4 ++--
 meta-oe/recipes-support/udisks/udisks2/0001-data-fix-out-of-tree-build.patch                                      | 35 +++++++++++++++++++++++++++++++++++
 meta-oe/recipes-support/udisks/udisks2_2.1.8.bb                                                                   | 39 ---------------------------------------
 meta-oe/recipes-support/udisks/udisks2_2.7.6.bb                                                                   | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 meta-oe/recipes-support/upower/{upower_0.99.5.bb => upower_0.99.7.bb}                                             |  9 ++-------
 meta-oe/recipes-support/xdg-user-dirs/files/0001-explicitly-disable-man-generation-disable-documentat.patch       | 31 -------------------------------
 meta-oe/recipes-support/xdg-user-dirs/files/xdg-user-dirs.desktop                                                 |  9 ---------
 meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.15.bb                                                       | 25 -------------------------
 meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.17.bb                                                       | 16 ++++++++++++++++
 meta-xfce/recipes-panel-plugins/pulseaudio/{xfce4-pulseaudio-plugin_0.3.5.bb => xfce4-pulseaudio-plugin_0.4.0.bb} |  4 ++--
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb                                                       |  6 +++---
 38 files changed, 365 insertions(+), 489 deletions(-)
 rename meta-gnome/recipes-extended/gparted/{gparted_0.30.0.bb => gparted_0.31.0.bb} (90%)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring/egg-asn1x.patch
 delete mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.20.0.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-system-monitor/files/0001-help-remove-YELP-macro.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.26.0.bb
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.34.1.bb => gvfs_1.36.0.bb} (90%)
 delete mode 100644 meta-gnome/recipes-gnome/libgtop/libgtop_2.30.0.bb
 create mode 100644 meta-gnome/recipes-gnome/libgtop/libgtop_2.38.0.bb
 delete mode 100644 meta-gnome/recipes-gnome/metacity/metacity/0001-ui-Define-_GNU_SOURCE.patch
 delete mode 100644 meta-gnome/recipes-gnome/metacity/metacity/remove-yelp-help-rules-var.patch
 delete mode 100644 meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
 delete mode 100644 meta-multimedia/recipes-connectivity/libupnp/libupnp1.6/sepbuildfix.patch
 delete mode 100644 meta-multimedia/recipes-connectivity/libupnp/libupnp1.6_1.6.21.bb
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.19.21.bb => mpd_0.20.18.bb} (90%)
 delete mode 100644 meta-oe/recipes-core/mm-common/mm-common_0.9.10.bb
 create mode 100644 meta-oe/recipes-core/mm-common/mm-common_0.9.11.bb
 rename meta-oe/recipes-extended/libblockdev/{libblockdev_2.10.bb => libblockdev_2.16.bb} (73%)
 create mode 100644 meta-oe/recipes-gnome/gtk+/gtkmm3_3.22.2.bb
 rename meta-oe/recipes-graphics/gphoto2/{libgphoto2_2.5.14.bb => libgphoto2_2.5.16.bb} (92%)
 delete mode 100644 meta-oe/recipes-multimedia/libass/libass_0.13.6.bb
 rename meta-oe/recipes-multimedia/libass/{libass.inc => libass_0.14.0.bb} (86%)
 rename meta-oe/recipes-support/hunspell/{hunspell_1.6.1.bb => hunspell_1.6.2.bb} (75%)
 create mode 100644 meta-oe/recipes-support/udisks/udisks2/0001-data-fix-out-of-tree-build.patch
 delete mode 100644 meta-oe/recipes-support/udisks/udisks2_2.1.8.bb
 create mode 100644 meta-oe/recipes-support/udisks/udisks2_2.7.6.bb
 rename meta-oe/recipes-support/upower/{upower_0.99.5.bb => upower_0.99.7.bb} (86%)
 delete mode 100644 meta-oe/recipes-support/xdg-user-dirs/files/0001-explicitly-disable-man-generation-disable-documentat.patch
 delete mode 100644 meta-oe/recipes-support/xdg-user-dirs/files/xdg-user-dirs.desktop
 delete mode 100644 meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.15.bb
 create mode 100644 meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.17.bb
 rename meta-xfce/recipes-panel-plugins/pulseaudio/{xfce4-pulseaudio-plugin_0.3.5.bb => xfce4-pulseaudio-plugin_0.4.0.bb} (73%)

-- 
2.14.3


