Return-Path: <robert.joslyn@redrectangle.org>
X-Greylist: delayed 6497 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 13 May 2018 03:47:22 UTC
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
	[217.70.183.194])
	by mail.openembedded.org (Postfix) with ESMTP id B6B5174F43
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 May 2018 03:47:21 +0000 (UTC)
X-Originating-IP: 64.126.143.1
Received: from localhost.localdomain (w143001.wireless.fsr.net [64.126.143.1])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 2B03A40003;
	Sun, 13 May 2018 05:47:20 +0200 (CEST)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 May 2018 20:47:06 -0700
Message-Id: <20180513034706.9546-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.16.1
X-Spam-Level: 
Subject: [meta-oe][master][sumo][PATCH] htop: Fix typo
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
X-List-Received-Date: Sun, 13 May 2018 03:47:23 -0000

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta-oe/recipes-support/htop/htop_2.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/htop/htop_2.1.0.bb b/meta-oe/recipes-support/htop/htop_2.1.0.bb
index 5ff2fcfbf..33508f984 100644
--- a/meta-oe/recipes-support/htop/htop_2.1.0.bb
+++ b/meta-oe/recipes-support/htop/htop_2.1.0.bb
@@ -8,7 +8,7 @@ DEPENDS = "ncurses"
 
 SRC_URI = "http://hisham.hm/htop/releases/${PV}/${BP}.tar.gz \
            file://0001-Use-pkg-config.patch"
-SRC_URt[md5sum] = "f262b66ad6c194782f4d3a80627e84c8"
+SRC_URI[md5sum] = "f262b66ad6c194782f4d3a80627e84c8"
 SRC_URI[sha256sum] = "3260be990d26e25b6b49fc9d96dbc935ad46e61083c0b7f6df413e513bf80748"
 
 inherit autotools pkgconfig
-- 
2.16.1


