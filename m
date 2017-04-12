Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4AE2D77CD4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 19:56:52 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id t189so32272047wmt.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 12:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+auAG6ZwbxezJGNecfsGNwANXCA1x52JbPidn3jeynw=;
	b=cScNH7T2Ko0ftilYqgtTEhFce1li6oaKva1QHpz32i+Qwl4GYU2orU1eEaGo28mOTz
	dsg/g9x7k/3dykzHRGblTxDhUmITTEsXys2KlYtDz1ojF8LHW/HMniWHIxjrXUWsi9Uo
	dfnfvgsp1UHFCysItflDU5XpG6VZRVnndA7lWNKACENJ04GmjJux0cQ9Ue113WcFZt+T
	YT6W9oQwQBfGMYmlYO3OMJOFExF3nqhZP4GrWiURWhIK2ivescaXGEy2O7g3TA/IrFTJ
	etmLCSDtuGFJzKR8MK9xtJSineP8o8Cl85w4xMmYBhLIgwltszR3uYw145H38U5Ew/LV
	ceZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+auAG6ZwbxezJGNecfsGNwANXCA1x52JbPidn3jeynw=;
	b=n10zQYTCapSZO+RzjNWZ7loeLDIkECqbzHKXVroPQQ4gKYCdxU1Xp4wuUBncHdxBfV
	16bpx8wGu4YSOaCqOrVutXW84U1euOZ6iEoKWmSycXYPS5Jm55ZYS9LYUoOFbANKii5Y
	13sG+VEOoLgtGfBNrsDs50EtVWK76uECvQXQkFEcG20PMI1t33m/MlbU4z9bLQ0woouk
	IdtaQYyAT76nZHVikyL07RYli7upEpnge4a2JMYC4vlazZO5ykcIuQhXBO2b1U6fOgGN
	Fk3BG3lAQUzEQYtHHTUoEtoxBNw0VxaSRikzzEeWv+7mYVJJmC0qmOJUpanKn2qnCAuU
	ipMg==
X-Gm-Message-State: AN3rC/4pVvnjhBok/2r2/PpO42zMJS/8Jbuycz3wWEqOyOjR5ZHDQVvm
	VF5ZAC8fsWRzGNLD
X-Received: by 10.28.159.143 with SMTP id i137mr21174976wme.128.1492027012427; 
	Wed, 12 Apr 2017 12:56:52 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911F1781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:f178:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	t100sm3522637wrc.24.2017.04.12.12.56.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Apr 2017 12:56:51 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Apr 2017 21:56:09 +0200
Message-Id: <20170412195638.3243-1-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH 00/29] updates and more
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
X-List-Received-Date: Wed, 12 Apr 2017 19:56:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 2cdea6c5bb09aa90184c17c9157f4fed0e10b3c2:

  opencv: do not depend on swig. (2017-04-06 13:00:31 +0200)

are available in the git repository at:

  https://github.com/schnitzeltony/meta-openembedded.git pre-easter-stuff

for you to fetch changes up to 79828cc0084a26602385a82e0f3fd73e739f1537:

  xfce4-sensors-plugin: update 1.2.6 -> 1.2.97 (2017-04-12 18:38:18 +0200)

----------------------------------------------------------------
Andreas Müller (29):
      fltk: rework completely
      jack: update to latest git-revision
      thunar: update 1.6.10 -> 1.6.11
      geany: update 1.29 -> 1.30.1
      geany-plugins: update 1.29 -> 1.30
      xfce4-notifyd: update 0.3.4 -> 0.3.6
      xfce4-taskmanager: update 1.1.0 -> 1.2.0
      xfce4-terminal: update 0.8.3 -> 0.8.4
      xfce4-diskperf-plugin: update 2.6.0 -> 2.6.1
      xfwm4: 4.12.3 -> 4.12.4
      xfce4-weather-plugin: update 0.8.8 -> 0.8.9
      xfce4-systemload-plugin: update 1.2.0 -> 1.2.1
      xfce4-netload-plugin: update 1.3.0 -> 1.3.1
      xfce4-equake-plugin: update 1.3.8 -> 1.3.8.1
      xfce4-genmon-plugin: update 3.4.0 -> 4.0.0
      xfce4-whiskermenu-plugin: update 2.1.0 -> 2.1.2
      networkmanager: update 1.4.2 -> 1.4.4
      networkmanager-openvpn: add glib-2.0-native to DEPENDS and unblacklist
      networkmanager-openvpn: pack static libs properly
      networkmanager-openvpn: update 1.2.6 -> 1.2.8
      network-manager-applet: update 1.4.2 -> 1.4.4
      xfce4-mount-plugin: update 0.6.4 -> 1.1.2
      poppler: update 0.51.0 -> 0.53.0
      libass: update 0.13.2 -> 0.13.6
      mpv: update 0.15.0 -> 0.24.0
      mpv: add PACKAGECONFIG for drm/gbm/vdpau/wayland
      xfce4-closebutton-plugin: Upstream clang-fix-patch
      xarchiver: Upstream printf-fix-patch
      xfce4-sensors-plugin: update 1.2.6 -> 1.2.97

 .../network-manager-applet/{network-manager-applet_1.4.2.bb => network-manager-applet_1.4.4.bb}                   |   4 +-
 meta-oe/recipes-connectivity/networkmanager/{networkmanager-openvpn_1.2.6.bb => networkmanager-openvpn_1.2.8.bb}  |  12 +-
 meta-oe/recipes-connectivity/networkmanager/{networkmanager_1.4.2.bb => networkmanager_1.4.4.bb}                  |   6 +-
 meta-oe/recipes-devtools/geany/{geany-plugins_1.29.bb => geany-plugins_1.30.bb}                                   |   4 +-
 meta-oe/recipes-devtools/geany/{geany_1.29.bb => geany_1.30.1.bb}                                                 |   4 +-
 meta-oe/recipes-multimedia/jack/jack/0001-Add-ARM-NEON-acceleration-for-all-non-dithering-samp.patch              | 496 ----------------------------------------------------------
 meta-oe/recipes-multimedia/jack/jack/0002-jack_simdtests-add-application-checking-accurracy-an.patch              | 433 --------------------------------------------------
 meta-oe/recipes-multimedia/jack/jack_git.bb                                                                       |   8 +-
 meta-oe/recipes-multimedia/libass/libass.inc                                                                      |   2 +-
 meta-oe/recipes-multimedia/libass/libass_0.13.2.bb                                                                |   4 -
 meta-oe/recipes-multimedia/libass/libass_0.13.6.bb                                                                |   4 +
 meta-oe/recipes-multimedia/mplayer/mpv/0001-Fix-build-with-HAVE_GL-0.patch                                        |  39 +++++
 meta-oe/recipes-multimedia/mplayer/{mpv_0.15.0.bb => mpv_0.24.0.bb}                                               |  25 ++-
 meta-oe/recipes-support/fltk/fltk-native.bb                                                                       |  16 ++
 meta-oe/recipes-support/fltk/fltk.bb                                                                              |  34 ++++
 meta-oe/recipes-support/fltk/fltk.inc                                                                             |  21 +++
 meta-oe/recipes-support/fltk/fltk/0001-Fl_Preferences.cxx-do-not-use-dlopen-in-case-glibc-s.patch                 |  39 +++++
 meta-oe/recipes-support/fltk/fltk/0002-always-build-fluid-and-export-pointers.patch                               |  31 ++++
 meta-oe/recipes-support/fltk/fltk_1.3.4-1.bb                                                                      |  47 ------
 meta-oe/recipes-support/poppler/{poppler_0.51.0.bb => poppler_0.53.0.bb}                                          |  11 +-
 meta-xfce/recipes-apps/xarchiver/xarchiver/0001-Add-proper-formatting-string-to-printf-like-function.patch        |  40 -----
 meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb                                                                 |   6 +-
 meta-xfce/recipes-apps/xfce4-notifyd/{xfce4-notifyd_0.3.4.bb => xfce4-notifyd_0.3.6.bb}                           |   4 +-
 meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.1.0.bb                                               |  10 --
 meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.2.0.bb                                               |  10 ++
 meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.8.3.bb => xfce4-terminal_0.8.4.bb}                        |   4 +-
 .../closebutton/xfce4-closebutton-plugin/0001-Use-g_return_val_if_fail-in-functions-expecting-a-re.patch          |  62 --------
 meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb                                       |   6 +-
 meta-xfce/recipes-panel-plugins/diskperf/{xfce4-diskperf-plugin_2.6.0.bb => xfce4-diskperf-plugin_2.6.1.bb}       |   4 +-
 meta-xfce/recipes-panel-plugins/equake/{xfce4-equake-plugin_1.3.8.bb => xfce4-equake-plugin_1.3.8.1.bb}           |   6 +-
 meta-xfce/recipes-panel-plugins/genmon/files/0001-Allow-timer-period-to-be-set-at-250ms-resolution.-Pa.patch      |  36 -----
 meta-xfce/recipes-panel-plugins/genmon/{xfce4-genmon-plugin_3.4.0.bb => xfce4-genmon-plugin_4.0.0.bb}             |   8 +-
 meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin/0001-check-for-fstab.h-during-configure.patch            |  50 +++---
 meta-xfce/recipes-panel-plugins/mount/{xfce4-mount-plugin_0.6.4.bb => xfce4-mount-plugin_1.1.2.bb}                |   7 +-
 meta-xfce/recipes-panel-plugins/netload/{xfce4-netload-plugin_1.3.0.bb => xfce4-netload-plugin_1.3.1.bb}          |   4 +-
 meta-xfce/recipes-panel-plugins/sensors/{xfce4-sensors-plugin_1.2.6.bb => xfce4-sensors-plugin_1.2.97.bb}         |   4 +-
 meta-xfce/recipes-panel-plugins/systemload/{xfce4-systemload-plugin_1.2.0.bb => xfce4-systemload-plugin_1.2.1.bb} |   4 +-
 meta-xfce/recipes-panel-plugins/weather/{xfce4-weather-plugin_0.8.8.bb => xfce4-weather-plugin_0.8.9.bb}          |   4 +-
 .../recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.1.0.bb => xfce4-whiskermenu-plugin_2.1.2.bb}    |   4 +-
 meta-xfce/recipes-xfce/thunar/{thunar_1.6.10.bb => thunar_1.6.11.bb}                                              |   4 +-
 meta-xfce/recipes-xfce/xfwm4/files/0001-don-t-block-display-events-when-time-is-set-backward.patch                |  33 ----
 meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.12.3.bb => xfwm4_4.12.4.bb}                                                 |   5 +-
 42 files changed, 291 insertions(+), 1264 deletions(-)
 rename meta-gnome/recipes-connectivity/network-manager-applet/{network-manager-applet_1.4.2.bb => network-manager-applet_1.4.4.bb} (84%)
 rename meta-oe/recipes-connectivity/networkmanager/{networkmanager-openvpn_1.2.6.bb => networkmanager-openvpn_1.2.8.bb} (72%)
 rename meta-oe/recipes-connectivity/networkmanager/{networkmanager_1.4.2.bb => networkmanager_1.4.4.bb} (94%)
 rename meta-oe/recipes-devtools/geany/{geany-plugins_1.29.bb => geany-plugins_1.30.bb} (98%)
 rename meta-oe/recipes-devtools/geany/{geany_1.29.bb => geany_1.30.1.bb} (75%)
 delete mode 100644 meta-oe/recipes-multimedia/jack/jack/0001-Add-ARM-NEON-acceleration-for-all-non-dithering-samp.patch
 delete mode 100644 meta-oe/recipes-multimedia/jack/jack/0002-jack_simdtests-add-application-checking-accurracy-an.patch
 delete mode 100644 meta-oe/recipes-multimedia/libass/libass_0.13.2.bb
 create mode 100644 meta-oe/recipes-multimedia/libass/libass_0.13.6.bb
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv/0001-Fix-build-with-HAVE_GL-0.patch
 rename meta-oe/recipes-multimedia/mplayer/{mpv_0.15.0.bb => mpv_0.24.0.bb} (68%)
 create mode 100644 meta-oe/recipes-support/fltk/fltk-native.bb
 create mode 100644 meta-oe/recipes-support/fltk/fltk.bb
 create mode 100644 meta-oe/recipes-support/fltk/fltk.inc
 create mode 100644 meta-oe/recipes-support/fltk/fltk/0001-Fl_Preferences.cxx-do-not-use-dlopen-in-case-glibc-s.patch
 create mode 100644 meta-oe/recipes-support/fltk/fltk/0002-always-build-fluid-and-export-pointers.patch
 delete mode 100644 meta-oe/recipes-support/fltk/fltk_1.3.4-1.bb
 rename meta-oe/recipes-support/poppler/{poppler_0.51.0.bb => poppler_0.53.0.bb} (78%)
 delete mode 100644 meta-xfce/recipes-apps/xarchiver/xarchiver/0001-Add-proper-formatting-string-to-printf-like-function.patch
 rename meta-xfce/recipes-apps/xfce4-notifyd/{xfce4-notifyd_0.3.4.bb => xfce4-notifyd_0.3.6.bb} (79%)
 delete mode 100644 meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.1.0.bb
 create mode 100644 meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.2.0.bb
 rename meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.8.3.bb => xfce4-terminal_0.8.4.bb} (68%)
 delete mode 100644 meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin/0001-Use-g_return_val_if_fail-in-functions-expecting-a-re.patch
 rename meta-xfce/recipes-panel-plugins/diskperf/{xfce4-diskperf-plugin_2.6.0.bb => xfce4-diskperf-plugin_2.6.1.bb} (65%)
 rename meta-xfce/recipes-panel-plugins/equake/{xfce4-equake-plugin_1.3.8.bb => xfce4-equake-plugin_1.3.8.1.bb} (72%)
 delete mode 100644 meta-xfce/recipes-panel-plugins/genmon/files/0001-Allow-timer-period-to-be-set-at-250ms-resolution.-Pa.patch
 rename meta-xfce/recipes-panel-plugins/genmon/{xfce4-genmon-plugin_3.4.0.bb => xfce4-genmon-plugin_4.0.0.bb} (57%)
 rename meta-xfce/recipes-panel-plugins/mount/{xfce4-mount-plugin_0.6.4.bb => xfce4-mount-plugin_1.1.2.bb} (68%)
 rename meta-xfce/recipes-panel-plugins/netload/{xfce4-netload-plugin_1.3.0.bb => xfce4-netload-plugin_1.3.1.bb} (66%)
 rename meta-xfce/recipes-panel-plugins/sensors/{xfce4-sensors-plugin_1.2.6.bb => xfce4-sensors-plugin_1.2.97.bb} (86%)
 rename meta-xfce/recipes-panel-plugins/systemload/{xfce4-systemload-plugin_1.2.0.bb => xfce4-systemload-plugin_1.2.1.bb} (70%)
 rename meta-xfce/recipes-panel-plugins/weather/{xfce4-weather-plugin_0.8.8.bb => xfce4-weather-plugin_0.8.9.bb} (72%)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.1.0.bb => xfce4-whiskermenu-plugin_2.1.2.bb} (66%)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.6.10.bb => thunar_1.6.11.bb} (88%)
 delete mode 100644 meta-xfce/recipes-xfce/xfwm4/files/0001-don-t-block-display-events-when-time-is-set-backward.patch
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.12.3.bb => xfwm4_4.12.4.bb} (80%)

-- 
2.9.3


