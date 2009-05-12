Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1M3gNE-0007Ax-PQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 May 2009 03:01:36 +0200
Received: from gandalf.denix.org ([71.127.60.148]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KJI00GAYAIUCDCU@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	11 May 2009 19:54:35 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3175C14AF64; Mon,
	11 May 2009 20:54:28 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 May 2009 20:54:26 -0400
Message-id: <1242089668-11610-7-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.6.0.6
In-reply-to: <1242089668-11610-1-git-send-email-denis@denix.org>
References: <1242089668-11610-1-git-send-email-denis@denix.org>
Subject: [PATCH 6/8] dm357-evm: add new machine definition
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
X-List-Received-Date: Tue, 12 May 2009 01:01:37 -0000

kernel support is on the way

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 conf/machine/dm357-evm.conf |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/dm357-evm.conf

diff --git a/conf/machine/dm357-evm.conf b/conf/machine/dm357-evm.conf
new file mode 100644
index 0000000..2690437
--- /dev/null
+++ b/conf/machine/dm357-evm.conf
@@ -0,0 +1,13 @@
+#@TYPE: Machine
+#@NAME: DM357 CPUs on a Davinci DM357 EVM board
+#@DESCRIPTION: Machine configuration for the TI Davinci DM357 EVM board
+
+require conf/machine/include/davinci.inc
+
+PREFERRED_PROVIDER_xserver = "xserver-kdrive"
+PREFERRED_PROVIDERS += "virtual/${TARGET_PREFIX}depmod:module-init-tools-cross"
+
+PREFERRED_VERSION_u-boot = "git"
+UBOOT_MACHINE = "davinci_dvevm_config"
+
+#MACHINE_EXTRA_RRECOMMENDS = ""
-- 
1.6.0.6



