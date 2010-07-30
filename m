Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OeriA-0001YR-QU
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 17:41:31 +0200
Received: by wwd20 with SMTP id 20so7524700wwd.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 08:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=wnDhqdW358pT2lC6GDAaUUMtTCi3ucxBrf16Av0SSJA=;
	b=NWZeaO2WGIZnjkXz90si4JP4+eTIegpWm9uux8ehPNBiqJcHwpS1hMpK3G+5CHrRGb
	QkY/pZElsbrXX/EFrg4WuMQ+siS0wQK904UWHNYRdtE12jOK3vK0DmzVzOjEq8Z5DXhI
	GjVJkt98NNGOF9iHewCvwBu74zq4kDc7NH4fI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=t0lEWcclzOjz3SAE3YwptDYrLVFV+wjl3ad+fqVkKfuHC7/lAThz1ml6mtDBL7shdN
	CVtVnhEC6qjn/oTa4hvPt0Ka0K90nOGI5y8ki3SdYxDX/10Yad3DwvoMIo1wa9DuR6dz
	bgjvaAVnP0zDOl87K721cFoIXmaIbLvSTUmRU=
Received: by 10.227.69.202 with SMTP id a10mr1929064wbj.81.1280504461113;
	Fri, 30 Jul 2010 08:41:01 -0700 (PDT)
Received: from aalonso-pc.lan ([201.153.218.190])
	by mx.google.com with ESMTPS id h3sm2015014wbb.15.2010.07.30.08.40.58
	(version=SSLv3 cipher=RC4-MD5); Fri, 30 Jul 2010 08:41:00 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jul 2010 10:42:34 -0500
Message-Id: <1280504555-3633-9-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <openembedded-devel@lists.openembedded.org>
References: <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.82.41
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 09/10] xorg-xserver-conf: virtex5 machine support
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
X-List-Received-Date: Fri, 30 Jul 2010 15:41:32 -0000

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



