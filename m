Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SMR05-0008QB-Un
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Apr 2012 23:40:50 +0200
Received: from mizar.localdomain (87.5.26.19) by smtp206.alice.it (8.6.023.02)
	id 4F1836AD0B30A572; Mon, 23 Apr 2012 23:31:18 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Apr 2012 23:31:13 +0200
Message-Id: <1335216674-11159-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1335216674-11159-1-git-send-email-andrea.adami@gmail.com>
References: <1335216674-11159-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 2/3] zaurus.inc: update references to linux-kexecboot
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
X-List-Received-Date: Mon, 23 Apr 2012 21:40:50 -0000

* now using linux-yocto-tiny-kexecboot

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/include/zaurus.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zaurus.inc
index 1ef3213..268b9fd 100644
--- a/conf/machine/include/zaurus.inc
+++ b/conf/machine/include/zaurus.inc
@@ -69,10 +69,10 @@ MACHINE_EXTRA_RDEPENDS_collie = "zaurusd"
 
 ##################################
 # Zaurus rootfs are booted by
-# linux-kexecboot
+# linux-yocto-tiny-kexecboot
 ##################################
 
-# If set here, each image will also build linux-kexecboot and the updater
+# If set here, each image will also build linux-yocto-tiny-kexecboot and the updater
 # EXTRA_IMAGEDEPENDS += "zaurus-installer"
 
 # Install /boot/boot.cfg in target images
-- 
1.7.3.4



