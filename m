Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4828C7E572
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2019 08:45:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4V8idXv026424
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 31 May 2019 01:44:49 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 31 May 2019 01:44:28 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 31 May 2019 04:44:13 -0400
Message-ID: <20190531084423.172617-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 00/10] Update recipes in meta-xfce
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
X-List-Received-Date: Fri, 31 May 2019 08:45:14 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>


Kai Kang (10):
  thunar: 1.8.4 -> 1.8.6
  xfdesktop: 4.13.3 -> 4.13.4
  xfce4-panel: 4.13.4 -> 4.13.5
  thunar-volman: 0.9.1 -> 0.9.2
  xfce4-appfinder: 4.13.2 -> 4.13.3
  libxfce4util: 4.13.2 -> 4.13.3
  xfwm4: 4.13.1 -> 4.13.2
  xfconf: 4.13.6 -> 4.13.7
  libxfce4ui: 4.13.4 -> 4.13.5
  xfce4-power-manager: 1.6.1 -> 1.6.2

 .../{libxfce4ui_4.13.4.bb => libxfce4ui_4.13.5.bb}          | 4 ++--
 .../{libxfce4util_4.13.2.bb => libxfce4util_4.13.3.bb}      | 4 ++--
 .../{thunar-volman_0.9.1.bb => thunar-volman_0.9.2.bb}      | 4 ++--
 .../thunar/{thunar_1.8.4.bb => thunar_1.8.6.bb}             | 4 ++--
 ...{xfce4-appfinder_4.13.2.bb => xfce4-appfinder_4.13.3.bb} | 4 ++--
 .../{xfce4-panel_4.13.4.bb => xfce4-panel_4.13.5.bb}        | 4 ++--
 ...-power-manager_1.6.1.bb => xfce4-power-manager_1.6.2.bb} | 6 +++---
 .../xfconf/{xfconf_4.13.6.bb => xfconf_4.13.7.bb}           | 4 ++--
 .../xfdesktop/{xfdesktop_4.13.3.bb => xfdesktop_4.13.4.bb}  | 4 ++--
 .../recipes-xfce/xfwm4/{xfwm4_4.13.1.bb => xfwm4_4.13.2.bb} | 4 ++--
 10 files changed, 21 insertions(+), 21 deletions(-)
 rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.13.4.bb => libxfce4ui_4.13.5.bb} (89%)
 rename meta-xfce/recipes-xfce/libxfce4util/{libxfce4util_4.13.2.bb => libxfce4util_4.13.3.bb} (64%)
 rename meta-xfce/recipes-xfce/thunar-volman/{thunar-volman_0.9.1.bb => thunar-volman_0.9.2.bb} (76%)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.8.4.bb => thunar_1.8.6.bb} (86%)
 rename meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.13.2.bb => xfce4-appfinder_4.13.3.bb} (69%)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.13.4.bb => xfce4-panel_4.13.5.bb} (90%)
 rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_1.6.1.bb => xfce4-power-manager_1.6.2.bb} (88%)
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.13.6.bb => xfconf_4.13.7.bb} (82%)
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.13.3.bb => xfdesktop_4.13.4.bb} (76%)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.13.1.bb => xfwm4_4.13.2.bb} (89%)

-- 
2.20.0


