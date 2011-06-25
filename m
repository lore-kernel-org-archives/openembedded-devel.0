Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QaHWj-0000l8-Pt
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Jun 2011 03:19:14 +0200
Received: by gwb11 with SMTP id 11so1388142gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jun 2011 18:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=tjgcb8fBj3fUky+MdvImG63q7FWeZv23iLcVPn4Iv+c=;
	b=G+bHN1BzuzCOUOIPV8+GupmuVBPgYpoJWupXl/HntwRTdNK5Tu/YHX2OYpQJwyhCJr
	6SKHWRhr+xqWz6DqZllDJvlGkWfEoOdvlOyjkRiJk3/ePTavnm777w8OVyiLeFzlNyIi
	9M4p1ZHKVLhZ0mkIX8S2JudLU1x7TMAdn4wUk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=FFOF2CRHnulCfuKyP1ZqDMrgUMM6SIbOBkU2y75ge4l+5bUM4WmVpAQDoyM1ApWf2V
	d2BJIH/9hUGNrOIxQmBHdfMr4VOuxNPLakGhmHYPr4oPKrHUQEGFNEhMFTtJVZi5hAdD
	BWd23w+WV46pRDGduGqJB6JshxsiZNbVzxN4M=
Received: by 10.236.157.97 with SMTP id n61mr5974080yhk.285.1308964535751;
	Fri, 24 Jun 2011 18:15:35 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id u64sm2078030yhm.13.2011.06.24.18.15.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Jun 2011 18:15:35 -0700 (PDT)
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Jun 2011 20:14:04 -0500
Message-Id: <1308964444-2595-1-git-send-email-agnel.joel@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Joel A Fernandes \(Texas Instruments\)" <joelagnel@ti.com>,
	Joel A Fernandes <agnel.joel@gmail.com>,
	Jason Kridner <jdk@ti.com>, Koen Kooi <koen@ti.com>
Subject: [PATCH] ti-dmai: Fixes for Display and Capture.
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
X-List-Received-Date: Sat, 25 Jun 2011 01:19:15 -0000

These patches fix issues with display and capture in ti-dmai that cause it to break with recent kernels.

Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
---
 recipes/ti/ti-dmai.inc                             |    4 +
 ...display-Set-the-default-Display-Output-to.patch |   26 +++++
 ...o-detect-V4L2-display-device-node-to-open.patch |  109 ++++++++++++++++++++
 ...e-display-rotation-to-avoid-problems-due-.patch |   29 +++++
 ...-DMAI-Use-the-correct-capture-device-node.patch |   26 +++++
 5 files changed, 194 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ti/ti-dmai/beagle/0001-DMAI-video_display-Set-the-default-Display-Output-to.patch
 create mode 100644 recipes/ti/ti-dmai/beagle/0002-DMAI-Auto-detect-V4L2-display-device-node-to-open.patch
 create mode 100644 recipes/ti/ti-dmai/beagle/0003-DMAI-Disable-display-rotation-to-avoid-problems-due-.patch
 create mode 100644 recipes/ti/ti-dmai/beagle/0004-DMAI-Use-the-correct-capture-device-node.patch

diff --git a/recipes/ti/ti-dmai.inc b/recipes/ti/ti-dmai.inc
index c3a0f71..a5a11a1 100644
--- a/recipes/ti/ti-dmai.inc
+++ b/recipes/ti/ti-dmai.inc
@@ -27,6 +27,10 @@ SRC_URI = "svn://gforge.ti.com/svn/dmai/;module=${DMAIBRANCH};proto=https;user=a
 		file://loadmodules-ti-dmai-ol138_al.sh \
 	    file://doxygen_templates.tar.gz \
         file://arago-tdox \
+                file://beagle/0001-DMAI-video_display-Set-the-default-Display-Output-to.patch \
+                file://beagle/0002-DMAI-Auto-detect-V4L2-display-device-node-to-open.patch \
+                file://beagle/0003-DMAI-Disable-display-rotation-to-avoid-problems-due-.patch \
+                file://beagle/0004-DMAI-Use-the-correct-capture-device-node.patch \
 	"
 
 DEPENDS = "virtual/kernel alsa-lib ti-framework-components ti-codec-engine ti-xdctools"
diff --git a/recipes/ti/ti-dmai/beagle/0001-DMAI-video_display-Set-the-default-Display-Output-to.patch b/recipes/ti/ti-dmai/beagle/0001-DMAI-video_display-Set-the-default-Display-Output-to.patch
new file mode 100644
index 0000000..fce8272
--- /dev/null
+++ b/recipes/ti/ti-dmai/beagle/0001-DMAI-video_display-Set-the-default-Display-Output-to.patch
@@ -0,0 +1,26 @@
+From c584fc4593fc95c24facc8521a8a1180a0bc7b13 Mon Sep 17 00:00:00 2001
+From: Joel <joel@chase-ubuntu.(none)>
+Date: Mon, 20 Jun 2011 16:59:54 -0500
+Subject: [PATCH 1/4] DMAI video_display: Set the default Display Output to DVI.
+
+Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
+---
+ apps/video_display/linux/main.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+packages/ti/sdo/dmai
+diff --git a/packages/ti/sdo/dmai/apps/video_display/linux/main.c b/packages/ti/sdo/dmai/apps/video_display/linux/main.c
+index 15182b7..496d19c 100644
+--- a/packages/ti/sdo/dmai/apps/video_display/linux/main.c
++++ b/packages/ti/sdo/dmai/apps/video_display/linux/main.c
+@@ -45,7 +45,7 @@
+ #include "../appMain.h"
+ 
+ /* Default arguments for app */
+-#define DEFAULT_ARGS { 1000, FALSE, FALSE, VideoStd_D1_NTSC, Display_Output_COMPOSITE }
++#define DEFAULT_ARGS { 1000, FALSE, FALSE, VideoStd_D1_NTSC, Display_Output_DVI }
+ 
+ /*
+  * Argument IDs for long options. They must not conflict with ASCII values,
+-- 
+1.7.0.4
+
diff --git a/recipes/ti/ti-dmai/beagle/0002-DMAI-Auto-detect-V4L2-display-device-node-to-open.patch b/recipes/ti/ti-dmai/beagle/0002-DMAI-Auto-detect-V4L2-display-device-node-to-open.patch
new file mode 100644
index 0000000..77882f4
--- /dev/null
+++ b/recipes/ti/ti-dmai/beagle/0002-DMAI-Auto-detect-V4L2-display-device-node-to-open.patch
@@ -0,0 +1,109 @@
+From 39d909ea1040b86968adf0d62475955bd07f96a8 Mon Sep 17 00:00:00 2001
+From: Joel A Fernandes <agnel.joel@gmail.com>
+Date: Tue, 21 Jun 2011 15:33:14 -0500
+Subject: [PATCH 2/4] DMAI: Auto-detect V4L2 display device node to open.
+
+Changes in display device node names in the kernel break DMAI.
+This autodetects the device node name to avoid such breakages in the future.
+
+Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
+---
+ linux/Display.c               |    2 +-
+ linux/omap3530/Display_v4l2.c |   40 ++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 41 insertions(+), 1 deletions(-)
+
+diff --git a/packages/ti/sdo/dmai/linux/Display.c b/packages/ti/sdo/dmai/linux/Display.c
+index bf0db2e..578ab8a 100644
+--- a/packages/ti/sdo/dmai/linux/Display.c
++++ b/packages/ti/sdo/dmai/linux/Display.c
+@@ -197,7 +197,7 @@ const Display_Attrs Display_Attrs_O3530_VID_DEFAULT = {
+     Display_Std_V4L2,
+     VideoStd_VGA,
+     Display_Output_LCD,
+-    "/dev/video1",
++    "",			// V4L2 device nodes are auto detected
+     0,
+     ColorSpace_UYVY,
+     -1,
+diff --git a/packages/ti/sdo/dmai/linux/omap3530/Display_v4l2.c b/packages/ti/sdo/dmai/linux/omap3530/Display_v4l2.c
+index 8cd891c..61f15bb 100644
+--- a/packages/ti/sdo/dmai/linux/omap3530/Display_v4l2.c
++++ b/packages/ti/sdo/dmai/linux/omap3530/Display_v4l2.c
+@@ -35,6 +35,7 @@
+ #include <string.h>
+ #include <unistd.h>
+ #include <fcntl.h>
++#include <dirent.h>
+ #include <sys/ioctl.h>
+ #include <sys/mman.h>
+ #include <errno.h>
+@@ -55,6 +56,7 @@
+ #include "priv/_SysFs.h"
+ 
+ #define MODULE_NAME     "Display"
++#define V4LVOUT_DIR "/sys/devices/platform/omap_vout/video4linux"
+ 
+ /******************************************************************************
+  * cleanup
+@@ -134,6 +136,7 @@ Display_Handle Display_v4l2_create(BufTab_Handle hBufTab, Display_Attrs *attrs)
+ #if defined(V4L2_CID_ROTATE)
+     struct v4l2_control        control;
+ #endif
++    char                       displayDevName[20];
+     assert(attrs);
+ 
+     /* Allocate space for state object */
+@@ -152,6 +155,13 @@ Display_Handle Display_v4l2_create(BufTab_Handle hBufTab, Display_Attrs *attrs)
+     }
+     hDisplay->userAlloc = TRUE;
+ 
++    /* Get video capture device */
++    if(Display_v4l2_getdevice(displayDevName) < 0) {
++        Dmai_err0("Failed to get V4L2 display device node.\n");
++        return NULL;
++    }
++    attrs->displayDevice = displayDevName;
++
+     /* Open video capture device */
+     hDisplay->fd = open(attrs->displayDevice, O_RDWR, 0);
+ 
+@@ -319,6 +329,36 @@ Int Display_v4l2_delete(Display_Handle hDisplay)
+ }
+ 
+ /******************************************************************************
++ * Display_v4l2_getdevice
++ ******************************************************************************/
++Int Display_v4l2_getdevice(char displayDevice[20])
++{
++    DIR *dp;
++    struct dirent *ep;
++    dp = opendir (V4LVOUT_DIR);
++    displayDevice[0] = '\0';
++    strcat(displayDevice, "/dev/");
++    if (dp != NULL) {
++        while(ep = readdir (dp)) {
++            if(ep->d_name[0] == '.') continue;
++            Dmai_dbg1("V4L Video node found: '%s'\n", ep->d_name);
++            if(strlen(ep->d_name) > 19 -  strlen(displayDevice)) {
++                ep = NULL;
++                break;
++            }
++            strcat(displayDevice, ep->d_name);
++            closedir (dp);
++            break;
++        }
++    }
++    if(!dp || !ep) {
++        Dmai_err0("Could not open the directory\n");
++        return -1;
++    }
++    return 0;
++}
++
++/******************************************************************************
+  * Display_v4l2_get
+  ******************************************************************************/
+ Int Display_v4l2_get(Display_Handle hDisplay, Buffer_Handle *hBufPtr)
+-- 
+1.7.0.4
+
diff --git a/recipes/ti/ti-dmai/beagle/0003-DMAI-Disable-display-rotation-to-avoid-problems-due-.patch b/recipes/ti/ti-dmai/beagle/0003-DMAI-Disable-display-rotation-to-avoid-problems-due-.patch
new file mode 100644
index 0000000..924e301
--- /dev/null
+++ b/recipes/ti/ti-dmai/beagle/0003-DMAI-Disable-display-rotation-to-avoid-problems-due-.patch
@@ -0,0 +1,29 @@
+From 46cb37b4b2efdcc8fb9d2edf8e08a3b0e1c15f80 Mon Sep 17 00:00:00 2001
+From: Joel A Fernandes <agnel.joel@gmail.com>
+Date: Tue, 21 Jun 2011 15:53:32 -0500
+Subject: [PATCH 3/4] DMAI: Disable display rotation to avoid problems due to not passing vrfb in bootargs
+
+Disable display rotation as it is not known to be used by many users and can result
+in problems if vrfb is not passed in bootargs.
+
+Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
+---
+ linux/omap3530/Display_v4l2.c |    2 ++
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/packages/ti/sdo/dmai/linux/omap3530/Display_v4l2.c b/packages/ti/sdo/dmai/linux/omap3530/Display_v4l2.c
+index 61f15bb..3cfd75d 100644
+--- a/packages/ti/sdo/dmai/linux/omap3530/Display_v4l2.c
++++ b/packages/ti/sdo/dmai/linux/omap3530/Display_v4l2.c
+@@ -174,6 +174,8 @@ Display_Handle Display_v4l2_create(BufTab_Handle hBufTab, Display_Attrs *attrs)
+         return NULL;
+     }
+     
++#undef V4L2_CID_ROTATE
++
+ #if defined(V4L2_CID_ROTATE)
+     /* Make rotation by default 0 for DVI and S-video*/
+ 
+-- 
+1.7.0.4
+
diff --git a/recipes/ti/ti-dmai/beagle/0004-DMAI-Use-the-correct-capture-device-node.patch b/recipes/ti/ti-dmai/beagle/0004-DMAI-Use-the-correct-capture-device-node.patch
new file mode 100644
index 0000000..35a4043
--- /dev/null
+++ b/recipes/ti/ti-dmai/beagle/0004-DMAI-Use-the-correct-capture-device-node.patch
@@ -0,0 +1,26 @@
+From 5e59be7d0d5d3d90e9bbc5d1bb5829ad8482fbf0 Mon Sep 17 00:00:00 2001
+From: Joel A Fernandes <agnel.joel@gmail.com>
+Date: Fri, 24 Jun 2011 17:04:10 -0500
+Subject: [PATCH 4/4] DMAI: Use the correct capture device node.
+
+Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
+---
+ linux/Capture.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/packages/ti/sdo/dmai/linux/Capture.c b/packages/ti/sdo/dmai/linux/Capture.c
+index e7a081e..a2614e7 100644
+--- a/packages/ti/sdo/dmai/linux/Capture.c
++++ b/packages/ti/sdo/dmai/linux/Capture.c
+@@ -120,7 +120,7 @@ const Capture_Attrs Capture_Attrs_OMAP3530_DEFAULT = {
+     -1,
+     -1,
+     -1,
+-    "/dev/video0",
++    "/dev/video2",
+     FALSE,
+     VideoStd_AUTO,
+     -1,
+-- 
+1.7.0.4
+
-- 
1.7.0.4



