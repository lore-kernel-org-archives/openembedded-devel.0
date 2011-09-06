Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1R14mB-0001rB-Gy
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Sep 2011 01:09:55 +0200
Received: from mizar.localdomain (87.14.251.43) by smtp206.alice.it
	(8.5.124.08) id 4E4BBF7701898A82; Wed, 7 Sep 2011 00:59:06 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed,  7 Sep 2011 00:59:01 +0200
Message-Id: <1315349941-9278-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-handheld][PATCH] linux-2.6.39.inc: do not reassign SRC_URI
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
X-List-Received-Date: Tue, 06 Sep 2011 23:09:55 -0000

* fix missing bootlogo

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-2.6.39.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/linux-2.6.39.inc b/recipes-kernel/linux/linux-2.6.39.inc
index 3693aac..b1dc8b2 100644
--- a/recipes-kernel/linux/linux-2.6.39.inc
+++ b/recipes-kernel/linux/linux-2.6.39.inc
@@ -8,7 +8,7 @@ DEFAULT_PREFERENCE_spitz = "1"
 DEFAULT_PREFERENCE_tosa = "1"
 DEFAULT_PREFERENCE_h1940 = "1"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=kernel \
+SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=kernel \
            ${KERNELORG_MIRROR}/linux/kernel/v2.6/patch-${PV}.4.bz2;apply=yes;name=stablepatch \
            file://0001-pcmcia-pxa2xx_sharpsl-retain-ops-structure-on-collie.patch \
            file://locomo_kbd_tweak-r2.patch \
-- 
1.7.3.4



