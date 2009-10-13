Received: from [65.182.109.74] (helo=mta5.brinkster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1MxhpQ-0005yv-98
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Oct 2009 15:54:19 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta5.brinkster.com (Postfix) with ESMTP id F1CC62C03E1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2009 09:53:35 -0400 (EDT)
X-Virus-Scanned: amavisd-new at 
Received: from mta5.brinkster.com ([127.0.0.1])
	by localhost (mta5.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IfQE30IL95yE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2009 09:53:30 -0400 (EDT)
Received: from MareImbrium (82-46-19-72.cable.ubr02.bath.blueyonder.co.uk
	[82.46.19.72])
	by mta5.brinkster.com (Postfix) with ESMTP id 6479F2C0326
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Oct 2009 09:53:29 -0400 (EDT)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 13 Oct 2009 14:53:03 +0100
Message-ID: <008301ca4c0c$7d07c460$77174d20$@Willis@Distant-earth.com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcpMDHwSlsA/kc2nTWWZNfeVxx/JZg==
X-SA-Exim-Connect-IP: 65.182.109.74
X-SA-Exim-Mail-From: John.Willis@Distant-earth.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] netbase: Add config files for the omap3pandora and bump PR.
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
X-List-Received-Date: Tue, 13 Oct 2009 13:54:19 -0000
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Content-Language: en-us



Signed-off-by: David-John Willis <John.Willis@Distant-earth.com>
---
 recipes/netbase/netbase/omap3-pandora/hosts      |    2 +
 recipes/netbase/netbase/omap3-pandora/interfaces |   32
++++++++++++++++++++++
 recipes/netbase/netbase_4.21.bb                  |    2 +-
 3 files changed, 35 insertions(+), 1 deletions(-)
 create mode 100755 recipes/netbase/netbase/omap3-pandora/hosts
 create mode 100755 recipes/netbase/netbase/omap3-pandora/interfaces
 mode change 100644 => 100755 recipes/netbase/netbase_4.21.bb

diff --git a/recipes/netbase/netbase/omap3-pandora/hosts
b/recipes/netbase/netbase/omap3-pandora/hosts
new file mode 100755
index 0000000..04026bd
--- /dev/null
+++ b/recipes/netbase/netbase/omap3-pandora/hosts
@@ -0,0 +1,2 @@
+127.0.0.1	localhost.localdomain		localhost	openpandora
+
diff --git a/recipes/netbase/netbase/omap3-pandora/interfaces
b/recipes/netbase/netbase/omap3-pandora/interfaces
new file mode 100755
index 0000000..8c1484f
--- /dev/null
+++ b/recipes/netbase/netbase/omap3-pandora/interfaces
@@ -0,0 +1,32 @@
+# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
+ 
+# The loopback interface
+auto lo
+iface lo inet loopback
+
+
+# Wireless interfaces
+
+iface wlan0 inet dhcp
+	wireless_mode managed
+	wireless_essid any
+	wpa-driver wext
+	wpa-conf /etc/wpa_supplicant.conf
+
+# Wired or wireless interfaces
+auto eth0
+iface eth0 inet dhcp
+iface eth1 inet dhcp
+iface eth2 inet dhcp
+
+# Ethernet/RNDIS gadget (g_ether)
+# ... or on host side, usbnet and random hwaddr
+iface usb0 inet static
+	address 192.168.0.202
+	netmask 255.255.255.0
+	network 192.168.0.0
+	gateway 192.168.0.200
+
+# Bluetooth networking
+iface bnep0 inet dhcp
+
diff --git a/recipes/netbase/netbase_4.21.bb
b/recipes/netbase/netbase_4.21.bb
old mode 100644
new mode 100755
index adde2f0..403ca19
--- a/recipes/netbase/netbase_4.21.bb
+++ b/recipes/netbase/netbase_4.21.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "This package provides the necessary \
 infrastructure for basic TCP/IP based networking."
 SECTION = "base"
 LICENSE = "GPL"
-PR = "r37"
+PR = "r38"
 
 inherit update-rc.d
 
-- 
1.6.3.1





