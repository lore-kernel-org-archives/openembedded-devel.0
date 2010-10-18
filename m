Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1P7uoo-0004Yj-7o
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 20:52:23 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 17562275CE43; Mon, 18 Oct 2010 20:51:49 +0200 (CEST)
Received: from localhost (p5489BE68.dip.t-dialin.net [84.137.190.104])
	by gravedo.de (Postfix) with ESMTPSA id 4CB87275CD26;
	Mon, 18 Oct 2010 20:51:48 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Oct 2010 20:51:21 +0200
Message-Id: <1287427884-1517-13-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1287427884-1517-1-git-send-email-morphis@gravedo.de>
References: <1287427884-1517-1-git-send-email-morphis@gravedo.de>
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 12/15] linux-palmpre: enable devtmpfs per default but do not auto mount it
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
X-List-Received-Date: Mon, 18 Oct 2010 18:52:24 -0000

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes/linux/linux-palmpre/defconfig |    4 +++-
 recipes/linux/linux-palmpre_git.bb    |    2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes/linux/linux-palmpre/defconfig b/recipes/linux/linux-palmpre/defconfig
index 7bdaf0c..7cf2f6b 100644
--- a/recipes/linux/linux-palmpre/defconfig
+++ b/recipes/linux/linux-palmpre/defconfig
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
 # Linux kernel version: 2.6.24-palm
-# Wed May 26 09:04:32 2010
+# Thu Sep 30 06:47:30 2010
 #
 CONFIG_ARM=y
 CONFIG_SYS_SUPPORTS_APM_EMULATION=y
@@ -684,6 +684,8 @@ CONFIG_IEEE80211=m
 # Generic Driver Options
 #
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_DEVTMPFS=y
+# CONFIG_DEVTMPFS_MOUNT is not set
 CONFIG_STANDALONE=y
 CONFIG_PREVENT_FIRMWARE_BUILD=y
 CONFIG_FW_LOADER=y
diff --git a/recipes/linux/linux-palmpre_git.bb b/recipes/linux/linux-palmpre_git.bb
index 208b7bd..4669a1a 100644
--- a/recipes/linux/linux-palmpre_git.bb
+++ b/recipes/linux/linux-palmpre_git.bb
@@ -13,7 +13,7 @@ S = "${WORKDIR}/git/"
 
 SRCREV = "33239e4074f4716a674b450a443b64add201bf39"
 KV = "2.6.24"
-PR="r2"
+PR="r3"
 PV = "${KV}+gitr${SRCPV}"
 
 # linux.inc overrides LOCAVERSION but we like to stay with the one used originally
-- 
1.7.1



