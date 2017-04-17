Return-Path: <gyurco@freemail.hu>
X-Greylist: delayed 306 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 17 Apr 2017 21:27:33 UTC
Received: from primary.intra.htm-hungary.hu (mail.htm-hungary.hu [80.98.98.89])
	by mail.openembedded.org (Postfix) with ESMTP id F1744605C2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Apr 2017 21:27:33 +0000 (UTC)
Received: from localhost (primary [127.0.0.1])
	by primary.intra.htm-hungary.hu (Postfix) with ESMTP id 46CD680570;
	Mon, 17 Apr 2017 23:22:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at htm-hungary.com
Received: from primary.intra.htm-hungary.hu ([127.0.0.1])
	by localhost (primary.intra.htm-hungary.hu [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id UdepttWyMQOw; Mon, 17 Apr 2017 23:22:26 +0200 (CEST)
Received: from gyurco.lan (unknown [10.8.0.14])
	by primary.intra.htm-hungary.hu (Postfix) with ESMTPA id DF12A80523;
	Mon, 17 Apr 2017 23:22:25 +0200 (CEST)
From: Gyorgy Szombathelyi <gyurco@freemail.hu>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Apr 2017 23:22:07 +0200
Message-Id: <20170417212207.4753-1-gyurco@freemail.hu>
X-Mailer: git-send-email 2.9.3
Subject: [meta-networking][PATCH] samba: fix conflict between samba and sudo packages
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
X-List-Received-Date: Mon, 17 Apr 2017 21:27:35 -0000

Use the same permissions for sudoers.d as in the sudo package.

Signed-off-by: Gyorgy Szombathelyi <gyurco@freemail.hu>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index d0235c1..f2d52a2 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -154,6 +154,7 @@ do_install_append() {
         sed -i 's:\(#!/bin/\)bash:\1sh:' ${D}${bindir}/onnode
     fi
 
+    chmod 0750 ${D}${sysconfdir}/sudoers.d
     rm -rf ${D}/run ${D}${localstatedir}/run ${D}${localstatedir}/log
 }
 
-- 
2.9.3


