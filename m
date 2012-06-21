Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1ShpN2-0007wg-Lw
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jun 2012 23:56:56 +0200
Received: from mizar.localdomain (87.14.251.158) by smtp205.alice.it
	(8.6.023.02) id 4F421F7B0E49DD5B; Thu, 21 Jun 2012 23:46:10 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Jun 2012 23:46:06 +0200
Message-Id: <1340315167-5855-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-handheld][PATCH 1/2] linux_3.0.1 fix parsing warnings
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
X-List-Received-Date: Thu, 21 Jun 2012 21:56:56 -0000

* declare COMPATIBLE_MACHINE to fix
* WARNING: Unable to get checksum for linux SRC_URI entry
* defconfig: file could not be found

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux_3.0.1.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes-kernel/linux/linux_3.0.1.bb b/recipes-kernel/linux/linux_3.0.1.bb
index 38c5196..ac88b29 100644
--- a/recipes-kernel/linux/linux_3.0.1.bb
+++ b/recipes-kernel/linux/linux_3.0.1.bb
@@ -4,6 +4,8 @@ require linux.inc
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_hx4700 = "1"
 
+COMPATIBLE_MACHINE = "hx4700"
+
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/v3.0/linux-${PV}.tar.bz2;name=kernel \
            file://defconfig "
 
-- 
1.7.3.4



