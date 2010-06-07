Received: from smtp-out04.alice.it ([85.37.17.100])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1OLiir-00070k-1q
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 22:15:03 +0200
Received: from FBCMMO05.fbc.local ([192.168.184.136]) by smtp-out04.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 7 Jun 2010 22:10:40 +0200
Received: from FBCMCL01B03.fbc.local ([192.168.69.84]) by FBCMMO05.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 7 Jun 2010 22:10:40 +0200
Received: from localhost.localdomain ([95.237.157.170]) by
	FBCMCL01B03.fbc.local with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 7 Jun 2010 22:10:34 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Jun 2010 22:10:24 +0200
Message-Id: <1275941424-14837-2-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1275941424-14837-1-git-send-email-GNUtoo@no-log.org>
References: <1275941424-14837-1-git-send-email-GNUtoo@no-log.org>
X-OriginalArrivalTime: 07 Jun 2010 20:10:34.0994 (UTC)
	FILETIME=[7D1D4520:01CB067D]
X-SA-Exim-Connect-IP: 85.37.17.100
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] netbase: add support for htcdream
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
X-List-Received-Date: Mon, 07 Jun 2010 20:15:03 -0000

If we don't add a custom file containing auto usb0,
usb0 is not configured at boot and we can't ssh into the phone

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 recipes/netbase/netbase/htcdream/interfaces |   17 +++++++++++++++++
 recipes/netbase/netbase_4.21.bb             |    2 +-
 2 files changed, 18 insertions(+), 1 deletions(-)
 create mode 100644 recipes/netbase/netbase/htcdream/interfaces

diff --git a/recipes/netbase/netbase/htcdream/interfaces b/recipes/netbase/netbase/htcdream/interfaces
new file mode 100644
index 0000000..a75f259
--- /dev/null
+++ b/recipes/netbase/netbase/htcdream/interfaces
@@ -0,0 +1,17 @@
+# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
+ 
+# The loopback interface
+auto lo
+iface lo inet loopback
+
+# Ethernet/RNDIS gadget (g_ether)
+# ... or on host side, usbnet and random hwaddr
+auto usb0
+iface usb0 inet static
+	address 192.168.0.202
+	netmask 255.255.255.0
+	network 192.168.0.0
+	up route add default gw 192.168.0.200 metric 8
+	up echo nameserver 208.67.222.222 > /etc/resolv.conf
+	up echo nameserver 208.67.220.220 >> /etc/resolv.conf
+	down route del default gw 192.168.0.200 metric 8
diff --git a/recipes/netbase/netbase_4.21.bb b/recipes/netbase/netbase_4.21.bb
index 4e1d39f..baec44b 100644
--- a/recipes/netbase/netbase_4.21.bb
+++ b/recipes/netbase/netbase_4.21.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "This package provides the necessary \
 infrastructure for basic TCP/IP based networking."
 SECTION = "base"
 LICENSE = "GPLv2"
-PR = "r41"
+PR = "r42"
 
 inherit update-rc.d
 
-- 
1.7.0.4



