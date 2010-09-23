Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1OylpU-0003IR-D0
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Sep 2010 15:27:20 +0200
Received: by ywe9 with SMTP id 9so345257ywe.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Sep 2010 06:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=KiaVOEZUx5k+uJimIkYLy+kEQf1JvKWpf0V9h8XMFH4=;
	b=mA2l1FPipwt5btBQ0Jeq5IAyAXkBChbRFJnk1u1xkfM29BvmatCt18nJTSmaXYNXh7
	jUCBXRp92t8BsMdEEL+CZHh2Xt1prjrSO+cd7Ol1DvUvWqsRXTwTF77JJLcosH15olD1
	vB342/wwELc5SQU6dzbBMGBIB6fiWGxbwROOo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=GoGTBJUNKFS9KNotKmfVpgO6l4bwAVGv520scLfDZdgnSbILm4Ajcb5CHlKUAKMd4t
	SmPKRDv+946+UTxP0kryJzdnbqUSPuEwvQ1KluoOABAkjmxEx9AZl0nfoybHCEa5W65c
	2FfvqbQhXFTU4aaT3CHR8jdrfIxwJkgctaJlU=
Received: by 10.151.111.10 with SMTP id o10mr1976083ybm.130.1285248429855;
	Thu, 23 Sep 2010 06:27:09 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id u24sm999798yba.21.2010.09.23.06.27.07
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 23 Sep 2010 06:27:08 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Sep 2010 08:14:45 -0500
Message-Id: <1285247687-25731-1-git-send-email-chase.maupin@ti.com>
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
Subject: [PATCH 1/3] matrix-gui-common: update to latest sources
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
X-List-Received-Date: Thu, 23 Sep 2010 13:27:20 -0000

From: Jeff Lance <j-lance1@ti.com>

* Updated to use repository revision 131
    * This includes platform support
* Removed the browser binary
* Copy files based on PLATFORM

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
index 43d6b0c..6452e15 100644
--- a/recipes/ti/matrix-gui-common_svn.bb
+++ b/recipes/ti/matrix-gui-common_svn.bb
@@ -4,44 +4,34 @@ LICENSE = "BSD"
 SECTION = "multimedia"
 PRIORITY = "optional"
 
-SRCREV = "58"
-PV = "1.0"
-PR = "r1+svnr${SRCPV}"
+SRCREV = "131"
+PV = "1.1"
+PR = "r2+svnr${SRCPV}"
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



