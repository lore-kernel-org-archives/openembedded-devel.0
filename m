Received: from smtp208.alice.it ([82.57.200.104])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SHM80-00006q-4x
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Apr 2012 23:28:00 +0200
Received: from mizar.localdomain (79.17.249.93) by smtp208.alice.it
	(8.6.023.02) id 4F056E850AB51323; Mon, 9 Apr 2012 23:18:43 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Apr 2012 23:18:39 +0200
Message-Id: <1334006320-5810-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-handheld][PATCH 1/2] linux: add CONFIG_GPIO_PCA953X=y to akita defconfigs
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
X-List-Received-Date: Mon, 09 Apr 2012 21:28:00 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-3.1/akita/defconfig |    1 +
 recipes-kernel/linux/linux-3.2/akita/defconfig |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes-kernel/linux/linux-3.1/akita/defconfig b/recipes-kernel/linux/linux-3.1/akita/defconfig
index dfab582..3dc0ee3 100644
--- a/recipes-kernel/linux/linux-3.1/akita/defconfig
+++ b/recipes-kernel/linux/linux-3.1/akita/defconfig
@@ -22,6 +22,7 @@ CONFIG_MODULE_FORCE_UNLOAD=y
 CONFIG_IOSCHED_DEADLINE=m
 CONFIG_IOSCHED_CFQ=m
 CONFIG_ARCH_PXA=y
+CONFIG_GPIO_PCA953X=y
 CONFIG_PXA_SHARPSL=y
 CONFIG_MACH_AKITA=y
 CONFIG_MACH_BORZOI=y
diff --git a/recipes-kernel/linux/linux-3.2/akita/defconfig b/recipes-kernel/linux/linux-3.2/akita/defconfig
index f2e32de..8e9ce4f 100644
--- a/recipes-kernel/linux/linux-3.2/akita/defconfig
+++ b/recipes-kernel/linux/linux-3.2/akita/defconfig
@@ -22,6 +22,7 @@ CONFIG_MODULE_FORCE_UNLOAD=y
 CONFIG_IOSCHED_DEADLINE=m
 CONFIG_IOSCHED_CFQ=m
 CONFIG_ARCH_PXA=y
+CONFIG_GPIO_PCA953X=y
 CONFIG_PXA_SHARPSL=y
 CONFIG_MACH_AKITA=y
 CONFIG_MACH_BORZOI=y
-- 
1.7.3.4



