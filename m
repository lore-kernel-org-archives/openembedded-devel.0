Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Rms8B-0006RR-Kc
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jan 2012 20:22:11 +0100
Received: by wgbdr11 with SMTP id dr11so1797217wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jan 2012 11:14:32 -0800 (PST)
Received: by 10.180.24.105 with SMTP id t9mr22362998wif.19.1326741271985;
	Mon, 16 Jan 2012 11:14:31 -0800 (PST)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPS id g12sm35804037wiw.10.2012.01.16.11.14.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jan 2012 11:14:31 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Jan 2012 21:14:25 +0200
Message-Id: <1326741265-29476-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
Cc: florcirel@gmail.com, Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: [PATCH] [META-OE] In LICENSE "&&" should be replaced with "&"
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
X-List-Received-Date: Mon, 16 Jan 2012 19:22:11 -0000

From: Andrei Gherzan <andrei.gherzan@windriver.com>

In this way meta-oe recipes will be parsed correctly in yocto.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../recipes-gnome/bonobo/libbonoboui_2.24.3.bb     |    2 +-
 .../gnome-bluetooth/gnome-bluetooth_2.32.0.bb      |    2 +-
 .../gnome-menus/gnome-menus_2.30.5.bb              |    2 +-
 .../gnome-panel/gnome-panel3_3.0.2.bb              |    2 +-
 .../recipes-gnome/nautilus/nautilus3_3.0.2.bb      |    2 +-
 .../recipes-gnome/nautilus/nautilus_2.32.2.bb      |    2 +-
 meta-oe/recipes-connectivity/obex/openobex_1.5.bb  |    2 +-
 meta-oe/recipes-devtools/nodejs/nodejs_0.4.12.bb   |    2 +-
 meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb   |    2 +-
 .../audiofile/audiofile_0.2.7.bb                   |    2 +-
 meta-oe/recipes-multimedia/jack/jack_0.121.0.bb    |    2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.3.bb b/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.3.bb
index 5f519a5..cf37ccf 100644
--- a/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.3.bb
+++ b/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.3.bb
@@ -1,5 +1,5 @@
 SECTION = "x11/gnome/libs"
-LICENSE = "GPLv2 && LGPLv2.1"
+LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
 
diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
index f2273a7..80d7712 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "GNOME bluetooth manager"
-LICENSE = "GPLv2 && LGPLv2.1"
+LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 "
diff --git a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb
index 8d94e84..d4057c0 100644
--- a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb
+++ b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "GNOME menus"
 SECTION = "x11/gnome"
-LICENSE = "GPLv2 && LGPLv2"
+LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
index f1d6b3d..37288e1 100644
--- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "GNOME panel"
-LICENSE = "GPLv2 && LGPLv2 && GFDLv1.1"
+LICENSE = "GPLv2 & LGPLv2 & GFDLv1.1"
 
 BPN = "gnome-panel"
 
diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus3_3.0.2.bb b/meta-gnome/recipes-gnome/nautilus/nautilus3_3.0.2.bb
index b530cee..5dc4451 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus3_3.0.2.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus3_3.0.2.bb
@@ -2,7 +2,7 @@
 # Copyright (C) 2005, Advanced Micro Devices, Inc.  All Rights Reserved
 # Released under the MIT license (see packages/COPYING)
 
-LICENSE="GPLv2 && LGPLv2"
+LICENSE="GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f08a446809913fc9b3c718f0eaea0426 \
                     file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
 
diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
index e076ca1..fa136e1 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
@@ -2,7 +2,7 @@
 # Copyright (C) 2005, Advanced Micro Devices, Inc.  All Rights Reserved
 # Released under the MIT license (see packages/COPYING)
 
-LICENSE="GPLv2 && LGPLv2"
+LICENSE="GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7c0048536e43642a1f3a724c2909872b \
                     file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
 
diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.5.bb b/meta-oe/recipes-connectivity/obex/openobex_1.5.bb
index 66cc85d..d08420c 100644
--- a/meta-oe/recipes-connectivity/obex/openobex_1.5.bb
+++ b/meta-oe/recipes-connectivity/obex/openobex_1.5.bb
@@ -3,7 +3,7 @@ Object Exchange (OBEX) protocol."
 HOMEPAGE = "http://openobex.triq.net"
 SECTION = "libs"
 DEPENDS = "virtual/libusb0 bluez4"
-LICENSE = "GPLv2 && LGPLv2.1"
+LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                    "
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.4.12.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.4.12.bb
index 28fe4a1..b87b969 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.4.12.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.4.12.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
-LICENSE = "MIT && zlib"
+LICENSE = "MIT & zlib"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d6237f3a840aef5b7880fb4e49eecfe5"
 
 DEPENDS = "openssl"
diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb b/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb
index 8e09667..e581ded 100644
--- a/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "C++ bindings for the pango library."
 SECTION = "libs"
-LICENSE = "LGPLv2.1 && GPLv2"
+LICENSE = "LGPLv2.1 & GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
                     file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
 
diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb
index a21bec6..5b0c740 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb
@@ -4,7 +4,7 @@ WAVE, NeXT/Sun .snd/.au, Berkeley/IRCAM/CARL Sound File, Audio Visual \
 Research, Amiga IFF/8SVX, and NIST SPHERE."
 HOMEPAGE = "http://www.68k.org/~michael/audiofile/"
 SECTION = "libs"
-LICENSE = "LGPLv2 && GPLv2"
+LICENSE = "LGPLv2 & GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
 PR = "r0"
diff --git a/meta-oe/recipes-multimedia/jack/jack_0.121.0.bb b/meta-oe/recipes-multimedia/jack/jack_0.121.0.bb
index f43b40a..ca98146 100644
--- a/meta-oe/recipes-multimedia/jack/jack_0.121.0.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_0.121.0.bb
@@ -4,7 +4,7 @@ device, as well as allowing them to share audio between \
 themselves."
 SECTION = "libs/multimedia"
 
-LICENSE = "GPLv2 && LGPLv2.1"
+LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c030468238b2cf89925a57f2780396a7 \
                     file://COPYING.GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LGPL;md5=e77fe93202736b47c07035910f47974a \
-- 
1.7.5.4



