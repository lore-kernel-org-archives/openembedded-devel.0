Received: from [206.46.173.19] (helo=vms173019pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MplR6-0004DO-QA
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Sep 2009 18:08:24 +0200
Received: from gandalf.denix.org ([71.255.235.240]) by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KQB007PCWS2FLB6@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	21 Sep 2009 11:07:15 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id BD7DC14AF1F; Mon,
	21 Sep 2009 12:07:13 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Sep 2009 12:07:06 -0400
Message-id: <1253549226-16186-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 206.46.173.19
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [RFC][PATCH] netbase: don't start udhcpc if kernel assigned IP statically
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
X-List-Received-Date: Mon, 21 Sep 2009 16:08:24 -0000


Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 recipes/netbase/netbase/interfaces |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/netbase/netbase/interfaces b/recipes/netbase/netbase/interfaces
index c615642..bae03dd 100644
--- a/recipes/netbase/netbase/interfaces
+++ b/recipes/netbase/netbase/interfaces
@@ -52,6 +52,8 @@ iface atml0 inet dhcp
 # Wired or wireless interfaces
 auto eth0
 iface eth0 inet dhcp
+        pre-up /bin/grep -v -e "ip=[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+" /proc/cmdline > /dev/null
+
 iface eth1 inet dhcp
 
 # Ethernet/RNDIS gadget (g_ether)
-- 
1.6.3.3



