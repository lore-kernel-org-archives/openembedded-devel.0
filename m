Received: from mail-out.m-online.net ([212.18.0.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mok@mnet-online.de>) id 1NCK2l-0003bM-NU
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Nov 2009 22:32:30 +0100
Received: from mail01.m-online.net (mail.m-online.net [192.168.3.149])
	by mail-out.m-online.net (Postfix) with ESMTP id 6A68B1C1560F;
	Sun, 22 Nov 2009 22:31:00 +0100 (CET)
Received: from localhost (dynscan2.mnet-online.de [192.168.1.215])
	by mail.m-online.net (Postfix) with ESMTP id 616DE91DA7;
	Sun, 22 Nov 2009 22:31:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.3.149])
	by localhost (dynscan2.mnet-online.de [192.168.1.215]) (amavisd-new,
	port 10024)
	with ESMTP id Ld-5L2FE760h; Sun, 22 Nov 2009 22:30:58 +0100 (CET)
Received: from mrdenker.palutemo (ppp-82-135-69-249.dynamic.mnet-online.de
	[82.135.69.249]) by mail.mnet-online.de (Postfix) with SMTP;
	Sun, 22 Nov 2009 22:30:57 +0100 (CET)
Received: by mrdenker.palutemo (sSMTP sendmail emulation);
	Sun, 22 Nov 2009 22:30:57 +0100
From: mok@mnet-online.de
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Nov 2009 22:27:12 +0100
Message-Id: <1258925232-15834-1-git-send-email-mok@mnet-online.de>
X-Mailer: git-send-email 1.6.5.2
X-SA-Exim-Connect-IP: 212.18.0.9
X-SA-Exim-Mail-From: mok@mnet-online.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Klaus Kurzmann <mok@fluxnetz.de>
Subject: [PATCH] netbase: change allow-hotplug to auto for usb0 on om-gta01/02 as this seems to not work with busybox ifup/down and handle default route via up/down
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
X-List-Received-Date: Sun, 22 Nov 2009 21:32:30 -0000

From: Klaus Kurzmann <mok@fluxnetz.de>

Signed-off-by: Klaus Kurzmann <mok@fluxnetz.de>
---
 recipes/netbase/netbase/om-gta01/interfaces |    5 +++--
 recipes/netbase/netbase/om-gta02/interfaces |    7 ++++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/recipes/netbase/netbase/om-gta01/interfaces b/recipes/netbase/netbase/om-gta01/interfaces
index 56c485e..e595239 100644
--- a/recipes/netbase/netbase/om-gta01/interfaces
+++ b/recipes/netbase/netbase/om-gta01/interfaces
@@ -16,14 +16,15 @@ iface eth1 inet dhcp
 
 # Ethernet/RNDIS gadget (g_ether)
 # ... or on host side, usbnet and random hwaddr
-allow-hotplug usb0
+auto usb0
 iface usb0 inet static
 	address 192.168.0.202
 	netmask 255.255.255.0
 	network 192.168.0.0
-	gateway 192.168.0.200
+	up route add default gw 192.168.0.200 metric 8
 	up echo nameserver 208.67.222.222 >> /etc/resolv.conf
 	up echo nameserver 208.67.220.220 >> /etc/resolv.conf
+	down route del default gw 192.168.0.200 metric 8
 
 # Bluetooth networking
 iface bnep0 inet dhcp
diff --git a/recipes/netbase/netbase/om-gta02/interfaces b/recipes/netbase/netbase/om-gta02/interfaces
index ceedfc5..08bd3bb 100644
--- a/recipes/netbase/netbase/om-gta02/interfaces
+++ b/recipes/netbase/netbase/om-gta02/interfaces
@@ -16,14 +16,15 @@ iface eth1 inet dhcp
 
 # Ethernet/RNDIS gadget (g_ether)
 # ... or on host side, usbnet and random hwaddr
-allow-hotplug usb0
+auto usb0
 iface usb0 inet static
 	address 192.168.0.202
 	netmask 255.255.255.0
 	network 192.168.0.0
-	gateway 192.168.0.200
-	up echo nameserver 208.67.222.222 >> /etc/resolv.conf
+	up route add default gw 192.168.0.200 metric 8
+	up echo nameserver 208.67.222.222 > /etc/resolv.conf
 	up echo nameserver 208.67.220.220 >> /etc/resolv.conf
+	down route del default gw 192.168.0.200 metric 8
 
 # Bluetooth networking
 iface bnep0 inet dhcp
-- 
1.6.5.2



