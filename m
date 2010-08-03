Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OgKFQ-0007sx-Hy
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 18:21:53 +0200
Received: by mail-fx0-f47.google.com with SMTP id 12so2157248fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 09:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=KJF8TAGInQ7ixXNOZNvH0YLDDFmPnqOs0nHXWjX6xWo=;
	b=JDLtvUw4COnaWmSYDuqxo9URTEcfD+VH4gUWMx4nX2Z29bIIjT3nuu9em7NByLa0Xv
	b9vjwX97B2jjlsKyx9+BckRa7yuzo9JilezcBOGECJp6yHx0/k47nBPbEB621crd8dmb
	is54h3zGEkLe33gs5xHZHAObbp1xGVt4yiyZ4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=TFuaTiU9c++IGmdCg7zHs3QSV1Y9tYhcESeYeMVHsW1mXBmtvuRA+zuzhXYKfdI7XK
	NYsKhRZ92G4ieIuiLI6Zy7gi1rc8V76Ta1BtHygZGabOa3YapMv00xY2Nsonwa0Kskuk
	nk6hOdm6nt5KGDUU1J2zTR8mjYeRvfpwWi60g=
Received: by 10.223.121.4 with SMTP id f4mr7584720far.71.1280852507646;
	Tue, 03 Aug 2010 09:21:47 -0700 (PDT)
Received: from aalonso-pc.lan ([201.153.72.151])
	by mx.google.com with ESMTPS id s20sm2570960faa.28.2010.08.03.09.21.44
	(version=SSLv3 cipher=RC4-MD5); Tue, 03 Aug 2010 09:21:46 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Aug 2010 11:23:22 -0500
Message-Id: <1280852605-3524-8-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <1280852605-3524-1-git-send-email-aalonso00@gmail.com>
References: <1280852605-3524-1-git-send-email-aalonso00@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 08/11][v2] xorg-xserver-conf: virtex5 machine support
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
X-List-Received-Date: Tue, 03 Aug 2010 16:21:53 -0000

* Add xorg conf for xilinx virtex5 family targets
* Increase PR
* v2 reorder patch set

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 .../xserver-xorg-conf/xilinx-virtex5/xorg.conf     |   38 ++++++++++++++++++++
 recipes/xorg-xserver/xserver-xorg-conf_0.1.bb      |    2 +-
 2 files changed, 39 insertions(+), 1 deletions(-)
 create mode 100644 recipes/xorg-xserver/xserver-xorg-conf/xilinx-virtex5/xorg.conf

diff --git a/recipes/xorg-xserver/xserver-xorg-conf/xilinx-virtex5/xorg.conf b/recipes/xorg-xserver/xserver-xorg-conf/xilinx-virtex5/xorg.conf
new file mode 100644
index 0000000..61f0f9f
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-conf/xilinx-virtex5/xorg.conf
@@ -0,0 +1,38 @@
+# Xorg conf file for Xilinx platforms
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
+    Screen      0 "Default Screen" 0 0
+    InputDevice "Keyboard"
+    InputDevice "Mouse"
+EndSection
diff --git a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
index 976dfac..c3dbb01 100644
--- a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
+++ b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Machine specific xorg.conf files"
-PR = "r29"
+PR = "r30"
 
 SRC_URI = "file://xorg.conf"
 
-- 
1.7.2



