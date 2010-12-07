Received: from smtp201.alice.it ([82.57.200.97])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1PPyd8-00072Y-BS
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Dec 2010 15:35:15 +0100
Received: from localhost.localdomain (80.117.37.237) by smtp201.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4CC05A4C041ACA12; Tue, 7 Dec 2010 15:33:27 +0100
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Dec 2010 15:32:51 +0100
Message-Id: <1291732373-17953-3-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1291732373-17953-1-git-send-email-GNUtoo@no-log.org>
References: <1291732373-17953-1-git-send-email-GNUtoo@no-log.org>
X-SA-Exim-Connect-IP: 82.57.200.97
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/4] netbase: add iphone3g support
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
X-List-Received-Date: Tue, 07 Dec 2010 14:35:15 -0000

Without that patch, the user can't ssh into his device,
  because usb0 is not up on the device side

Signed-off-by: Chris 'Lopi' Spehn <chris.spehn@gmail.com>
Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 recipes/netbase/netbase/iphone3g/interfaces |   20 ++++++++++++++++++++
 recipes/netbase/netbase_4.21.bb             |    2 +-
 2 files changed, 21 insertions(+), 1 deletions(-)
 create mode 100644 recipes/netbase/netbase/iphone3g/interfaces

diff --git a/recipes/netbase/netbase/iphone3g/interfaces b/recipes/netbase/netbase/iphone3g/interfaces
new file mode 100644
index 0000000..e0c5f21
--- /dev/null
+++ b/recipes/netbase/netbase/iphone3g/interfaces
@@ -0,0 +1,20 @@
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
+
+auto wlan0
+iface wlan0 inet dhcp
diff --git a/recipes/netbase/netbase_4.21.bb b/recipes/netbase/netbase_4.21.bb
index 68b8637..f3ae6e9 100644
--- a/recipes/netbase/netbase_4.21.bb
+++ b/recipes/netbase/netbase_4.21.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "This package provides the necessary \
 infrastructure for basic TCP/IP based networking."
 SECTION = "base"
 LICENSE = "GPLv2"
-PR = "r49"
+PR = "r50"
 
 inherit update-rc.d
 
-- 
1.7.0.4



