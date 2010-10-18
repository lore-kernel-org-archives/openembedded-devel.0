Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1P7uoj-0004XD-4j
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 20:52:20 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id A86A0275CEBA; Mon, 18 Oct 2010 20:51:42 +0200 (CEST)
Received: from localhost (p5489BE68.dip.t-dialin.net [84.137.190.104])
	by gravedo.de (Postfix) with ESMTPSA id 89B50275CE2F;
	Mon, 18 Oct 2010 20:51:39 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Oct 2010 20:51:16 +0200
Message-Id: <1287427884-1517-8-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1287427884-1517-1-git-send-email-morphis@gravedo.de>
References: <1287427884-1517-1-git-send-email-morphis@gravedo.de>
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 07/15] initscripts-shr: remove unused usb-gadget script for palmpre machine
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
X-List-Received-Date: Mon, 18 Oct 2010 18:52:21 -0000

This script was resonsible for activating networking over usb but is not needed anymore as
our default kernel for the palmpre machine activates usb networking per default.

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes/shr/initscripts-shr/palmpre/usb-gadget.sh |   10 ----------
 recipes/shr/initscripts-shr_0.0.1.bb              |    8 +-------
 2 files changed, 1 insertions(+), 17 deletions(-)
 delete mode 100644 recipes/shr/initscripts-shr/palmpre/usb-gadget.sh

diff --git a/recipes/shr/initscripts-shr/palmpre/usb-gadget.sh b/recipes/shr/initscripts-shr/palmpre/usb-gadget.sh
deleted file mode 100644
index d755495..0000000
--- a/recipes/shr/initscripts-shr/palmpre/usb-gadget.sh
+++ /dev/null
@@ -1,10 +0,0 @@
-#!/bin/sh
-
-# usb gadget configuration:
-# there already different configurations on the palm pre defined,
-# we choose nr 5 cause it provides the usbnet, novacom
-# and storage gadget
-if [ -e /sys/class/usb_gadget/config_num ]; then
-	echo 5 > /sys/class/usb_gadget/config_num
-fi
-
diff --git a/recipes/shr/initscripts-shr_0.0.1.bb b/recipes/shr/initscripts-shr_0.0.1.bb
index 120c325..e4dc736 100644
--- a/recipes/shr/initscripts-shr_0.0.1.bb
+++ b/recipes/shr/initscripts-shr_0.0.1.bb
@@ -5,7 +5,7 @@ DEPENDS = ""
 RDEPENDS_${PN} = "procps"
 LICENSE = "GPL"
 PV = "0.0.1"
-PR = "r19"
+PR = "r20"
 
 RCONFLICTS_${PN} = "initscripts"
 
@@ -31,7 +31,6 @@ SRC_URI = "file://alignment.sh \
 	   file://umountfs \
 	   file://umountnfs.sh \
 	   "
-SRC_URI_append_palmpre = " file://usb-gadget.sh"
 
 inherit base
 
@@ -75,11 +74,6 @@ do_install () {
 	install -m 0755	${WORKDIR}/umountfs		${D}${sysconfdir}/init.d
 	install -m 0755	${WORKDIR}/umountnfs.sh		${D}${sysconfdir}/init.d
 
-	if [ "${MACHINE}" == "palmpre" ]; then
-		install -m 0755 ${WORKDIR}/usb-gadget.sh ${D}${sysconfdir}/init.d
-		ln -sf ../init.d/usb-gadget.sh ${D}${sysconfdir}/rcS.d/S00usb-gadget.sh
-	fi
-
 #
 # Create runlevel links
 #
-- 
1.7.1



