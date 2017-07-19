Return-Path: <gyurco@freemail.hu>
Received: from primary.intra.htm-hungary.hu (mail.htm-hungary.hu [80.98.98.89])
	by mail.openembedded.org (Postfix) with ESMTP id 78F85781E6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jul 2017 08:31:58 +0000 (UTC)
Received: from localhost (primary [127.0.0.1])
	by primary.intra.htm-hungary.hu (Postfix) with ESMTP id 9412780A01;
	Wed, 19 Jul 2017 10:31:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at htm-hungary.com
Received: from primary.intra.htm-hungary.hu ([127.0.0.1])
	by localhost (primary.intra.htm-hungary.hu [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id f9aodTL_lCpX; Wed, 19 Jul 2017 10:31:58 +0200 (CEST)
Received: from localhost.localdomain (unknown [5.159.216.117])
	by primary.intra.htm-hungary.hu (Postfix) with ESMTPA id 3DCEC800A9;
	Wed, 19 Jul 2017 10:31:58 +0200 (CEST)
From: Gyorgy Szombathelyi <gyurco@freemail.hu>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jul 2017 10:31:50 +0200
Message-Id: <1500453111-16858-1-git-send-email-gyurco@freemail.hu>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH 1/2] sdparm: add mirror
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
X-List-Received-Date: Wed, 19 Jul 2017 08:31:59 -0000

Signed-off-by: Gyorgy Szombathelyi <gyurco@freemail.hu>
---
 meta-oe/recipes-support/sdparm/sdparm_1.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/sdparm/sdparm_1.10.bb b/meta-oe/recipes-support/sdparm/sdparm_1.10.bb
index 8ab2819..3299a77 100644
--- a/meta-oe/recipes-support/sdparm/sdparm_1.10.bb
+++ b/meta-oe/recipes-support/sdparm/sdparm_1.10.bb
@@ -10,6 +10,7 @@ DEPENDS="sg3-utils"
 SRC_URI = "http://sg.danny.cz/sg/p/${BPN}-${PV}.tgz \
            file://make-sysroot-work.patch \
            "
+MIRRORS += "http://sg.danny.cz/sg/p https://fossies.org/linux/misc"
 
 PACKAGES =+ "${PN}-scripts"
 RDEPENDS_${PN}-scripts += "bash ${PN}"
-- 
2.7.4


