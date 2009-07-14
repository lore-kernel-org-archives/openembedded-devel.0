Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1MQYQE-0001zs-DE
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jul 2009 05:11:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 91872351066;
	Mon, 13 Jul 2009 22:57:59 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14661-01; Mon, 13 Jul 2009 22:57:59 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 63CFF34F64E; Mon, 13 Jul 2009 22:57:59 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id E0EA4350B26;
	Mon, 13 Jul 2009 22:57:57 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id DA871A44337; Mon, 13 Jul 2009 22:57:57 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Jul 2009 22:57:39 -0400
Message-Id: <1247540261-4537-2-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
In-Reply-To: <1247540261-4537-1-git-send-email-msmith@cbnco.com>
References: <1247540261-4537-1-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH 2/4] mesa-dri: set PACKAGE_ARCH to ${MACHINE}
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
X-List-Received-Date: Tue, 14 Jul 2009 03:11:14 -0000

${MACHINE_DRI_MODULES} is passed to configure, so the package output
depends on MACHINE. As foretold by commit f06119fc :)

Also switch to INC_PR and fix built of mesa-xprogs when prefix != /usr.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/mesa/mesa-common.inc |   10 +++++++++-
 recipes/mesa/mesa-dri_7.2.bb |    7 +------
 recipes/mesa/mesa-dri_7.4.bb |    7 +------
 recipes/mesa/mesa-dri_git.bb |    3 +--
 4 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/recipes/mesa/mesa-common.inc b/recipes/mesa/mesa-common.inc
index 9cd10eb..4f18c2f 100644
--- a/recipes/mesa/mesa-common.inc
+++ b/recipes/mesa/mesa-common.inc
@@ -4,6 +4,8 @@ DESCRIPTION = "An open source implementation of the OpenGL spec"
 HOMEPAGE = "http://mesa3d.org"
 LICENSE = "MIT"
 
+INC_PR = "r7"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/mesa3d/MesaLib-${PV}.tar.bz2 \
            ${SOURCEFORGE_MIRROR}/mesa3d/MesaDemos-${PV}.tar.bz2 "
 S = "${WORKDIR}/Mesa-${PV}"
@@ -20,6 +22,9 @@ EXTRA_OECONF = "--enable-glu \
 require mesa-tls.inc
 EXTRA_OECONF += "${@get_tls_setting(bb, d)} "
 
+# Package contents vary according to ${MACHINE_DRI_MODULES}.
+PACKAGE_ARCH = "${MACHINE}"
+
 PACKAGES =+ "libglu libglu-dev libosmesa libosmesa-dev libgl libgl-dev"
 FILES_libgl = "${libdir}/libGL.so.*"
 FILES_libglu = "${libdir}/libGLU.so.*"
@@ -36,4 +41,7 @@ do_stage() {
 		cp -pPr ${S}/include/GL/internal* ${STAGING_INCDIR}/GL/
 }
 
-
+do_install_append () {
+    install -d ${D}/${bindir}
+    install -m 0755 ${S}/progs/xdemos/{glxdemo,glxgears,glxheads,glxinfo} ${D}/${bindir}
+}
diff --git a/recipes/mesa/mesa-dri_7.2.bb b/recipes/mesa/mesa-dri_7.2.bb
index 296a254..9356843 100644
--- a/recipes/mesa/mesa-dri_7.2.bb
+++ b/recipes/mesa/mesa-dri_7.2.bb
@@ -6,7 +6,7 @@ LIB_DEPS = "libdrm virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
 DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS}"
 
 PE = "1"
-PR = "r6"
+PR = "${INC_PR}.0"
 
 # most of our targets do not have DRI so will use mesa-xlib
 DEFAULT_PREFERENCE = "-1"
@@ -21,8 +21,3 @@ FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
 FILES_${PN}-xprogs = "${bindir}/glxdemo ${bindir}/glxgears ${bindir}/glxheads ${bindir}/glxinfo"
 
 EXTRA_OECONF += "--with-driver=dri --with-dri-drivers=swrast,${MACHINE_DRI_MODULES}"
-
-do_install_append () {
-    install -d ${D}/usr/bin
-    install -m 0755 ${S}/progs/xdemos/{glxdemo,glxgears,glxheads,glxinfo} ${D}/usr/bin/
-}
diff --git a/recipes/mesa/mesa-dri_7.4.bb b/recipes/mesa/mesa-dri_7.4.bb
index 296a254..9356843 100644
--- a/recipes/mesa/mesa-dri_7.4.bb
+++ b/recipes/mesa/mesa-dri_7.4.bb
@@ -6,7 +6,7 @@ LIB_DEPS = "libdrm virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
 DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS}"
 
 PE = "1"
-PR = "r6"
+PR = "${INC_PR}.0"
 
 # most of our targets do not have DRI so will use mesa-xlib
 DEFAULT_PREFERENCE = "-1"
@@ -21,8 +21,3 @@ FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
 FILES_${PN}-xprogs = "${bindir}/glxdemo ${bindir}/glxgears ${bindir}/glxheads ${bindir}/glxinfo"
 
 EXTRA_OECONF += "--with-driver=dri --with-dri-drivers=swrast,${MACHINE_DRI_MODULES}"
-
-do_install_append () {
-    install -d ${D}/usr/bin
-    install -m 0755 ${S}/progs/xdemos/{glxdemo,glxgears,glxheads,glxinfo} ${D}/usr/bin/
-}
diff --git a/recipes/mesa/mesa-dri_git.bb b/recipes/mesa/mesa-dri_git.bb
index bca681c..4ca1b73 100644
--- a/recipes/mesa/mesa-dri_git.bb
+++ b/recipes/mesa/mesa-dri_git.bb
@@ -6,7 +6,7 @@ LIB_DEPS = "libdrm virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
 DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS}"
 
 PV = "7.2+gitr${SRCREV}"
-PR = "r1"
+PR = "${INC_PR}.0"
 PE = "1"
 
 DEFAULT_PREFERENCE = "-1"
@@ -18,4 +18,3 @@ FILES_${PN} += "${libdir}/dri/*.so"
 FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
 
 EXTRA_OECONF += "--with-driver=dri --with-dri-drivers=swrast,${MACHINE_DRI_MODULES}"
-
-- 
1.6.3



