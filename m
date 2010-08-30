Received: from mail.infocentr.ru ([78.108.66.4])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <norguhtar@gmail.com>) id 1Oq7XH-0004Ej-GG
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 18:48:44 +0200
Received: from localhost.localdomain (unknown [192.168.62.150])
	by mail.infocentr.ru (Postfix) with ESMTP id 4F489B0016E2;
	Mon, 30 Aug 2010 22:48:09 +0600 (YEKST)
From: Anatoly Shipitsin <norguhtar@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Aug 2010 22:47:58 +0600
Message-Id: <1283186879-971-3-git-send-email-norguhtar@gmail.com>
X-Mailer: git-send-email 1.6.0.6
In-Reply-To: <1283186879-971-2-git-send-email-norguhtar@gmail.com>
References: <1283186879-971-1-git-send-email-norguhtar@gmail.com>
	<1283186879-971-2-git-send-email-norguhtar@gmail.com>
X-SA-Exim-Connect-IP: 78.108.66.4
X-SA-Exim-Mail-From: norguhtar@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL,BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v3 3/4] update upstart.inc for fix upstart-sysvcompat
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
X-List-Received-Date: Mon, 30 Aug 2010 16:48:45 -0000

* change upstart-sysvtools to upstart-sysvcompat for right package build
* move all sysvcompat tools to upstart-sysvcompat
* add to upstart-sysvinit need for sysvcompat services from example-jobs
* add inherit update-alternatives for right set and switch between inits
* move base directory from /usr to /. This need for update-alternatives work right, see sysvinit recipe
* add generation native tty services, similary as in sysvinit recipe
* add update alternatives in upstart-sysvcompat and upstart packages

Signed-off-by: Anatoly Shipitsin <norguhtar@gmail.com>
---
 recipes/upstart/upstart.inc |  111 +++++++++++++++++++++++++++++++++++++++++--
 1 files changed, 107 insertions(+), 4 deletions(-)

diff --git a/recipes/upstart/upstart.inc b/recipes/upstart/upstart.inc
index e67774a..7512133 100644
--- a/recipes/upstart/upstart.inc
+++ b/recipes/upstart/upstart.inc
@@ -4,7 +4,7 @@ DEPENDS = ""
 DESCRIPTION = "Event driven system init"
 LICENSE = "GPL"
 
-inherit autotools pkgconfig 
+inherit autotools pkgconfig update-alternatives
 
 # --enable-compat builds halt, reboot, shutdown tools
 EXTRA_OECONF += "--enable-compat"
@@ -17,6 +17,109 @@ FILES_libupstart-dev += "${libdir}/libupstart.* ${includedir}/upstart/"
 
 # upstart-sysvcompat provides Sys V Init compatible tools: halt, reboot,
 # shutdown, telinit. These might be needed by other scripts.
-PACKAGES =+ "upstart-sysvcompat upstart-sysvtools-doc"
-FILES_upstart-sysvcompat += "${sbindir}/reboot ${sbindir}/halt ${sbindir}/shutdown ${sbindir}/telinit"
-FILES_upstart-sysvcompat-doc += "${mandir}/*/reboot.* ${mandir}/*/halt.* ${mandir}/*/shutdown.* ${mandir}/*/telinit.*"
+PACKAGES =+ "upstart-sysvcompat upstart-sysvcompat-doc"
+FILES_upstart-sysvcompat += " \
+    ${base_sbindir}/reboot.* ${base_sbindir}/halt.* ${base_sbindir}/poweroff.* \
+    ${base_sbindir}/shutdown.* ${base_sbindir}/telinit ${base_sbindir}/runlevel \
+    ${sysconfdir}/event.d/control-alt-delete \
+    ${sysconfdir}/event.d/rc* \
+    ${sysconfdir}/event.d/sulogin \
+    ${sysconfdir}/init.d \
+    ${sysconfdir}/default/rcS \
+"
+FILES_upstart-sysvcompat-doc += " \
+    ${mandir}/*/reboot.* ${mandir}/*/halt.* ${mandir}/*/poweroff.* \
+     ${mandir}/*/shutdown.* ${mandir}/*/telinit.* ${mandir}/*/runlevel.* \
+"
+
+ALTERNATIVE_NAME = "init"
+ALTERNATIVE_LINK = "${base_sbindir}/init"
+ALTERNATIVE_PATH = "${base_sbindir}/init.${PN}"
+ALTERNATIVE_PRIORITY = "60"
+
+EXTRA_OEMAKE += "'bindir=${base_bindir}' \
+		 'sbindir=${base_sbindir}' \
+		 'usrbindir=${bindir}' \
+		 'usrsbindir=${sbindir}' \
+		 'includedir=${includedir}' \
+		 'mandir=${mandir}'"
+
+do_install () {
+	oe_runmake 'DESTDIR=${D}' install
+	install -d ${D}${sysconfdir}
+	install -d ${D}${sysconfdir}/default
+	install -d ${D}${sysconfdir}/init.d
+
+	install -m 0644	${WORKDIR}/init/rcS-default	${D}${sysconfdir}/default/rcS
+	install -m 0755 ${WORKDIR}/init/rc		${D}${sysconfdir}/init.d
+	install -m 0755 ${WORKDIR}/init/rcS		${D}${sysconfdir}/init.d
+	install -m 0644 ${WORKDIR}/rc*			${D}${sysconfdir}/event.d
+	install -m 0644 ${WORKDIR}/control-alt-delete	${D}${sysconfdir}/event.d
+	install -m 0644 ${WORKDIR}/sulogin		${D}${sysconfdir}/event.d
+
+	if [ ! -z "${SERIAL_CONSOLE}" ]; then
+	     cat <<EOF >> ${D}${sysconfdir}/event.d/tty-serial
+# tty-serial - getty
+#
+# This service maintains a getty on tty-serial from the point the system is
+# started until it is shut down again.
+
+start on runlevel 2
+start on runlevel 3
+start on runlevel 4
+start on runlevel 5
+
+stop on runlevel 0
+stop on runlevel 1
+stop on runlevel 6
+
+respawn
+exec ${base_sbindir}/getty ${SERIAL_CONSOLE}
+EOF
+	fi
+	if [ "${USE_VT}" = "1" ]; then
+	    for n in ${SYSVINIT_ENABLED_GETTYS}
+	    do
+	     cat <<EOF >> ${D}${sysconfdir}/event.d/tty$n
+# tty$n - getty
+#
+# This service maintains a getty on tty$n from the point the system is
+# started until it is shut down again.
+
+start on runlevel 2
+start on runlevel 3
+start on runlevel 4
+start on runlevel 5
+
+stop on runlevel 0
+stop on runlevel 1
+stop on runlevel 6
+
+respawn
+exec ${base_sbindir}/getty 38400 tty$n
+EOF
+	    done
+	fi
+
+	mv ${D}${base_sbindir}/init	${D}${base_sbindir}/init.${PN}
+        mv ${D}${base_sbindir}/halt ${D}${base_sbindir}/halt.${PN}
+	mv ${D}${base_sbindir}/reboot ${D}${base_sbindir}/reboot.${PN}
+        mv ${D}${base_sbindir}/shutdown ${D}${base_sbindir}/shutdown.${PN}
+	mv ${D}${base_sbindir}/poweroff ${D}${base_sbindir}/poweroff.${PN}
+}
+
+pkg_postinst_${PN}-sysvcompat () {
+#!/bin/sh
+update-alternatives --install ${base_sbindir}/reboot reboot reboot.${PN} 200
+update-alternatives --install ${base_sbindir}/halt halt halt.${PN} 200
+update-alternatives --install ${base_sbindir}/poweroff poweroff poweroff.${PN} 200
+update-alternatives --install ${base_sbindir}/shutdown shutdown shutdown.${PN} 200
+}
+
+pkg_prerm_${PN}-sysvcompat () {
+#!/bin/sh
+update-alternatives --remove reboot reboot.${PN}
+update-alternatives --remove halt halt.${PN}
+update-alternatives --remove poweroff reboot.${PN}
+update-alternatives --remove shutdown shutdown.${PN}
+}
-- 
1.6.0.6



