Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P1NqF-0001xd-Uz
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 20:26:55 +0200
Received: by mail-yx0-f175.google.com with SMTP id 6so919398yxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Sep 2010 11:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=gEI5IiSkMW5ieYPZdt1p3FVvHOwsvfHd5ltwEaxCDm0=;
	b=kUO8tfH1yn4sSnnZec+xXtL/p/FF7aotTqKYGWWe7rmlIWe4sE+yiDm9P8G1nJqs5R
	3d66LBGQJIONpdt4Ei6NMCy0hfrBqg435+UvQBzuK3enJ6C2IwipyR326T2nfBmLwuLB
	2+TVs9zZd8yXk3BVIpyGVhZxgD98gMxFSzA/8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=vLydtTO/KEleWUUvLNb+U/dHD6hiETNP8zBEp3kgPaduvYSdJOlIrbArD9XgryYkYl
	kGAPIEvgU33fXaBDm1D8Z4lV8DVnp0Ny1atbBenlCgwPnZCvdK8PmB5de6U7pHdnJnfu
	znn916gHChJGrBtYBHMIBtCOzEluUvZ9WpptM=
Received: by 10.220.62.199 with SMTP id y7mr1063840vch.51.1285871199958;
	Thu, 30 Sep 2010 11:26:39 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id r15sm173572vbp.0.2010.09.30.11.26.38
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 30 Sep 2010 11:26:39 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Sep 2010 13:12:06 -0500
Message-Id: <1285870326-27944-5-git-send-email-chase.maupin@ti.com>
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
Subject: [PATCH 5/5] matrix-tui: create versioned matrix-tui recipe
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
X-List-Received-Date: Thu, 30 Sep 2010 18:26:55 -0000

* Created matrix-tui.inc to abstract the common recipe
  functionality.
* Created the matrix-tui_1.0.bb recipe in place of the
  matrix-tui_svn.bb recipe.
* This is to allow for multiple versions of this recipe
  to exist.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 recipes/ti/matrix-tui.inc    |   42 ++++++++++++++++++++++++++++++++++++++
 recipes/ti/matrix-tui_1.0.bb |    5 ++++
 recipes/ti/matrix-tui_svn.bb |   46 ------------------------------------------
 3 files changed, 47 insertions(+), 46 deletions(-)
 create mode 100644 recipes/ti/matrix-tui.inc
 create mode 100644 recipes/ti/matrix-tui_1.0.bb
 delete mode 100644 recipes/ti/matrix-tui_svn.bb

diff --git a/recipes/ti/matrix-tui.inc b/recipes/ti/matrix-tui.inc
new file mode 100644
index 0000000..c8fd70d
--- /dev/null
+++ b/recipes/ti/matrix-tui.inc
@@ -0,0 +1,42 @@
+DESCRIPTION = "Matrix TUI"
+HOMEPAGE = "https://gforge.ti.com/gf/project/matrix_tui/"
+LICENSE = "BSD"
+SECTION = "multimedia"
+PRIORITY = "optional"
+DEPENDS = "libxml2 zlib ncurses"
+
+INSANE_SKIP_${PN} = "True"
+
+SRC_URI = "svn://gforge.ti.com/svn/matrix_tui/;module=trunk;proto=https;user=anonymous;pswd='' \
+	file://init \
+"
+
+S = "${WORKDIR}/trunk"
+
+# Do not auto-start TUI by default, uncomment otherwise
+#inherit update-rc.d
+#INITSCRIPT_NAME = "matrix-tui"
+#INITSCRIPT_PARAMS = "defaults 99"
+
+do_configure() {
+	sed -i -e 's:PATH=${LINUX_DEVKIT_PATH}/arm-none-linux-gnueabi:PATH ?= ${LINUX_DEVKIT_PATH}/arm-none-linux-gnueabi:' makefile.init
+	sed -i -e 's|LIBS :=|LIBS := ${LDFLAGS} |' Release/objects.mk
+}
+
+do_compile() {
+	# don't build debug version
+	touch debug
+	export CROSS_COMPILE=${TARGET_PREFIX}
+	export TUI_INCLUDE_PATH=${STAGING_INCDIR}
+	export XML_INCLUDE_PATH=${STAGING_INCDIR}/libxml2
+	export TUI_LIB_PATH=${STAGING_LIBDIR}
+	make release
+}
+
+do_install() {
+	make DESTDIR=${D} install
+	install -d ${D}${sysconfdir}/init.d/
+	install -c -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/matrix-tui
+}
+
+FILES_${PN} += "${datadir}/matrix/*"
diff --git a/recipes/ti/matrix-tui_1.0.bb b/recipes/ti/matrix-tui_1.0.bb
new file mode 100644
index 0000000..c82dc14
--- /dev/null
+++ b/recipes/ti/matrix-tui_1.0.bb
@@ -0,0 +1,5 @@
+require matrix-tui.inc
+
+SRCREV = "29"
+PV = "1.0"
+PR = "r4"
diff --git a/recipes/ti/matrix-tui_svn.bb b/recipes/ti/matrix-tui_svn.bb
deleted file mode 100644
index 4a223e4..0000000
--- a/recipes/ti/matrix-tui_svn.bb
+++ /dev/null
@@ -1,46 +0,0 @@
-DESCRIPTION = "Matrix TUI"
-HOMEPAGE = "https://gforge.ti.com/gf/project/matrix_tui/"
-LICENSE = "BSD"
-SECTION = "multimedia"
-PRIORITY = "optional"
-DEPENDS = "libxml2 zlib ncurses"
-
-SRCREV = "29"
-PV = "1.0"
-PR = "r3+svnr${SRCPV}"
-
-INSANE_SKIP_${PN} = "True"
-
-SRC_URI = "svn://gforge.ti.com/svn/matrix_tui/;module=trunk;proto=https;user=anonymous;pswd='' \
-	file://init \
-"
-
-S = "${WORKDIR}/trunk"
-
-# Do not auto-start TUI by default, uncomment otherwise
-#inherit update-rc.d
-#INITSCRIPT_NAME = "matrix-tui"
-#INITSCRIPT_PARAMS = "defaults 99"
-
-do_configure() {
-	sed -i -e 's:PATH=${LINUX_DEVKIT_PATH}/arm-none-linux-gnueabi:PATH ?= ${LINUX_DEVKIT_PATH}/arm-none-linux-gnueabi:' makefile.init
-	sed -i -e 's|LIBS :=|LIBS := ${LDFLAGS} |' Release/objects.mk
-}
-
-do_compile() {
-	# don't build debug version
-	touch debug
-	export CROSS_COMPILE=${TARGET_PREFIX}
-	export TUI_INCLUDE_PATH=${STAGING_INCDIR}
-	export XML_INCLUDE_PATH=${STAGING_INCDIR}/libxml2
-	export TUI_LIB_PATH=${STAGING_LIBDIR}
-	make release
-}
-
-do_install() {
-	make DESTDIR=${D} install
-	install -d ${D}${sysconfdir}/init.d/
-	install -c -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/matrix-tui
-}
-
-FILES_${PN} += "${datadir}/matrix/*"
-- 
1.7.0.4



