Received: from mail-bw0-f220.google.com ([209.85.218.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1O6lqr-0002FW-2P
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Apr 2010 16:33:30 +0200
Received: by mail-bw0-f220.google.com with SMTP id 20so2940304bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Apr 2010 07:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=FjM+f/MO8IG5Zc26G3OrjwfmzH+AEMMzBJmvbPBlhqg=;
	b=k4o6rALi52s2WsDcYra1/v8cZT9jP7dU5jl0ODi5ATYYqNax289c5f45kD+qTXMsYD
	216gUyQeVujA1lA20Ymx3LCU2zjpSjI7sE+gnyFSn71CyuRDKFpO0nE8OQpKd+p1XX+h
	PVXetYpleoWvyA5gK6k/JKFl8a9Ql8JKrW1IA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=T9VtTrD2Qr45mGR+rvNRwrV1z8y5W8bt5sFZpbBaH8jZ+0VNs+2PR4BU7u9FrxRxdy
	7bXXg1QDH/Q19kGXy6lavF/QwtoD9J338KQOZt2vzyYd/5oX8pHLqM/djVW8is2CWM3O
	/a0R57vPdo7KQCBrqbBcL5NjRyJA17YP0MPkI=
Received: by 10.204.152.17 with SMTP id e17mr3792378bkw.105.1272378591251;
	Tue, 27 Apr 2010 07:29:51 -0700 (PDT)
Received: from localhost.localdomain ([201.153.217.127])
	by mx.google.com with ESMTPS id a11sm171739bkc.21.2010.04.27.07.29.49
	(version=SSLv3 cipher=RC4-MD5); Tue, 27 Apr 2010 07:29:50 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Apr 2010 09:29:16 -0500
Message-Id: <1272378556-21914-5-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1272378556-21914-4-git-send-email-aalonso00@gmail.com>
References: <openembedded-devel@lists.openembedded.org>
	<1272378556-21914-1-git-send-email-aalonso00@gmail.com>
	<1272378556-21914-2-git-send-email-aalonso00@gmail.com>
	<1272378556-21914-3-git-send-email-aalonso00@gmail.com>
	<1272378556-21914-4-git-send-email-aalonso00@gmail.com>
X-SA-Exim-Connect-IP: 209.85.218.220
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 5/5] xorg.conf: new file
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
X-List-Received-Date: Tue, 27 Apr 2010 14:33:31 -0000

* xorg config file for xilinx ml507 platform

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 .../xserver-xorg-conf/xilinx-ml507/xorg.conf       |   39 ++++++++++++++++++++
 1 files changed, 39 insertions(+), 0 deletions(-)
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
-- 
1.6.6.1



