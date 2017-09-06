Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D54CC77B95
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 19:29:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v86JTbRV027099
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Sep 2017 12:29:37 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 6 Sep 2017 12:29:36 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Sep 2017 14:23:04 -0500
Message-ID: <1504725809-12825-7-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/31] xorg-drivers: Add opengl distro flag requirement to ati and nouveau
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
X-List-Received-Date: Wed, 06 Sep 2017 19:29:36 -0000
Content-Type: text/plain

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.8.0.bb      | 3 +++
 meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.15.bb | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.8.0.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.8.0.bb
index a101008..d409a18 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.8.0.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.8.0.bb
@@ -9,6 +9,9 @@ DESCRIPTION = "Open-source X.org graphics driver for ATI Radeon graphics"
 DEPENDS += "virtual/libx11 libxvmc drm xf86driproto glproto \
             virtual/libgl xineramaproto libpciaccess"
 
+inherit distro_features_check
+REQUIRED_DISTRO_FEATURES += "opengl"
+
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
 SRC_URI[md5sum] = "f34d04a755e761e03b459155fa3ddcbb"
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.15.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.15.bb
index b10ee71..2746821 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.15.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.15.bb
@@ -10,7 +10,11 @@ DEPENDS += "virtual/libx11 libxvmc drm xf86driproto glproto \
             virtual/libgl xineramaproto libpciaccess"
 RDEPENDS_${PN} += "xserver-xorg-module-exa"
 
+inherit distro_features_check
+REQUIRED_DISTRO_FEATURES += "opengl"
+
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
 SRC_URI[md5sum] = "717203cb87029cddcbccf7398f9ad8c3"
 SRC_URI[sha256sum] = "aede10fd395610a328697adca3434fb14e9afbd79911d6c8545cfa2c0e541d4c"
+
-- 
1.8.3.1


