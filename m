Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Rnede-0002r3-1R
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jan 2012 00:09:54 +0100
Received: from mizar.localdomain (87.0.248.69) by smtp205.alice.it (8.6.023.02)
	id 4EECA2D804895C11; Thu, 19 Jan 2012 00:02:17 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 19 Jan 2012 00:02:09 +0100
Message-Id: <1326927730-21142-3-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1326927730-21142-1-git-send-email-andrea.adami@gmail.com>
References: <1326927730-21142-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld] [PATCH 2/3] zaurus-legacy-tar.bb: Inhibit toolchain dependencies
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jan 2012 23:09:54 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/zaurus-utils/zaurus-legacy-tar.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/zaurus-utils/zaurus-legacy-tar.bb b/recipes-bsp/zaurus-utils/zaurus-legacy-tar.bb
index cc2563a..66a48ef 100644
--- a/recipes-bsp/zaurus-utils/zaurus-legacy-tar.bb
+++ b/recipes-bsp/zaurus-utils/zaurus-legacy-tar.bb
@@ -1,7 +1,9 @@
 DESCRIPTION = "Legacy GNU-tar to unpack hd images on install for Zaurus spitz"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/gnu-tar;md5=34b647d6444a9a38e269c2793c7d0bf2"
-PR = "r1"
+PR = "r2"
+
+INHIBIT_DEFAULT_DEPS = "1"
 
 SRC_URI = "http://pocketworkstation.org/files/gnu-tar.gz"
 SRC_URI[md5sum] = "0c1494335e4f33ac5712d1f72de2eff2"
-- 
1.7.3.4



