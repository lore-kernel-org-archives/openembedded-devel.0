Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B9C757CB45
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Feb 2019 02:02:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x1L22ihU027133
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2019 18:02:44 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.435.0; Wed, 20 Feb 2019 18:02:44 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Feb 2019 10:02:16 +0800
Message-ID: <1550714538-415016-4-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1550714538-415016-1-git-send-email-changqing.li@windriver.com>
References: <1550714538-415016-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/5] xf86-video-mga: upgrade 1.6.5 -> 2.0.0
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
X-List-Received-Date: Thu, 21 Feb 2019 02:02:43 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../xorg-driver/{xf86-video-mga_1.6.5.bb => xf86-video-mga_2.0.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-driver/{xf86-video-mga_1.6.5.bb => xf86-video-mga_2.0.0.bb} (81%)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_1.6.5.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_2.0.0.bb
similarity index 81%
rename from meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_1.6.5.bb
rename to meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_2.0.0.bb
index 182e18f..c113d51 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_1.6.5.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_2.0.0.bb
@@ -12,8 +12,8 @@ DEPENDS += "virtual/libx11 libpciaccess"
 
 COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
 
-SRC_URI[md5sum] = "3ee2549247e01de3e7bce52c27483118"
-SRC_URI[sha256sum] = "b663cd8e6364f7c4e2637b9fcab9861d0e3971518c73b00d213f6545a1289422"
+SRC_URI[md5sum] = "b8fc99b4adea8bfe80156b13df4b6c9c"
+SRC_URI[sha256sum] = "268946e1a13e9d80e4f724a0740df9e6e8c8bad37697fcbf456924e9fdbb5d79"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri', '', d)}"
 PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,drm xorgproto,xserver-xorg-extension-dri"
-- 
2.7.4


