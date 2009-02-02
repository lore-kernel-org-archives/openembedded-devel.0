Received: from [65.182.109.77] (helo=mta8.brinkster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1LTxIK-0000BL-4n
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Feb 2009 12:48:52 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta8.brinkster.com (Postfix) with ESMTP id 9E22D715154;
	Mon,  2 Feb 2009 06:40:49 -0500 (EST)
X-Virus-Scanned: amavisd-new at 
X-Spam-Flag: NO
X-Spam-Score: 0.179
X-Spam-Level: 
X-Spam-Status: No, score=0.179 tagged_above=-10 required=5 tests=[AWL=-0.319, 
	BAYES_00=-2.599, HELO_LH_LD=1.215, RCVD_IN_PBL=0.905,
	RCVD_IN_SORBS_DUL=0.877, RDNS_DYNAMIC=0.1]
Received: from mta8.brinkster.com ([127.0.0.1])
	by localhost (mta8.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gWchANl6nSVn; Mon,  2 Feb 2009 06:40:48 -0500 (EST)
Received: from localhost.localdomain
	(82-46-19-72.cable.ubr02.bath.blueyonder.co.uk [82.46.19.72])
	by mta8.brinkster.com (Postfix) with ESMTP id 76F6D714B2F;
	Mon,  2 Feb 2009 06:40:47 -0500 (EST)
From: David-John Willis <John.Willis@Distant-earth.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Feb 2009 11:40:50 +0000
Message-Id: <1233574850-4230-4-git-send-email-John.Willis@Distant-earth.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <1233574850-4230-3-git-send-email-John.Willis@Distant-earth.com>
References: <> <1233574850-4230-1-git-send-email-John.Willis@Distant-earth.com>
	<1233574850-4230-2-git-send-email-John.Willis@Distant-earth.com>
	<1233574850-4230-3-git-send-email-John.Willis@Distant-earth.com>
Cc: David-John Willis <John.Willis@Distant-earth.com>
Subject: [PATCH] Add default xorg.conf for the Pandora.
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
X-List-Received-Date: Mon, 02 Feb 2009 11:48:52 -0000

Signed-off-by: David-John Willis <John.Willis@Distant-earth.com>
---
 .../xserver-xorg-conf/omap3-pandora/xorg.conf      |   29 ++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100755 packages/xorg-xserver/xserver-xorg-conf/omap3-pandora/xorg.conf

diff --git a/packages/xorg-xserver/xserver-xorg-conf/omap3-pandora/xorg.conf b/packages/xorg-xserver/xserver-xorg-conf/omap3-pandora/xorg.conf
new file mode 100755
index 0000000..983bb08
--- /dev/null
+++ b/packages/xorg-xserver/xserver-xorg-conf/omap3-pandora/xorg.conf
@@ -0,0 +1,29 @@
+Section "Module"                                       
+        Load    "extmod"                                
+        Load    "dbe"                           
+        Load    "glx"                                           
+        Load    "freetype"                             
+        Load    "type1"                        
+        Load    "record"                    
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
-- 
1.6.0.5



