Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P1Nq5-0001xd-8R
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 20:26:42 +0200
Received: by yxg6 with SMTP id 6so919398yxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Sep 2010 11:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=kpwQDRay3tdcD6oKgRTtGymTUPkajDdKcaQTrZirjBI=;
	b=wygkjfMP6zr9L/SqddoUw+pq4PJUZjwvyureDZpR/f4AhEamvAOIaak8SohqS3XSlI
	J4YPYRKjKfph70c3bTJJyS3Qya/dHkytP2wlr/0hTLP0sopUXWaoDTkYZdiuF4e99End
	NI34h3/bH+la8C7WXZx6+6Y15fYmyGZ6ZLcrY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=XlAx/40VqRnG7J583gtSOxQSwXR+tyVUhk6FnO1uvWd47cX/v8F1/5roB5z9zxTp3I
	/8wrlqEOtmCezFtMhh1HTV1VMuOajVZGNm7uOG6Im7YTI/c1I7Zsm5l28lNik6xo6NYW
	UgnpyerbJP3neJ8pBG1sSIV+igMPRNEYqLlGA=
Received: by 10.220.161.201 with SMTP id s9mr1060674vcx.137.1285871180514;
	Thu, 30 Sep 2010 11:26:20 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id r15sm173572vbp.0.2010.09.30.11.26.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 30 Sep 2010 11:26:19 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Sep 2010 13:12:05 -0500
Message-Id: <1285870326-27944-4-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1285870326-27944-1-git-send-email-chase.maupin@ti.com>
References: <1285870326-27944-1-git-send-email-chase.maupin@ti.com>
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 4/5] matrix-gui: make versioned recipes
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
X-List-Received-Date: Thu, 30 Sep 2010 18:26:42 -0000

* Abstracted common code to .inc file
* Made versioned recipe for version 1.1 and 1.2
* Removed _svn version of the recipe

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 recipes/ti/matrix-gui.inc    |   43 ++++++++++++++++++++++++++++++++++++++++
 recipes/ti/matrix-gui_1.1.bb |    7 ++++++
 recipes/ti/matrix-gui_1.2.bb |    5 ++++
 recipes/ti/matrix-gui_svn.bb |   45 ------------------------------------------
 4 files changed, 55 insertions(+), 45 deletions(-)
 create mode 100644 recipes/ti/matrix-gui.inc
 create mode 100644 recipes/ti/matrix-gui_1.1.bb
 create mode 100644 recipes/ti/matrix-gui_1.2.bb
 delete mode 100644 recipes/ti/matrix-gui_svn.bb

diff --git a/recipes/ti/matrix-gui.inc b/recipes/ti/matrix-gui.inc
new file mode 100644
index 0000000..afdd96a
--- /dev/null
+++ b/recipes/ti/matrix-gui.inc
@@ -0,0 +1,43 @@
+DESCRIPTION = "Matrix GUI for Qt X11"
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
+CXXFLAGS_da850-omapl138-evm_append = " -DPlatform_omapl138 "
+CXXFLAGS_dm365_append = " -DPlatform_dm365 "
+PACKAGE_ARCH = ${MACHINE_ARCH}
+
+inherit qt4x11
+
+do_install() {
+	install -d ${D}/${bindir}
+	install -m 0755 ${S}/matrix_gui ${D}/${bindir}
+	install -d ${D}${sysconfdir}/init.d/
+	install -c -m 0755 ${S}/${PLATFORM}/etc/x11/init ${D}${sysconfdir}/init.d/matrix-gui
+	install -d ${D}/${sysconfdir}/xdg/autostart
+	install -m 0755 ${S}/${PLATFORM}/etc/x11/matrix-gui.desktop ${D}/${sysconfdir}/xdg/autostart
+}
+
+FILES_${PN}-autostart = "${sysconfdir}/xdg/autostart/matrix-gui.desktop"
+
+#Make autostart package depend on matrix-gui package.  Doesn't make sense
+#to install the autostart package without the underlying matrix-gui package.
+RDEPENDS_${PN}-autostart += "${PN}"
+PACKAGES =+ "${PN}-autostart"
+
+RDEPENDS_${PN} += "matrix-gui-common"
diff --git a/recipes/ti/matrix-gui_1.1.bb b/recipes/ti/matrix-gui_1.1.bb
new file mode 100644
index 0000000..22a8b86
--- /dev/null
+++ b/recipes/ti/matrix-gui_1.1.bb
@@ -0,0 +1,7 @@
+require matrix-gui.inc
+
+COMPATIBLE_MACHINE = "(dm365|omapl138|omap3)"
+
+SRCREV = "136"
+PV = "1.1"
+PR = "r17"
diff --git a/recipes/ti/matrix-gui_1.2.bb b/recipes/ti/matrix-gui_1.2.bb
new file mode 100644
index 0000000..486fd2d
--- /dev/null
+++ b/recipes/ti/matrix-gui_1.2.bb
@@ -0,0 +1,5 @@
+require matrix-gui.inc
+
+SRCREV = "146"
+PV = "1.2"
+PR = "r0"
diff --git a/recipes/ti/matrix-gui_svn.bb b/recipes/ti/matrix-gui_svn.bb
deleted file mode 100644
index f52294d..0000000
--- a/recipes/ti/matrix-gui_svn.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-DESCRIPTION = "Matrix GUI for Qt X11"
-HOMEPAGE = "https://gforge.ti.com/gf/project/matrix_gui/"
-LICENSE = "BSD"
-SECTION = "multimedia"
-PRIORITY = "optional"
-
-SRCREV = "136"
-PV = "1.1"
-PR = "r16+svnr${SRCPV}"
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
-CXXFLAGS_da850-omapl138-evm_append = " -DPlatform_omapl138 "
-CXXFLAGS_dm365_append = " -DPlatform_dm365 "
-PACKAGE_ARCH = ${MACHINE_ARCH}
-
-inherit qt4x11
-
-do_install() {
-	install -d ${D}/${bindir}
-	install -m 0755 ${S}/matrix_gui ${D}/${bindir}
-	install -d ${D}${sysconfdir}/init.d/
-	install -c -m 0755 ${S}/${PLATFORM}/etc/x11/init ${D}${sysconfdir}/init.d/matrix-gui
-	install -d ${D}/${sysconfdir}/xdg/autostart
-	install -m 0755 ${S}/${PLATFORM}/etc/x11/matrix-gui.desktop ${D}/${sysconfdir}/xdg/autostart
-}
-
-FILES_${PN}-autostart = "${sysconfdir}/xdg/autostart/matrix-gui.desktop"
-
-#Make autostart package depend on matrix-gui package.  Doesn't make sense
-#to install the autostart package without the underlying matrix-gui package.
-RDEPENDS_${PN}-autostart += "${PN}"
-PACKAGES =+ "${PN}-autostart"
-
-RDEPENDS_${PN} += "matrix-gui-common"
-- 
1.7.0.4



