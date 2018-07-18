Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 551E978493
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2018 07:31:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6I7VocV012409
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2018 00:31:50 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 18 Jul 2018 00:31:49 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Jul 2018 15:31:29 +0800
Message-ID: <1531899089-395618-10-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531899089-395618-1-git-send-email-changqing.li@windriver.com>
References: <1531899089-395618-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH][meta-oe] xf86-video-ati: 7.8.0 -> 18.0.1
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
X-List-Received-Date: Wed, 18 Jul 2018 07:31:49 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../{xf86-video-ati_7.8.0.bb => xf86-video-ati_18.0.1.bb}           | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-driver/{xf86-video-ati_7.8.0.bb => xf86-video-ati_18.0.1.bb} (77%)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.8.0.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_18.0.1.bb
similarity index 77%
rename from meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.8.0.bb
rename to meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_18.0.1.bb
index fb81e53..969c1a0 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.8.0.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_18.0.1.bb
@@ -14,10 +14,12 @@ REQUIRED_DISTRO_FEATURES += "opengl"
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
-SRC_URI[md5sum] = "f34d04a755e761e03b459155fa3ddcbb"
-SRC_URI[sha256sum] = "401f5de772928f3dc4ce43a885adb0a47a2f61aa4a9e45d2ab3d184136a9d6fa"
+SRC_URI[md5sum] = "40e7c0a5a69aba3d84e0958f58705ea7"
+SRC_URI[sha256sum] = "72ea3b8127d4550b64f797457f5a7851a541fa4ee2cc3f345b6c1886b81714a0"
 
 EXTRA_OECONF += "--disable-glamor"
 
 RDEPENDS_${PN} += "xserver-xorg-module-exa"
 RRECOMMENDS_${PN} += "linux-firmware-radeon"
+
+FILES_${PN} += "${datadir}/X11"
-- 
2.7.4


