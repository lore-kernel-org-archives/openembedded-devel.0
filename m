Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OhT9F-0002yg-Rk
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Aug 2010 22:04:12 +0200
Received: by qwg8 with SMTP id 8so5511962qwg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Aug 2010 13:03:53 -0700 (PDT)
Received: by 10.229.11.34 with SMTP id r34mr4942081qcr.292.1281125033411;
	Fri, 06 Aug 2010 13:03:53 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id t24sm2215269qcs.23.2010.08.06.13.03.52
	(version=SSLv3 cipher=RC4-MD5); Fri, 06 Aug 2010 13:03:52 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Aug 2010 15:03:51 -0500
Message-Id: <1281125031-26612-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] netbase: beagleboard: auto configure xM Ethernet
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
X-List-Received-Date: Fri, 06 Aug 2010 20:04:12 -0000


Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 recipes/netbase/netbase/beagleboard/interfaces |    1 +
 recipes/netbase/netbase_4.21.bb                |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/netbase/netbase/beagleboard/interfaces b/recipes/netbase/netbase/beagleboard/interfaces
index ae420bd..403af28 100644
--- a/recipes/netbase/netbase/beagleboard/interfaces
+++ b/recipes/netbase/netbase/beagleboard/interfaces
@@ -53,6 +53,7 @@ iface eth0 inet dhcp
 iface eth1 inet dhcp
 
 # Ethernet/RNDIS gadget (g_ether) or LAN9514
+auto usb0
 iface usb0 inet dhcp
 
 # Bluetooth networking
diff --git a/recipes/netbase/netbase_4.21.bb b/recipes/netbase/netbase_4.21.bb
index 656ca48..9938d6e 100644
--- a/recipes/netbase/netbase_4.21.bb
+++ b/recipes/netbase/netbase_4.21.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "This package provides the necessary \
 infrastructure for basic TCP/IP based networking."
 SECTION = "base"
 LICENSE = "GPLv2"
-PR = "r43"
+PR = "r44"
 
 inherit update-rc.d
 
-- 
1.5.6.4



