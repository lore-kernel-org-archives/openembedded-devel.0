Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MsdeE-0000oC-KD
	for openembedded-devel@openembedded.org; Tue, 29 Sep 2009 16:25:50 +0200
Received: (qmail 12998 invoked by uid 813007); 29 Sep 2009 14:25:04 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 29 Sep 2009 14:25:04 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Sep 2009 16:25:01 +0200
Message-Id: <1254234301-11957-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.4.3
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Marcin Juszkiewicz <marcin@buglabs.net>
Subject: [STABLE][PATCH] netbase: on BUG eth0 is always built-in Ethernet not wifi
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
X-List-Received-Date: Tue, 29 Sep 2009 14:25:50 -0000

From: Marcin Juszkiewicz <marcin@buglabs.net>

---
 recipes/netbase/netbase/bug/interfaces |   11 ++++-------
 recipes/netbase/netbase_4.21.bb        |    2 +-
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/recipes/netbase/netbase/bug/interfaces b/recipes/netbase/netbase/bug/interfaces
index c410484..30e2404 100644
--- a/recipes/netbase/netbase/bug/interfaces
+++ b/recipes/netbase/netbase/bug/interfaces
@@ -20,17 +20,14 @@ iface wlan0 inet dhcp
 	wpa-driver wext
 	wpa-conf /etc/wpa_supplicant.conf
 
-# Wired or wireless interfaces
-# Handylink Ethernet or Wifi bugmodule or USB Ethernet
+# Wired interface
+# BUGbase Ethernet which is built into kernel
 auto eth0
 iface eth0 inet dhcp
-	wireless_mode managed
-	wireless_essid any
-	wpa-driver wext
-	wpa-conf /etc/wpa_supplicant.conf
+
 #
 # Wired or wireless interfaces
-# Wifi bugmodule or USB Ethernet
+# BUGbase or BUGWifi module or USB Ethernet
 auto eth1
 iface eth1 inet dhcp
 	wireless_mode managed
diff --git a/recipes/netbase/netbase_4.21.bb b/recipes/netbase/netbase_4.21.bb
index c0c97b7..adde2f0 100644
--- a/recipes/netbase/netbase_4.21.bb
+++ b/recipes/netbase/netbase_4.21.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "This package provides the necessary \
 infrastructure for basic TCP/IP based networking."
 SECTION = "base"
 LICENSE = "GPL"
-PR = "r35"
+PR = "r37"
 
 inherit update-rc.d
 
-- 
1.6.4.3





