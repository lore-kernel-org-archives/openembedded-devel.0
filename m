Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P1Npw-0001vd-Ku
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 20:26:34 +0200
Received: by ywe9 with SMTP id 9so783190ywe.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Sep 2010 11:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=855N+rTMUpiiwdJHWKsaka7hkHnDs+AZxqO+pma13eE=;
	b=WSDavvr7MVtjrjEW4j6YD4YtlzDrjMgZ6oQyCKnRlEUDSuPZDvJ4vltxDXgWHUkmlK
	U22XqJRWtN83pD8tUPjx/TYu7BL6aMpNJWaorzo34xPcwDMCbdHrLXSZHvdbVVnSUQs1
	RsA4NUgltqXN/qJCdAqOGTJGGkoL2zdoFAxzg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=oCnl03Gu7RR5s5stMJzy4bopKfZjQQhNwK2F0ib+kkVK7cVq9l7vAUg4Q43A0zZoHP
	EqCqBfriNnSOPLdlWMuF847mZzCNC5HyY44gGZemzHmm09yHYRB9ZXpojhl36Lesrny2
	WIBkh0nxG7qKs5Mtkg/TbRRTR7GxT5u1Bo298=
Received: by 10.220.93.17 with SMTP id t17mr1064609vcm.126.1285871175886;
	Thu, 30 Sep 2010 11:26:15 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id r15sm173572vbp.0.2010.09.30.11.26.14
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 30 Sep 2010 11:26:15 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Sep 2010 13:12:04 -0500
Message-Id: <1285870326-27944-3-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1285870326-27944-1-git-send-email-chase.maupin@ti.com>
References: <1285870326-27944-1-git-send-email-chase.maupin@ti.com>
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/5] matrix-gui-e: make versioned recipes
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
X-List-Received-Date: Thu, 30 Sep 2010 18:26:35 -0000

* Abstracted common code to .inc file
* Made versioned recipe for version 1.1 and 1.2
* Removed _svn version of the recipe

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 recipes/ti/matrix-gui-e.inc    |   40 ++++++++++++++++++++++++++++++++++++++
 recipes/ti/matrix-gui-e_1.1.bb |    8 +++++++
 recipes/ti/matrix-gui-e_1.2.bb |    6 +++++
 recipes/ti/matrix-gui-e_svn.bb |   42 ----------------------------------------
 4 files changed, 54 insertions(+), 42 deletions(-)
 create mode 100644 recipes/ti/matrix-gui-e.inc
 create mode 100644 recipes/ti/matrix-gui-e_1.1.bb
 create mode 100644 recipes/ti/matrix-gui-e_1.2.bb
 delete mode 100644 recipes/ti/matrix-gui-e_svn.bb

diff --git a/recipes/ti/matrix-gui-e.inc b/recipes/ti/matrix-gui-e.inc
new file mode 100644
index 0000000..3004a65
--- /dev/null
+++ b/recipes/ti/matrix-gui-e.inc
@@ -0,0 +1,40 @@
+DESCRIPTION = "Matrix GUI for Qt Embedded"
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
+SRC_URI = "svn://gforge.ti.com/svn/matrix_gui/;module=trunk;proto=https;user=anonymous;pswd='' "
+
+S = "${WORKDIR}/trunk"
+
+INITSCRIPT_NAME = "matrix-gui-e"
+INITSCRIPT_PARAMS = "defaults 99"
+#INITSCRIPT_PARAMS = "start 99 3 . stop 99 3 ."
+
+CXXFLAGS_da850-omapl138-evm_append = " -DPlatform_omapl138 "
+CXXFLAGS_dm365_append = " -DPlatform_dm365 "
+PACKAGE_ARCH = ${MACHINE_ARCH}
+
+inherit qt4e update-rc.d
+
+do_install() {
+	install -d ${D}/${bindir}
+	install -m 0755 ${S}/matrix_gui ${D}/${bindir}/matrix_guiE
+	install -d ${D}${sysconfdir}/init.d/
+	install -c -m 0755 ${S}/${PLATFORM}/etc/init ${D}${sysconfdir}/init.d/matrix-gui-e
+
+}
+
+RRECOMMENDS_${PN} = "qt4-embedded-plugin-mousedriver-tslib qt4-embedded-fonts"
+RDEPENDS_${PN} += "matrix-gui-common"
diff --git a/recipes/ti/matrix-gui-e_1.1.bb b/recipes/ti/matrix-gui-e_1.1.bb
new file mode 100644
index 0000000..d6a674f
--- /dev/null
+++ b/recipes/ti/matrix-gui-e_1.1.bb
@@ -0,0 +1,8 @@
+require matrix-gui-e.inc
+
+COMPATIBLE_MACHINE = "(dm365|omapl138|omap3)"
+
+SRCREV = "136"
+PV = "1.1"
+PR = "r19"
+
diff --git a/recipes/ti/matrix-gui-e_1.2.bb b/recipes/ti/matrix-gui-e_1.2.bb
new file mode 100644
index 0000000..461fc7e
--- /dev/null
+++ b/recipes/ti/matrix-gui-e_1.2.bb
@@ -0,0 +1,6 @@
+require matrix-gui-e.inc
+
+SRCREV = "146"
+PV = "1.2"
+PR = "r0"
+
diff --git a/recipes/ti/matrix-gui-e_svn.bb b/recipes/ti/matrix-gui-e_svn.bb
deleted file mode 100644
index 5570d92..0000000
--- a/recipes/ti/matrix-gui-e_svn.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-DESCRIPTION = "Matrix GUI for Qt Embedded"
-HOMEPAGE = "https://gforge.ti.com/gf/project/matrix_gui/"
-LICENSE = "BSD"
-SECTION = "multimedia"
-PRIORITY = "optional"
-
-SRCREV = "136"
-PV = "1.1"
-PR = "r18+svnr${SRCPV}"
-
-PLATFORM_dm365 = "dm365"
-PLATFORM_da850-omapl138-evm = "omapl138"
-PLATFORM_omap3evm = "omap3530"
-PLATFORM_dm37x-evm = "dm3730"
-PLATFORM_am37x-evm = "am3715"
-PLATFORM_beagleboard = "am3715"
-PLATFORM ?= "<UNDEFINED>"
-
-SRC_URI = "svn://gforge.ti.com/svn/matrix_gui/;module=trunk;proto=https;user=anonymous;pswd='' "
-
-S = "${WORKDIR}/trunk"
-
-INITSCRIPT_NAME = "matrix-gui-e"
-INITSCRIPT_PARAMS = "defaults 99"
-#INITSCRIPT_PARAMS = "start 99 3 . stop 99 3 ."
-
-CXXFLAGS_da850-omapl138-evm_append = " -DPlatform_omapl138 "
-CXXFLAGS_dm365_append = " -DPlatform_dm365 "
-PACKAGE_ARCH = ${MACHINE_ARCH}
-
-inherit qt4e update-rc.d
-
-do_install() {
-	install -d ${D}/${bindir}
-	install -m 0755 ${S}/matrix_gui ${D}/${bindir}/matrix_guiE
-	install -d ${D}${sysconfdir}/init.d/
-	install -c -m 0755 ${S}/${PLATFORM}/etc/init ${D}${sysconfdir}/init.d/matrix-gui-e
-
-}
-
-RRECOMMENDS_${PN} = "qt4-embedded-plugin-mousedriver-tslib qt4-embedded-fonts"
-RDEPENDS_${PN} += "matrix-gui-common"
-- 
1.7.0.4



