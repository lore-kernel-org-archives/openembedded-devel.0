Return-Path: <kai.kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 668DC71BA0
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Aug 2018 08:54:16 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w768sH2w011160
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Aug 2018 01:54:17 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Mon, 06 Aug 2018 01:54:17 -0700
From: Kai Kang <kai.kang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Aug 2018 01:53:58 -0700
Message-Id: <20180806085408.44739-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-xfce][PATCH 00/10] Upgrade packages in layer meta-xfce
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
X-List-Received-Date: Mon, 06 Aug 2018 08:54:17 -0000


Kai Kang (10):
  libwnck3: 3.20.1 -> 3.24.1
  xfce4-mount-plugin: 1.1.2 -> 1.1.3
  xfce4-hotcorner-plugin: fix library install path
  xfce4-embed-plugin: 1.0.0 -> 1.6.0
  xfce4-eyes-plugin: 4.4.5 -> 4.5.0
  xfce4-genmon-plugin: 4.0.0 -> 4.0.1
  exo: 0.12.1 -> 0.12.2
  xfce4-session: 4.12.1 -> 4.13.0
  xfconf: 4.13.4 -> 4.13.5
  xfwm4: 4.12.4 -> 4.12.5

 .../{libwnck3_3.20.1.bb => libwnck3_3.24.1.bb}     |  7 ++--
 ...plugin_1.0.0.bb => xfce4-embed-plugin_1.6.0.bb} |  6 ++--
 ...-plugin_4.4.5.bb => xfce4-eyes-plugin_4.5.0.bb} |  4 +--
 ...lugin_4.0.0.bb => xfce4-genmon-plugin_4.0.1.bb} |  4 +--
 ...1-CMakeLists.txt-fix-library-install-path.patch | 39 ++++++++++++++++++++++
 .../hotcorner/xfce4-hotcorner-plugin_0.0.2.bb      |  5 ++-
 ...plugin_1.1.2.bb => xfce4-mount-plugin_1.1.3.bb} |  4 +--
 .../exo/{exo_0.12.1.bb => exo_0.12.2.bb}           |  4 +--
 ...4-session_4.12.1.bb => xfce4-session_4.13.0.bb} |  6 ++--
 .../xfconf/{xfconf_4.13.4.bb => xfconf_4.13.5.bb}  |  4 +--
 .../xfwm4/{xfwm4_4.12.4.bb => xfwm4_4.12.5.bb}     |  6 ++--
 11 files changed, 66 insertions(+), 23 deletions(-)
 rename meta-gnome/recipes-gnome/libwnck/{libwnck3_3.20.1.bb => libwnck3_3.24.1.bb} (70%)
 rename meta-xfce/recipes-panel-plugins/embed/{xfce4-embed-plugin_1.0.0.bb => xfce4-embed-plugin_1.6.0.bb} (57%)
 rename meta-xfce/recipes-panel-plugins/eyes/{xfce4-eyes-plugin_4.4.5.bb => xfce4-eyes-plugin_4.5.0.bb} (68%)
 rename meta-xfce/recipes-panel-plugins/genmon/{xfce4-genmon-plugin_4.0.0.bb => xfce4-genmon-plugin_4.0.1.bb} (71%)
 create mode 100644 meta-xfce/recipes-panel-plugins/hotcorner/xfce4-hotcorner-plugin/0001-CMakeLists.txt-fix-library-install-path.patch
 rename meta-xfce/recipes-panel-plugins/mount/{xfce4-mount-plugin_1.1.2.bb => xfce4-mount-plugin_1.1.3.bb} (70%)
 rename meta-xfce/recipes-xfce/exo/{exo_0.12.1.bb => exo_0.12.2.bb} (87%)
 rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.12.1.bb => xfce4-session_4.13.0.bb} (83%)
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.13.4.bb => xfconf_4.13.5.bb} (75%)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.12.4.bb => xfwm4_4.12.5.bb} (73%)

-- 
2.11.0


