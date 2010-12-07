Received: from smtp201.alice.it ([82.57.200.97])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1PPyd8-00072Z-BE
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Dec 2010 15:35:14 +0100
Received: from localhost.localdomain (80.117.37.237) by smtp201.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4CC05A4C041ACA18; Tue, 7 Dec 2010 15:33:28 +0100
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Dec 2010 15:32:52 +0100
Message-Id: <1291732373-17953-4-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1291732373-17953-1-git-send-email-GNUtoo@no-log.org>
References: <1291732373-17953-1-git-send-email-GNUtoo@no-log.org>
X-SA-Exim-Connect-IP: 82.57.200.97
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/4] xserver-xorg-conf: add iphone3g support
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
X-List-Received-Date: Tue, 07 Dec 2010 14:35:15 -0000

Signed-off-by: Chris 'Lopi' Spehn <chris.spehn@gmail.com>
Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 .../xserver-xorg-conf/iphone3g/xorg.conf           |   31 ++++++++++++++++++++
 recipes/xorg-xserver/xserver-xorg-conf_0.1.bb      |    2 +-
 2 files changed, 32 insertions(+), 1 deletions(-)
 create mode 100644 recipes/xorg-xserver/xserver-xorg-conf/iphone3g/xorg.conf

diff --git a/recipes/xorg-xserver/xserver-xorg-conf/iphone3g/xorg.conf b/recipes/xorg-xserver/xserver-xorg-conf/iphone3g/xorg.conf
new file mode 100644
index 0000000..19f02e9
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-conf/iphone3g/xorg.conf
@@ -0,0 +1,31 @@
+Section "Device"
+	Identifier "Builtin Default fbdev Device 0"
+	Driver  "fbdev"
+	Option "ShadowFB" "on"
+	#Option "Rotate" "CW" # comment for disabling rotation
+EndSection
+
+Section "Screen"
+	Identifier "Builtin Default fbdev Screen 0"
+	Device "Builtin Default fbdev Device 0"
+EndSection
+
+
+Section "InputDevice"
+	Identifier "touchscreen"
+	Driver "evdev"
+	Option "Device" "/dev/input/event2"
+	Option "Calibration" "0 4602 0 7306"
+	Option "ReportingMode" "Raw"
+	Option "SendCoreEvents" "On"
+	Option "GrabDevices" "True"
+	Option "InvertY" "0"
+	Option "SwapAxes" "0"
+EndSection
+
+
+Section "ServerLayout"
+	Identifier      "Builtin Default Layout"
+	Screen  "Builtin Default fbdev Screen 0"
+	InputDevice "touchscreen" "CorePointer" "AlwaysCore"
+EndSection
diff --git a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
index 25a3867..71d3be3 100644
--- a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
+++ b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Machine specific xorg.conf files"
-PR = "r37"
+PR = "r38"
 
 SRC_URI = "file://xorg.conf"
 
-- 
1.7.0.4



