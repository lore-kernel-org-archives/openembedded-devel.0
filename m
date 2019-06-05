Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4FC857E079
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Jun 2019 03:04:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5534psF022920
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 4 Jun 2019 20:04:51 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Tue, 4 Jun 2019 20:04:50 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Jun 2019 11:03:59 +0800
Message-ID: <1559703841-263740-6-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559703841-263740-1-git-send-email-changqing.li@windriver.com>
References: <1559703841-263740-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] xf86-video-ati: upgrade 18.0.1 -> 19.0.1
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
X-List-Received-Date: Wed, 05 Jun 2019 03:04:50 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../{xf86-video-ati_18.0.1.bb => xf86-video-ati_19.0.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-driver/{xf86-video-ati_18.0.1.bb => xf86-video-ati_19.0.1.bb} (80%)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_18.0.1.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_19.0.1.bb
similarity index 80%
rename from meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_18.0.1.bb
rename to meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_19.0.1.bb
index b38fb65..971de73 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_18.0.1.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_19.0.1.bb
@@ -12,8 +12,8 @@ DEPENDS += "virtual/libx11 libxvmc drm \
 inherit distro_features_check
 REQUIRED_DISTRO_FEATURES += "opengl"
 
-SRC_URI[md5sum] = "40e7c0a5a69aba3d84e0958f58705ea7"
-SRC_URI[sha256sum] = "72ea3b8127d4550b64f797457f5a7851a541fa4ee2cc3f345b6c1886b81714a0"
+SRC_URI[md5sum] = "47eccf71823206ade9629cba69de7ef6"
+SRC_URI[sha256sum] = "5cb6015d8664546ad1311bc9c363d7bc41ebf60e7046ceb44dd38e5b707961b0"
 
 EXTRA_OECONF += "--disable-glamor"
 
-- 
2.7.4


