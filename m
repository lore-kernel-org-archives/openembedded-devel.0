Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id AFC2476DF8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 00:41:42 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so97096241wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 17:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=+Eiy+XFIUv8E/7T1obeCOjTMjh2s+MzIf34pv0Y4Pqc=;
	b=YZNkLH5aURPyERvftAHUukDi38gp8MsgI2uT87ET+mQKtE7sZXEFFkeMFw8oRpPft8
	U6Vsq/YwMy11rCJfA17phik/ydnMSKQm9HSMwXsheF0BOUjoZEYXHX6a9+iEfr8yNOUi
	mRJAc27L+j2pZ4TleDkvFI+V4knbBsD4tnnjWdpSHUV2aFwowbx2MokxL6aZJ0MgK1KL
	YKedkC++xVNA1SI3BYMFPuMVuwvkQ6/N0gt/lL/URifpUtouYuR7jZNsoF3y9nNI0QT+
	EkU3Fg7YBT5HyU5RWjC720WI1C3y3Oi8cyuskLPfBUP+CLcs1605LgaYHOqoDPdE6kk7
	k7vQ==
X-Received: by 10.194.47.161 with SMTP id e1mr61127276wjn.1.1442450502186;
	Wed, 16 Sep 2015 17:41:42 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0F55.dip0.t-ipconnect.de.
	[79.223.15.85]) by smtp.googlemail.com with ESMTPSA id
	sd14sm393216wjb.36.2015.09.16.17.41.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Sep 2015 17:41:41 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Sep 2015 02:41:12 +0200
Message-Id: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH 00/19] news, updates and fixes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Sep 2015 00:41:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently my error logs are so poluted and I have so many patches that I might
have missed something.

I did not take care yet for gazillions of 'host-user-contaminated' warnings.
Most of them are caused by dbg-packages and in the current situation I don't
care for correct user settings of source code files I don't install often.

Please note that this series needs some patches not yet applied in master and
found in this branch:

gupnp-tools: Upgrade 0.8.1 -> 0.8.10
gimp: disable webkit dependency in the recipe
evince: Remove pkg-config check for specific icon theme
gnome-system-monitor: Remove pkg-config check for specific icon theme
gnome-themes: Depend on adwaita, not gnome-icon-theme
xfce4-settings: recommend adwaita, not gnome-icon-theme

The following changes since commit b1a92d10d8bdf453746151ea9f0c14dce96d5f95:

  xfce4-settings: recommend adwaita, not gnome-icon-theme (2015-09-17 01:17:13 +0200)

are available in the git repository at:

  git://github.com/schnitzeltony/meta-openembedded.git desperate-fixes

for you to fetch changes up to 63fd6384b37f3e4a3d2d8e1e348060f2657321b4:

  xfce4-settings: make Adwaita default icon theme (2015-09-17 02:19:07 +0200)

----------------------------------------------------------------
Andreas Müller (19):
      gvfs: remove invalid PACKAGECONFIG[cdda]
      gst-plugins-ugly: prepare for update of libcdio
      libcdio: update to 0.93
      libburn: initial add 1.4.0
      cdrkit: initial add 1.1.11
      libgudev: initial add 230
      udisks2: add libgudev to DEPENDS
      udisks: replace udev by libgudev in DEPENDS
      udisks: update to 1.05 and fix build with latest glibc-version
      upower replace udev by libgudev in DEPENDS
      libmbim: replace udev by libgudev in DEPENDS
      thunar-volman: replace udev by libgudev in DEPENDS
      xfce4-power-manager: make upower a build dependency
      gimp: fix compile in latest environment
      gimp: add libgudev to DEPENDS
      polkit-group-rule.inc: remove allarch
      xfce4-settings: remove libnotify from DEPENDS - it is in PACKAGECONFIG
      xfce4-settings: get 0001-xsettings.xml-Set-default-themes.patch back
      xfce4-settings: make Adwaita default icon theme

 meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb                                                                      |   5 +-
 .../gstreamer-0.10/gst-plugins-ugly/0001-cdio-compensate-for-libcdio-s-recent-cd-text-api-cha.patch               | 193 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly_0.10.19.bb                                     |   1 +
 meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb                                                            |   2 +-
 meta-oe/recipes-extended/polkit/polkit-group-rule.inc                                                             |   2 +-
 meta-oe/recipes-gnome/libgudev/libgudev_230.bb                                                                    |  11 ++++
 meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb                                                                      |   4 +-
 meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb                                                                |  18 ++++++
 meta-oe/recipes-multimedia/cdrkit/files/0001-do-not-create-a-run-test-to-determine-order-of-bitfi.patch           |  53 ++++++++++++++++
 meta-oe/recipes-multimedia/libburn/libburn_1.4.0.bb                                                               |  11 ++++
 meta-oe/recipes-multimedia/libcdio/{libcdio_0.82.bb => libcdio_0.93.bb}                                           |   7 +--
 meta-oe/recipes-support/udisks/udisks/0001-fix-build-with-newer-glibc-versions.patch                              |  29 +++++++++
 meta-oe/recipes-support/udisks/udisks/add-systemd-support.patch                                                   | 112 ----------------------------------
 meta-oe/recipes-support/udisks/udisks/udisks-1.0.5-fix-service-file.patch                                         |  33 ++++++++++
 meta-oe/recipes-support/udisks/udisks2_2.1.5.bb                                                                   |   3 +-
 meta-oe/recipes-support/udisks/{udisks_1.0.4.bb => udisks_1.0.5.bb}                                               |  22 +++----
 meta-oe/recipes-support/upower/upower_0.9.14.bb                                                                   |   2 +-
 meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.1.bb                                                       |   2 +-
 meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb                                           |   4 +-
 meta-xfce/recipes-xfce/xfce4-settings/files/0001-xsettings.xml-Set-default-themes.patch                           |  33 ++++++++++
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb                                                       |   9 ++-
 21 files changed, 413 insertions(+), 143 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-ugly/0001-cdio-compensate-for-libcdio-s-recent-cd-text-api-cha.patch
 create mode 100644 meta-oe/recipes-gnome/libgudev/libgudev_230.bb
 create mode 100644 meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
 create mode 100644 meta-oe/recipes-multimedia/cdrkit/files/0001-do-not-create-a-run-test-to-determine-order-of-bitfi.patch
 create mode 100644 meta-oe/recipes-multimedia/libburn/libburn_1.4.0.bb
 rename meta-oe/recipes-multimedia/libcdio/{libcdio_0.82.bb => libcdio_0.93.bb} (71%)
 create mode 100644 meta-oe/recipes-support/udisks/udisks/0001-fix-build-with-newer-glibc-versions.patch
 delete mode 100644 meta-oe/recipes-support/udisks/udisks/add-systemd-support.patch
 create mode 100644 meta-oe/recipes-support/udisks/udisks/udisks-1.0.5-fix-service-file.patch
 rename meta-oe/recipes-support/udisks/{udisks_1.0.4.bb => udisks_1.0.5.bb} (60%)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/files/0001-xsettings.xml-Set-default-themes.patch

-- 
2.1.0


