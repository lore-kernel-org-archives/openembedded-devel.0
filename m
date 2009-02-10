Received: from [65.182.109.74] (helo=mta5.brinkster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1LWsb0-0005wy-JQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Feb 2009 14:24:14 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta5.brinkster.com (Postfix) with ESMTP id C308232819A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Feb 2009 08:23:10 -0500 (EST)
X-Virus-Scanned: amavisd-new at 
X-Spam-Flag: NO
X-Spam-Score: 0.06
X-Spam-Level: 
X-Spam-Status: No, score=0.06 tagged_above=-10 required=5 tests=[AWL=-0.386,
	BAYES_00=-2.599, MSGID_MULTIPLE_AT=1.449, NO_DNS_FOR_FROM=1.496,
	RDNS_DYNAMIC=0.1]
Received: from mta5.brinkster.com ([127.0.0.1])
	by localhost (mta5.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EJu48O6pGudk
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Feb 2009 08:23:06 -0500 (EST)
Received: from MareImbrium (82-46-19-72.cable.ubr02.bath.blueyonder.co.uk
	[82.46.19.72])
	by mta5.brinkster.com (Postfix) with ESMTP id AC182328326
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Feb 2009 08:23:04 -0500 (EST)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
References: <><1233574850-4230-1-git-send-email-John.Willis@Distant-earth.com>	<1233574850-4230-2-git-send-email-John.Willis@Distant-earth.com>	<1233574850-4230-3-git-send-email-John.Willis@Distant-earth.com><1233574850-4230-4-git-send-email-John.Willis@Distant-earth.com>
	<gm6oc5$o0k$1@ger.gmane.org>
In-Reply-To: <gm6oc5$o0k$1@ger.gmane.org>
Date: Tue, 10 Feb 2009 13:22:38 -0000
Message-ID: <00a701c98b82$a59b2f70$f0d18e50$@Willis@Distant-earth.com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcmFMgZ15JLcKCroT5arjRgQ8wJ0JwGTw0Eg
Subject: Re: [PATCH] Add default xorg.conf for the Pandora.
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
X-List-Received-Date: Tue, 10 Feb 2009 13:24:15 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

> Looks good, but you need to bump PR on the xserver-xorg-conf recipe as
> well.

Updated patches below (I hope). Sorry, real life got in the way.

Signed-off-by: David-John Willis <John.Willis@Distant-earth.com>

---
 .../xserver-xorg-conf/omap3-pandora/xorg.conf      |   29
++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100755
packages/xorg-xserver/xserver-xorg-conf/omap3-pandora/xorg.conf
diff --git a/packages/xorg-xserver/xserver-xorg-conf/omap3-pandora/xorg.conf
b/packages/xorg-xserver/xserver-xorg-conf/omap3-pandora/xorg.conf
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

---
packages/xorg-xserver/xserver-xorg-conf_0.1.bb |    2 +-
diff --git a/packages/xorg-xserver/xserver-xorg-conf_0.1.bb
b/packages/xorg-xserver/xserver-xorg-conf_0.1.bb
index 23dcf18..95aa82b
--- a/packages/xorg-xserver/xserver-xorg-conf_0.1.bb
+++ b/packages/xorg-xserver/xserver-xorg-conf_0.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Machine specific xorg.conf files"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "file://xorg.conf"






