Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EF08A71993
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2016 07:32:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uAM7WwCH010585
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 23:32:58 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 21 Nov 2016 23:32:57 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Nov 2016 15:30:45 +0800
Message-ID: <cover.1479795970.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [PATCH 00/27] add x11 to REQUIRED_DISTRO_FEATURES for required packages
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
X-List-Received-Date: Tue, 22 Nov 2016 07:33:02 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

--
The following changes since commit 7f8915a6ecdd5c4b03c7e5b5f1fa903f89c2d560:

  wireshark: install missing header files (2016-11-14 13:01:33 -0500)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/d_xfce-x11_161122_0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/d_xfce-x11_161122_0

Jackie Huang (27):
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

 meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb                       | 4 +++-
 meta-gnome/recipes-gnome/evince/evince_3.18.2.bb                     | 4 +++-
 .../recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb    | 5 ++++-
 meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb      | 4 +++-
 meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb                   | 4 +++-
 meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb              | 5 ++++-
 meta-oe/recipes-gnome/gtk+/gtkmm_2.24.3.bb                           | 4 +++-
 meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb                   | 4 +++-
 meta-oe/recipes-multimedia/pulseaudio/pavucontrol_3.0.bb             | 4 +++-
 meta-xfce/classes/thunar-plugin.bbclass                              | 4 +++-
 meta-xfce/classes/xfce-app.bbclass                                   | 4 +++-
 meta-xfce/classes/xfce-panel-plugin.bbclass                          | 4 +++-
 .../pulseaudio/xfce4-pulseaudio-plugin_0.2.4.bb                      | 2 +-
 meta-xfce/recipes-xfce/exo/exo_0.11.1.bb                             | 5 ++++-
 meta-xfce/recipes-xfce/garcon/garcon_0.4.0.bb                        | 4 +++-
 meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb      | 4 +++-
 meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.12.1.bb               | 4 +++-
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb       | 4 +++-
 meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.8.1.bb          | 4 +++-
 meta-xfce/recipes-xfce/thunar/thunar_1.6.10.bb                       | 4 +++-
 meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.12.0.bb     | 4 +++-
 meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.0.bb             | 4 +++-
 .../recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.0.bb    | 4 +++-
 meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb         | 4 +++-
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb          | 4 +++-
 meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.3.bb                 | 4 +++-
 meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.3.bb                         | 4 +++-
 27 files changed, 82 insertions(+), 27 deletions(-)

-- 
2.8.3


