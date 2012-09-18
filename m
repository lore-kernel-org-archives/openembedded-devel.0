Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDylH-0001l8-D1
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:26:51 +0200
Received: by bkcik5 with SMTP id ik5so2999326bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=+mxkhOu6zrij9T2mDaijO9gezFi+Vo5X7biCH99S8lQ=;
	b=UfXCNEk1N1vHJLDv2SLBVyeiLTzqU2WTJd6lkfYmcVNirBA5HmGQjBLYy+fRcRArk8
	7Z40F0Y7NW9Nk7u4PnyO2sdre7jxBJzQo8Vp+Uk+pREVNlbiRJUvWBA5F7Hg3KACU8sY
	Lhlh3t7wu0Eu8sxLNikeeU3oEyYHeildLmTE+1sXDl/LxTdzWVfMN6zjBHOzSYJtcDUo
	zaIj/gtgR+/FumAt5byyFJpb1lT52dV6razlH3FGsdwYYssAAg8no+1tN8W7VcDNYQKV
	qp1kJHsE/sXjGfxgvj0tr2k36eBV8/mBf52RNWxFqvegDRan81XikzY52+ja44xMUOeL
	pi3A==
Received: by 10.204.3.207 with SMTP id 15mr146166bko.98.1347977651141;
	Tue, 18 Sep 2012 07:14:11 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.14.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:14:10 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:12:41 +0200
Message-Id: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 00/40] xfce-4.10 and more
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Sep 2012 14:26:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Whole patch series was run-tested on gumstix overo with lxdm and without dm.

The following changes since commit 72335a05f2b9a47aceec9e6f3881cd7209224343:

  xfce4-session: Don't loose xfwm4 when closing session with multiple windows waiting for user input (2012-09-17 10:42:34 +0200)

are available in the git repository at:
  git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git xfce-4.10

Andreas Müller (40):
      lxdm: initial add 1.22_git
      xfce.bbclass: change SRC_URI calculation
      xfce4-dev-tools: update to 4.10.0 and oe-stylize a bit
      libxfce4util: update to 4.10.0
      libxfce4ui: update to 4.10.0
      garcon: update to 0.2.0
      exo: update to 0.8.0
      xfce-utils: remove since they are not needed anymore
      xfconf: update to 4.10.0
      xfce4-session: update to 4.10.0
      xfce4-settings: update to 4.10.0 and set default themes
      xfwm4: update to 4.10.0
      packagegreoup-xfce-extended: only RDEPEND on themes shipped by xfwm4
      packagegroup-xfce-base: no need to RDEPEND xfwm4-theme-default - xfwm4 does already
      xfwm4-themes: initial add 4.10.0
      xfce4-panel: update to 4.10.0
      thunar: update to 1.4.0
      xfdesktop update to 4.10.0
      xfce4-appfinder: update to 4.10.0
      tumbler: update to 0.1.25
      thunar-volman: update to 0.8.0
      gtk-xfce-engine: update to 3.0.1 and restructure
      ristretto: update to 0.6.0
      xfce4-wavelan-plugin: update to 0.5.11
      xfce4-screenshooter: update to 1.8.1
      xfce4-netload-plugin: update to 1.2.0
      xfce4-diskperf-plugin: update to 2.5.4
      xfce4-places-plugin: update to 1.4.0
      xfce4-cpugraph-plugin: update to 1.0.5
      xfce4-systemload-plugin: update to 1.1.1
      xfce4-fsguard-plugin: initial add 1.0.1
      xfce4-battery-plugin: initial add 1.0.5
      packagegroup-xfce-extended: add xfce4-fsguard-plugin and xfce4-battery-plugin
      midori: update to 0.4.6
      libmpd: initial add 11.8.17
      mpd: Initial add 0.17.1
      xfce4-mpc-plugin: initial add 0.4.4
      xfmpc: initial add 0.2.2
      packagegroup-xfce-multimedia: initial add
      README: add some layer dependency hints

 .../recipes-multimedia/musicpd/libmpd_11.8.17.bb   |   11 +
 .../recipes-multimedia/musicpd/mpd/mpd.conf.in     |  420 ++++++++++++++++
 .../recipes-multimedia/musicpd/mpd_0.17.1.bb       |   44 ++
 .../midori/{midori_0.4.5.bb => midori_0.4.6.bb}    |    4 +-
 ...conf.in-blacklist-root-for-release-images.patch |   29 ++
 meta-oe/recipes-graphics/lxdm/lxdm/lxdm-pam        |   13 +
 meta-oe/recipes-graphics/lxdm/lxdm/lxdm-pam-debug  |   13 +
 meta-oe/recipes-graphics/lxdm/lxdm/lxdm.conf       |    4 +
 meta-oe/recipes-graphics/lxdm/lxdm_git.bb          |   62 +++
 .../recipes-multimedia/musicpd/mpd_0.17.1.bbappend |   14 +
 .../recipes-graphics/lxdm/lxdm/lxdm.service.in     |   10 +
 .../recipes-graphics/lxdm/lxdm_git.bbappend        |   16 +
 meta-xfce/README                                   |    6 +
 meta-xfce/classes/xfce.bbclass                     |    7 +-
 .../{ristretto_0.3.5.bb => ristretto_0.6.3.bb}     |    7 +-
 .../files/0001-Fix-panel-plugin-build.patch        |   43 ++
 ...ooter_1.8.0.bb => xfce4-screenshooter_1.8.1.bb} |   11 +-
 .../xfwm4-themes/xfwm4-themes_4.10.0.bb            |   19 +
 .../packagegroups/packagegroup-xfce-multimedia.bb  |   10 +
 .../xfce4-mpc-plugin/xfce4-mpc-plugin_0.4.4.bb     |   15 +
 meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.2.bb  |   13 +
 .../battery/xfce4-battery-plugin_1.0.5.bb          |    9 +
 ...gin_1.0.2.bb => xfce4-cpugraph-plugin_1.0.5.bb} |    4 +-
 ...gin_2.5.3.bb => xfce4-diskperf-plugin_2.5.4.bb} |    4 +-
 .../fsguard/xfce4-fsguard-plugin_1.0.1.bb          |    9 +
 ...ugin_1.1.0.bb => xfce4-netload-plugin_1.2.0.bb} |    4 +-
 ...lugin_1.3.0.bb => xfce4-places-plugin_1.4.0.bb} |    4 +-
 ...n_1.1.0.bb => xfce4-systemload-plugin_1.1.1.bb} |    4 +-
 ...in_0.5.10.bb => xfce4-wavelan-plugin_0.5.11.bb} |    4 +-
 .../recipes-xfce/exo/exo/exo-no-tests-0.6.patch    |   12 -
 .../recipes-xfce/exo/exo/exo-no-tests-0.8.patch    |   31 ++
 .../exo/exo/fix-qa-desktop-type-error.patch        |  531 --------------------
 .../exo/{exo_0.6.2.bb => exo_0.8.0.bb}             |   15 +-
 .../garcon/{garcon_0.1.10.bb => garcon_0.2.0.bb}   |    6 +-
 ...-a-graduent-pattern-at-each-draw-bug-8521.patch |   30 --
 .../gtk-xfce-engine/gtk-xfce-engine_2.9.0.bb       |   18 -
 .../gtk-xfce-engine/gtk-xfce-engine_3.0.1.bb       |   23 +
 .../{libxfce4ui_4.8.1.bb => libxfce4ui_4.10.0.bb}  |    6 +-
 ...ibxfce4util_4.8.2.bb => libxfce4util_4.10.0.bb} |    8 +-
 .../packagegroups/packagegroup-xfce-base.bb        |    4 +-
 .../packagegroups/packagegroup-xfce-extended.bb    |    9 +-
 ...unar-volman_0.6.0.bb => thunar-volman_0.8.0.bb} |    7 +-
 .../thunar/{thunar_1.2.3.bb => thunar_1.4.0.bb}    |   10 +-
 .../{tumbler_0.1.23.bb => tumbler_0.1.25.bb}       |    8 +-
 .../recipes-xfce/xfce-utils/xfce-utils_4.8.3.bb    |   20 -
 .../xfce4-appfinder/xfce4-appfinder_4.10.0.bb      |   10 +
 .../xfce4-appfinder/xfce4-appfinder_4.8.0.bb       |   12 -
 ...ev-tools_4.8.0.bb => xfce4-dev-tools_4.10.0.bb} |   11 +-
 ...{xfce4-panel_4.8.6.bb => xfce4-panel_4.10.0.bb} |   10 +-
 ...ltiple-interactive-session-save-bug-5379.patch} |   61 +--
 ...e4-session_4.8.3.bb => xfce4-session_4.10.0.bb} |   14 +-
 ...settingsd-use-gnome-as-default-icon-theme.patch |   29 --
 ...ttings.xml-remove-trouble-causing-comment.patch |   31 ++
 .../0002-xsettings.xml-Set-default-themes.patch    |   32 ++
 ...-settings_4.8.3.bb => xfce4-settings_4.10.0.bb} |    8 +-
 .../xfconf/{xfconf_4.8.0.bb => xfconf_4.10.0.bb}   |    8 +-
 .../xfdesktop/relative-symlinks-docs.patch         |   31 --
 .../recipes-xfce/xfdesktop/xfdesktop_4.10.0.bb     |   12 +
 .../recipes-xfce/xfdesktop/xfdesktop_4.8.3.bb      |   19 -
 .../xfwm4/{xfwm4_4.8.3.bb => xfwm4_4.10.0.bb}      |    7 +-
 60 files changed, 1000 insertions(+), 846 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb
 create mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd/mpd.conf.in
 create mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb
 rename meta-oe/recipes-connectivity/midori/{midori_0.4.5.bb => midori_0.4.6.bb} (90%)
 create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/0001-lxdm.conf.in-blacklist-root-for-release-images.patch
 create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/lxdm-pam
 create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/lxdm-pam-debug
 create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/lxdm.conf
 create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm_git.bb
 create mode 100644 meta-systemd/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bbappend
 create mode 100644 meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm/lxdm.service.in
 create mode 100644 meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend
 rename meta-xfce/recipes-apps/ristretto/{ristretto_0.3.5.bb => ristretto_0.6.3.bb} (55%)
 create mode 100644 meta-xfce/recipes-apps/xfce4-screenshooter/files/0001-Fix-panel-plugin-build.patch
 rename meta-xfce/recipes-apps/xfce4-screenshooter/{xfce4-screenshooter_1.8.0.bb => xfce4-screenshooter_1.8.1.bb} (58%)
 create mode 100644 meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb
 create mode 100644 meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb
 create mode 100644 meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.4.4.bb
 create mode 100644 meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.2.bb
 create mode 100644 meta-xfce/recipes-panel-plugins/battery/xfce4-battery-plugin_1.0.5.bb
 rename meta-xfce/recipes-panel-plugins/cpugraph/{xfce4-cpugraph-plugin_1.0.2.bb => xfce4-cpugraph-plugin_1.0.5.bb} (66%)
 rename meta-xfce/recipes-panel-plugins/diskperf/{xfce4-diskperf-plugin_2.5.3.bb => xfce4-diskperf-plugin_2.5.4.bb} (66%)
 create mode 100644 meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.0.1.bb
 rename meta-xfce/recipes-panel-plugins/netload/{xfce4-netload-plugin_1.1.0.bb => xfce4-netload-plugin_1.2.0.bb} (66%)
 rename meta-xfce/recipes-panel-plugins/places/{xfce4-places-plugin_1.3.0.bb => xfce4-places-plugin_1.4.0.bb} (68%)
 rename meta-xfce/recipes-panel-plugins/systemload/{xfce4-systemload-plugin_1.1.0.bb => xfce4-systemload-plugin_1.1.1.bb} (70%)
 rename meta-xfce/recipes-panel-plugins/wavelan/{xfce4-wavelan-plugin_0.5.10.bb => xfce4-wavelan-plugin_0.5.11.bb} (67%)
 delete mode 100644 meta-xfce/recipes-xfce/exo/exo/exo-no-tests-0.6.patch
 create mode 100644 meta-xfce/recipes-xfce/exo/exo/exo-no-tests-0.8.patch
 delete mode 100644 meta-xfce/recipes-xfce/exo/exo/fix-qa-desktop-type-error.patch
 rename meta-xfce/recipes-xfce/exo/{exo_0.6.2.bb => exo_0.8.0.bb} (67%)
 rename meta-xfce/recipes-xfce/garcon/{garcon_0.1.10.bb => garcon_0.2.0.bb} (53%)
 delete mode 100644 meta-xfce/recipes-xfce/gtk-xfce-engine/files/0001-Don-t-leak-a-graduent-pattern-at-each-draw-bug-8521.patch
 delete mode 100644 meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_2.9.0.bb
 create mode 100644 meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.0.1.bb
 rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.8.1.bb => libxfce4ui_4.10.0.bb} (56%)
 rename meta-xfce/recipes-xfce/libxfce4util/{libxfce4util_4.8.2.bb => libxfce4util_4.10.0.bb} (54%)
 rename meta-xfce/recipes-xfce/thunar-volman/{thunar-volman_0.6.0.bb => thunar-volman_0.8.0.bb} (50%)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.2.3.bb => thunar_1.4.0.bb} (71%)
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_0.1.23.bb => tumbler_0.1.25.bb} (83%)
 delete mode 100644 meta-xfce/recipes-xfce/xfce-utils/xfce-utils_4.8.3.bb
 create mode 100644 meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.10.0.bb
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.8.0.bb
 rename meta-xfce/recipes-xfce/xfce4-dev-tools/{xfce4-dev-tools_4.8.0.bb => xfce4-dev-tools_4.10.0.bb} (71%)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.8.6.bb => xfce4-panel_4.10.0.bb} (81%)
 rename meta-xfce/recipes-xfce/xfce4-session/files/{0001-Don-t-loose-xfwm4-when-closing-session-with-multiple.patch => 0001-Handle-multiple-interactive-session-save-bug-5379.patch} (77%)
 rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.8.3.bb => xfce4-session_4.10.0.bb} (62%)
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0001-xfsettingsd-use-gnome-as-default-icon-theme.patch
 create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0001-xsettings.xml-remove-trouble-causing-comment.patch
 create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0002-xsettings.xml-Set-default-themes.patch
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.8.3.bb => xfce4-settings_4.10.0.bb} (50%)
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.8.0.bb => xfconf_4.10.0.bb} (69%)
 delete mode 100644 meta-xfce/recipes-xfce/xfdesktop/xfdesktop/relative-symlinks-docs.patch
 create mode 100644 meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.10.0.bb
 delete mode 100644 meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.8.3.bb
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.8.3.bb => xfwm4_4.10.0.bb} (81%)

-- 
1.7.6.5



