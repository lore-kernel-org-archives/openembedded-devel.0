Received: from [148.204.64.197] (helo=localhost.localdomain)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso@localhost.localdomain>) id 1NnhRJ-00061f-69
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Mar 2010 01:00:17 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (8.14.3/8.14.3) with ESMTP id o25NFTq8014769; 
	Fri, 5 Mar 2010 17:15:29 -0600
Received: (from aalonso@localhost)
	by localhost.localdomain (8.14.3/8.14.3/Submit) id o25NFTwN014768;
	Fri, 5 Mar 2010 17:15:29 -0600
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Mar 2010 17:15:17 -0600
Message-Id: <1267830919-14718-5-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1267830919-14718-4-git-send-email-aalonso00@gmail.com>
References: <openembedded-devel@lists.openembedded.org>
	<1267830919-14718-1-git-send-email-aalonso00@gmail.com>
	<1267830919-14718-2-git-send-email-aalonso00@gmail.com>
	<1267830919-14718-3-git-send-email-aalonso00@gmail.com>
	<1267830919-14718-4-git-send-email-aalonso00@gmail.com>
X-SA-Exim-Connect-IP: 148.204.64.197
X-SA-Exim-Mail-From: aalonso@localhost.localdomain
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=AWL,BAYES_00,HELO_LH_LD,
	NO_DNS_FOR_FROM,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 5/7] linux.inc: add device tree for xilinx ml507
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
X-List-Received-Date: Sat, 06 Mar 2010 00:00:18 -0000

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 recipes/linux/linux.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/linux/linux.inc b/recipes/linux/linux.inc
index 6c2ce31..bcba0aa 100644
--- a/recipes/linux/linux.inc
+++ b/recipes/linux/linux.inc
@@ -38,6 +38,7 @@ KERNEL_DEVICETREE_mpc8313e-rdb = "arch/${ARCH}/boot/dts/mpc8313erdb.dts"
 KERNEL_DEVICETREE_mpc8315e-rdb = "arch/${ARCH}/boot/dts/mpc8315erdb.dts"
 KERNEL_DEVICETREE_mpc8323e-rdb = "arch/${ARCH}/boot/dts/mpc832x_rdb.dts"
 KERNEL_DEVICETREE_sequoia = "arch/${ARCH}/boot/dts/sequoia.dts"
+KERNEL_DEVICETREE_xilinx-ml507 = "arch/${ARCH}/boot/dts/virtex440-ml507.dts"
 
 KERNEL_DEVICETREE_FLAGS = "-R 8 -S 0x3000"
 
-- 
1.6.6.1



