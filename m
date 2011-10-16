Received: from smtp208.alice.it ([82.57.200.104])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RFaCJ-0007XZ-Ow
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Oct 2011 01:32:52 +0200
Received: from mizar.localdomain (82.60.186.164) by smtp208.alice.it
	(8.5.124.08) id 4DE64DF10C5F6EAC; Mon, 17 Oct 2011 01:27:06 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 17 Oct 2011 01:26:51 +0200
Message-Id: <1318807611-16837-3-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1318807611-16837-1-git-send-email-andrea.adami@gmail.com>
References: <1318807611-16837-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 3/3] xserver-xf86-config: add more xorg.conf for other Zaurus devices
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
X-List-Received-Date: Sun, 16 Oct 2011 23:32:52 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../xserver-xf86-config/akita/xorg.conf            |   49 ++++++++++++++++++++
 .../xserver-xf86-config/c7x0/xorg.conf             |   48 +++++++++++++++++++
 .../xserver-xf86-config/collie/xorg.conf           |   49 ++++++++++++++++++++
 .../xserver-xf86-config/poodle/xorg.conf           |   49 ++++++++++++++++++++
 .../xserver-xf86-config/tosa/xorg.conf             |   48 +++++++++++++++++++
 5 files changed, 243 insertions(+), 0 deletions(-)
 create mode 100644 recipes-graphics/xorg-xserver/xserver-xf86-config/akita/xorg.conf
 create mode 100644 recipes-graphics/xorg-xserver/xserver-xf86-config/c7x0/xorg.conf
 create mode 100644 recipes-graphics/xorg-xserver/xserver-xf86-config/collie/xorg.conf
 create mode 100644 recipes-graphics/xorg-xserver/xserver-xf86-config/poodle/xorg.conf
 create mode 100644 recipes-graphics/xorg-xserver/xserver-xf86-config/tosa/xorg.conf

diff --git a/recipes-graphics/xorg-xserver/xserver-xf86-config/akita/xorg.conf b/recipes-graphics/xorg-xserver/xserver-xf86-config/akita/xorg.conf
new file mode 100644
index 0000000..224df5c
--- /dev/null
+++ b/recipes-graphics/xorg-xserver/xserver-xf86-config/akita/xorg.conf
@@ -0,0 +1,49 @@
+Section "Device"
+        Identifier      "Generic Video Card"
+        Driver          "fbdev"
+        Option          "UseFBDev"              "true"
+        Option          "Rotate"                "CW"
+EndSection
+
+Section "Monitor"
+        Identifier      "Generic Monitor"
+        Option          "DPMS"
+        HorizSync       28-32
+        VertRefresh     43-60
+EndSection
+
+Section "Screen"
+        Identifier      "Default Screen"
+        Device          "Generic Video Card"
+        Monitor         "Generic Monitor"
+        DefaultDepth    16
+        SubSection "Display"
+                Depth           1
+                Modes           "640x480"
+        EndSubSection
+        SubSection "Display"
+                Depth           4
+                Modes           "640x480"
+        EndSubSection
+        SubSection "Display"
+                Depth           8
+                Modes           "640x480"
+        EndSubSection
+        SubSection "Display"
+                Depth           15
+                Modes           "640x480"
+        EndSubSection
+        SubSection "Display"
+                Depth           16
+                Modes           "640x480"
+        EndSubSection
+        SubSection "Display"
+                Depth           24
+                Modes           "640x480"
+        EndSubSection
+EndSection
+
+Section "ServerLayout"
+        Identifier      "Default Layout"
+        Screen          "Default Screen"
+EndSection
diff --git a/recipes-graphics/xorg-xserver/xserver-xf86-config/c7x0/xorg.conf b/recipes-graphics/xorg-xserver/xserver-xf86-config/c7x0/xorg.conf
new file mode 100644
index 0000000..ce544bb
--- /dev/null
+++ b/recipes-graphics/xorg-xserver/xserver-xf86-config/c7x0/xorg.conf
@@ -0,0 +1,48 @@
+Section "Device"
+        Identifier      "Generic Video Card"
+        Driver          "fbdev"
+        Option          "UseFBDev"              "true"
+ndSection
+
+Section "Monitor"
+        Identifier      "Generic Monitor"
+        Option          "DPMS"
+        HorizSync       28-32
+        VertRefresh     43-60
+EndSection
+
+Section "Screen"
+        Identifier      "Default Screen"
+        Device          "Generic Video Card"
+        Monitor         "Generic Monitor"
+        DefaultDepth    16
+        SubSection "Display"
+                Depth           1
+                Modes           "640x480"
+        EndSubSection
+        SubSection "Display"
+                Depth           4
+                Modes           "640x480"
+        EndSubSection
+        SubSection "Display"
+                Depth           8
+                Modes           "640x480"
+        EndSubSection
+        SubSection "Display"
+                Depth           15
+                Modes           "640x480"
+        EndSubSection
+        SubSection "Display"
+                Depth           16
+                Modes           "640x480"
+        EndSubSection
+        SubSection "Display"
+                Depth           24
+                Modes           "640x480"
+        EndSubSection
+EndSection
+
+Section "ServerLayout"
+        Identifier      "Default Layout"
+        Screen          "Default Screen"
+EndSection
diff --git a/recipes-graphics/xorg-xserver/xserver-xf86-config/collie/xorg.conf b/recipes-graphics/xorg-xserver/xserver-xf86-config/collie/xorg.conf
new file mode 100644
index 0000000..0c8d291
--- /dev/null
+++ b/recipes-graphics/xorg-xserver/xserver-xf86-config/collie/xorg.conf
@@ -0,0 +1,49 @@
+Section "Device"
+        Identifier      "Generic Video Card"
+        Driver          "fbdev"
+        Option          "UseFBDev"              "true"
+        Option          "Rotate"                "CW"
+EndSection
+
+Section "Monitor"
+        Identifier      "Generic Monitor"
+        Option          "DPMS"
+        HorizSync       28-32
+        VertRefresh     43-60
+EndSection
+
+Section "Screen"
+        Identifier      "Default Screen"
+        Device          "Generic Video Card"
+        Monitor         "Generic Monitor"
+        DefaultDepth    16
+        SubSection "Display"
+                Depth           1
+                Modes           "320x240"
+        EndSubSection
+        SubSection "Display"
+                Depth           4
+                Modes           "320x240"
+        EndSubSection
+        SubSection "Display"
+                Depth           8
+                Modes           "320x240"
+        EndSubSection
+        SubSection "Display"
+                Depth           15
+                Modes           "320x240"
+        EndSubSection
+        SubSection "Display"
+                Depth           16
+                Modes           "320x240"
+        EndSubSection
+        SubSection "Display"
+                Depth           24
+                Modes           "320x240"
+        EndSubSection
+EndSection
+
+Section "ServerLayout"
+        Identifier      "Default Layout"
+        Screen          "Default Screen"
+EndSection
diff --git a/recipes-graphics/xorg-xserver/xserver-xf86-config/poodle/xorg.conf b/recipes-graphics/xorg-xserver/xserver-xf86-config/poodle/xorg.conf
new file mode 100644
index 0000000..0c8d291
--- /dev/null
+++ b/recipes-graphics/xorg-xserver/xserver-xf86-config/poodle/xorg.conf
@@ -0,0 +1,49 @@
+Section "Device"
+        Identifier      "Generic Video Card"
+        Driver          "fbdev"
+        Option          "UseFBDev"              "true"
+        Option          "Rotate"                "CW"
+EndSection
+
+Section "Monitor"
+        Identifier      "Generic Monitor"
+        Option          "DPMS"
+        HorizSync       28-32
+        VertRefresh     43-60
+EndSection
+
+Section "Screen"
+        Identifier      "Default Screen"
+        Device          "Generic Video Card"
+        Monitor         "Generic Monitor"
+        DefaultDepth    16
+        SubSection "Display"
+                Depth           1
+                Modes           "320x240"
+        EndSubSection
+        SubSection "Display"
+                Depth           4
+                Modes           "320x240"
+        EndSubSection
+        SubSection "Display"
+                Depth           8
+                Modes           "320x240"
+        EndSubSection
+        SubSection "Display"
+                Depth           15
+                Modes           "320x240"
+        EndSubSection
+        SubSection "Display"
+                Depth           16
+                Modes           "320x240"
+        EndSubSection
+        SubSection "Display"
+                Depth           24
+                Modes           "320x240"
+        EndSubSection
+EndSection
+
+Section "ServerLayout"
+        Identifier      "Default Layout"
+        Screen          "Default Screen"
+EndSection
diff --git a/recipes-graphics/xorg-xserver/xserver-xf86-config/tosa/xorg.conf b/recipes-graphics/xorg-xserver/xserver-xf86-config/tosa/xorg.conf
new file mode 100644
index 0000000..73f26df
--- /dev/null
+++ b/recipes-graphics/xorg-xserver/xserver-xf86-config/tosa/xorg.conf
@@ -0,0 +1,48 @@
+Section "Device"
+        Identifier      "Generic Video Card"
+        Driver          "fbdev"
+        Option          "UseFBDev"              "true"
+ndSection
+
+Section "Monitor"
+        Identifier      "Generic Monitor"
+        Option          "DPMS"
+        HorizSync       28-32
+        VertRefresh     43-60
+EndSection
+
+Section "Screen"
+        Identifier      "Default Screen"
+        Device          "Generic Video Card"
+        Monitor         "Generic Monitor"
+        DefaultDepth    16
+        SubSection "Display"
+                Depth           1
+                Modes           "480x640"
+        EndSubSection
+        SubSection "Display"
+                Depth           4
+                Modes           "480x640"
+        EndSubSection
+        SubSection "Display"
+                Depth           8
+                Modes           "480x640"
+        EndSubSection
+        SubSection "Display"
+                Depth           15
+                Modes           "480x640"
+        EndSubSection
+        SubSection "Display"
+                Depth           16
+                Modes           "480x640"
+        EndSubSection
+        SubSection "Display"
+                Depth           24
+                Modes           "480x640"
+        EndSubSection
+EndSection
+
+Section "ServerLayout"
+        Identifier      "Default Layout"
+        Screen          "Default Screen"
+EndSection
-- 
1.7.3.4



