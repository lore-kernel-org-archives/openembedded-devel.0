Received: from smtp208.alice.it ([82.57.200.104])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RjJkf-00036m-UE
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Jan 2012 01:03:14 +0100
Received: from mizar.localdomain (79.16.253.172) by smtp208.alice.it
	(8.6.023.02) id 4F056E85001CA422; Sat, 7 Jan 2012 00:55:49 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat,  7 Jan 2012 00:55:28 +0100
Message-Id: <1325894128-26110-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-oe] [PATCH] xserver-common: remove extraneous BSP customizations
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
X-List-Received-Date: Sat, 07 Jan 2012 00:03:14 -0000

* delete patches meant for BSP layers
* bump PR

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../Xserver.add.dpi.for.gta.patch                  |   29 ------------------
 .../Xserver.add.nocursor.for.gta.patch             |   20 ------------
 .../xserver-common-1.34/Xserver.gta04.patch        |   32 --------------------
 .../xserver-common-1.34/Xserver.n900.patch         |   17 ----------
 .../xserver-common-1.34/Xserver.nexusone.patch     |   14 --------
 .../xserver-common-1.34/Xserver.nexuss.patch       |   14 --------
 .../xserver-common/xserver-common_1.34.bb          |    8 +----
 7 files changed, 1 insertions(+), 133 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.add.dpi.for.gta.patch
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.add.nocursor.for.gta.patch
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.gta04.patch
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.n900.patch
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.nexusone.patch
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.nexuss.patch

diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.add.dpi.for.gta.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.add.dpi.for.gta.patch
deleted file mode 100644
index f6e36d9..0000000
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.add.dpi.for.gta.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-xdpyinfo returns 96, but 285 is right value (but 280 is used as it renders 4 columns of illume icons instead of 3 and empty space)
-
-diff -uNr xserver-common-1.33.orig//X11/xserver-common xserver-common-1.33/X11/xserver-common
---- xserver-common-1.33.orig//X11/xserver-common	2010-04-28 23:27:10.000000000 +0200
-+++ xserver-common-1.33/X11/xserver-common	2010-04-28 23:29:07.000000000 +0200
-@@ -133,19 +133,19 @@
-             ARGS="$ARGS -screen ${SCREEN_SIZE}"
-             DPI="225" ;;
-         "gta01" )
--            DPI="285"
-+            DPI="280"
-             if [ "$XSERVER" != "Xorg" ] ; then
-                 ARGS="$ARGS -screen 480x640"
-             else
--                ARGS="$ARGS -nocursor"
-+                ARGS="$ARGS -dpi ${DPI} -nocursor"
-             fi
-             ;;
-         "gta02")
--            DPI="285"
-+            DPI="280"
-             if [ "$XSERVER" != "Xorg" ] ; then
-                 ARGS="$ARGS -screen ${SCREEN_SIZE}"
-             else
--                ARGS="$ARGS -nocursor"
-+                ARGS="$ARGS -dpi ${DPI} -nocursor"
-             fi
-             ;;
-         "motorola_ezx_platform")
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.add.nocursor.for.gta.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.add.nocursor.for.gta.patch
deleted file mode 100644
index bd16efc..0000000
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.add.nocursor.for.gta.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-diff -uNr xserver-common-1.33.orig//X11/xserver-common xserver-common-1.33/X11/xserver-common
---- xserver-common-1.33.orig//X11/xserver-common	2010-04-28 10:44:23.000000000 +0200
-+++ xserver-common-1.33/X11/xserver-common	2010-04-28 10:46:41.000000000 +0200
-@@ -136,12 +136,16 @@
-             DPI="285"
-             if [ "$XSERVER" != "Xorg" ] ; then
-                 ARGS="$ARGS -screen 480x640"
-+            else
-+                ARGS="$ARGS -nocursor"
-             fi
-             ;;
-         "gta02")
-             DPI="285"
-             if [ "$XSERVER" != "Xorg" ] ; then
-                 ARGS="$ARGS -screen ${SCREEN_SIZE}"
-+            else
-+                ARGS="$ARGS -nocursor"
-             fi
-             ;;
-         "motorola_ezx_platform")
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.gta04.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.gta04.patch
deleted file mode 100644
index 8a17c9a..0000000
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.gta04.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 95d741d6849a2faddf8c1e930c7250ead90e7bed Mon Sep 17 00:00:00 2001
-From: Klaus Kurzmann <mok@fluxnetz.de>
-Date: Thu, 20 Oct 2011 09:05:43 +0200
-Subject: [PATCH] gta04
-
-Signed-off-by: Klaus Kurzmann <mok@fluxnetz.de>
----
- X11/xserver-common |    8 ++++++++
- 1 files changed, 8 insertions(+), 0 deletions(-)
-
-diff --git a/X11/xserver-common b/X11/xserver-common
-index 448b262..208bbfd 100644
---- a/X11/xserver-common
-+++ b/X11/xserver-common
-@@ -161,6 +161,14 @@ else
-                 ARGS="$ARGS -dpi ${DPI} -nocursor"
-             fi
-             ;;
-+        "gta04")
-+            DPI="280"
-+            if [ "$XSERVER" != "Xorg" ] ; then
-+                ARGS="$ARGS -screen ${SCREEN_SIZE}"
-+            else
-+                ARGS="$ARGS -dpi ${DPI} -nocursor"
-+            fi
-+            ;;
-         "motorola_ezx_platform")
-             ARGS="$ARGS -screen 240x320"
-             DPI="170" ;;
--- 
-1.7.7
-
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.n900.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.n900.patch
deleted file mode 100644
index 4d36f5f..0000000
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.n900.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-diff -uri xserver-common-1.33.orig/X11/xserver-common xserver-common-1.33/X11/xserver-common
---- xserver-common-1.33.orig/X11/xserver-common	2010-09-14 17:10:35.955430177 +0200
-+++ xserver-common-1.33/X11/xserver-common	2010-09-14 17:17:12.484423440 +0200
-@@ -132,6 +132,13 @@
-         "nokia_n800" | "nokia_rx-44" | "nokia_n770")
-             ARGS="$ARGS -screen ${SCREEN_SIZE}"
-             DPI="225" ;;
-+        "nokia_rx-51_board" )                                     
-+            DPI="267"                                    
-+            if [ "$XSERVER" != "Xorg" ] ; then                    
-+                ARGS="$ARGS -screen ${SCREEN_SIZE}"               
-+            else                                                  
-+                ARGS="$ARGS -dpi ${DPI} -nocursor"       
-+            fi ;;                                                    
-         "gta01" )
-             DPI="280"
-             if [ "$XSERVER" != "Xorg" ] ; then
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.nexusone.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.nexusone.patch
deleted file mode 100644
index 7d528ae..0000000
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.nexusone.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Index: xserver-common-1.34/X11/xserver-common
-===================================================================
---- xserver-common-1.34.orig/X11/xserver-common	2011-10-10 22:36:14.163129002 +0200
-+++ xserver-common-1.34/X11/xserver-common	2011-10-10 22:37:47.513129001 +0200
-@@ -129,6 +129,9 @@
-         "herring")
-             DPI="235"
-             ARGS="$ARGS -dpi ${DPI} -nocursor";;
-+        "mahimahi")
-+            DPI="254"
-+            ARGS="$ARGS -dpi ${DPI}";;
-         "generic_omap1510/1610/1710")
-             ARGS="$ARGS -screen ${SCREEN_SIZE}"
-             DPI="225" ;;
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.nexuss.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.nexuss.patch
deleted file mode 100644
index 1e564ce..0000000
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.nexuss.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Index: xserver-common-1.34/X11/xserver-common
-===================================================================
---- xserver-common-1.34.orig/X11/xserver-common	2011-10-09 14:57:10.716896996 +0200
-+++ xserver-common-1.34/X11/xserver-common	2011-10-09 14:57:31.226897012 +0200
-@@ -126,6 +126,9 @@
-         "htc_tornado")
-             ARGS="$ARGS -hide-cursor"
-             DPI="100" ;;
-+        "herring")
-+            DPI="235"
-+            ARGS="$ARGS -dpi ${DPI} -nocursor";;
-         "generic_omap1510/1610/1710")
-             ARGS="$ARGS -screen ${SCREEN_SIZE}"
-             DPI="225" ;;
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
index 4f99a90..d326ea6 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Common X11 scripts and support files"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-PR = "r5"
+PR = "r6"
 
 # we are using a gpe-style Makefile
 inherit gpe
@@ -17,12 +17,6 @@ SRC_URI_append = " \
                    file://89xTs_Calibrate.xinput_calibrator.patch \
                    file://90xXWindowManager.patch \
                    file://Xserver.add.xserver-system.patch \
-                   file://Xserver.add.nocursor.for.gta.patch \
-                   file://Xserver.add.dpi.for.gta.patch \
-                   file://Xserver.n900.patch \
-                   file://Xserver.nexuss.patch \
-                   file://Xserver.nexusone.patch \
-                   file://Xserver.gta04.patch \
 "
 
 
-- 
1.7.3.4



