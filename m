Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0EE5A7C654
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2019 01:32:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x1F1W2uO027414
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Feb 2019 17:32:03 -0800 (PST)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.435.0;
	Thu, 14 Feb 2019 17:32:02 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Thu, 14 Feb 2019 17:32:02 -0800
Message-ID: <20190215013202.126333-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] cryptsetup: Upgrade to 2.1.0
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
X-List-Received-Date: Fri, 15 Feb 2019 01:32:03 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Instead of hardcoding the version in SRC_URI,
get the version for the folder of the source
dynamically in SRC_URI.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../cryptsetup/{cryptsetup_2.0.4.bb => cryptsetup_2.1.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.0.4.bb => cryptsetup_2.1.0.bb} (83%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.0.4.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
similarity index 83%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.0.4.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
index cc7bc6e01..cf1d22242 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.0.4.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
@@ -11,9 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=32107dd283b1dfeb66c9b3e6be312326"
 
 DEPENDS = "util-linux libdevmapper popt libgcrypt json-c"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v2.0/${BP}.tar.xz"
-SRC_URI[md5sum] = "ed42b31f67d05b05e392d1943d467b8d"
-SRC_URI[sha256sum] = "9d3a3c7033293e0c97f0ad0501fd5b4d4913ae497cbf70cca06633ccc54b5734"
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
+SRC_URI[md5sum] = "41d8b985ef69242852b93e95d53e8e28"
+SRC_URI[sha256sum] = "a3eeb2741f8f3376d16585191f3c60e067dd987e096c3c4b073fab7748b1c897"
 
 inherit autotools gettext pkgconfig
 
-- 
2.17.1


