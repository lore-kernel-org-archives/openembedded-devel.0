Return-Path: <martri@arantia.com>
X-Greylist: delayed 582 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 19 May 2016 06:56:21 UTC
Received: from mailext0.televes.com (mailext0.televes.com [212.163.42.140])
	by mail.openembedded.org (Postfix) with ESMTP id A69326067C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 May 2016 06:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailext0.televes.com (Postfix) with ESMTP id E50F99A40FC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 May 2016 08:46:38 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at mailext0.televes.com
Received: from mailext0.televes.com ([127.0.0.1])
	by localhost (mailext0.televes.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id WYNrq3XFz-6w
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 May 2016 08:46:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mailext0.televes.com (Postfix) with ESMTP id A42819A4081
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 May 2016 08:46:38 +0200 (CEST)
Received: from tves0.televes.com (tvesbackup0 [212.163.42.137])
	by mailext0.televes.com (Postfix) with ESMTP id 8EE8F9A3E0C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 May 2016 08:46:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by tves0.televes.com (Postfix) with ESMTP id 88303F04B900F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 May 2016 08:46:38 +0200 (CEST)
Received: from arantia1.arantia.com (ARANTIA0.televes.com [192.168.178.2])
	by tves0.televes.com (Postfix) with ESMTP id 84617F02ADBFC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 May 2016 08:46:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by arantia1.arantia.com (Postfix) with ESMTP id 6F9EB15FE1EA;
	Thu, 19 May 2016 08:46:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by arantia1.arantia.com (Postfix) with ESMTP id 4D1681BF37DF;
	Thu, 19 May 2016 08:46:38 +0200 (CEST)
Received: from arantia1.arantia.com ([127.0.0.1])
	by localhost (arantia0 [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 24667-06; Thu, 19 May 2016 08:46:37 +0200 (CEST)
Received: from 246-SERVER.televes.com (unknown [192.168.178.246])
	by arantia1.arantia.com (Postfix) with ESMTP id 7A4C215FE1EA;
	Thu, 19 May 2016 08:46:37 +0200 (CEST)
From: Marco Trillo <martri@arantia.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 May 2016 08:46:33 +0200
Message-Id: <1463640393-17008-1-git-send-email-martri@arantia.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-webserver][PATCH] sthttpd: update to 2.27.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 May 2016 06:56:24 -0000

Update sthttpd to release 2.27.0.

The variable WEBGROUP is introduced to allow configuring the group used
for the special ${sbindir}/makeweb tool, which in 2.27.0 is installed
setgid to this group by default, whereas in 2.26.4 it was not.
sthttpd 2.27 uses `thttpd' as the default value; here, the more
standard `www-data' group is used by default.

---
 .../recipes-httpd/sthttpd/sthttpd_2.26.4.bb        | 45 -------------------
 .../recipes-httpd/sthttpd/sthttpd_2.27.0.bb        | 52 ++++++++++++++++++++++
 2 files changed, 52 insertions(+), 45 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/sthttpd/sthttpd_2.26.4.bb
 create mode 100644 meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.0.bb

diff --git a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.26.4.bb b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.26.4.bb
deleted file mode 100644
index 7034921..0000000
--- a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.26.4.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-SUMMARY = "A simple, small, portable, fast, and secure HTTP server"
-DESCRIPTION = "A simple, small, portable, fast, and secure HTTP server (supported fork of thttpd)."
-HOMEPAGE = "http://opensource.dyc.edu/sthttpd"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://src/thttpd.c;beginline=1;endline=26;md5=0c5762c2c34dcbe9eb18815516502872"
-
-SRC_URI = "http://opensource.dyc.edu/pub/sthttpd/sthttpd-${PV}.tar.gz \
-           file://thttpd.service \
-           file://thttpd.conf \
-           file://init"
-
-SRC_URI[md5sum] = "e645a85a97d3cb883011a35bc2211815"
-SRC_URI[sha256sum] = "78e87979140cbda123c81b4051552242dbbffb5dec1a17e5f95ec4826b1eaddb"
-
-S = "${WORKDIR}/sthttpd-${PV}"
-
-inherit autotools update-rc.d systemd
-
-SRV_DIR ?= "${servicedir}/www"
-
-EXTRA_OEMAKE += "'WEBDIR=${SRV_DIR}'"
-
-do_install_append () {
-    install -d ${D}${sysconfdir}/init.d
-    install -c -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/thttpd
-    install -c -m 755 ${WORKDIR}/thttpd.conf ${D}${sysconfdir}
-    sed -i -e 's,@@CONFFILE,${sysconfdir}/thttpd.conf,g' ${D}${sysconfdir}/init.d/thttpd
-    sed -i -e 's,@@SRVDIR,${SRV_DIR},g' ${D}${sysconfdir}/thttpd.conf
-    sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/thttpd
-
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/thttpd.service ${D}${systemd_unitdir}/system
-    sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${systemd_unitdir}/system/thttpd.service
-    sed -i 's!/var/!${localstatedir}/!g' ${D}${systemd_unitdir}/system/thttpd.service
-    sed -i -e 's,@@CONFFILE,${sysconfdir}/thttpd.conf,g' ${D}${systemd_unitdir}/system/thttpd.service
-}
-
-INITSCRIPT_NAME = "thttpd"
-INITSCRIPT_PARAMS = "defaults"
-
-SYSTEMD_SERVICE_${PN} = "thttpd.service"
-
-FILES_${PN} += "${SRV_DIR}"
-FILES_${PN}-dbg += "${SRV_DIR}/cgi-bin/.debug"
-
diff --git a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.0.bb b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.0.bb
new file mode 100644
index 0000000..efa533a
--- /dev/null
+++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.0.bb
@@ -0,0 +1,52 @@
+SUMMARY = "A simple, small, portable, fast, and secure HTTP server"
+DESCRIPTION = "A simple, small, portable, fast, and secure HTTP server (supported fork of thttpd)."
+HOMEPAGE = "http://opensource.dyc.edu/sthttpd"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://src/thttpd.c;beginline=1;endline=26;md5=0c5762c2c34dcbe9eb18815516502872"
+
+SRC_URI = "http://opensource.dyc.edu/pub/sthttpd/sthttpd-${PV}.tar.gz \
+           file://thttpd.service \
+           file://thttpd.conf \
+           file://init"
+
+SRC_URI[md5sum] = "f7dd2d506dc5fad2ad8794b1800d2634"
+SRC_URI[sha256sum] = "97d660a881331e93818e872ce11536f461105d70a18dfc5de5895851c4b2afdb"
+
+S = "${WORKDIR}/sthttpd-${PV}"
+
+inherit autotools update-rc.d systemd
+
+SRV_DIR ?= "${servicedir}/www"
+
+# Note that `${sbindir}/makeweb' is installed setgid to this group,
+# but ${SRV_DIR} is not installed chgrp'd to the group by default.
+WEBGROUP ?= "www-data"
+
+do_configure_prepend () {
+    export WEBDIR=${SRV_DIR}
+    export WEBGROUP=${WEBGROUP}
+}
+
+do_install_append () {
+    install -d ${D}${sysconfdir}/init.d
+    install -c -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/thttpd
+    install -c -m 755 ${WORKDIR}/thttpd.conf ${D}${sysconfdir}
+    sed -i -e 's,@@CONFFILE,${sysconfdir}/thttpd.conf,g' ${D}${sysconfdir}/init.d/thttpd
+    sed -i -e 's,@@SRVDIR,${SRV_DIR},g' ${D}${sysconfdir}/thttpd.conf
+    sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/thttpd
+
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/thttpd.service ${D}${systemd_unitdir}/system
+    sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${systemd_unitdir}/system/thttpd.service
+    sed -i 's!/var/!${localstatedir}/!g' ${D}${systemd_unitdir}/system/thttpd.service
+    sed -i -e 's,@@CONFFILE,${sysconfdir}/thttpd.conf,g' ${D}${systemd_unitdir}/system/thttpd.service
+}
+
+INITSCRIPT_NAME = "thttpd"
+INITSCRIPT_PARAMS = "defaults"
+
+SYSTEMD_SERVICE_${PN} = "thttpd.service"
+
+FILES_${PN} += "${SRV_DIR}"
+FILES_${PN}-dbg += "${SRV_DIR}/cgi-bin/.debug"
+
-- 
1.9.1



