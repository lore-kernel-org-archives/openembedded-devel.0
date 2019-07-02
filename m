Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 000037E7BF
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 01:29:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x621TG4A024119
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Jul 2019 18:29:31 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 1 Jul 2019 18:29:17 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Mon, 1 Jul 2019 21:29:02 -0400
Message-ID: <20190702012913.7163-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 00/11] Upgrade to xfce 4.14 pre2
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
X-List-Received-Date: Tue, 02 Jul 2019 01:29:56 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade core packages of xfce to 4.14pre2

Kai Kang (11):
  thunar: 1.8.6 -> 1.8.7
  exo: 0.12.5 -> 0.12.6
  garcon: 0.6.2 -> 0.6.3
  thunar-volman: 0.9.2 -> 0.9.3
  xfce4-dev-tools: 4.12.0 -> 4.13.0
  xfce4-panel: 4.13.5 -> 4.13.6
  xfce4-power-manager: 1.6.2 -> 1.6.3
  xfce4-session: 4.13.2 -> 4.13.3
  xfdesktop: 4.13.4 -> 4.13.5
  xfwm4: 4.13.2 -> 4.13.3
  xfconf: 4.13.7 -> 4.13.8

 meta-xfce/recipes-xfce/exo/{exo_0.12.5.bb => exo_0.12.6.bb} | 4 ++--
 .../garcon/{garcon_0.6.2.bb => garcon_0.6.3.bb}             | 4 ++--
 .../{thunar-volman_0.9.2.bb => thunar-volman_0.9.3.bb}      | 4 ++--
 .../thunar/{thunar_1.8.6.bb => thunar_1.8.7.bb}             | 4 ++--
 ...{xfce4-dev-tools_4.12.0.bb => xfce4-dev-tools_4.13.0.bb} | 4 ++--
 .../{xfce4-panel_4.13.5.bb => xfce4-panel_4.13.6.bb}        | 4 ++--
 ...-power-manager_1.6.2.bb => xfce4-power-manager_1.6.3.bb} | 4 ++--
 .../{xfce4-session_4.13.2.bb => xfce4-session_4.13.3.bb}    | 4 ++--
 .../xfconf/{xfconf_4.13.7.bb => xfconf_4.13.8.bb}           | 6 +++---
 .../xfdesktop/{xfdesktop_4.13.4.bb => xfdesktop_4.13.5.bb}  | 4 ++--
 .../recipes-xfce/xfwm4/{xfwm4_4.13.2.bb => xfwm4_4.13.3.bb} | 4 ++--
 11 files changed, 23 insertions(+), 23 deletions(-)
 rename meta-xfce/recipes-xfce/exo/{exo_0.12.5.bb => exo_0.12.6.bb} (87%)
 rename meta-xfce/recipes-xfce/garcon/{garcon_0.6.2.bb => garcon_0.6.3.bb} (76%)
 rename meta-xfce/recipes-xfce/thunar-volman/{thunar-volman_0.9.2.bb => thunar-volman_0.9.3.bb} (76%)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.8.6.bb => thunar_1.8.7.bb} (86%)
 rename meta-xfce/recipes-xfce/xfce4-dev-tools/{xfce4-dev-tools_4.12.0.bb => xfce4-dev-tools_4.13.0.bb} (79%)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.13.5.bb => xfce4-panel_4.13.6.bb} (90%)
 rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_1.6.2.bb => xfce4-power-manager_1.6.3.bb} (90%)
 rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.13.2.bb => xfce4-session_4.13.3.bb} (87%)
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.13.7.bb => xfconf_4.13.8.bb} (78%)
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.13.4.bb => xfdesktop_4.13.5.bb} (76%)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.13.2.bb => xfwm4_4.13.3.bb} (89%)

-- 
2.20.0


