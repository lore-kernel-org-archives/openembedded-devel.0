Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1Oyrrp-0002he-P9
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Sep 2010 21:54:07 +0200
Received: by ywe9 with SMTP id 9so520799ywe.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Sep 2010 12:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=iGfLg1v9vG79fT9nEvNPScTj2661h0JglNBWeQt1B40=;
	b=AOxUkNAwyDyl0gd/wuGRt9YY3y6J3lXWvU7N8Ei37gwP0lrlVUQLqPb2TjOhMBtC8g
	i9fZdiTFT0B30J+ucf/6GOdJULE0phVNH4bLxEsJqr2v257YmKbinSAAS86T0zcPxrya
	TCwM4qitcRzKyTTrjfKOTrgiCgB9eYiXyvG50=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=c3CH8uyz9hKCqD+VXjzB6kz2YOKPEw2uXZeYit38IVvu9NkbpKZpWFBr7xU/j1EJiD
	hk+EWEDHbic1OrIACqTWcA8/xKtfFh2+k7YQBYQZRBw36PtgnqCqSJGeybFclXjP+6Nb
	O02NnsnGyXXaoPBRSCp4H+nakT+/A2B3clvZ8=
Received: by 10.151.62.30 with SMTP id p30mr3302026ybk.328.1285271638737;
	Thu, 23 Sep 2010 12:53:58 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id q25sm1294122ybk.18.2010.09.23.12.53.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 23 Sep 2010 12:53:57 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Sep 2010 14:41:35 -0500
Message-Id: <1285270897-3618-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCHv2 1/3] matrix-gui-common: update to latest sources
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
X-List-Received-Date: Thu, 23 Sep 2010 19:54:07 -0000

From: Jeff Lance <j-lance1@ti.com>

* Updated to use repository revision 131
    * This includes platform support
* Removed the browser binary
* Copy files based on PLATFORM
* Bumped SRCREV to 136 in version 2 of this patch

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
Signed-off-by: Jeff Lance <j-lance1@ti.com>
---
 recipes/ti/matrix-gui-common/browser |   20 ----------------
 recipes/ti/matrix-gui-common_svn.bb  |   42 +++++++++++++---------------------
 2 files changed, 16 insertions(+), 46 deletions(-)
 delete mode 100644 recipes/ti/matrix-gui-common/browser

diff --git a/recipes/ti/matrix-gui-common/browser b/recipes/ti/matrix-gui-common/browser
deleted file mode 100644
index b5202d5..0000000
--- a/recipes/ti/matrix-gui-common/browser
+++ /dev/null
@@ -1,20 +0,0 @@
-#!/bin/sh
-
-BROWSERDIR=""
-BROWSERAPP="browser"
-
-#Check if DISPLAY is set.  If so we assume we are running in X11
-#and will call the X11 version of the browser if it exists.
-if [ "$DISPLAY" == "" ]
-then
-    BROWSERDIR="/usr/bin/qtopia/demos/browser"
-else
-    BROWSERDIR="/usr/bin/qt4/demos/browser"
-fi
-
-if [ -e "$BROWSERDIR/$BROWSERAPP" ]
-then
-    cd $BROWSERDIR
-    ./$BROWSERAPP
-fi
-
diff --git a/recipes/ti/matrix-gui-common_svn.bb b/recipes/ti/matrix-gui-common_svn.bb
index 43d6b0c..89126a2 100644
--- a/recipes/ti/matrix-gui-common_svn.bb
+++ b/recipes/ti/matrix-gui-common_svn.bb
@@ -4,44 +4,34 @@ LICENSE = "BSD"
 SECTION = "multimedia"
 PRIORITY = "optional"
 
-SRCREV = "58"
-PV = "1.0"
-PR = "r1+svnr${SRCPV}"
+SRCREV = "136"
+PV = "1.1"
+PR = "r3+svnr${SRCPV}"
+
+PLATFORM_dm365 = "dm365"
+PLATFORM_da850-omapl138-evm = "omapl138"
+PLATFORM_omap3evm = "omap3530"
+PLATFORM_dm37x-evm = "dm3730"
+PLATFORM_am37x-evm = "am3715"
+PLATFORM_beagleboard = "am3715"
+PLATFORM ?= "<UNDEFINED>"
 
 #Checkout the project repository to get access to the scripts and data
 #files.
-SRC_URI = "svn://gforge.ti.com/svn/matrix_gui/;module=trunk;proto=https;user=anonymous;pswd='' \
-    file://browser \
-"
+SRC_URI = "svn://gforge.ti.com/svn/matrix_gui/;module=trunk;proto=https;user=anonymous;pswd='' "
 
 S = "${WORKDIR}/trunk"
 
-MATRIX_EXTRA_BINS = " \
-    memInfo \
-    networkSettings \
-    runOGLES2Coverflow \
-    runOGLES2Shaders \
-    runOGLESChameleonMan \
-    runOGLESVase \
-    setopp1 \
-    setopp2 \
-    setopp3 \
-    setopp4 \
-    standby \
-    sysSettings \
-    taskInfo \
-"
+PACKAGE_ARCH = ${MACHINE_ARCH}
 
 do_install() {
     install -d ${D}/${bindir}
-    for i in ${MATRIX_EXTRA_BINS}; do
-        install -m 0755 ${S}/bin/${i} ${D}/${bindir}
-    done
-    install -m 0755 ${WORKDIR}/browser ${D}/${bindir}
+    install -m 0755 ${S}/${PLATFORM}/bin/* ${D}/${bindir}/
     install -d ${D}/${datadir}/matrix/html
-    install -m 0644 ${S}/*.html ${D}/${datadir}/matrix/html/
+    install -m 0644 ${S}/${PLATFORM}/html/* ${D}/${datadir}/matrix/html
     install -d ${D}/${datadir}/matrix/images
     install -m 0644 ${S}/images/*.png ${D}/${datadir}/matrix/images/
+
 }
 
 FILES_${PN} += "${datadir}/matrix/*"
-- 
1.7.0.4



