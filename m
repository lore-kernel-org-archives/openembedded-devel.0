Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SpYSA-0006cB-JX
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 07:30:11 +0200
Received: by pbbrq2 with SMTP id rq2so4563931pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jul 2012 22:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=AYJYg9djV1z4sLc6MRmbraqMR1uOJJdWaDaq5vivPs4=;
	b=QlCju8VyItJz4C7kixF43sL9w2YCpdBn0x00NJzqijpVM/Qx8nlTFJ/IS109JPvA5U
	2FsT3wRky9PPrOnN7c+OPB6vsBY1YupwzBheI6TIGO7akDf2QbriVSVuwau/NT/gbXlR
	fTDv8VamreVFtDOC0U3MtEYNbHLf5Ukyp2NuWzKgEx6BHSv9l8t0NY+9TOOBaWAn2Put
	yw/7YSfMl0fbWsuBWixH5FLBLRF/Hg6YwN2WqX0uy8ZwWmV77kMGApyfuh1e/nDd82SO
	1kamK+5zOWVbPUvo9JY12lsM06HYCVggyRnoEeCLnb4aPOOxcvLLpgxcx985iYGg5zTu
	J0KQ==
Received: by 10.68.134.161 with SMTP id pl1mr500134pbb.29.1342156735886;
	Thu, 12 Jul 2012 22:18:55 -0700 (PDT)
Received: from localhost.localdomain ([94.205.108.162])
	by mx.google.com with ESMTPS id pe8sm5259403pbc.76.2012.07.12.22.18.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jul 2012 22:18:55 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 09:18:46 +0400
Message-Id: <1342156726-23890-1-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-openembedded] meta-oe: Fix SRC_URI warnings to use "protocol" not "proto"
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
X-List-Received-Date: Fri, 13 Jul 2012 05:30:11 -0000

This commit updates the SRC_URI for the following recipes to use "protocol"
meta-oe/recipes-devtools/python/python-pyyaml_svn.bb
meta-oe/recipes-navigation/navit/navit_svn.bb
meta-oe/recipes-qt/qcanobserver/qcanobserver-socketcan_svn.bb
meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb
#meta-oe/recipes-support/dfu-util/dfu-util_svn.bb
meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_svn.bb
meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb
meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_svn.bb
meta-oe/recipes-support/usbpath/usbpath_svn.bb
meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 .../recipes-devtools/python/python-pyyaml_svn.bb   |    2 +-
 meta-oe/recipes-navigation/navit/navit_svn.bb      |    2 +-
 .../qcanobserver/qcanobserver-socketcan_svn.bb     |    2 +-
 .../recipes-qt/qcanobserver/qcanobserver_svn.bb    |    2 +-
 meta-oe/recipes-support/dfu-util/dfu-util_svn.bb   |    2 +-
 .../recipes-support/portaudio/portaudio-v19_svn.bb |    2 +-
 .../samsung-soc-utils/s3c24xx-gpio_svn.bb          |    2 +-
 .../samsung-soc-utils/s3c64xx-gpio_svn.bb          |    2 +-
 .../samsung-soc-utils/sjf2410-linux-native_svn.bb  |    2 +-
 meta-oe/recipes-support/usbpath/usbpath_svn.bb     |    2 +-
 meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb |    2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-devtools/python/python-pyyaml_svn.bb b/meta-oe/recipes-devtools/python/python-pyyaml_svn.bb
index c224507..92c0673 100644
--- a/meta-oe/recipes-devtools/python/python-pyyaml_svn.bb
+++ b/meta-oe/recipes-devtools/python/python-pyyaml_svn.bb
@@ -9,7 +9,7 @@ PV = "3.08+svnr${SRCPV}"
 PR = "ml2"
 
 SRC_URI = "\
-  svn://svn.pyyaml.org/pyyaml;module=trunk;proto=http \
+  svn://svn.pyyaml.org/pyyaml;module=trunk;protocol=http \
   file://setup.py \
 "
 S = "${WORKDIR}/trunk"
diff --git a/meta-oe/recipes-navigation/navit/navit_svn.bb b/meta-oe/recipes-navigation/navit/navit_svn.bb
index b3057b5..1350751 100644
--- a/meta-oe/recipes-navigation/navit/navit_svn.bb
+++ b/meta-oe/recipes-navigation/navit/navit_svn.bb
@@ -5,6 +5,6 @@ PV = "0.2.0+svnr${SRCPV}"
 PR = "${INC_PR}.2"
 
 S = "${WORKDIR}/${PN}"
-SRC_URI += "svn://anonymous@navit.svn.sourceforge.net/svnroot/navit/trunk;module=navit;proto=http \
+SRC_URI += "svn://anonymous@navit.svn.sourceforge.net/svnroot/navit/trunk;module=navit;protocol=http \
   file://taking-address-of-temporary-array.patch \
 "
diff --git a/meta-oe/recipes-qt/qcanobserver/qcanobserver-socketcan_svn.bb b/meta-oe/recipes-qt/qcanobserver/qcanobserver-socketcan_svn.bb
index c636128..aed190c 100644
--- a/meta-oe/recipes-qt/qcanobserver/qcanobserver-socketcan_svn.bb
+++ b/meta-oe/recipes-qt/qcanobserver/qcanobserver-socketcan_svn.bb
@@ -9,7 +9,7 @@ DEPENDS += "qwt libsocketcan"
 
 PV = "0.5+svnr${SRCPV}"
 SRCREV = "48"
-SRC_URI = "svn://qcanobserver.svn.sourceforge.net/svnroot;module=qcanobserver;proto=https"
+SRC_URI = "svn://qcanobserver.svn.sourceforge.net/svnroot;module=qcanobserver;protocol=https"
 
 S = "${WORKDIR}/qcanobserver/DeviceLib/linux/SocketCAN"
 
diff --git a/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb b/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb
index 9d8f4a3..3d79fdc 100644
--- a/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb
+++ b/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb
@@ -9,7 +9,7 @@ DEPENDS += "qwt"
 
 PV = "0.5+svnr${SRCPV}"
 SRCREV = "48"
-SRC_URI = "svn://qcanobserver.svn.sourceforge.net/svnroot;module=qcanobserver;proto=https \
+SRC_URI = "svn://qcanobserver.svn.sourceforge.net/svnroot;module=qcanobserver;protocol=https \
            file://0001-messagebufferinterface.cpp-add-sys-socket.h-as-inclu.patch \
            file://0002-qconsole-writethread-gcc-4.5-fixes.patch  \
            file://candemo.xml"
diff --git a/meta-oe/recipes-support/dfu-util/dfu-util_svn.bb b/meta-oe/recipes-support/dfu-util/dfu-util_svn.bb
index abb85fa..7e71820 100644
--- a/meta-oe/recipes-support/dfu-util/dfu-util_svn.bb
+++ b/meta-oe/recipes-support/dfu-util/dfu-util_svn.bb
@@ -9,7 +9,7 @@ PR = "r2"
 
 DEPENDS = "virtual/libusb0 usbpath"
 
-SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=dfu-util;proto=http"
+SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=dfu-util;protocol=http"
 S = "${WORKDIR}/dfu-util"
 
 inherit autotools
diff --git a/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb b/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
index 2ae9eb4..312ae60 100644
--- a/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
+++ b/meta-oe/recipes-support/portaudio/portaudio-v19_svn.bb
@@ -6,7 +6,7 @@ SRCREV = "1387"
 PV = "v19+svnr${SRCPV}"
 PR = "r0"
 
-SRC_URI = "svn://www.portaudio.com/repos/portaudio;module=trunk;proto=http"
+SRC_URI = "svn://www.portaudio.com/repos/portaudio;module=trunk;protocol=http"
 S = "${WORKDIR}/trunk"
 
 inherit autotools
diff --git a/meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_svn.bb b/meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_svn.bb
index 80fd4f7..d465803 100644
--- a/meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_svn.bb
+++ b/meta-oe/recipes-support/samsung-soc-utils/s3c24xx-gpio_svn.bb
@@ -7,7 +7,7 @@ SRCREV = "4949"
 PV = "1.0+svnr${SRCPV}"
 PR = "r2"
 
-SRC_URI = "svn://svn.openmoko.org/trunk/src/target;module=gpio;proto=http"
+SRC_URI = "svn://svn.openmoko.org/trunk/src/target;module=gpio;protocol=http"
 S = "${WORKDIR}/gpio"
 
 do_compile() {
diff --git a/meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb b/meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb
index 8a3d190..96285e9 100644
--- a/meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb
+++ b/meta-oe/recipes-support/samsung-soc-utils/s3c64xx-gpio_svn.bb
@@ -7,7 +7,7 @@ SRCREV = "4949"
 PV = "1.0+svnr${SRCPV}"
 PR = "r0"
 
-SRC_URI = "svn://svn.openmoko.org/trunk/src/target;module=gpio;proto=http"
+SRC_URI = "svn://svn.openmoko.org/trunk/src/target;module=gpio;protocol=http"
 S = "${WORKDIR}/gpio"
 
 do_compile() {
diff --git a/meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_svn.bb b/meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_svn.bb
index b712316..15e11ac 100644
--- a/meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_svn.bb
+++ b/meta-oe/recipes-support/samsung-soc-utils/sjf2410-linux-native_svn.bb
@@ -7,7 +7,7 @@ SRCREV = "4268"
 PV = "0.1+svnr${SRCPV}"
 PR = "r1"
 
-SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=sjf2410-linux;proto=http"
+SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=sjf2410-linux;protocol=http"
 S = "${WORKDIR}/sjf2410-linux"
 
 inherit native deploy
diff --git a/meta-oe/recipes-support/usbpath/usbpath_svn.bb b/meta-oe/recipes-support/usbpath/usbpath_svn.bb
index 5941267..903a33d 100644
--- a/meta-oe/recipes-support/usbpath/usbpath_svn.bb
+++ b/meta-oe/recipes-support/usbpath/usbpath_svn.bb
@@ -11,7 +11,7 @@ BBCLASSEXTEND = "native"
 SRCREV = "3172"
 PV = "0.0+svnr${SRCPV}"
 
-SRC_URI = "svn://svn.openmoko.org/trunk/src/host;module=usbpath;proto=http"
+SRC_URI = "svn://svn.openmoko.org/trunk/src/host;module=usbpath;protocol=http"
 
 S = "${WORKDIR}/usbpath"
 
diff --git a/meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb b/meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb
index 9114832..6d1fa9a 100644
--- a/meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb
+++ b/meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb
@@ -6,7 +6,7 @@ SRCREV = "5394"
 PV = "0.0.0+svnr${SRCPV}"
 PR = "r2"
 
-SRC_URI = "svn://svn.openmoko.org/trunk/src/target;module=AR6kSDK.build_sw.18;proto=http"
+SRC_URI = "svn://svn.openmoko.org/trunk/src/target;module=AR6kSDK.build_sw.18;protocol=http"
 S = "${WORKDIR}/AR6kSDK.build_sw.18/host/tools/wmiconfig"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
-- 
1.7.9.5



