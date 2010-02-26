Received: from dd20204.kasserver.com ([85.13.140.93])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Bernhard.Guillon@opensimpad.org>) id 1Nl4sB-0004Le-6S
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 19:25:15 +0100
Received: from localhost (95-90-75-53-dynip.superkabel.de [95.90.75.53])
	by dd20204.kasserver.com (Postfix) with ESMTP id 0079D184A3AF8;
	Fri, 26 Feb 2010 19:22:25 +0100 (CET)
From: Bernhard.Guillon@opensimpad.org
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Feb 2010 19:22:28 +0100
Message-Id: <1267208548-769-1-git-send-email-Bernhard.Guillon@opensimpad.org>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <201002261318.46211.marcin@juszkiewicz.com.pl>
References: <201002261318.46211.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 85.13.140.93
X-SA-Exim-Mail-From: Bernhard.Guillon@opensimpad.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=AWL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] linux: atngw100 - add bridge module to defconfig, bump PR
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
X-List-Received-Date: Fri, 26 Feb 2010 18:25:15 -0000

From: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>


Signed-off-by: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>
---
 recipes/linux/linux/atngw100/defconfig |    2 +-
 recipes/linux/linux_2.6.29.bb          |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/linux/linux/atngw100/defconfig b/recipes/linux/linux/atngw100/defconfig
index 489d094..b54fca1 100644
--- a/recipes/linux/linux/atngw100/defconfig
+++ b/recipes/linux/linux/atngw100/defconfig
@@ -489,7 +489,7 @@ CONFIG_IP6_NF_RAW=m
 # CONFIG_IP_SCTP is not set
 # CONFIG_TIPC is not set
 # CONFIG_ATM is not set
-# CONFIG_BRIDGE is not set
+CONFIG_BRIDGE=m
 # CONFIG_NET_DSA is not set
 # CONFIG_VLAN_8021Q is not set
 # CONFIG_DECNET is not set
diff --git a/recipes/linux/linux_2.6.29.bb b/recipes/linux/linux_2.6.29.bb
index 240faf2..33f0eda 100644
--- a/recipes/linux/linux_2.6.29.bb
+++ b/recipes/linux/linux_2.6.29.bb
@@ -1,6 +1,6 @@
 require linux.inc
 
-PR = "r10"
+PR = "r11"
 
 S = "${WORKDIR}/linux-2.6.29"
 
-- 
1.6.3.3



