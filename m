Received: from ns.awellconnected.net ([83.167.180.132]
	helo=edison.awellconnected.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lukas@htc-linux.org>) id 1PxzOZ-0005Ef-Va
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 11:16:32 +0100
Received: from ip-80-226-0-1.vodafone-net.de ([80.226.0.1] helo=[10.225.64.94])
	by edison.awellconnected.net with esmtp (Exim 4.69)
	(envelope-from <lukas@htc-linux.org>) id 1PxzMz-0000gO-5r
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 10:14:53 +0000
From: Lukas-David Gorris <lukas@htc-linux.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Mar 2011 11:14:47 +0100
Message-ID: <1299838487.2321.9.camel@computer>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - edison.awellconnected.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - htc-linux.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: [PATCH] htcleo: update xorg.conf
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
X-List-Received-Date: Fri, 11 Mar 2011 10:16:32 -0000
X-Groupsio-MsgNum: 30062
Content-Type: multipart/mixed; boundary="=-Xx0m8bFn/YJ70GxzsbMB"

--=-Xx0m8bFn/YJ70GxzsbMB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Attached patch updates xorg.conf for htcleo machine. It's needed to
disable tslib. Tested on the device.

Best,
Lukas

--=-Xx0m8bFn/YJ70GxzsbMB
Content-Disposition: attachment; filename="htcleo_update-xorg-conf.diff"
Content-Type: text/x-patch; name="htcleo_update-xorg-conf.diff"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From: Lukas-David Gorris <lukas.gorris@gmail.com>
Date: Thu, 10 Mar 2011 18:28:41 +0100
Subject: [oe][PATCH] htcleo: update xorg.conf

---
 .../xserver-xorg-conf/htcleo/xorg.conf             |   93 +++++++++++++-------
 1 files changed, 62 insertions(+), 31 deletions(-)

diff --git a/recipes/xorg-xserver/xserver-xorg-conf/htcleo/xorg.conf b/recipes/xorg-xserver/xserver-xorg-conf/htcleo/xorg.conf
index 4153a26..c819873 100644
--- a/recipes/xorg-xserver/xserver-xorg-conf/htcleo/xorg.conf
+++ b/recipes/xorg-xserver/xserver-xorg-conf/htcleo/xorg.conf
@@ -1,3 +1,11 @@
+Section "Module"
+        Load    "extmod"
+        Load    "dbe"
+        Load    "freetype"
+        Load    "type1"
+        Load    "record"
+EndSection
+
 Section "Monitor"
 	Identifier "Monitor0"
 	Mode "480x800"
@@ -18,17 +26,6 @@ Section "Device"
 EndSection                                                
 
 
-Section "Screen"                                        
-        Identifier "Framebuffer"     
-        Device  "fbdev"            
-        Monitor "Monitor"               
-	DefaultFbBpp 16
-	SubSection "Display"
-		Depth 16
-        	Modes "480x800"
-	EndSubSection
-EndSection                                              
-
 Section "Screen"
         Identifier "480x800x16"
         Device  "fbdev"
@@ -41,33 +38,67 @@ Section "Screen"
 EndSection
 
 
-Section "ServerLayout"                                 
-        Identifier      "Builtin Default Layout"                                     
-        Screen  "Framebuffer"        
-	InputDevice "Touchscreen" "CorePointer"
-        InputDevice "Keyboard" "CoreKeyboard"
-EndSection        
+Section "ServerLayout"
+	Identifier      "Default Layout"
+	Screen		"480x800x16"
+#	InputDevice     "event0"
+#        InputDevice     "event1"
+#        InputDevice     "event2"
+        InputDevice     "event3"
+#        InputDevice     "event4"
+#        InputDevice     "event5"
+        InputDevice     "event6"
+EndSection 
+
+     
+Section "InputDevice"
+	Identifier      "event0"
+	Driver          "evdev"
+	Option          "Device"        "/dev/input/event0"
+EndSection
+
+Section "InputDevice"
+        Identifier      "event1"
+        Driver          "evdev"
+        Option          "Device"        "/dev/input/event1"
+EndSection
+
+
+Section "InputDevice"
+        Identifier      "event2"
+        Driver          "evdev"
+        Option          "Device"        "/dev/input/event2"
+EndSection
 
 Section "InputDevice"
-    Identifier     "Mouse0"
-    Driver         "mouse"
-    Option         "Protocol" "auto"
-    Option         "Device" "/dev/input/mice"
-    Option         "Emulate3Buttons" "no"
-    Option         "ZAxisMapping" "4 5"
+        Identifier      "event3"
+        Driver          "evdev"
+        Option          "Device"        "/dev/input/event3"
+#	Option	"Calibration"		"6713 86 262 4110"
+#	Option "InvertY"	"1"
+#        Option "InvertX"        "1"
+
+#	Option	"SwapAxes"	"1" # unless it was already set to 1
+
 EndSection
 
+Section "InputDevice"
+        Identifier      "event4"
+        Driver          "evdev"
+        Option          "Device"        "/dev/input/event4"
+EndSection
 
 Section "InputDevice"
-    Identifier     "Touchscreen"
-    Driver         "tslib"
-    Option         "Protocol" "auto"
-    Option         "Device" "/dev/input/event0"
-    Option         "CorePointer"    "true"
+        Identifier      "event5"
+        Driver          "evdev"
+        Option          "Device"        "/dev/input/event5"
 EndSection
 
 Section "InputDevice"
-        Identifier  "Keyboard"
-        Driver      "kbd"
-        Option      "XkbLayout" "en_US"
+        Identifier      "event6"
+        Driver          "evdev"
+        Option          "Device"        "/dev/input/event6"
+#       Option "InvertY"        "1"
+
+#       Option  "SwapAxes"	"1" # unless it was already set to 1
 EndSection
-- 
1.7.1


--=-Xx0m8bFn/YJ70GxzsbMB--
