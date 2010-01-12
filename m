Received: from mail.atmel.fr ([81.80.104.162] helo=atmel-es2.atmel.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicolas.ferre@atmel.com>) id 1NUeIC-0003E0-8G
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 11:48:11 +0100
Received: from fwat.rfo.atmel.com (gateway [192.168.1.1])
	by atmel-es2.atmel.fr (8.11.7p1+Sun/8.11.6) with SMTP id o0CAjJF11332; 
	Tue, 12 Jan 2010 11:45:19 +0100 (MET)
Received: from meyreuil ([10.159.254.132]) by fwat;
	Tue, 12 Jan 2010 11:17:46 +0100 (MET)
Received: from localhost.localdomain ([10.159.245.201])
	by meyreuil.atmel.fr (8.11.7p1+Sun/8.11.7) with ESMTP id o0CAXjg11178; 
	Tue, 12 Jan 2010 11:33:45 +0100 (MET)
From: Nicolas Ferre <nicolas.ferre@atmel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jan 2010 12:43:44 +0100
Message-Id: <1263296624-27140-1-git-send-email-nicolas.ferre@atmel.com>
X-Mailer: git-send-email 1.5.6.5
X-SA-Exim-Connect-IP: 81.80.104.162
X-SA-Exim-Mail-From: nicolas.ferre@atmel.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: patrice.vilchez@atmel.com
Subject: [PATCH] xserver-common: add SAM9G10/G45/9RL to Xserver file
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
X-List-Received-Date: Tue, 12 Jan 2010 10:48:11 -0000

Adding some Atmel AT91 chips to Xserver file.

Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
---
 recipes/xserver-common/files/Xserver-at91.patch |   18 ++++++++++++++++++
 recipes/xserver-common/xserver-common_1.25.bb   |    3 ++-
 2 files changed, 20 insertions(+), 1 deletions(-)
 create mode 100644 recipes/xserver-common/files/Xserver-at91.patch

diff --git a/recipes/xserver-common/files/Xserver-at91.patch b/recipes/xserver-common/files/Xserver-at91.patch
new file mode 100644
index 0000000..e030e9f
--- /dev/null
+++ b/recipes/xserver-common/files/Xserver-at91.patch
@@ -0,0 +1,18 @@
+diff -ru xserver-common-1.25.orig/X11/Xserver xserver-common-1.25/X11/Xserver
+--- xserver-common-1.25.orig/X11/Xserver	2010-01-12 12:04:52.000000000 +0100
++++ xserver-common-1.25/X11/Xserver	2010-01-12 12:15:32.000000000 +0100
+@@ -104,8 +104,12 @@
+ 		ARGS="$ARGS -dpi 100 -screen 480x640@270" ;;
+ 	"HTC Tornado")
+ 		ARGS="$ARGS -dpi 100 -hide-cursor" ;;
+-	"Atmel AT91SAM9261-EK" | "Atmel AT91SAM9263-EK")
+-		ARGS="$ARGS -dpi 100 -rgba bgr -screen 240x320" ;;	
++	"Atmel AT91SAM9261-EK" | "Atmel AT91SAM9263-EK" | "Atmel AT91CAP9A-DK" | "Atmel AT91CAP9-STK")
++		ARGS="$ARGS -dpi 100 -rgba bgr -screen ${SCREEN_SIZE} " ;;
++	"Atmel AT91SAM9RL-EK" | "Atmel AT91SAM9G10-EK" )
++		ARGS="$ARGS -dpi 100 -rgba rgb -screen ${SCREEN_SIZE} " ;;
++	"Atmel AT91SAM9M10-EKES" | "Atmel AT91SAM9G45-EKES" | "Atmel AT91SAM9M10G45-EK")
++		ARGS="$ARGS -rgba rgb -screen 480x272 " ;;
+ 	"Generic OMAP1510/1610/1710" | "Nokia N770")
+ 		ARGS="$ARGS -dpi 225 -screen ${SCREEN_SIZE} " ;;
+ 	"Nokia N800")
diff --git a/recipes/xserver-common/xserver-common_1.25.bb b/recipes/xserver-common/xserver-common_1.25.bb
index b55e0e5..40ec4af 100644
--- a/recipes/xserver-common/xserver-common_1.25.bb
+++ b/recipes/xserver-common/xserver-common_1.25.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Common X11 scripts and support files"
 LICENSE = "GPL"
 SECTION = "x11"
 RDEPENDS_${PN} = "xmodmap xrandr xdpyinfo"
-PR = "r3"
+PR = "r4"
 
 PACKAGE_ARCH = "all"
 
@@ -13,6 +13,7 @@ SRC_URI_append = " file://setDPI.sh \
                    file://89xdgautostart.sh \
                    file://avoid-rotated-server.patch;patch=1 \
                    file://ts-handling-cleanup.diff;patch=1 \
+                   file://Xserver-at91.patch;patch=1 \
 "
 
 SRC_URI_append_angstrom = " file://xtscal-fix.patch;patch=1 "
-- 
1.5.6.5



