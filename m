Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 453C774F9D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Aug 2018 09:45:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7T9jSpJ009687
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Aug 2018 02:45:28 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 29 Aug 2018 02:45:20 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 29 Aug 2018 02:45:20 -0700
Message-ID: <20180829094520.70347-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] cryptsetup: Upgrade to 2.0.4
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
X-List-Received-Date: Wed, 29 Aug 2018 09:45:28 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../cryptsetup/{cryptsetup_2.0.3.bb => cryptsetup_2.0.4.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.0.3.bb => cryptsetup_2.0.4.bb} (91%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.0.3.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.0.4.bb
similarity index 91%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.0.3.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.0.4.bb
index df85add6a..cc7bc6e01 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.0.3.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.0.4.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=32107dd283b1dfeb66c9b3e6be312326"
 DEPENDS = "util-linux libdevmapper popt libgcrypt json-c"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v2.0/${BP}.tar.xz"
-SRC_URI[md5sum] = "ea1c722f8d4c4e36427628b679b1f819"
-SRC_URI[sha256sum] = "4d6cca04c1f5ff4a68d045d190efb2623087eda0274ded92f92a4b6911e501d4"
+SRC_URI[md5sum] = "ed42b31f67d05b05e392d1943d467b8d"
+SRC_URI[sha256sum] = "9d3a3c7033293e0c97f0ad0501fd5b4d4913ae497cbf70cca06633ccc54b5734"
 
 inherit autotools gettext pkgconfig
 
-- 
2.17.1


