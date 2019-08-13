Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6FC567D3B7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2019 09:23:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7D9NSss017299
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Aug 2019 02:23:28 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 13 Aug 2019 02:23:27 -0700
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>, <raj.khem@gmail.com>
Date: Tue, 13 Aug 2019 05:21:13 -0400
Message-ID: <20190813092118.113213-12-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190813092118.113213-1-kai.kang@windriver.com>
References: <20190813092118.113213-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 11/16] xfce4-panel: 4.13.6 -> 4.14.0
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
X-List-Received-Date: Tue, 13 Aug 2019 09:23:27 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Update xfce4-panel from 4.13.6 to 4.14.0.

* xfce4-panel ports to gtk+3 and gdbus, so remove dbus from DEPENDS and
  replace gtk+ with gtk+3

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{xfce4-panel_4.13.6.bb => xfce4-panel_4.14.0.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.13.6.bb => xfce4-panel_4.14.0.bb} (85%)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.6.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.0.bb
similarity index 85%
rename from meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.6.bb
rename to meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.0.bb
index acffa01fe..749c3fea4 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.6.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.0.bb
@@ -2,14 +2,14 @@ SUMMARY = "Xfce4 Panel"
 SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=26a8bd75d8f8498bdbbe64a27791d4ee"
-DEPENDS = "garcon exo gtk+ dbus cairo virtual/libx11 libxml2 libwnck3 vala-native"
+DEPENDS = "garcon exo gtk+3 cairo virtual/libx11 libxml2 libwnck3 vala-native"
 
 inherit xfce gtk-doc gobject-introspection distro_features_check remove-libtool
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "bb18c10b44df2d9afc30abe6bd2f63df"
-SRC_URI[sha256sum] = "42411fee7675bb6fb3055395673dc925d43495df93b5e940a1ae3d0a3d2f63a8"
+SRC_URI[md5sum] = "940e8b430e28093a2e56e390055bcd51"
+SRC_URI[sha256sum] = "d5f8f3bd7e142139987e5e62cda26135a424baabb5e47aa0c23b4169d0a66ef4"
 SRC_URI += " \
     file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
     file://0001-use-lxdm-to-replace-dm-tool.patch \
-- 
2.20.0


