Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Nu8GV-0006bg-4I
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 18:51:48 +0100
Received: (qmail 18822 invoked by uid 813007); 23 Mar 2010 17:48:30 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 23 Mar 2010 17:48:30 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Mar 2010 18:48:20 +0100
Message-Id: <1269366500-19336-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.7.0.2
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Marcin Juszkiewicz <marcin@buglabs.net>
Subject: [STABLE][PATCH] xserver-xorg-conf: really add BUG 2.0
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
X-List-Received-Date: Tue, 23 Mar 2010 17:51:48 -0000

From: Marcin Juszkiewicz <marcin@buglabs.net>

Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 .../xorg-xserver/xserver-xorg-conf/bug20/xorg.conf |   29 ++++++++++++++++++++
 recipes/xorg-xserver/xserver-xorg-conf_0.1.bb      |    2 +-
 2 files changed, 30 insertions(+), 1 deletions(-)
 create mode 100644 recipes/xorg-xserver/xserver-xorg-conf/bug20/xorg.conf

diff --git a/recipes/xorg-xserver/xserver-xorg-conf/bug20/xorg.conf b/recipes/xorg-xserver/xserver-xorg-conf/bug20/xorg.conf
new file mode 100644
index 0000000..0b976fe
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-conf/bug20/xorg.conf
@@ -0,0 +1,29 @@
+Section "Module"                                       
+        Load    "extmod"                                
+        Load    "dbe"                           
+        Load    "glx"                                           
+        Load    "freetype"                             
+#       Load    "type1"                        
+#       Load    "record"                    
+        Load    "dri"                       
+EndSection                            
+
+Section "Monitor"                                                                    
+        Identifier      "Builtin Default Monitor"
+EndSection                                       
+
+Section "Device"                                  
+        Identifier      "Builtin Default fbdev Device 0"
+        Driver  "omapfb"
+EndSection                                                
+
+Section "Screen"                                        
+        Identifier      "Builtin Default fbdev Screen 0"     
+        Device  "Builtin Default fbdev Device 0"            
+        Monitor "Builtin Default Monitor"               
+EndSection                                              
+
+Section "ServerLayout"                                 
+        Identifier      "Builtin Default Layout"                                     
+        Screen  "Builtin Default fbdev Screen 0"        
+EndSection                                              
diff --git a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
index b7655b8..2cc6360 100644
--- a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
+++ b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Machine specific xorg.conf files"
-PR = "r21"
+PR = "r24"
 
 SRC_URI = "file://xorg.conf"
 
-- 
1.7.0.2





