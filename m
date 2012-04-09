Received: from smtp208.alice.it ([82.57.200.104])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SHM80-00006q-A3
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Apr 2012 23:28:00 +0200
Received: from mizar.localdomain (79.17.249.93) by smtp208.alice.it
	(8.6.023.02) id 4F056E850AB51345; Mon, 9 Apr 2012 23:18:45 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Apr 2012 23:18:40 +0200
Message-Id: <1334006320-5810-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1334006320-5810-1-git-send-email-andrea.adami@gmail.com>
References: <1334006320-5810-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 2/2] linux-kexecboot: add CONFIG_GPIO_PCA953X=y to akita defconfigs
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
 .../linux/linux-kexecboot-3.1/akita/defconfig      |    1 +
 .../linux/linux-kexecboot-3.2/akita/defconfig      |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes-kernel/linux/linux-kexecboot-3.1/akita/defconfig b/recipes-kernel/linux/linux-kexecboot-3.1/akita/defconfig
index b066839..32530a3 100644
--- a/recipes-kernel/linux/linux-kexecboot-3.1/akita/defconfig
+++ b/recipes-kernel/linux/linux-kexecboot-3.1/akita/defconfig
@@ -21,6 +21,7 @@ CONFIG_SLOB=y
 # CONFIG_LBDAF is not set
 # CONFIG_IOSCHED_CFQ is not set
 CONFIG_ARCH_PXA=y
+CONFIG_GPIO_PCA953X=y
 CONFIG_PXA_SHARPSL=y
 CONFIG_PXA_SHARPSL_DETECT_MACH_ID=y
 CONFIG_MACH_AKITA=y
diff --git a/recipes-kernel/linux/linux-kexecboot-3.2/akita/defconfig b/recipes-kernel/linux/linux-kexecboot-3.2/akita/defconfig
index 6c579fa..a25331b 100644
--- a/recipes-kernel/linux/linux-kexecboot-3.2/akita/defconfig
+++ b/recipes-kernel/linux/linux-kexecboot-3.2/akita/defconfig
@@ -20,6 +20,7 @@ CONFIG_SLOB=y
 # CONFIG_LBDAF is not set
 # CONFIG_IOSCHED_CFQ is not set
 CONFIG_ARCH_PXA=y
+CONFIG_GPIO_PCA953X=y
 CONFIG_PXA_SHARPSL=y
 CONFIG_PXA_SHARPSL_DETECT_MACH_ID=y
 CONFIG_MACH_AKITA=y
-- 
1.7.3.4



