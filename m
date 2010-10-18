Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1P7uoq-0004Zx-JT
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 20:52:25 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 6A068275CEAD; Mon, 18 Oct 2010 20:51:53 +0200 (CEST)
Received: from localhost (p5489BE68.dip.t-dialin.net [84.137.190.104])
	by gravedo.de (Postfix) with ESMTPSA id CB249275CE82;
	Mon, 18 Oct 2010 20:51:51 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Oct 2010 20:51:23 +0200
Message-Id: <1287427884-1517-15-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1287427884-1517-1-git-send-email-morphis@gravedo.de>
References: <1287427884-1517-1-git-send-email-morphis@gravedo.de>
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 14/15] xserver-xorg-conf: switch from plain tslib access to evdev for touchscreen on palmpre machine
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
X-List-Received-Date: Mon, 18 Oct 2010 18:52:26 -0000

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 .../xserver-xorg-conf/palmpre/xorg.conf            |    4 ++--
 recipes/xorg-xserver/xserver-xorg-conf_0.1.bb      |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/xorg-xserver/xserver-xorg-conf/palmpre/xorg.conf b/recipes/xorg-xserver/xserver-xorg-conf/palmpre/xorg.conf
index 87001f0..08e99e8 100644
--- a/recipes/xorg-xserver/xserver-xorg-conf/palmpre/xorg.conf
+++ b/recipes/xorg-xserver/xserver-xorg-conf/palmpre/xorg.conf
@@ -31,8 +31,8 @@ EndSection
 
 Section "InputDevice"
     Identifier  "Touchscreen"
-    Driver      "tslib"
-    Option      "Device"                "/dev/touchscreen"
+    Driver      "evdev"
+    Option      "Device"                "/dev/input/event6"
     Option      "CorePointer"           "true"
     Option      "SendCoreEvents"        "true"
     Option      "Protocol"              "Auto"
diff --git a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
index fd62ee2..21dac99 100644
--- a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
+++ b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Machine specific xorg.conf files"
-PR = "r34"
+PR = "r35"
 
 SRC_URI = "file://xorg.conf"
 
-- 
1.7.1



