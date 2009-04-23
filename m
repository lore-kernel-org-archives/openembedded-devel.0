Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Lx3hm-0000vY-7u
	for openembedded-devel@openembedded.org; Thu, 23 Apr 2009 20:31:26 +0200
Received: (qmail 28296 invoked by uid 813007); 23 Apr 2009 18:26:47 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 23 Apr 2009 18:26:47 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Apr 2009 20:26:39 +0200
Message-Id: <1240511199-30422-5-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.rc0
In-Reply-To: <1240511199-30422-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1240511199-30422-1-git-send-email-marcin@juszkiewicz.com.pl>
Cc: Marcin Juszkiewicz <marcin@buglabs.net>
Subject: [STABLE][PATCH 4/4] netbase: added BUG support
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
X-List-Received-Date: Thu, 23 Apr 2009 18:31:27 -0000

From: Marcin Juszkiewicz <marcin@buglabs.net>

We use other network range for usb0 then OE default and this will not
change soon. Also support for onboard Ethernet, Wifi module and
USB-Ethernet adapters is present.

Signed-off-by: Marcin Juszkiewicz <marcin@buglabs.net>
---
 recipes/netbase/netbase/bug/hosts      |    3 ++
 recipes/netbase/netbase/bug/interfaces |   39 ++++++++++++++++++++++++++++++++
 recipes/netbase/netbase_4.21.bb        |    2 +-
 3 files changed, 43 insertions(+), 1 deletions(-)
 create mode 100644 recipes/netbase/netbase/bug/hosts
 create mode 100644 recipes/netbase/netbase/bug/interfaces

diff --git a/recipes/netbase/netbase/bug/hosts b/recipes/netbase/netbase/bug/hosts
new file mode 100644
index 0000000..789d660
--- /dev/null
+++ b/recipes/netbase/netbase/bug/hosts
@@ -0,0 +1,3 @@
+127.0.0.1	localhost.localdomain		localhost	bug
+10.10.10.1	bughost
+
diff --git a/recipes/netbase/netbase/bug/interfaces b/recipes/netbase/netbase/bug/interfaces
new file mode 100644
index 0000000..c410484
--- /dev/null
+++ b/recipes/netbase/netbase/bug/interfaces
@@ -0,0 +1,39 @@
+# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
+ 
+# The loopback interface
+auto lo
+iface lo inet loopback
+
+# Ethernet/RNDIS gadget (g_ether)
+# usbnet and static hwaddr for mac users
+auto usb0
+iface usb0 inet static
+	hwaddress ether A2:80:F4:8A:3C:91
+	address 10.10.10.10 
+	netmask 255.255.255.0
+	gateway 10.10.10.1 
+
+# Wireless interfaces
+iface wlan0 inet dhcp
+	wireless_mode managed
+	wireless_essid any
+	wpa-driver wext
+	wpa-conf /etc/wpa_supplicant.conf
+
+# Wired or wireless interfaces
+# Handylink Ethernet or Wifi bugmodule or USB Ethernet
+auto eth0
+iface eth0 inet dhcp
+	wireless_mode managed
+	wireless_essid any
+	wpa-driver wext
+	wpa-conf /etc/wpa_supplicant.conf
+#
+# Wired or wireless interfaces
+# Wifi bugmodule or USB Ethernet
+auto eth1
+iface eth1 inet dhcp
+	wireless_mode managed
+	wireless_essid any
+	wpa-driver wext
+	wpa-conf /etc/wpa_supplicant.conf
diff --git a/recipes/netbase/netbase_4.21.bb b/recipes/netbase/netbase_4.21.bb
index 04533d8..4dfc182 100644
--- a/recipes/netbase/netbase_4.21.bb
+++ b/recipes/netbase/netbase_4.21.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "This package provides the necessary \
 infrastructure for basic TCP/IP based networking."
 SECTION = "base"
 LICENSE = "GPL"
-PR = "r34"
+PR = "r35"
 
 inherit update-rc.d
 
-- 
1.6.3.rc0





