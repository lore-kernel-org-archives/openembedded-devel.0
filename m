Received: from mail-ea0-f182.google.com ([209.85.215.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR0nh-0007WB-Ae
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 15:47:30 +0200
Received: by mail-ea0-f182.google.com with SMTP id q15so1630577ead.41
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 06:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=o4RGpT2ewMAEJufNywOH+1CtvQmtNkVWHrSCNV4A47Y=;
	b=PedfIg+6e7sHJw4sRSuwJJ1lvYfjJblRKhDcihfafO0yu+SHLuH9cAcInnBq+rtmca
	k/8kTVNhUxIRQrFHl4Zvs8Fy9l39lH2hjhK2mUHO69xSVhWM8GWwEObdgbVVE3UB3uk1
	jD2+Rv9lRce6lVnhFXg9CyM02oz07zpgEU5D5tky0EcM/Hsi/TaGRDbUm9u7RifYktYp
	46R8a5iK88Xo28X01xTiYCCT89gYXp9HrbLTnP+3kR+KOJCjRvdNlk37fv9QITmmlT7Z
	84HPSHr2Pnj+taU67lEpdLwAgn4q5E6bQMqeTHN+94P6SU7KUeiJQ9UcJsGK3RcvO/0v
	2DRA==
X-Received: by 10.14.107.69 with SMTP id n45mr39523421eeg.23.1365859803550;
	Sat, 13 Apr 2013 06:30:03 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id r48sm11808465eeg.2.2013.04.13.06.30.02
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 06:30:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 15:29:28 +0200
Message-Id: <1365859790-20947-11-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 11/33] yp-tools, ypbind-mt: move systemd support from meta-systemd back to meta-networking
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
X-List-Received-Date: Sat, 13 Apr 2013 13:48:02 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../nis/yp-tools}/domainname.service               |  0
 .../recipes-support/nis/yp-tools_2.12.bb           | 18 +++++++++++++++--
 .../recipes-support/nis/ypbind-mt}/ypbind.service  |  0
 .../recipes-support/nis/ypbind-mt_1.36.bb          | 23 +++++++++++++++++-----
 .../recipes-support/nis/yp-tools_2.12.bbappend     | 19 ------------------
 .../recipes-support/nis/ypbind-mt_1.36.bbappend    | 17 ----------------
 6 files changed, 34 insertions(+), 43 deletions(-)
 rename {meta-systemd/meta-networking/recipes-support/nis/files => meta-networking/recipes-support/nis/yp-tools}/domainname.service (100%)
 rename {meta-systemd/meta-networking/recipes-support/nis/files => meta-networking/recipes-support/nis/ypbind-mt}/ypbind.service (100%)
 delete mode 100644 meta-systemd/meta-networking/recipes-support/nis/yp-tools_2.12.bbappend
 delete mode 100644 meta-systemd/meta-networking/recipes-support/nis/ypbind-mt_1.36.bbappend

diff --git a/meta-systemd/meta-networking/recipes-support/nis/files/domainname.service b/meta-networking/recipes-support/nis/yp-tools/domainname.service
similarity index 100%
rename from meta-systemd/meta-networking/recipes-support/nis/files/domainname.service
rename to meta-networking/recipes-support/nis/yp-tools/domainname.service
diff --git a/meta-networking/recipes-support/nis/yp-tools_2.12.bb b/meta-networking/recipes-support/nis/yp-tools_2.12.bb
index fb7ebc2..8593c6b 100644
--- a/meta-networking/recipes-support/nis/yp-tools_2.12.bb
+++ b/meta-networking/recipes-support/nis/yp-tools_2.12.bb
@@ -1,7 +1,7 @@
 # This package builds tools to manage NIS
 # The source package is utils/net/NIS/yp-tools
 #
-PR = "r0"
+PR = "r3"
 DESCRIPTION="\
 Network Information Service tools.  \
 This package contains ypcat, ypmatch, ypset, \
@@ -9,9 +9,23 @@ ypwhich, yppasswd, domainname, nisdomainname \
 and ypdomainname."
 
 require nis.inc
-SRC_URI = "http://www.linux-nis.org/download/yp-tools/${BP}.tar.bz2"
+SRC_URI = "http://www.linux-nis.org/download/yp-tools/${BP}.tar.bz2 \
+           file://domainname.service \
+"
 
 SRC_URI[md5sum] = "ce1e06d86caa285fa8cd76fdf103f51e"
 SRC_URI[sha256sum] = "6ae8321666eea7837da343eea90ea30273fb74943ad111d5a4befd2afb252063"
 
 CACHED_CONFIGUREVARS += "ac_cv_prog_STRIP=/bin/true"
+
+inherit systemd
+
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "domainname.service"
+
+do_install_append() {
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/domainname.service ${D}${systemd_unitdir}/system
+}
diff --git a/meta-systemd/meta-networking/recipes-support/nis/files/ypbind.service b/meta-networking/recipes-support/nis/ypbind-mt/ypbind.service
similarity index 100%
rename from meta-systemd/meta-networking/recipes-support/nis/files/ypbind.service
rename to meta-networking/recipes-support/nis/ypbind-mt/ypbind.service
diff --git a/meta-networking/recipes-support/nis/ypbind-mt_1.36.bb b/meta-networking/recipes-support/nis/ypbind-mt_1.36.bb
index e2f654c..fee934d 100644
--- a/meta-networking/recipes-support/nis/ypbind-mt_1.36.bb
+++ b/meta-networking/recipes-support/nis/ypbind-mt_1.36.bb
@@ -1,7 +1,7 @@
 # This package builds the NIS ypbind daemon
 # The source package is utils/net/NIS/ypbind-mt
 #
-PR = "r0"
+PR = "r3"
 DESCRIPTION="\
 Multithreaded NIS bind service (ypbind-mt).  \
 ypbind-mt is a complete new implementation of a NIS \
@@ -14,12 +14,15 @@ of known secure NIS server (/etc/yp.conf) Binds to \
 the server which answered as first."
 HOMEPAGE="http://www.linux-nis.org/nis/ypbind-mt/index.html"
 
+LIC_FILES_CHKSUM = "file://COPYING;md5=082c9a0886c7c3db1bc862b5b62ffe08"
+
 require nis.inc
 
-SRC_URI = "http://www.linux-nis.org/download/ypbind-mt/${BP}.tar.bz2"
+SRC_URI = "http://www.linux-nis.org/download/ypbind-mt/${BP}.tar.bz2 \
+           file://ypbind-yocto.init \
+           file://ypbind.service \
+"
 SRC_URI[md5sum] = "135834db97d78ff6d79fdee2810b4056"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=082c9a0886c7c3db1bc862b5b62ffe08"
 SRC_URI[sha256sum] = "0eff76c1849f4b38ea1a60280d8397c4240369c641fe5402ce57edf1a90958c7"
 
 # ypbind-mt now provides all the functionality of ypbind
@@ -27,7 +30,6 @@ SRC_URI[sha256sum] = "0eff76c1849f4b38ea1a60280d8397c4240369c641fe5402ce57edf1a9
 PROVIDES += "ypbind"
 
 CACHED_CONFIGUREVARS = "ac_cv_prog_STRIP=/bin/true"
-SRC_URI += "file://ypbind-yocto.init"
 
 do_install_append () {
     install -d ${D}${sysconfdir}/init.d
@@ -35,5 +37,16 @@ do_install_append () {
 
     install -m 0755 ${WORKDIR}/ypbind-yocto.init ${D}${sysconfdir}/init.d/ypbind
 
+    # TODO, use update-rc.d
     ln -s ../init.d/ypbind ${D}${sysconfdir}/rcS.d/S44ypbind
+
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/ypbind.service ${D}${systemd_unitdir}/system
 }
+
+inherit systemd
+
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "ypbind.service"
diff --git a/meta-systemd/meta-networking/recipes-support/nis/yp-tools_2.12.bbappend b/meta-systemd/meta-networking/recipes-support/nis/yp-tools_2.12.bbappend
deleted file mode 100644
index d5ea1ca..0000000
--- a/meta-systemd/meta-networking/recipes-support/nis/yp-tools_2.12.bbappend
+++ /dev/null
@@ -1,19 +0,0 @@
-inherit systemd
-
-PRINC := "${@int(PRINC) + 2}"
-
-# look for files in the layer first
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
-
-SRC_URI += "file://domainname.service"
-
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "domainname.service"
-
-do_install_append() {
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/domainname.service ${D}${systemd_unitdir}/system
-}
-
diff --git a/meta-systemd/meta-networking/recipes-support/nis/ypbind-mt_1.36.bbappend b/meta-systemd/meta-networking/recipes-support/nis/ypbind-mt_1.36.bbappend
deleted file mode 100644
index 8f11247..0000000
--- a/meta-systemd/meta-networking/recipes-support/nis/ypbind-mt_1.36.bbappend
+++ /dev/null
@@ -1,17 +0,0 @@
-inherit systemd
-
-PRINC := "${@int(PRINC) + 2}"
-
-# look for files in the layer first
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
-
-SRC_URI += "file://ypbind.service"
-
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "ypbind.service"
-do_install_append() {
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/ypbind.service ${D}${systemd_unitdir}/system
-}
-- 
1.8.1.5



