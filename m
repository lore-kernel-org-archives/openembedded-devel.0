Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B7FA1749EA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 May 2018 02:03:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4823jrm001396
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 7 May 2018 19:03:45 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 7 May 2018 19:03:44 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 7 May 2018 19:03:44 -0700
Message-ID: <20180508020344.2791-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [meta-oe][PATCH] xorg: Replace depreciated *proto depends with xorgproto
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
X-List-Received-Date: Tue, 08 May 2018 02:03:46 -0000
Content-Type: text/plain

The oe-core commit 9d236bd40ef8598c78c1ea807d658467700505e2 has removed *proto,
we also need to do so in meta-openembedded.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.8.0.bb          | 4 ++--
 meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_1.6.5.bb          | 2 +-
 meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.2.bb | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.8.0.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.8.0.bb
index d409a18..fb81e53 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.8.0.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.8.0.bb
@@ -6,8 +6,8 @@ SUMMARY = "X.Org X server -- ATI Radeon video driver"
 
 DESCRIPTION = "Open-source X.org graphics driver for ATI Radeon graphics"
 
-DEPENDS += "virtual/libx11 libxvmc drm xf86driproto glproto \
-            virtual/libgl xineramaproto libpciaccess"
+DEPENDS += "virtual/libx11 libxvmc drm \
+            virtual/libgl xorgproto libpciaccess"
 
 inherit distro_features_check
 REQUIRED_DISTRO_FEATURES += "opengl"
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_1.6.5.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_1.6.5.bb
index cd68059..182e18f 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_1.6.5.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_1.6.5.bb
@@ -16,6 +16,6 @@ SRC_URI[md5sum] = "3ee2549247e01de3e7bce52c27483118"
 SRC_URI[sha256sum] = "b663cd8e6364f7c4e2637b9fcab9861d0e3971518c73b00d213f6545a1289422"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri', '', d)}"
-PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,drm xf86driproto,xserver-xorg-extension-dri"
+PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,drm xorgproto,xserver-xorg-extension-dri"
 
 RDEPENDS_${PN} = "xserver-xorg-module-exa"
diff --git a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.2.bb b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.2.bb
index 96bdf0e..f683f53 100644
--- a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.2.bb
+++ b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 inherit xfce-panel-plugin
 
-DEPENDS += "xfconf xproto libxtst"
+DEPENDS += "xfconf xorgproto libxtst"
 
 SRC_URI[md5sum] = "9169140af7c9d3fddd8a5c9e0efb5a61"
 SRC_URI[sha256sum] = "cf2b45e327e67cc187dcb99a6ef6d95570463045accd24540e17172f005189b3"
-- 
2.10.2


