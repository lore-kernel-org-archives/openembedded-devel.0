Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OYP0g-0004O1-R9
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jul 2010 21:50:06 +0200
Received: by mail-pv0-f175.google.com with SMTP id 13so2328304pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jul 2010 12:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=KAUIQVD6LpgkocfckFIHOVOBTkgxpKftt3LTmHdIK40=;
	b=trXDg6zpI+uEBG7NLGDQFUNG2PNbTVctyFWLeIvR+MuHDU+Ohn6kBq/WrptS9aazTA
	no6wu3D3KOOqTs6wbQvCDyusXS0VLTrblQmUrqudfIxCj3W4c3DPvzH2J95ZMj/bhkvF
	6lm1HJAWJVN6Z992Za1OKCc0xIjj9yXiE1u/k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=l0zWJO+6wbQ9CPH1R2IfpPtyBAe4SKjkKndB6U2vfAvszJTcW3MBS7nsmSda0rDWGY
	CZ72+aJ2RBDtSwUsTn/LOGAliANeEyVM2DFNpzSGf218UkC5OU+OdLEKHlFK+/q/Yr+d
	8UztrtL6Fx1YMbaz8AvknK1pVD3u1DK1GYELg=
Received: by 10.142.79.1 with SMTP id c1mr17346918wfb.279.1278963895888;
	Mon, 12 Jul 2010 12:44:55 -0700 (PDT)
Received: from aalonso-pc.lan ([201.153.224.36])
	by mx.google.com with ESMTPS id 23sm5192380wfa.22.2010.07.12.12.44.53
	(version=SSLv3 cipher=RC4-MD5); Mon, 12 Jul 2010 12:44:55 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Jul 2010 14:45:49 -0500
Message-Id: <1278963950-2587-8-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.7.1.1
In-Reply-To: <1278963950-2587-1-git-send-email-aalonso00@gmail.com>
References: <1278963950-2587-1-git-send-email-aalonso00@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 8/9] xorg-xserver-conf: virtex5 machine support
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
X-List-Received-Date: Mon, 12 Jul 2010 19:50:06 -0000

* Add xorg conf for virtex5 family targets
* Increase PR

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
index 4194b57..f8ce48c 100644
--- a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
+++ b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Machine specific xorg.conf files"
-PR = "r27"
+PR = "r28"
 
 SRC_URI = "file://xorg.conf"
 
-- 
1.7.1.1



