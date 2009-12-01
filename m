Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NFXGr-0002j8-KD
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Dec 2009 19:16:20 +0100
Received: (qmail 27229 invoked by uid 813007); 1 Dec 2009 18:14:44 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Dec 2009 18:14:44 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Dec 2009 19:14:53 +0100
Message-Id: <1259691294-1131-2-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.5.3
In-Reply-To: <1259691294-1131-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1259691294-1131-1-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Marcin Juszkiewicz <marcin@buglabs.net>
Subject: [STABLE][PATCH 2/3] xserver-xorg-conf: added BUG support
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
X-List-Received-Date: Tue, 01 Dec 2009 18:16:20 -0000

From: Marcin Juszkiewicz <marcin@buglabs.net>

Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 .../xorg-xserver/xserver-xorg-conf/bug/xorg.conf   |   65 ++++++++++++++++++++
 recipes/xorg-xserver/xserver-xorg-conf_0.1.bb      |    2 +-
 2 files changed, 66 insertions(+), 1 deletions(-)
 create mode 100644 recipes/xorg-xserver/xserver-xorg-conf/bug/xorg.conf

diff --git a/recipes/xorg-xserver/xserver-xorg-conf/bug/xorg.conf b/recipes/xorg-xserver/xserver-xorg-conf/bug/xorg.conf
new file mode 100644
index 0000000..8b6cd94
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-conf/bug/xorg.conf
@@ -0,0 +1,65 @@
+#
+# Initial version of X11 configuration for BugLabs BUG device.
+#
+# Up to 2 LCD modules are supported (as DISPLAY=0.0/0.1).
+# Touchscreen on first screen works properly (req tslib 0.0.6 driver).
+#
+# By default software starts on 0.0 only.
+#
+
+Section "Monitor"
+        Identifier      "Monitor 1"
+EndSection
+
+Section "Monitor"
+        Identifier      "Monitor 2"
+EndSection
+
+Section "Device"
+        Identifier      "fbdev Device 2"
+        Driver  "fbdev"
+	Option "fbdev" "/dev/fb2"
+	Option "shadowfb" "true"
+EndSection
+
+Section "Device"
+        Identifier      "fbdev Device 1"
+        Driver  "fbdev"
+	Option "fbdev" "/dev/fb1"
+	Option "shadowfb" "true"
+EndSection
+
+Section "Screen"
+        Identifier      "fbdev Screen 2"
+        Device  "fbdev Device 2"
+        Monitor "Monitor 2"
+EndSection
+
+Section "Screen"
+        Identifier      "fbdev Screen 1"
+        Device  "fbdev Device 1"
+        Monitor "Monitor 1"
+EndSection
+
+Section "ServerLayout"
+        Identifier      "Layout"
+        Screen  "fbdev Screen 1"
+        Screen  "fbdev Screen 2" Below "fbdev Screen 1"
+	InputDevice "ts4" "CorePointer"
+EndSection
+
+Section "InputDevice"
+    Identifier "ts5"
+    Driver "tslib"
+    Option "Device" "/dev/input/bmi_lcd_ts5"
+EndSection
+
+Section "InputDevice"
+    Identifier "ts4"
+    Driver "tslib"
+    Option "Device" "/dev/input/bmi_lcd_ts4"
+EndSection
+
+Section "ServerFlags"
+	Option "AutoAddDevices" "false"
+EndSection
diff --git a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
index 95aa82b..67fc683 100644
--- a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
+++ b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Machine specific xorg.conf files"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "file://xorg.conf"
 
-- 
1.6.5.2





