Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OOakD-00029l-0J
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jun 2010 20:20:21 +0200
Received: from p5b035734.dip.t-dialin.net ([91.3.87.52] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OOafk-0004GE-5o by authid <stefan@sostec.de> with cram_md5;
	Tue, 15 Jun 2010 20:15:51 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>)
	id 1OOaff-0001hc-4B; Tue, 15 Jun 2010 20:15:35 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Jun 2010 20:15:24 +0200
Message-Id: <1276625727-22991-2-git-send-email-stefan@datenfreihafen.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1276625727-22991-1-git-send-email-stefan@datenfreihafen.org>
References: <1276625727-22991-1-git-send-email-stefan@datenfreihafen.org>
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Stefan Schmidt <stefan@buglabs.net>
Subject: [PATCH][STABLE 1/4] bug20/xorg.conf: update to use tslib driver for touchscreen input device.
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
X-List-Received-Date: Tue, 15 Jun 2010 18:20:21 -0000

From: Ken Gilmer <ken@buglabs.net>


Signed-off-by: Ken Gilmer <ken@buglabs.net>
Signed-off-by: Stefan Schmidt <stefan@buglabs.net>

---
 .../xorg-xserver/xserver-xorg-conf/bug20/xorg.conf |    8 ++++++++
 recipes/xorg-xserver/xserver-xorg-conf_0.1.bb      |    2 +-
 2 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/recipes/xorg-xserver/xserver-xorg-conf/bug20/xorg.conf b/recipes/xorg-xserver/xserver-xorg-conf/bug20/xorg.conf
index 0b976fe..6301d06 100644
--- a/recipes/xorg-xserver/xserver-xorg-conf/bug20/xorg.conf
+++ b/recipes/xorg-xserver/xserver-xorg-conf/bug20/xorg.conf
@@ -26,4 +26,12 @@ EndSection
 Section "ServerLayout"                                 
         Identifier      "Builtin Default Layout"                                     
         Screen  "Builtin Default fbdev Screen 0"        
+		InputDevice "bmi-lcd-ts" "CorePointer"
 EndSection                                              
+
+Section "InputDevice"
+		Identifier "bmi-lcd-ts"
+		Driver "tslib"
+		Option "SwapAxes" "1"
+		Option "Device" "/dev/input/touchscreen0"
+EndSection
diff --git a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
index 0d286b7..43ca6fa 100644
--- a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
+++ b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Machine specific xorg.conf files"
-PR = "r24"
+PR = "r25"
 
 SRC_URI = "file://xorg.conf"
 
-- 
1.7.1



