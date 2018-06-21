Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 14219786E7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2018 08:39:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5L8dIYR007869
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2018 01:39:19 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Thu, 21 Jun 2018 01:39:18 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Jun 2018 15:58:44 +0800
Message-ID: <20180621075845.5422-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH 0/1] Exclude mips64 from COMPATIBLE_HOST for packages which depends on mozjs
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
X-List-Received-Date: Thu, 21 Jun 2018 08:39:18 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

I don't know whether need to split it according sub-layers. So make it
as a whole.

Kai Kang (1):
  mozjs17: exclude mips64 from COMPATIBLE_HOST

 .../network-manager-applet/network-manager-applet_1.8.10.bb  | 5 +++++
 meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb               | 5 +++++
 meta-gnome/recipes-gnome/gvfs/gvfs_1.36.0.bb                 | 3 +++
 .../networkmanager/networkmanager-openvpn_1.2.8.bb           | 5 +++++
 .../networkmanager/networkmanager_1.10.6.bb                  | 3 +++
 .../python-networkmanager/python-networkmanager_2.0.1.bb     | 5 +++++
 .../modemmanager/modemmanager_1.7.991.bb                     | 2 ++
 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb               | 3 +++
 meta-oe/recipes-extended/polkit/polkit-group-rule.inc        | 3 +++
 meta-oe/recipes-extended/polkit/polkit_0.113.bb              | 3 +++
 meta-oe/recipes-support/udisks/udisks2_2.7.6.bb              | 3 +++
 meta-oe/recipes-support/udisks/udisks_1.0.5.bb               | 3 +++
 meta-oe/recipes-support/upower/upower_0.99.7.bb              | 3 +++
 meta-xfce/classes/thunar-plugin.bbclass                      | 5 +++++
 meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb        | 3 +++
 meta-xfce/recipes-core/images/core-image-minimal-xfce.bb     | 5 +++++
 .../systemload/xfce4-systemload-plugin_1.2.1.bb              | 5 +++++
 .../weather/xfce4-weather-plugin_0.8.10.bb                   | 5 +++++
 .../recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.1.bb      | 5 +++++
 .../recipes-xfce/packagegroups/packagegroup-xfce-base.bb     | 4 ++++
 .../recipes-xfce/packagegroups/packagegroup-xfce-extended.bb | 4 ++++
 meta-xfce/recipes-xfce/thunar/thunar_1.8.0.bb                | 5 +++++
 .../xfce4-power-manager/xfce4-power-manager_1.6.1.bb         | 5 +++++
 meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.12.1.bb | 3 +++
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb  | 5 +++++
 meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.4.bb         | 5 +++++
 26 files changed, 105 insertions(+)

-- 
2.17.1


