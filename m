Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR0nb-0007Un-TX
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 15:47:30 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so1593005eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 06:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=SPWOFa9XhnQGD+SawapgK3wyUPT/C0vD1oMq2XgnmOM=;
	b=EXBwOAstE5aIbF5OvQ94Q2At4c6S9H3Eo4PXOcOOcUOW1XGb3dRYFtxIRqNgj8TFPx
	wTXyn4gQ4yWl0x2dWAVDcz2+vJjEd8cr/Q2k6E48SGlu3NvripcLz4n2DGA5qGdHWocy
	E5zq8YmUaSRRdKXZaX65hlgGVk3DT/fv8TsTwrelUkjWlPI+9t6AeBrsrLY9+sf8xl64
	z1WZKX2AOe1H6tqrC95EdfWaatAwZh48EXfh73E0v9h2PFQfgesMxWU/Ccp9L1wzMdVl
	CVOsOzlPaFl/7kPczmvFNzqQSDzS8NpFIVnlGSxO/lUsN5Nk4GfJnfk+ah5qE38wU219
	2QqQ==
X-Received: by 10.14.201.67 with SMTP id a43mr21935748eeo.33.1365859798254;
	Sat, 13 Apr 2013 06:29:58 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ca4sm16372352eeb.15.2013.04.13.06.29.57
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 06:29:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 15:29:24 +0200
Message-Id: <1365859790-20947-7-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 07/33] gdm: move systemd support from meta-systemd back to meta-gnome
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
X-List-Received-Date: Sat, 13 Apr 2013 13:47:43 -0000
X-List-Received-Date: Sat, 13 Apr 2013 13:47:43 -0000
X-List-Received-Date: Sat, 13 Apr 2013 13:47:43 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-gnome/gdm/gdm                            |  0
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb           | 17 +++++++++++------
 .../meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend | 20 --------------------
 3 files changed, 11 insertions(+), 26 deletions(-)
 rename meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/gdm.service.in => meta-gnome/recipes-gnome/gdm/gdm (100%)
 delete mode 100644 meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend

diff --git a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/gdm.service.in b/meta-gnome/recipes-gnome/gdm/gdm
similarity index 100%
rename from meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/gdm.service.in
rename to meta-gnome/recipes-gnome/gdm/gdm
diff --git a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
index 863db2e..45bddc8 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
@@ -4,9 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "xinput gnome-panel tcp-wrappers libcanberra libxklavier grep consolekit libpam gnome-doc-utils gtk+ xrdb"
 
-PR = "r10"
+PR = "r15"
 
-inherit gnome update-rc.d
+inherit gnome update-rc.d systemd
 
 SRC_URI += " \
             file://cross-xdetection.diff \
@@ -17,6 +17,7 @@ SRC_URI += " \
             file://gdm.conf \
             file://gdm-pam \
             file://Default \
+            file://gdm.service.in \
            "
 
 SRC_URI[archive.md5sum] = "dbe5187a2e17881cc454e313e0ae8d1e"
@@ -49,6 +50,10 @@ do_install_append() {
 	install -d ${D}/${sysconfdir}/gdm/Init
 	install -m 0755 ${WORKDIR}/Default ${D}/${sysconfdir}/gdm/Init
 
+	install -d ${D}${systemd_unitdir}/system
+	sed -e 's,%sbindir%,${sbindir},g' \
+		< ${WORKDIR}/gdm.service.in \
+		> ${D}${systemd_unitdir}/system/gdm.service
 }
 
 FILES_${PN} += "${datadir}/icon* \
@@ -60,6 +65,10 @@ RDEPENDS_${PN} += "grep dbus-x11 shadow"
 CONFFILES_${PN} += "${sysconfdir}/gdm/gdm.conf ${sysconfdir}/init.d/gdm"
 RRECOMMENDS_${PN} += "openssh-misc desktop-file-utils glib-2.0-utils metacity gnome-session polkit-gnome consolekit"
 
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "gdm.service"
+
 INITSCRIPT_NAME = "gdm"
 INITSCRIPT_PARAMS = "start 99 5 2 . stop 20 0 1 6 ."
 
@@ -87,7 +96,3 @@ pkg_postrm_${PN} () {
     delgroup gdm || true
 	sed -i /gdm/d ${sysconfdir}/X11/default-display-manager || true
 }
-
-
-
-
diff --git a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
deleted file mode 100644
index 6201352..0000000
--- a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
+++ /dev/null
@@ -1,20 +0,0 @@
-# look for files in the layer first
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-PRINC := "${@int(PRINC) + 4}"
-
-inherit systemd
-
-SRC_URI += "file://gdm.service.in"
-
-do_install_append() {
-	install -d ${D}${systemd_unitdir}/system
-	sed -e 's,%sbindir%,${sbindir},g' \
-		< ${WORKDIR}/gdm.service.in \
-		> ${D}${systemd_unitdir}/system/gdm.service
-}
-
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "gdm.service"
-- 
1.8.1.5



