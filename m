Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1456A76952
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 07:58:09 +0000 (UTC)
Received: by wijp15 with SMTP id p15so165105453wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 00:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=0Jtzqxp0azK3bJ2Cy2MqgfvSXVX+YKm++0htq2JbxoE=;
	b=HPBTexSCHCntoFtRpC+WWU/YRAhl0+xZi5+vyOkYVZQd2HPObtd2sxb+LKLqzgu7ma
	X180dX7VBgMv/t+ep+WtSovuG0W7lG/tbnYZbRMEoQ1W2ZXaNjXlT9donBWUlL1nfNEH
	0F6PpyNAjJ9IW9zyue3kVisDDrCP5CtBR7ASWBNourw9hlDICxWbe//+Xb/BPBOZGeQL
	6QJPc8HMTcCE+96Y5IbMxaWpLDmmL/SZgSz4/R2t1mzmdz3cvRzAXzoGM5f4YLu9u1wb
	z+lpyWyoXWQUWm4KJCQoFypYs/4fkNdZVqQyawe28Xa4AhAFSDmc+LTmDayyFSjlnmft
	OZwA==
X-Received: by 10.194.21.230 with SMTP id y6mr58825302wje.132.1439279889702;
	Tue, 11 Aug 2015 00:58:09 -0700 (PDT)
Received: from localhost.localdomain
	(ip-109-91-251-29.hsi12.unitymediagroup.de. [109.91.251.29])
	by smtp.googlemail.com with ESMTPSA id
	fs8sm2124773wib.0.2015.08.11.00.58.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Aug 2015 00:58:09 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Aug 2015 09:57:22 +0200
Message-Id: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH 00/17] updates & new recipes
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
X-List-Received-Date: Tue, 11 Aug 2015 07:58:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 9a67b079a7deff2d6e53df031b26304a71c4e0f8:

  znc: add SRCREV_FORMAT variable (2015-08-07 11:01:01 -0400)

are available in the git repository at:

  git://github.com/schnitzeltony/meta-openembedded.git patches

for you to fetch changes up to ac67408111e9c6729da89f3c9f96b9e39c5994b3:

  xfce4-settings: get option to hide mousepointer for (touch) input devices back (2015-08-11 09:43:28 +0200)

----------------------------------------------------------------
Andreas Müller (17):
      xfce4-panel: build gtk3 libraries and ship them in an extra package
      xfce4-pulseaudio-plugin: initial add 0.2.3
      packagegroup-xfce-extended: add xfce4-pulseaudio-plugin
      xfdesktop: update to 4.12.3
      xfce4-cpufreq-plugin: update to 1.1.2
      xfce4-weather-plugin: update to 0.8.6
      xfce4-notes-plugin: update to 1.8.1
      glibmm: update to 2.44.0
      mm-common: update to 0.9.8
      cairomm: update to 1.11.2
      pangomm: update to 2.36.0
      gparted: update to 0.23.0
      rodent-icon-theme: initial add 5.0
      networkmanager: update to 1.0.4
      network-manager-applet: update to 1.0.4
      pavucontrol: update to 3.0
      xfce4-settings: get option to hide mousepointer for (touch) input devices back

 .../recipes-connectivity/network-manager-applet/files/0001-Add-support-for-AP-mode-setting-for-wifi-sharing.patch |  28 +--
 .../network-manager-applet/{network-manager-applet_1.0.2.bb => network-manager-applet_1.0.4.bb}                   |   4 +-
 meta-gnome/recipes-extended/gparted/gparted/0001-configure.ac-use-pkg-config-to-check-for-version-of-.patch       |  68 -------
 meta-gnome/recipes-extended/gparted/{gparted_0.20.0.bb => gparted_0.23.0.bb}                                      |   9 +-
 meta-oe/recipes-connectivity/networkmanager/{networkmanager_1.0.2.bb => networkmanager_1.0.4.bb}                  |   4 +-
 meta-oe/recipes-core/glib-2.0/{glibmm_2.36.2.bb => glibmm_2.44.0.bb}                                              |   4 +-
 meta-oe/recipes-core/mm-common/{mm-common_0.9.7.bb => mm-common_0.9.8.bb}                                         |   4 +-
 meta-oe/recipes-graphics/cairo/{cairomm_1.10.0.bb => cairomm_1.11.2.bb}                                           |   6 +-
 meta-oe/recipes-graphics/pango/{pangomm_2.34.0.bb => pangomm_2.36.0.bb}                                           |   4 +-
 meta-oe/recipes-multimedia/pulseaudio/{pavucontrol_1.0.bb => pavucontrol_3.0.bb}                                  |   4 +-
 meta-xfce/recipes-art/rodent-icon-theme/rodent-icon-theme_5.0.bb                                                  |  11 ++
 meta-xfce/recipes-panel-plugins/cpufreq/{xfce4-cpufreq-plugin_1.1.1.bb => xfce4-cpufreq-plugin_1.1.2.bb}          |   4 +-
 meta-xfce/recipes-panel-plugins/notes/{xfce4-notes-plugin_1.8.0.bb => xfce4-notes-plugin_1.8.1.bb}                |   4 +-
 meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.2.3.bb                                       |  14 ++
 meta-xfce/recipes-panel-plugins/weather/{xfce4-weather-plugin_0.8.5.bb => xfce4-weather-plugin_0.8.6.bb}          |   4 +-
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb                                                |   1 +
 meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.0.bb                                                          |  10 +-
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0001-xsettings.xml-remove-trouble-causing-comment.patch      |  31 ----
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0002-xsettings.xml-Set-default-themes.patch                  |  32 ----
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0001-add-cursor-theme-xfce-invisible.patch       | 248 -------------------------
 .../xfce4-settings/xfce4-settings/touchscreen/0002-mouse-settings-dialog-add-touchscreen-pointer-option.patch     | 152 ---------------
 .../xfce4-settings/xfce4-settings/touchscreen/0003-XfcePointersHelper-gets-a-pointer-to-XfceXSettingsHe.patch     | 137 --------------
 .../xfce4-settings/xfce4-settings/touchscreen/0004-XfceXSettingsHelper-gets-a-property-touchscreen-poin.patch     | 249 -------------------------
 .../xfce4-settings/xfce4-settings/touchscreen/0005-pointers-detect-a-change-of-pointer-device-used-and-.patch     | 589 ----------------------------------------------------------
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/invisible                                        | Bin 4160 -> 0 bytes
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/wait                                             | Bin 126096 -> 0 bytes
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb                                                       |  11 +-
 meta-xfce/recipes-xfce/xfdesktop/files/0001-Remove-whitespaces-from-monitor-name-when-accessing-.patch            | 138 --------------
 meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.12.2.bb => xfdesktop_4.12.3.bb}                                     |   5 +-
 29 files changed, 82 insertions(+), 1693 deletions(-)
 rename meta-gnome/recipes-connectivity/network-manager-applet/{network-manager-applet_1.0.2.bb => network-manager-applet_1.0.4.bb} (89%)
 delete mode 100644 meta-gnome/recipes-extended/gparted/gparted/0001-configure.ac-use-pkg-config-to-check-for-version-of-.patch
 rename meta-gnome/recipes-extended/gparted/{gparted_0.20.0.bb => gparted_0.23.0.bb} (57%)
 rename meta-oe/recipes-connectivity/networkmanager/{networkmanager_1.0.2.bb => networkmanager_1.0.4.bb} (94%)
 rename meta-oe/recipes-core/glib-2.0/{glibmm_2.36.2.bb => glibmm_2.44.0.bb} (87%)
 rename meta-oe/recipes-core/mm-common/{mm-common_0.9.7.bb => mm-common_0.9.8.bb} (51%)
 rename meta-oe/recipes-graphics/cairo/{cairomm_1.10.0.bb => cairomm_1.11.2.bb} (68%)
 rename meta-oe/recipes-graphics/pango/{pangomm_2.34.0.bb => pangomm_2.36.0.bb} (81%)
 rename meta-oe/recipes-multimedia/pulseaudio/{pavucontrol_1.0.bb => pavucontrol_3.0.bb} (75%)
 create mode 100644 meta-xfce/recipes-art/rodent-icon-theme/rodent-icon-theme_5.0.bb
 rename meta-xfce/recipes-panel-plugins/cpufreq/{xfce4-cpufreq-plugin_1.1.1.bb => xfce4-cpufreq-plugin_1.1.2.bb} (64%)
 rename meta-xfce/recipes-panel-plugins/notes/{xfce4-notes-plugin_1.8.0.bb => xfce4-notes-plugin_1.8.1.bb} (78%)
 create mode 100644 meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.2.3.bb
 rename meta-xfce/recipes-panel-plugins/weather/{xfce4-weather-plugin_0.8.5.bb => xfce4-weather-plugin_0.8.6.bb} (72%)
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0001-xsettings.xml-remove-trouble-causing-comment.patch
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0002-xsettings.xml-Set-default-themes.patch
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0001-add-cursor-theme-xfce-invisible.patch
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0002-mouse-settings-dialog-add-touchscreen-pointer-option.patch
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0003-XfcePointersHelper-gets-a-pointer-to-XfceXSettingsHe.patch
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0004-XfceXSettingsHelper-gets-a-property-touchscreen-poin.patch
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0005-pointers-detect-a-change-of-pointer-device-used-and-.patch
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/invisible
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/wait
 delete mode 100644 meta-xfce/recipes-xfce/xfdesktop/files/0001-Remove-whitespaces-from-monitor-name-when-accessing-.patch
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.12.2.bb => xfdesktop_4.12.3.bb} (64%)

-- 
2.1.0


