Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P1NpW-0001pV-Uy
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 20:26:10 +0200
Received: by gxk10 with SMTP id 10so923947gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Sep 2010 11:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=QmSlwiVG6KlbnTSRMk/PxO+d6LBGgHyx3jx1OIFlv/I=;
	b=F6quPx2ahMXtyttVqyGbT8vAJw4Q11RVjXK53m4mu8a6fsHqk5gi9PlkMGNwcVD4N1
	a+0UDk0JQzelBZRTOLzPETAQxU6lxltxcLubpEtE+eCraPgFFe0nEjNhRgL+vfMyFHKC
	lAaZaYtMzR7TIKgt/TVDrjYr/9IAsC+x078II=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=oybSp7YovL/mc37GNaWmPHfcJLezs13Q4u+2EGhZLEVmOflKjgo2YNrAFgm9eSyN6i
	xabQGaDaQ2AJw9WOKTBzG67D86L8CPI+s70lsqbey0E/KblTEBC7hLqwT7DfQ+FIOXsw
	4hVHylXUmDBncKZj/eK+50YjezI7udhfEpF6w=
Received: by 10.220.124.230 with SMTP id v38mr29484vcr.23.1285871136594;
	Thu, 30 Sep 2010 11:25:36 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id r15sm173572vbp.0.2010.09.30.11.25.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 30 Sep 2010 11:25:35 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Sep 2010 13:12:03 -0500
Message-Id: <1285870326-27944-2-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1285870326-27944-1-git-send-email-chase.maupin@ti.com>
References: <1285870326-27944-1-git-send-email-chase.maupin@ti.com>
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/5] matrix-gui-common: make versioned recipes
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
X-List-Received-Date: Thu, 30 Sep 2010 18:26:10 -0000

* Abstracted common code to .inc file
* Made versioned recipe for version 1.1 and 1.2
* Removed the _svn version of the recipe.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 recipes/ti/matrix-gui-common.inc    |   35 +++++++++++++++++++++++++++++++++
 recipes/ti/matrix-gui-common_1.1.bb |    7 ++++++
 recipes/ti/matrix-gui-common_1.2.bb |    5 ++++
 recipes/ti/matrix-gui-common_svn.bb |   37 -----------------------------------
 4 files changed, 47 insertions(+), 37 deletions(-)
 create mode 100644 recipes/ti/matrix-gui-common.inc
 create mode 100644 recipes/ti/matrix-gui-common_1.1.bb
 create mode 100644 recipes/ti/matrix-gui-common_1.2.bb
 delete mode 100644 recipes/ti/matrix-gui-common_svn.bb

diff --git a/recipes/ti/matrix-gui-common.inc b/recipes/ti/matrix-gui-common.inc
new file mode 100644
index 0000000..096c321
--- /dev/null
+++ b/recipes/ti/matrix-gui-common.inc
@@ -0,0 +1,35 @@
+DESCRIPTION = "Common files for all versions of Matrix GUI"
+HOMEPAGE = "https://gforge.ti.com/gf/project/matrix_gui/"
+LICENSE = "BSD"
+SECTION = "multimedia"
+PRIORITY = "optional"
+
+COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x)"
+
+PLATFORM_dm365 = "dm365"
+PLATFORM_omapl138 = "omapl138"
+PLATFORM_omap3evm = "omap3530"
+PLATFORM_dm37x-evm = "dm3730"
+PLATFORM_am37x-evm = "am3715"
+PLATFORM_beagleboard = "am3715"
+PLATFORM_ti816x = "ti816x"
+
+#Checkout the project repository to get access to the scripts and data
+#files.
+SRC_URI = "svn://gforge.ti.com/svn/matrix_gui/;module=trunk;proto=https;user=anonymous;pswd='' "
+
+S = "${WORKDIR}/trunk"
+
+PACKAGE_ARCH = ${MACHINE_ARCH}
+
+do_install() {
+    install -d ${D}/${bindir}
+    install -m 0755 ${S}/${PLATFORM}/bin/* ${D}/${bindir}/
+    install -d ${D}/${datadir}/matrix/html
+    install -m 0644 ${S}/${PLATFORM}/html/* ${D}/${datadir}/matrix/html
+    install -d ${D}/${datadir}/matrix/images
+    install -m 0644 ${S}/images/*.png ${D}/${datadir}/matrix/images/
+
+}
+
+FILES_${PN} += "${datadir}/matrix/*"
diff --git a/recipes/ti/matrix-gui-common_1.1.bb b/recipes/ti/matrix-gui-common_1.1.bb
new file mode 100644
index 0000000..2b921af
--- /dev/null
+++ b/recipes/ti/matrix-gui-common_1.1.bb
@@ -0,0 +1,7 @@
+require matrix-gui-common.inc
+
+COMPATIBLE_MACHINE = "(dm365|omapl138|omap3)"
+
+SRCREV = "136"
+PV = "1.1"
+PR = "r4"
diff --git a/recipes/ti/matrix-gui-common_1.2.bb b/recipes/ti/matrix-gui-common_1.2.bb
new file mode 100644
index 0000000..a3da400
--- /dev/null
+++ b/recipes/ti/matrix-gui-common_1.2.bb
@@ -0,0 +1,5 @@
+require matrix-gui-common.inc
+
+SRCREV = "146"
+PV = "1.2"
+PR = "r0"
diff --git a/recipes/ti/matrix-gui-common_svn.bb b/recipes/ti/matrix-gui-common_svn.bb
deleted file mode 100644
index 89126a2..0000000
--- a/recipes/ti/matrix-gui-common_svn.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-DESCRIPTION = "Common files for all versions of Matrix GUI"
-HOMEPAGE = "https://gforge.ti.com/gf/project/matrix_gui/"
-LICENSE = "BSD"
-SECTION = "multimedia"
-PRIORITY = "optional"
-
-SRCREV = "136"
-PV = "1.1"
-PR = "r3+svnr${SRCPV}"
-
-PLATFORM_dm365 = "dm365"
-PLATFORM_da850-omapl138-evm = "omapl138"
-PLATFORM_omap3evm = "omap3530"
-PLATFORM_dm37x-evm = "dm3730"
-PLATFORM_am37x-evm = "am3715"
-PLATFORM_beagleboard = "am3715"
-PLATFORM ?= "<UNDEFINED>"
-
-#Checkout the project repository to get access to the scripts and data
-#files.
-SRC_URI = "svn://gforge.ti.com/svn/matrix_gui/;module=trunk;proto=https;user=anonymous;pswd='' "
-
-S = "${WORKDIR}/trunk"
-
-PACKAGE_ARCH = ${MACHINE_ARCH}
-
-do_install() {
-    install -d ${D}/${bindir}
-    install -m 0755 ${S}/${PLATFORM}/bin/* ${D}/${bindir}/
-    install -d ${D}/${datadir}/matrix/html
-    install -m 0644 ${S}/${PLATFORM}/html/* ${D}/${datadir}/matrix/html
-    install -d ${D}/${datadir}/matrix/images
-    install -m 0644 ${S}/images/*.png ${D}/${datadir}/matrix/images/
-
-}
-
-FILES_${PN} += "${datadir}/matrix/*"
-- 
1.7.0.4



