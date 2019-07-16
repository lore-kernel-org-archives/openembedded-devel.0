Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 724567ECB5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2019 14:12:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6GECZax013287
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Jul 2019 07:12:35 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 16 Jul 2019 07:12:35 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 16 Jul 2019 10:12:16 -0400
Message-ID: <20190716141231.77957-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 00/15] Upgrade to xfce 4.14 pre2
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
X-List-Received-Date: Tue, 16 Jul 2019 14:12:35 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Hi Khem,

It seems v1 have not been merged, so I send v2.

v2:
* update xfce4-settings
* remove dependency dbus-glib
* clean DEPENDS and inherited classes

Kai Kang (15):
  libxfce4util: 4.13.3 -> 4.13.4
  libxfce4ui: 4.13.5 -> 4.13.6
  exo: 0.12.5 -> 0.12.6
  xfconf: 4.13.7 -> 4.13.8
  thunar: 1.8.6 -> 1.8.7
  xfce4-session: 4.13.2 -> 4.13.3
  xfwm4: 4.13.2 -> 4.13.3
  xfdesktop: 4.13.4 -> 4.13.5
  xfce4-power-manager: 1.6.2 -> 1.6.3
  xfce4-panel: 4.13.5 -> 4.13.6
  xfce4-dev-tools: 4.12.0 -> 4.13.0
  thunar-volman: 0.9.2 -> 0.9.3
  garcon: 0.6.2 -> 0.6.3
  xfce4-settings: 4.12.4 -> 4.13.7
  xfce4-pulseaudio-plugin: add dependency dbus-glib

 .../xfce4-pulseaudio-plugin_0.4.1.bb          |  2 +-
 .../exo/{exo_0.12.5.bb => exo_0.12.6.bb}      |  6 +--
 .../{garcon_0.6.2.bb => garcon_0.6.3.bb}      |  6 +--
 ...xfce4ui_4.13.5.bb => libxfce4ui_4.13.6.bb} |  8 ++--
 ...4util_4.13.3.bb => libxfce4util_4.13.4.bb} |  4 +-
 ...volman_0.9.2.bb => thunar-volman_0.9.3.bb} |  6 +--
 .../{thunar_1.8.6.bb => thunar_1.8.7.bb}      |  6 +--
 ...ls_4.12.0.bb => xfce4-dev-tools_4.13.0.bb} |  4 +-
 ...-panel_4.13.5.bb => xfce4-panel_4.13.6.bb} |  8 ++--
 ..._1.6.2.bb => xfce4-power-manager_1.6.3.bb} |  7 ++--
 ...sion_4.13.2.bb => xfce4-session_4.13.3.bb} | 16 ++------
 ...2-Fix-linking-to-dbus-glib-bug-13633.patch | 41 -------------------
 ...ttings_git.bb => xfce4-settings_4.13.7.bb} | 19 +++------
 .../{xfconf_4.13.7.bb => xfconf_4.13.8.bb}    |  8 ++--
 ...fdesktop_4.13.4.bb => xfdesktop_4.13.5.bb} |  6 +--
 .../{xfwm4_4.13.2.bb => xfwm4_4.13.3.bb}      |  6 +--
 16 files changed, 46 insertions(+), 107 deletions(-)
 rename meta-xfce/recipes-xfce/exo/{exo_0.12.5.bb => exo_0.12.6.bb} (80%)
 rename meta-xfce/recipes-xfce/garcon/{garcon_0.6.2.bb => garcon_0.6.3.bb} (64%)
 rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.13.5.bb => libxfce4ui_4.13.6.bb} (75%)
 rename meta-xfce/recipes-xfce/libxfce4util/{libxfce4util_4.13.3.bb => libxfce4util_4.13.4.bb} (64%)
 rename meta-xfce/recipes-xfce/thunar-volman/{thunar-volman_0.9.2.bb => thunar-volman_0.9.3.bb} (63%)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.8.6.bb => thunar_1.8.7.bb} (74%)
 rename meta-xfce/recipes-xfce/xfce4-dev-tools/{xfce4-dev-tools_4.12.0.bb => xfce4-dev-tools_4.13.0.bb} (79%)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.13.5.bb => xfce4-panel_4.13.6.bb} (81%)
 rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_1.6.2.bb => xfce4-power-manager_1.6.3.bb} (79%)
 rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.13.2.bb => xfce4-session_4.13.3.bb} (76%)
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-settings/files/0002-Fix-linking-to-dbus-glib-bug-13633.patch
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_git.bb => xfce4-settings_4.13.7.bb} (52%)
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.13.7.bb => xfconf_4.13.8.bb} (69%)
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.13.4.bb => xfdesktop_4.13.5.bb} (60%)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.13.2.bb => xfwm4_4.13.3.bb} (82%)

-- 
2.20.0


