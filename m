Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 35F73733B5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 07:02:09 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id r20so9827128wiv.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 23:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=UlbK2xdsakxnP+2qJDPZcinFPCtldzkZNnRz9eau/A4=;
	b=VX8zbXGCDqppgEuI0LG57QPpprC1gg6qCFUlk50fGl+4BfG5RTByi46j/uBSLLteO1
	JJgB2qBpSlJmtWfTL1FvlUAi+I7m80Pml5a2MYW+xikqbXyLQX0zi+zG6/Q7XvM3UduZ
	DziCRc4bHzaGNUeTBnVDA8PGoSHKvycN0nKWfsVl2mEswgSEQ2jwOBeaM522fLxGjCik
	j0Lc6KNcPjFy3bVGS985D83nubVSoD9o5/DzD5//PY5M1G1gJAN/8gUNO0f6zoNBFPlA
	aLBAgRMfn9aZJB7FXpSkwvDPsUPP5usYnjzLo8mCFymgyicNLb0TYOvGG6Xfe2KYA2GL
	BYew==
X-Received: by 10.180.14.104 with SMTP id o8mr12980266wic.47.1423810930583;
	Thu, 12 Feb 2015 23:02:10 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip0.t-ipconnect.de.
	[91.10.19.148])
	by mx.google.com with ESMTPSA id v16sm1635972wib.5.2015.02.12.23.02.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 23:02:09 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2015 08:01:40 +0100
Message-Id: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [V2][PATCH 00/19] various adds/updates/fxes
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
X-List-Received-Date: Fri, 13 Feb 2015 07:02:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

V1-V2:

* long SUMMARYs shortened / DESCRIPTION added
* xmessage: commit message aligned

The following changes since commit 4e08e7c3a5c36c859e01e4d2168ea3e1b287bcc0:

  snmpd: instead option -LS by -Ls (2015-02-11 21:27:29 -0500)

are available in the git repository at:

  https://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git patches

for you to fetch changes up to d0eee205333bc47b68e3df688c445c63890a8cf1:

  gimp: update to 2.8.14 / fix build by not configuring with freetype-config (2015-02-13 07:49:22 +0100)

----------------------------------------------------------------
Andreas Müller (19):
      libmbim: initial add 1.12.2
      libqmi: initial add 1.12.2
      modemmanager: update to 1.4.2
      network-manager-applet: add PACKAGCONFIG for modemmanager - disabled by default
      xmessage: initial add 1.0.4
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
 meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb                                                            |  16 ++++++
 meta-oe/recipes-connectivity/libqmi/libqmi_1.12.2.bb                                                              |  16 ++++++
 meta-oe/recipes-connectivity/modemmanager/modemmanager_1.4.2.bb                                                   |  40 +++++++++++++++
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
 meta-xfce/recipes-panel-plugins/kbdleds/xfce4-kbdleds-plugin_0.0.6.bb                                             |  15 ++++++
 meta-xfce/recipes-panel-plugins/netload/{xfce4-netload-plugin_1.2.0.bb => xfce4-netload-plugin_1.2.4.bb}          |   4 +-
 meta-xfce/recipes-panel-plugins/systemload/{xfce4-systemload-plugin_1.1.1.bb => xfce4-systemload-plugin_1.1.2.bb} |   4 +-
 meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.6.0.bb                                                 |  10 ++++
 meta-xfce/recipes-panel-plugins/weather/files/0001-Make-plugin-ready-for-met.no-locationforecast-1.2-AP.patch     | 162 ----------------------------------------------------------
 meta-xfce/recipes-panel-plugins/weather/files/0002-Switch-to-met.no-locationforecastLTS-1.2-API-bug-109.patch     |  27 ----------
 meta-xfce/recipes-panel-plugins/weather/{xfce4-weather-plugin_0.8.3.bb => xfce4-weather-plugin_0.8.5.bb}          |   8 +--
 .../{whisker/xfce4-whiskermenu-plugin_1.3.2.bb => whiskermenu/xfce4-whiskermenu-plugin_1.4.2.bb}                  |   4 +-
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb                                                |   2 +
 26 files changed, 309 insertions(+), 337 deletions(-)
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


