Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 321F060034
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 23:33:51 +0000 (UTC)
Received: by wibg7 with SMTP id g7so21286201wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 16:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=BmJkmyTOCsCxH7hf2eilII1Pu2d2hOZk07kjFXyqkkg=;
	b=BpZ9a/4mc6XujBlxNQlaw2T56Tb7hcdL9eKgHm9nG4fUNBFNPru3npisKMzMJLFijr
	pQ5taoQK5NjZJ3nYXrQ+j1dSnWVeuYZC4cgx9BFyK8RdwLyQh0NI33nNAQyCIIIJ48La
	C2ARen9eTnHcAMovfrvVAn/ulabHAUfP11pJor4ITQldD2L8CXr8qpWrCuRu2eVkAZkL
	Aa4gqCRav9a2aPq7NKv6w67uzsohD/4F/pi72vn20+RFzKnvkuRNDU890Mmk8CDUQB4P
	OhRYvurPhYBA7Uzx8h1sQWaQ3jhYsfQPj7o7tRyGFQKNiGTyOFoayzFGB/QyfOgzyKA5
	Z7Iw==
X-Received: by 10.180.171.35 with SMTP id ar3mr118798261wic.24.1426462432096; 
	Sun, 15 Mar 2015 16:33:52 -0700 (PDT)
Received: from localhost.localdomain (p54AA52CC.dip0.t-ipconnect.de.
	[84.170.82.204]) by mx.google.com with ESMTPSA id
	r14sm12804945wiv.13.2015.03.15.16.33.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 16:33:50 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2015 00:33:09 +0100
Message-Id: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH][meta-xfce 00/30] xfce 4.12
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
X-List-Received-Date: Sun, 15 Mar 2015 23:33:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 7f274585316a3ac85b3b14f4bb8a297662141f05:

  postfix: get rid of useless code (2015-03-11 19:29:34 -0400)

are available in the git repository at:

  git@github.com:schnitzeltony/meta-openembedded.git xfce-4.12

for you to fetch changes up to b0b2fbe7211f031e551e13fe081d798ff3bf07b2:

  xfce4-eyes-plugin_ update to 4.4.4 (2015-03-15 22:29:47 +0100)

----------------------------------------------------------------
Andreas Müller (30):
      exo: update to 0.10.3
      xfce4-dev-tools: update to 4.12.0
      libxfce4util: update to 4.12.1
      xfconf: update to 4.12.0
      libxfce4ui: update to 4.12.1
      garcon: update to 0.4.0
      xfwm4: update to 4.12.2
      xfce4-panel: update to 4.12.0
      xfce4-session: update to 4.12.0
      xfce4-appfinder: update to 4.12.0
      thunar: update to 1.6.6
      thunar-volman: update to 0.8.1
      xfdesktop: update to 4.12.0
      tumbler: update to 0.1.31
      xfce4-power-manager: update to 1.4.3
      ristretto: update to 0.8.0
      mousepad: update to 0.4.0
      gtk-xfce-engine: update to 3.2.0
      xfce4-diskperf-plugin: update to 2.5.5
      xfce4-fsguard-plugin: update to 1.0.2
      xfce4-whiskermenu-plugin: update to 1.5.0.bb
      xfce4-taskmanager: update to 1.1.0
      xfce4-mixer: update to 4.11.0
      xfce4-settings: update to 4.12.0
      xfce4-wavelan-plugin: update to 0.5.12
      xfce4-mpc-plugin: update to 0.4.5
      xfce4-places-plugin: update to 1.7.0
      xarchiver: git repo was moved to github
      xfce4-closebutton-plugin: git repo was moved to github
      xfce4-eyes-plugin_ update to 4.4.4

 meta-xfce/recipes-apps/mousepad/{mousepad_0.3.0.bb => mousepad_0.4.0.bb}                                          |   9 +++--
 meta-xfce/recipes-apps/ristretto/{ristretto_0.6.3.bb => ristretto_0.8.0.bb}                                       |   6 ++--
 meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb                                                                 |   2 +-
 meta-xfce/recipes-apps/xfce4-mixer/{xfce4-mixer_4.10.0.bb => xfce4-mixer_4.11.0.bb}                               |   4 +--
 meta-xfce/recipes-apps/xfce4-taskmanager/files/0001-do-not-build-documantation-Makefile-has-no-install-t.patch    |  29 ---------------
 meta-xfce/recipes-apps/xfce4-taskmanager/{xfce4-taskmanager_1.0.1.bb => xfce4-taskmanager_1.1.0.bb}               |   4 +--
 meta-xfce/recipes-multimedia/xfce4-mpc-plugin/{xfce4-mpc-plugin_0.4.4.bb => xfce4-mpc-plugin_0.4.5.bb}            |   4 +--
 meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb                                       |   2 +-
 meta-xfce/recipes-panel-plugins/diskperf/{xfce4-diskperf-plugin_2.5.4.bb => xfce4-diskperf-plugin_2.5.5.bb}       |   4 +--
 meta-xfce/recipes-panel-plugins/eyes/{xfce4-eyes-plugin_4.4.3.bb => xfce4-eyes-plugin_4.4.4.bb}                   |   4 +--
 meta-xfce/recipes-panel-plugins/fsguard/{xfce4-fsguard-plugin_1.0.1.bb => xfce4-fsguard-plugin_1.0.2.bb}          |   4 +--
 meta-xfce/recipes-panel-plugins/places/{xfce4-places-plugin_1.6.0.bb => xfce4-places-plugin_1.7.0.bb}             |   4 +--
 meta-xfce/recipes-panel-plugins/wavelan/{xfce4-wavelan-plugin_0.5.11.bb => xfce4-wavelan-plugin_0.5.12.bb}        |   4 +--
 .../recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_1.4.2.bb => xfce4-whiskermenu-plugin_1.5.0.bb}    |   4 +--
 meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch                                             |  26 +++++++-------
 meta-xfce/recipes-xfce/exo/{exo_0.10.2.bb => exo_0.10.3.bb}                                                       |   5 ++-
 meta-xfce/recipes-xfce/garcon/{garcon_0.2.1.bb => garcon_0.4.0.bb}                                                |   7 ++--
 meta-xfce/recipes-xfce/gtk-xfce-engine/{gtk-xfce-engine_3.0.1.bb => gtk-xfce-engine_3.2.0.bb}                     |   9 +++--
 ...02-configure.ac.in-remove-optional-gtk3-support.patch => 0002-configure.ac-remove-optional-gtk3-support.patch} |  10 +++---
 meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.10.0.bb => libxfce4ui_4.12.1.bb}                                  |  14 ++++----
 meta-xfce/recipes-xfce/libxfce4util/{libxfce4util_4.10.1.bb => libxfce4util_4.12.1.bb}                            |   4 +--
 meta-xfce/recipes-xfce/thunar-volman/{thunar-volman_0.8.0.bb => thunar-volman_0.8.1.bb}                           |   4 +--
 meta-xfce/recipes-xfce/thunar/{thunar_1.6.3.bb => thunar_1.6.6.bb}                                                |  24 +++++++------
 meta-xfce/recipes-xfce/tumbler/{tumbler_0.1.30.bb => tumbler_0.1.31.bb}                                           |  11 ++----
 meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.10.1.bb => xfce4-appfinder_4.12.0.bb}                   |   6 ++--
 meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools-4.11.0/xdt-autogen_dependency.patch                        |  13 -------
 meta-xfce/recipes-xfce/xfce4-dev-tools/{xfce4-dev-tools_4.11.0.bb => xfce4-dev-tools_4.12.0.bb}                   |   9 ++---
 meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.10.1.bb => xfce4-panel_4.12.0.bb}                               |   8 ++---
 meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_1.4.1.bb => xfce4-power-manager_1.4.3.bb}         |   4 +--
 meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb                                                      |  31 ----------------
 meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.0.bb                                                      |  28 +++++++++++++++
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0002-xsettings.xml-Set-default-themes.patch                  |   2 +-
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb                                                       |  19 ++--------
 meta-xfce/recipes-xfce/xfconf/files/0001-Simplify-checks.patch                                                    | 112 ----------------------------------------------------------
 meta-xfce/recipes-xfce/xfconf/{xfconf_4.10.0.bb => xfconf_4.12.0.bb}                                              |   5 ++-
 meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.10.2.bb => xfdesktop_4.12.0.bb}                                     |   4 +--
 meta-xfce/recipes-xfce/xfwm4/{xfwm4_git.bb => xfwm4_4.12.2.bb}                                                    |  15 +++-----
 37 files changed, 140 insertions(+), 314 deletions(-)
 rename meta-xfce/recipes-apps/mousepad/{mousepad_0.3.0.bb => mousepad_0.4.0.bb} (66%)
 rename meta-xfce/recipes-apps/ristretto/{ristretto_0.6.3.bb => ristretto_0.8.0.bb} (65%)
 rename meta-xfce/recipes-apps/xfce4-mixer/{xfce4-mixer_4.10.0.bb => xfce4-mixer_4.11.0.bb} (72%)
 delete mode 100644 meta-xfce/recipes-apps/xfce4-taskmanager/files/0001-do-not-build-documantation-Makefile-has-no-install-t.patch
 rename meta-xfce/recipes-apps/xfce4-taskmanager/{xfce4-taskmanager_1.0.1.bb => xfce4-taskmanager_1.1.0.bb} (60%)
 rename meta-xfce/recipes-multimedia/xfce4-mpc-plugin/{xfce4-mpc-plugin_0.4.4.bb => xfce4-mpc-plugin_0.4.5.bb} (72%)
 rename meta-xfce/recipes-panel-plugins/diskperf/{xfce4-diskperf-plugin_2.5.4.bb => xfce4-diskperf-plugin_2.5.5.bb} (65%)
 rename meta-xfce/recipes-panel-plugins/eyes/{xfce4-eyes-plugin_4.4.3.bb => xfce4-eyes-plugin_4.4.4.bb} (68%)
 rename meta-xfce/recipes-panel-plugins/fsguard/{xfce4-fsguard-plugin_1.0.1.bb => xfce4-fsguard-plugin_1.0.2.bb} (71%)
 rename meta-xfce/recipes-panel-plugins/places/{xfce4-places-plugin_1.6.0.bb => xfce4-places-plugin_1.7.0.bb} (74%)
 rename meta-xfce/recipes-panel-plugins/wavelan/{xfce4-wavelan-plugin_0.5.11.bb => xfce4-wavelan-plugin_0.5.12.bb} (65%)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_1.4.2.bb => xfce4-whiskermenu-plugin_1.5.0.bb} (68%)
 rename meta-xfce/recipes-xfce/exo/{exo_0.10.2.bb => exo_0.10.3.bb} (86%)
 rename meta-xfce/recipes-xfce/garcon/{garcon_0.2.1.bb => garcon_0.4.0.bb} (57%)
 rename meta-xfce/recipes-xfce/gtk-xfce-engine/{gtk-xfce-engine_3.0.1.bb => gtk-xfce-engine_3.2.0.bb} (72%)
 rename meta-xfce/recipes-xfce/libxfce4ui/files/{0002-configure.ac.in-remove-optional-gtk3-support.patch => 0002-configure.ac-remove-optional-gtk3-support.patch} (86%)
 rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.10.0.bb => libxfce4ui_4.12.1.bb} (69%)
 rename meta-xfce/recipes-xfce/libxfce4util/{libxfce4util_4.10.1.bb => libxfce4util_4.12.1.bb} (62%)
 rename meta-xfce/recipes-xfce/thunar-volman/{thunar-volman_0.8.0.bb => thunar-volman_0.8.1.bb} (74%)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.6.3.bb => thunar_1.6.6.bb} (56%)
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_0.1.30.bb => tumbler_0.1.31.bb} (68%)
 rename meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.10.1.bb => xfce4-appfinder_4.12.0.bb} (56%)
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools-4.11.0/xdt-autogen_dependency.patch
 rename meta-xfce/recipes-xfce/xfce4-dev-tools/{xfce4-dev-tools_4.11.0.bb => xfce4-dev-tools_4.12.0.bb} (62%)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.10.1.bb => xfce4-panel_4.12.0.bb} (82%)
 rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_1.4.1.bb => xfce4-power-manager_1.4.3.bb} (89%)
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb
 create mode 100644 meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.0.bb
 delete mode 100644 meta-xfce/recipes-xfce/xfconf/files/0001-Simplify-checks.patch
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.10.0.bb => xfconf_4.12.0.bb} (70%)
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.10.2.bb => xfdesktop_4.12.0.bb} (73%)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_git.bb => xfwm4_4.12.2.bb} (71%)

-- 
1.9.3


