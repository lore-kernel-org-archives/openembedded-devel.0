Received: from [206.46.173.19] (helo=vms173019pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1M6geH-0005BH-W6
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 May 2009 09:55:43 +0200
Received: from gandalf.denix.org ([71.127.60.148]) by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KJX003O5N00B746@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	20 May 2009 02:48:01 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 2008114AF63; Wed,
	20 May 2009 03:47:59 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 May 2009 03:47:55 -0400
Message-id: <1242805678-20645-6-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.6.0.6
In-reply-to: <1242805678-20645-1-git-send-email-denis@denix.org>
References: <1242805678-20645-1-git-send-email-denis@denix.org>
Subject: [PATCHv2 5/8] dm365-evm: add new machine definition
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
X-List-Received-Date: Wed, 20 May 2009 07:55:58 -0000

kernel support is on the way

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 conf/machine/dm365-evm.conf |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/dm365-evm.conf

diff --git a/conf/machine/dm365-evm.conf b/conf/machine/dm365-evm.conf
new file mode 100644
index 0000000..09f4a35
--- /dev/null
+++ b/conf/machine/dm365-evm.conf
@@ -0,0 +1,7 @@
+#@TYPE: Machine
+#@NAME: DM365 CPUs on a Davinci DM365 EVM board
+#@DESCRIPTION: Machine configuration for the TI Davinci DM365 EVM board
+
+require conf/machine/include/davinci.inc
+
+UBOOT_MACHINE = "davinci_dvevm_config"
-- 
1.6.0.6



