Received: from caiajhbdcahe.dreamhost.com ([208.97.132.74]
	helo=homiemail-a22.g.dreamhost.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1NCuvj-0000lJ-Mr
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Nov 2009 13:55:42 +0100
Received: from localhost.localdomain (mtec-hg-docking-1-dhcp-199.ethz.ch
	[129.132.133.199])
	by homiemail-a22.g.dreamhost.com (Postfix) with ESMTPA id 4ED831A8061; 
	Tue, 24 Nov 2009 04:54:07 -0800 (PST)
From: Sebastian Spaeth <Sebastian@SSpaeth.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Nov 2009 13:53:57 +0100
Message-Id: <1259067237-25725-1-git-send-email-Sebastian@SSpaeth.de>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <4B0BD1AC.1010806@SSpaeth.de>
References: <4B0BD1AC.1010806@SSpaeth.de>
X-SA-Exim-Connect-IP: 208.97.132.74
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Sebastian Spaeth <Sebastian@SSpaeth.de>,
	SHR-devel <shr-devel@lists.shr-project.org>
Subject: [PATCH] navit: Do not set /proc/sys/vm/overcommit in an app launcher, especially not without ever changing it back.
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
X-List-Received-Date: Tue, 24 Nov 2009 12:55:42 -0000

* This reverts parts of 742fb4ae71e6a7e655385086ba9edebbf00b6ebd
* If someone wants to do use this, it should be done on a more finegrained distro basis

Signed-off-by: Sebastian Spaeth <Sebastian@SSpaeth.de>
---
 recipes/navit/files/navit.launcher |   30 ------------------------------
 recipes/navit/navit.inc            |    4 ----
 2 files changed, 0 insertions(+), 34 deletions(-)
 delete mode 100644 recipes/navit/files/navit.launcher

diff --git a/recipes/navit/files/navit.launcher b/recipes/navit/files/navit.launcher
deleted file mode 100644
index b95aadb..0000000
--- a/recipes/navit/files/navit.launcher
+++ /dev/null
@@ -1,30 +0,0 @@
-#! /bin/sh
-#
-# Copyright Matthias Hentges <devel@hentges.net> (c) 2008
-# License: GPL (see http://www.gnu.org/licenses/gpl.txt for a copy of the license)
-#
-# Filename: navit.launcher
-# Date: 20080105 (YMD)
-#
-#################################################################################
-#
-# 20080105 - v0.0.1	- Initial release
-
-# On devices with low memory (< 512Mb?) Navit will segfault on start.
-# This can be worked around by doing
-# "echo 1 > /proc/sys/vm/overcommit_memory"
-
-if test "`cat /proc/meminfo | grep ^MemTotal | awk '{print $2}'`" -lt "500000"
-then
-	if test "$USER" = "root"
-	then
-		echo "Enabling low-mem workaround..."
-		echo 1 > /proc/sys/vm/overcommit_memory
-	else
-		echo "I need root-privs to enable the low-mem workaround!"
-	fi
-fi
-
-navit.real $*
-	
-
diff --git a/recipes/navit/navit.inc b/recipes/navit/navit.inc
index 8ad439d..fa250ff 100644
--- a/recipes/navit/navit.inc
+++ b/recipes/navit/navit.inc
@@ -15,7 +15,6 @@ FILES_${PN}-dbg += "${libdir}/${PN}/*/.debug"
 
 SRC_URI_append = " \
                   file://navit.desktop \
-                  file://navit.launcher \
                   file://navit.png \
 	  	 "
 
@@ -25,8 +24,5 @@ do_install_append() {
         install -d ${D}${datadir}/pixmaps/
         install -m 0644 ${WORKDIR}/navit.png ${D}${datadir}/pixmaps/
 
-        mv ${D}${bindir}/navit ${D}${bindir}/navit.real
-        install -m 0755 ${WORKDIR}/navit.launcher ${D}${bindir}/navit
-
 	rm ${D}${libdir}/${PN}/*/*.la
 }
-- 
1.6.3.3



