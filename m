Received: from [209.85.219.209] (helo=mail-ew0-f209.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eballetbo@gmail.com>) id 1N2hr2-0000UV-KM
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Oct 2009 09:56:39 +0100
Received: by mail-ew0-f209.google.com with SMTP id 5so8624074ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2009 01:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=IhtU+ADcbnYGtAGs6U6duMOo2boooPOe9msQMbNfXbM=;
	b=YmM2Mt7sHI/NgZDt80v4g+sQGKzACcbk48om/GjkG8d80rBLicw4p4XpvvU6hpHhbR
	IHWfX6NY6JJxmRNMJk0cekMlJBkuxbHRzrFyoSrSRPyROnl9gJGC0r+S4gKAIxQv6MGS
	xxTMXRvTmvM3OqeIJ3rPWipmXYGjzgPVDfwSA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=iAYMIv7k6Cd1hc7LDwdB09ejteiX0Ny2pOk2PZy8TgCCBc8X8MYX5DWa5/XaRgs4Kp
	PxSYx941UCd/wWNaLTBMz9b0cgieht7oYUL6WRYm4JgMk3FFd9/PbxLKuaNI3v7/fQHs
	k8x8rcF521t7C+kEe5L0DKEyqbv+77CNV0mQI=
MIME-Version: 1.0
Received: by 10.216.88.67 with SMTP id z45mr159448wee.112.1256633732994; Tue, 
	27 Oct 2009 01:55:32 -0700 (PDT)
Date: Tue, 27 Oct 2009 09:55:32 +0100
Message-ID: <70c9a9110910270155x3ddb90fane839454032c017d8@mail.gmail.com>
From: =?UTF-8?Q?Enric_Balletb=C3=B2_i_Serra?= <eballetbo@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.209
X-SA-Exim-Mail-From: eballetbo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 5/5] xserver-xf86-config: Add version for IGEP v2 board
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
X-List-Received-Date: Tue, 27 Oct 2009 08:56:39 -0000
Content-Type: text/plain; charset=UTF-8

Signed-off-by: Enric Balletbo i Serra <eballetbo@iseebcn.com>
---
 .../xserver-xorg-conf/igep0020/xorg.conf           |   29 ++++++++++++++++++++
 recipes/xorg-xserver/xserver-xorg-conf_0.1.bb      |    2 +-
 2 files changed, 30 insertions(+), 1 deletions(-)
 create mode 100644 recipes/xorg-xserver/xserver-xorg-conf/igep0020/xorg.conf

diff --git a/recipes/xorg-xserver/xserver-xorg-conf/igep0020/xorg.conf
b/recipes/xorg-xserver/xserver-xorg-conf/igep0020/xorg.conf
new file mode 100644
index 0000000..983bb08
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-conf/igep0020/xorg.conf
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
diff --git a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
index ba52376..37d200b 100644
--- a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
+++ b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Machine specific xorg.conf files"
-PR = "r11"
+PR = "r12"

 SRC_URI = "file://xorg.conf"

-- 
1.5.4.3


