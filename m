Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OCYnp-0001dW-6L
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 15:50:21 +0200
Received: by pwj5 with SMTP id 5so639947pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 May 2010 06:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=d4FbcyYcHygonhQQ8+RG9Dn3FPsvySNuAf6uZ5qx4ew=;
	b=OfgYl+ppJYVbZwWXQ1i3kjYhYsraMB0J63+z23WALMWA69CYr6aqrp4+LFWu++zSDZ
	fAKED7UaITpWVVxKQUKadb1EoNgVe4+Av8D7bRw6nSmqitxyPUDxzimcAxaDtsK1wDl2
	1Snpwm5tjD3SP9BBxqaNrAMF+74HCobQ0q6yw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=kTxWwS9yfQwK/yBofLqtPlyrAAPtHtd5TVViV56WViLr50g9aMBGCXTF5uFtxaHbZv
	s9Dg5KpzyvJm8X6/5AiiD1/vKmvRQLvT2FoXecEjdzeOb+S13IoXh8oIrnD7eMdjGVP8
	MHacZ/y7rxWskixivyvvd0NpBoIcuK8/MnMbU=
Received: by 10.141.88.21 with SMTP id q21mr6100448rvl.299.1273758381325;
	Thu, 13 May 2010 06:46:21 -0700 (PDT)
Received: from localhost.localdomain ([201.153.77.51])
	by mx.google.com with ESMTPS id d14sm1098627rva.18.2010.05.13.06.46.19
	(version=SSLv3 cipher=RC4-MD5); Thu, 13 May 2010 06:46:20 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 May 2010 08:46:39 -0500
Message-Id: <1273758399-23601-5-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1273758399-23601-4-git-send-email-aalonso00@gmail.com>
References: <1273758399-23601-1-git-send-email-aalonso00@gmail.com>
	<1273758399-23601-2-git-send-email-aalonso00@gmail.com>
	<1273758399-23601-3-git-send-email-aalonso00@gmail.com>
	<1273758399-23601-4-git-send-email-aalonso00@gmail.com>
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 5/5 v2] xserver-xorg-conf: add xilinx-ml507 config
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
X-List-Received-Date: Thu, 13 May 2010 13:50:21 -0000

* xorg config file for xilinx-ml507 target platform

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 .../xserver-xorg-conf/xilinx-ml507/xorg.conf       |   39 ++++++++++++++++++++
 recipes/xorg-xserver/xserver-xorg-conf_0.1.bb      |    2 +-
 2 files changed, 40 insertions(+), 1 deletions(-)
 create mode 100644 recipes/xorg-xserver/xserver-xorg-conf/xilinx-ml507/xorg.conf

diff --git a/recipes/xorg-xserver/xserver-xorg-conf/xilinx-ml507/xorg.conf b/recipes/xorg-xserver/xserver-xorg-conf/xilinx-ml507/xorg.conf
new file mode 100644
index 0000000..aca5eed
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-conf/xilinx-ml507/xorg.conf
@@ -0,0 +1,39 @@
+Section "Monitor"
+	Identifier "LCD Panel"
+EndSection
+
+Section "Device"
+    Identifier  "Xilinx frame buffer"
+    Driver      "fbdev"
+EndSection
+
+Section "Screen"
+    Identifier  "Default Screen"
+    Device      "Xilinx frame buffer"
+    Monitor     "LCD Panel"
+	SubSection "Display"
+		Depth   24
+        Modes   "640x480"
+	EndSubSection
+EndSection                             
+
+Section "InputDevice"
+    Identifier  "Keyboard"
+    Driver      "kbd"
+#    Option      "XkbLayout" "es"
+#    Option      "XkbModel"  "pc105"
+EndSection
+
+Section "InputDevice"
+    Identifier  "Mouse"
+    Driver      "mouse"
+    Option      "protocol" "auto"
+    Option      "device" "/dev/input/mice"
+EndSection
+
+Section "ServerLayout"
+    Identifier  "Default Layout"
+    Screen      "Default Screen"
+    InputDevice "Keyboard"
+    InputDevice "Mouse"
+EndSection
diff --git a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
index 283bc58..c56aafc 100644
--- a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
+++ b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Machine specific xorg.conf files"
-PR = "r25"
+PR = "r26"
 
 SRC_URI = "file://xorg.conf"
 
-- 
1.6.6.1



