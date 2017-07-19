Return-Path: <gyurco@freemail.hu>
Received: from primary.intra.htm-hungary.hu (mail.htm-hungary.hu [80.98.98.89])
	by mail.openembedded.org (Postfix) with ESMTP id 4E452781DC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jul 2017 08:32:01 +0000 (UTC)
Received: from localhost (primary [127.0.0.1])
	by primary.intra.htm-hungary.hu (Postfix) with ESMTP id EBEB4800A9;
	Wed, 19 Jul 2017 10:32:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at htm-hungary.com
Received: from primary.intra.htm-hungary.hu ([127.0.0.1])
	by localhost (primary.intra.htm-hungary.hu [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id KDNGRkqqG9Z2; Wed, 19 Jul 2017 10:32:01 +0200 (CEST)
Received: from localhost.localdomain (unknown [5.159.216.117])
	by primary.intra.htm-hungary.hu (Postfix) with ESMTPA id 98C1E80DC1;
	Wed, 19 Jul 2017 10:32:01 +0200 (CEST)
From: Gyorgy Szombathelyi <gyurco@freemail.hu>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jul 2017 10:31:51 +0200
Message-Id: <1500453111-16858-2-git-send-email-gyurco@freemail.hu>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1500453111-16858-1-git-send-email-gyurco@freemail.hu>
References: <1500453111-16858-1-git-send-email-gyurco@freemail.hu>
Subject: [meta-oe][PATCH 2/2] sg3-utils: add mirror
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
X-List-Received-Date: Wed, 19 Jul 2017 08:32:02 -0000

Signed-off-by: Gyorgy Szombathelyi <gyurco@freemail.hu>
---
 meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bb b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bb
index a11bd77..c7de057 100644
--- a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bb
+++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bb
@@ -9,6 +9,7 @@ LICENSE = "GPLv2+ & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f90da7fc52172599dbf082d7620f18ca"
 
 SRC_URI = "http://sg.danny.cz/sg/p/sg3_utils-${PV}.tgz"
+MIRRORS += "http://sg.danny.cz/sg/p https://fossies.org/linux/misc"
 
 SRC_URI[md5sum] = "28080de5bf2222f8b55a29093bec8aea"
 SRC_URI[sha256sum] = "1dcb7a0309bd0ba3d4a83acb526973b80106ee26cd9f7398186cd3f0633c9ef3"
-- 
2.7.4


