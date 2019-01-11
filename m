Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5AF237C090
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2019 09:26:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0B9PCUF008817
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 11 Jan 2019 01:25:42 -0800
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 11 Jan 2019 01:25:07 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Fri, 11 Jan 2019 01:25:07 -0800
Message-ID: <20190111092507.6390-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] libteam: Upgrade to 1.28
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
X-List-Received-Date: Fri, 11 Jan 2019 09:26:08 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Remove the useless checksum lines as the
source is git repo, not the tar file.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../libteam/{libteam_1.27.bb => libteam_1.28.bb}             | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)
 rename meta-oe/recipes-support/libteam/{libteam_1.27.bb => libteam_1.28.bb} (84%)

diff --git a/meta-oe/recipes-support/libteam/libteam_1.27.bb b/meta-oe/recipes-support/libteam/libteam_1.28.bb
similarity index 84%
rename from meta-oe/recipes-support/libteam/libteam_1.27.bb
rename to meta-oe/recipes-support/libteam/libteam_1.28.bb
index 442592de9..b80bb4efa 100644
--- a/meta-oe/recipes-support/libteam/libteam_1.27.bb
+++ b/meta-oe/recipes-support/libteam/libteam_1.28.bb
@@ -13,10 +13,7 @@ SRC_URI = "git://github.com/jpirko/libteam \
            file://0001-team_basic_test.py-disable-RedHat-specific-test.patch \
            file://run-ptest \
            "
-SRCREV = "91a928a56a501daac5ce8b3c16bd9943661f1d16"
-
-SRC_URI[md5sum] = "565114d70c41bff6093d8e57be284e8a"
-SRC_URI[sha256sum] = "d65286379141db141bea33424ec0507bb0f827a0bf03d9c65004bb593e3d5545"
+SRCREV = "903950c7fcf28c32f4b62d9d1c07c0234e8378a2"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


