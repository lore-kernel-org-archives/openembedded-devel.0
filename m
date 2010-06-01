Received: from out5.smtp.messagingengine.com ([66.111.4.29])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1OJbEH-0005OT-TP
	for Openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 01:50:42 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 1FD0FF67D3;
	Tue,  1 Jun 2010 19:36:43 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Tue, 01 Jun 2010 19:36:43 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=from:to:cc:subject:date:message-id; s=smtpout;
	bh=vsbWZx8V3F/K2wtrP+tMDl5b3TI=;
	b=aaaejO6D+WfU17Q516V5PTNKKODxzVKYoPpLGhIWFW8w3LrEBvQfQxupaLOvrpM99j3/7Nv+TQ8h8aAVD+Sd/kZ2sgSkFWdGmAzHVVJrTWPAsOzOs9RdehWuZJ0Wz8vwSnn4Ud5PmU6NMM1an5mU37whybxqsbtgSPCVdn6l1TY=
X-Sasl-enc: JUsyWoNw+UdCWnGozvf/T5NAKpABuJXo1Bz1ThIsTwMd 1275435402
Received: from localhost.localdomain (hnvr-4d07a42a.pool.mediaWays.net
	[77.7.164.42])
	by mail.messagingengine.com (Postfix) with ESMTPA id 6090E10B0D;
	Tue,  1 Jun 2010 19:36:42 -0400 (EDT)
From: Vitus Jensen <vjensen@gmx.de>
To: Openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jun 2010 01:37:33 +0200
Message-Id: <1275435453-1118-1-git-send-email-vjensen@gmx.de>
X-Mailer: git-send-email 1.6.4.4
X-SA-Exim-Connect-IP: 66.111.4.29
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Vitus Jensen <vjensen@gmx.de>
Subject: [PATCH] linux-n1200_2.6.27-rc9+git: change KERNEL_OUTPUT to a relative path
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
X-List-Received-Date: Tue, 01 Jun 2010 23:50:43 -0000

deploy method in kernel.bbclass automatically adds {S}

Signed-off-by: Vitus Jensen <vjensen@gmx.de>
---
 recipes/linux/linux-n1200_2.6.27-rc9+git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/linux/linux-n1200_2.6.27-rc9+git.bb b/recipes/linux/linux-n1200_2.6.27-rc9+git.bb
index d6751d0..31a07cd 100644
--- a/recipes/linux/linux-n1200_2.6.27-rc9+git.bb
+++ b/recipes/linux/linux-n1200_2.6.27-rc9+git.bb
@@ -13,7 +13,7 @@ S = "${WORKDIR}/linux-2.6.27-foonas-git"
 export ARCH="powerpc"
 
 # Bootloader is not device tree aware
-KERNEL_OUTPUT = "${S}/arch/powerpc/boot/cuImage.thecus_n1200"
+KERNEL_OUTPUT = "arch/powerpc/boot/cuImage.thecus_n1200"
 
 require linux.inc
 
-- 
1.6.4.4



