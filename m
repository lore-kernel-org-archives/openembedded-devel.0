Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 007557ED41
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2019 09:22:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7D9LHqc027611
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Aug 2019 02:21:41 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 13 Aug 2019 02:21:20 -0700
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>, <raj.khem@gmail.com>
Date: Tue, 13 Aug 2019 05:21:02 -0400
Message-ID: <20190813092118.113213-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 00/16] Update Xfce core modules to 4.14
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
X-List-Received-Date: Tue, 13 Aug 2019 09:22:07 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>


Kai Kang (16):
  libxfce4util: 4.13.4 -> 4.14.0
  xfconf: 4.13.8 -> 4.14.1
  libxfce4ui: 4.13.6 -> 4.14.1
  exo: 0.12.6 -> 0.12.8
  garcon: 0.6.3 -> 0.6.4
  thunar: 1.8.7 -> 1.8.9
  thunar-volman: 0.9.3 -> 0.9.5
  tumbler: 0.2.0 -> 0.2.7
  xfce4-appfinder: 4.13.3 -> 4.14.0
  xfce4-dev-tools: 4.13.0 -> 4.14.0
  xfce4-panel: 4.13.6 -> 4.14.0
  xfce4-power-manager: 1.6.3 -> 1.6.5
  xfce4-session: 4.13.3 -> 4.14.0
  xfce4-settings: 4.13.7 -> 4.14.0
  xfdesktop: 4.13.5 -> 4.14.1
  xfwm4: 4.13.3 -> 4.14.0

 .../exo/{exo_0.12.6.bb => exo_0.12.8.bb}      | 12 +++--
 .../{garcon_0.6.3.bb => garcon_0.6.4.bb}      |  6 +--
 ...xfce4ui_4.13.6.bb => libxfce4ui_4.14.1.bb} |  4 +-
 ...4util_4.13.4.bb => libxfce4util_4.14.0.bb} |  4 +-
 ...volman_0.9.3.bb => thunar-volman_0.9.5.bb} |  4 +-
 .../{thunar_1.8.7.bb => thunar_1.8.9.bb}      |  4 +-
 ...nfigure-use-pkg-config-for-freetype2.patch | 45 -------------------
 .../{tumbler_0.2.0.bb => tumbler_0.2.7.bb}    |  9 ++--
 ...er_4.13.3.bb => xfce4-appfinder_4.14.0.bb} |  8 ++--
 ...ls_4.13.0.bb => xfce4-dev-tools_4.14.0.bb} |  4 +-
 ...-panel_4.13.6.bb => xfce4-panel_4.14.0.bb} |  6 +--
 ..._1.6.3.bb => xfce4-power-manager_1.6.5.bb} |  4 +-
 ...sion_4.13.3.bb => xfce4-session_4.14.0.bb} |  6 +--
 ...ngs_4.13.7.bb => xfce4-settings_4.14.0.bb} |  4 +-
 .../{xfconf_4.13.8.bb => xfconf_4.14.1.bb}    |  4 +-
 ...fdesktop_4.13.5.bb => xfdesktop_4.14.1.bb} |  4 +-
 .../{xfwm4_4.13.3.bb => xfwm4_4.14.0.bb}      |  6 +--
 17 files changed, 46 insertions(+), 88 deletions(-)
 rename meta-xfce/recipes-xfce/exo/{exo_0.12.6.bb => exo_0.12.8.bb} (68%)
 rename meta-xfce/recipes-xfce/garcon/{garcon_0.6.3.bb => garcon_0.6.4.bb} (70%)
 rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.13.6.bb => libxfce4ui_4.14.1.bb} (89%)
 rename meta-xfce/recipes-xfce/libxfce4util/{libxfce4util_4.13.4.bb => libxfce4util_4.14.0.bb} (64%)
 rename meta-xfce/recipes-xfce/thunar-volman/{thunar-volman_0.9.3.bb => thunar-volman_0.9.5.bb} (74%)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.8.7.bb => thunar_1.8.9.bb} (86%)
 delete mode 100644 meta-xfce/recipes-xfce/tumbler/tumbler/0001-configure-use-pkg-config-for-freetype2.patch
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_0.2.0.bb => tumbler_0.2.7.bb} (68%)
 rename meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.13.3.bb => xfce4-appfinder_4.14.0.bb} (46%)
 rename meta-xfce/recipes-xfce/xfce4-dev-tools/{xfce4-dev-tools_4.13.0.bb => xfce4-dev-tools_4.14.0.bb} (79%)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.13.6.bb => xfce4-panel_4.14.0.bb} (85%)
 rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_1.6.3.bb => xfce4-power-manager_1.6.5.bb} (89%)
 rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.13.3.bb => xfce4-session_4.14.0.bb} (82%)
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.13.7.bb => xfce4-settings_4.14.0.bb} (89%)
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.13.8.bb => xfconf_4.14.1.bb} (83%)
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.13.5.bb => xfdesktop_4.14.1.bb} (74%)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.13.3.bb => xfwm4_4.14.0.bb} (87%)

-- 
2.20.0


