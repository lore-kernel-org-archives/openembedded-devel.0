Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 941F87ED17
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2019 14:13:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6GEE0L0015359
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Jul 2019 07:14:00 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 16 Jul 2019 07:13:59 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 16 Jul 2019 10:12:26 -0400
Message-ID: <20190716141231.77957-11-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190716141231.77957-1-kai.kang@windriver.com>
References: <20190716141231.77957-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 10/15] xfce4-panel: 4.13.5 -> 4.13.6
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
X-List-Received-Date: Tue, 16 Jul 2019 14:13:59 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

* clean DEPENDS
  - libxfce4util xfconf and gtk+3 are required by libxfce4ui which is
    required by garcon and exo
* bbclass gtk-icon-cache has been inherited in xfce.bbclass

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{xfce4-panel_4.13.5.bb => xfce4-panel_4.13.6.bb}      | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.13.5.bb => xfce4-panel_4.13.6.bb} (81%)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.5.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.6.bb
similarity index 81%
rename from meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.5.bb
rename to meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.6.bb
index cebddf6f9..acffa01fe 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.5.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.6.bb
@@ -2,14 +2,14 @@ SUMMARY = "Xfce4 Panel"
 SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=26a8bd75d8f8498bdbbe64a27791d4ee"
-DEPENDS = "libxfce4util garcon libxfce4ui xfconf exo gtk+ gtk+3 dbus cairo virtual/libx11 libxml2 libwnck3 vala-native"
+DEPENDS = "garcon exo gtk+ dbus cairo virtual/libx11 libxml2 libwnck3 vala-native"
 
-inherit xfce gtk-doc gobject-introspection distro_features_check gtk-icon-cache remove-libtool
+inherit xfce gtk-doc gobject-introspection distro_features_check remove-libtool
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "376e360fb87095edaea7df8ca34fe6a7"
-SRC_URI[sha256sum] = "0d05b6dd8c91c154a364a3e31583c5f423c33e26d44d43cc409165f7d578ca15"
+SRC_URI[md5sum] = "bb18c10b44df2d9afc30abe6bd2f63df"
+SRC_URI[sha256sum] = "42411fee7675bb6fb3055395673dc925d43495df93b5e940a1ae3d0a3d2f63a8"
 SRC_URI += " \
     file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
     file://0001-use-lxdm-to-replace-dm-tool.patch \
-- 
2.20.0


