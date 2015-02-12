Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8BF9A733B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 21:22:11 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id y19so12827325wgg.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 13:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=b1fgNSEMaIn7kfq3O/lN2lY+cuSK7In+s2qCoFfdrmU=;
	b=vIlF+dEUc9dtdrUQKTaFcxwRF8s+183DH4cpZZc8XKs6D5484TYfJEhTPtDNBhvk8M
	gBs+EO/ZDMG2T4Gmp9jznb4q60e7Pdg1JXV5WrQ089ukhh4JL2Iwm88EfTxDlV22jfwZ
	TE1u3tlxP9qiFQJmwzdJxIAS2PBsiVMuzOuCf3ByFWyqKa2/fOWso/wYQ87n1r3Py78/
	Vra0yPZgyNLJwW3RAvwWuadg/shxbUO0n0BObaSKt/llzbJtEJBhBG8cuTtVnoBbTRFQ
	AFBUZEKJEqZTmzrUGjc707UC0CvZ8Ly+Na8xgBweiKjdz57TX3E4f+20Qc7VVzgr7Rd+
	fuJA==
X-Received: by 10.181.13.4 with SMTP id eu4mr10054371wid.41.1423776132047;
	Thu, 12 Feb 2015 13:22:12 -0800 (PST)
Received: from localhost.localdomain (p5B0A0430.dip0.t-ipconnect.de.
	[91.10.4.48])
	by mx.google.com with ESMTPSA id fm10sm4136024wib.7.2015.02.12.13.22.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 13:22:11 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2015 22:21:40 +0100
Message-Id: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH 00/19] various adds/updates/fxes
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
X-List-Received-Date: Thu, 12 Feb 2015 21:22:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 4e08e7c3a5c36c859e01e4d2168ea3e1b287bcc0:

  snmpd: instead option -LS by -Ls (2015-02-11 21:27:29 -0500)

are available in the git repository at:

  https://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git patches

for you to fetch changes up to d79e10f595f569a177efbd09e4778a87dbd3fed5:

  gimp: update to 2.8.14 / fix build by not configuring with freetype-config (2015-02-12 16:09:33 +0100)

----------------------------------------------------------------
Andreas Müller (19):
      libmbim: initial add 1.12.2
      libqmi: initial add 1.12.2
      modemmanager: update to 1.4.2
      network-manager-applet: add PACKAGCONFIG for modemmanager - disabled by default
      initial add xmessage 1.0.4
      xfce4-kbdleds-plugin: Initial add 0.0.6
      packagegroup-xfce-extended: add xfce4-kbdleds-plugin
      xfce4-screenshooter: update to 1.8.2
      xfce4-weather-plugin: update to 0.8.5
      xfce4-whiskermenu-plugin: update to 1.4.2
      xfce4-cpufreq-plugin: update to 1.1.1
      xfce4-netload-plugin: update to 1.2.4
      xfce4-eyes-plugin: update to 4.4.3
      xfce4-systemload-plugin: update to 1.1.2
      xfce4-equake-plugin: update to 1.3.6
      xfce4-timer-plugin: initial add 1.6.0
      packagegroup-xfce-extended: add xfce4-timer-plugin
      gnome-bluetooth: fix build by using a valid dbus interface + unblacklist
      gimp: update to 2.8.14 / fix build by not configuring with freetype-config

 meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.10.bb                         |   1 +
 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0002-bluetooth-client-use-valid-interface-names.patch    | 122 +++++++++++++++++++++++++++++++++++++++++++
 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb                                                |   8 +--
 meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb                                                            |  15 ++++++
 meta-oe/recipes-connectivity/libqmi/libqmi_1.12.2.bb                                                              |  15 ++++++
 meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.2.bb                                                   |  39 ++++++++++++++
 meta-oe/recipes-connectivity/networkmanager/modemmanager_0.6.0.0.bb                                               |  29 -----------
 meta-oe/recipes-graphics/gimp/gimp/0001-configure-ac-do-not-check-for-freetype-config.patch                       |  38 ++++++++++++++
 meta-oe/recipes-graphics/gimp/gimp/freetype.patch                                                                 |  30 -----------
 meta-oe/recipes-graphics/gimp/{gimp_2.8.10.bb => gimp_2.8.14.bb}                                                  |  13 ++---
 meta-oe/recipes-graphics/xorg-app/xmessage_1.0.4.bb                                                               |  10 ++++
 meta-xfce/recipes-apps/xfce4-screenshooter/files/0001-Fix-panel-plugin-build.patch                                |  43 ----------------
 meta-xfce/recipes-apps/xfce4-screenshooter/{xfce4-screenshooter_1.8.1.bb => xfce4-screenshooter_1.8.2.bb}         |  12 +++--
 meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.1.0.bb                                             |  15 ------
 meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.1.1.bb                                             |   9 ++++
 meta-xfce/recipes-panel-plugins/equake/{xfce4-equake-plugin_1.3.5.bb => xfce4-equake-plugin_1.3.6.bb}             |   4 +-
 meta-xfce/recipes-panel-plugins/eyes/{xfce4-eyes-plugin_4.4.2.bb => xfce4-eyes-plugin_4.4.3.bb}                   |   4 +-
 meta-xfce/recipes-panel-plugins/kbdleds/xfce4-kbdleds-plugin_0.0.6.bb                                             |  14 +++++
 meta-xfce/recipes-panel-plugins/netload/{xfce4-netload-plugin_1.2.0.bb => xfce4-netload-plugin_1.2.4.bb}          |   4 +-
 meta-xfce/recipes-panel-plugins/systemload/{xfce4-systemload-plugin_1.1.1.bb => xfce4-systemload-plugin_1.1.2.bb} |   4 +-
 meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.6.0.bb                                                 |   9 ++++
 meta-xfce/recipes-panel-plugins/weather/files/0001-Make-plugin-ready-for-met.no-locationforecast-1.2-AP.patch     | 162 ----------------------------------------------------------
 meta-xfce/recipes-panel-plugins/weather/files/0002-Switch-to-met.no-locationforecastLTS-1.2-API-bug-109.patch     |  27 ----------
 meta-xfce/recipes-panel-plugins/weather/{xfce4-weather-plugin_0.8.3.bb => xfce4-weather-plugin_0.8.5.bb}          |   8 +--
 .../{whisker/xfce4-whiskermenu-plugin_1.3.2.bb => whiskermenu/xfce4-whiskermenu-plugin_1.4.2.bb}                  |   4 +-
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb                                                |   2 +
 26 files changed, 304 insertions(+), 337 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0002-bluetooth-client-use-valid-interface-names.patch
 create mode 100644 meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb
 create mode 100644 meta-oe/recipes-connectivity/libqmi/libqmi_1.12.2.bb
 create mode 100644 meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.2.bb
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/modemmanager_0.6.0.0.bb
 create mode 100644 meta-oe/recipes-graphics/gimp/gimp/0001-configure-ac-do-not-check-for-freetype-config.patch
 delete mode 100644 meta-oe/recipes-graphics/gimp/gimp/freetype.patch
 rename meta-oe/recipes-graphics/gimp/{gimp_2.8.10.bb => gimp_2.8.14.bb} (73%)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/xmessage_1.0.4.bb
 delete mode 100644 meta-xfce/recipes-apps/xfce4-screenshooter/files/0001-Fix-panel-plugin-build.patch
 rename meta-xfce/recipes-apps/xfce4-screenshooter/{xfce4-screenshooter_1.8.1.bb => xfce4-screenshooter_1.8.2.bb} (59%)
 delete mode 100644 meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.1.0.bb
 create mode 100644 meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.1.1.bb
 rename meta-xfce/recipes-panel-plugins/equake/{xfce4-equake-plugin_1.3.5.bb => xfce4-equake-plugin_1.3.6.bb} (74%)
 rename meta-xfce/recipes-panel-plugins/eyes/{xfce4-eyes-plugin_4.4.2.bb => xfce4-eyes-plugin_4.4.3.bb} (68%)
 create mode 100644 meta-xfce/recipes-panel-plugins/kbdleds/xfce4-kbdleds-plugin_0.0.6.bb
 rename meta-xfce/recipes-panel-plugins/netload/{xfce4-netload-plugin_1.2.0.bb => xfce4-netload-plugin_1.2.4.bb} (66%)
 rename meta-xfce/recipes-panel-plugins/systemload/{xfce4-systemload-plugin_1.1.1.bb => xfce4-systemload-plugin_1.1.2.bb} (70%)
 create mode 100644 meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.6.0.bb
 delete mode 100644 meta-xfce/recipes-panel-plugins/weather/files/0001-Make-plugin-ready-for-met.no-locationforecast-1.2-AP.patch
 delete mode 100644 meta-xfce/recipes-panel-plugins/weather/files/0002-Switch-to-met.no-locationforecastLTS-1.2-API-bug-109.patch
 rename meta-xfce/recipes-panel-plugins/weather/{xfce4-weather-plugin_0.8.3.bb => xfce4-weather-plugin_0.8.5.bb} (53%)
 rename meta-xfce/recipes-panel-plugins/{whisker/xfce4-whiskermenu-plugin_1.3.2.bb => whiskermenu/xfce4-whiskermenu-plugin_1.4.2.bb} (68%)

-- 
1.9.3


