Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id E6B60724AC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Dec 2014 11:00:25 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="44805688"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Dec 2014 18:57:06 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sBA94Pvt021033
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Dec 2014 17:04:26 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 10 Dec 2014 17:04:50 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 10 Dec 2014 17:01:28 +0800
Message-ID: <1418202088-36649-2-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1418202088-36649-1-git-send-email-biannm@cn.fujitsu.com>
References: <1418202088-36649-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [PATCH 1/1] drbd: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Dec 2014 11:00:28 -0000
Content-Type: text/plain

DRBD is a block device which is designed to build high availability clusters.

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 .../recipes-support/drbd/drbd/drbd.service         | 12 +++++
 meta-networking/recipes-support/drbd/drbd_8.4.4.bb | 58 ++++++++++++++++++++++
 meta-oe/recipes-extended/drbd/drbd_8.4.4.bb        | 57 ---------------------
 meta-oe/recipes-extended/drbd/files/drbd.service   | 12 -----
 4 files changed, 70 insertions(+), 69 deletions(-)
 create mode 100644 meta-networking/recipes-support/drbd/drbd/drbd.service
 create mode 100644 meta-networking/recipes-support/drbd/drbd_8.4.4.bb
 delete mode 100644 meta-oe/recipes-extended/drbd/drbd_8.4.4.bb
 delete mode 100644 meta-oe/recipes-extended/drbd/files/drbd.service

diff --git a/meta-networking/recipes-support/drbd/drbd/drbd.service b/meta-networking/recipes-support/drbd/drbd/drbd.service
new file mode 100644
index 0000000..6b6ab30
--- /dev/null
+++ b/meta-networking/recipes-support/drbd/drbd/drbd.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=DRBD Service
+After=network.target
+
+[Service]
+Type=oneshot
+RemainAfterExit=yes
+ExecStart=@LIBEXECDIR@/drbd-helper startxxx
+ExecStop=@LIBEXECDIR@/drbd-helper stop
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-support/drbd/drbd_8.4.4.bb b/meta-networking/recipes-support/drbd/drbd_8.4.4.bb
new file mode 100644
index 0000000..abf4554
--- /dev/null
+++ b/meta-networking/recipes-support/drbd/drbd_8.4.4.bb
@@ -0,0 +1,58 @@
+SUMMARY = "BD driver for Linux"
+DESCRIPTION = "DRBD mirrors a block device over the network to another machine.\
+DRBD mirrors a block device over the network to another machine.\
+Think of it as networked raid 1. It is a building block for\
+setting up high availability (HA) clusters."
+
+HOMEPAGE = "http://www.drbd.org/"
+SECTION = "kernel/userland"
+
+RDEPENDS_${PN} += "bash perl"
+
+LICENSE = "GPLv2+"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
+
+SRC_URI = "http://oss.linbit.com/${BPN}/8.4/${BPN}-${PV}.tar.gz \
+           file://drbd.service \
+          "
+
+#SRC_URI[md5sum] = "ef4e6db51cda1898c597a3d61fcb9e1e"
+#SRC_URI[sha256sum] = "7c1558459614fbdc1b3209f1b9e5767a443d9bdfe681a49c652b5f392799d58d"
+
+SRC_URI[md5sum] = "b51815343c1a9151e2936b3b97520388"
+SRC_URI[sha256sum] = "a056219c5c23b079c3354179f7a1b9f55d47e573a4cd3178f2ef4c15604288f0"
+
+inherit autotools-brokensep systemd
+
+EXTRA_OECONF = "--with-utils                  \
+                --without-km                  \
+                --with-initdir=/etc/init.d    \
+                --without-pacemaker           \
+                --without-rgmanager           \
+                --without-bashcompletion      \
+                --with-distro debian          \
+               "
+
+do_configure (){
+    oe_runconf
+}
+
+SYSTEMD_SERVICE_${PN} = "drbd.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
+do_install_append() {
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}/${systemd_unitdir}/system
+        install -m 644 ${WORKDIR}/drbd.service ${D}/${systemd_unitdir}/system
+        install -d ${D}/${libexecdir}
+        install -m 755 ${D}/${sysconfdir}/init.d/drbd ${D}/${libexecdir}/drbd-helper
+
+        sed -i -e 's,@LIBEXECDIR@,${libexecdir},g' \
+            ${D}${systemd_unitdir}/system/drbd.service
+    fi
+}
+
+FILES_${PN} += "run"
+FILES_${PN} += "${base_libdir}/drbd"
+FILES_${PN}-dbg += "${base_libdir}/drbd/.debug"
diff --git a/meta-oe/recipes-extended/drbd/drbd_8.4.4.bb b/meta-oe/recipes-extended/drbd/drbd_8.4.4.bb
deleted file mode 100644
index 5439bac..0000000
--- a/meta-oe/recipes-extended/drbd/drbd_8.4.4.bb
+++ /dev/null
@@ -1,57 +0,0 @@
-SUMMARY = "BD driver for Linux"
-DESCRIPTION = "DRBD mirrors a block device over the network to another machine.\
-DRBD mirrors a block device over the network to another machine.\
-Think of it as networked raid 1. It is a building block for\
-setting up high availability (HA) clusters."
-
-HOMEPAGE = "http://www.drbd.org/"
-
-SECTION = "kernel/userland"
-
-LICENSE = "GPLv2+"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
-
-PR = "r0"
-#PR = "r1001"
-
-SRC_URI = "http://oss.linbit.com/${BPN}/8.4/${BPN}-${PV}.tar.gz \
-           file://drbd.service \
-          "
-
-#SRC_URI[md5sum] = "ef4e6db51cda1898c597a3d61fcb9e1e"
-#SRC_URI[sha256sum] = "7c1558459614fbdc1b3209f1b9e5767a443d9bdfe681a49c652b5f392799d58d"
-
-SRC_URI[md5sum] = "b51815343c1a9151e2936b3b97520388"
-SRC_URI[sha256sum] = "a056219c5c23b079c3354179f7a1b9f55d47e573a4cd3178f2ef4c15604288f0"
-
-inherit autotools-brokensep systemd
-
-EXTRA_OECONF = "--with-utils                  \
-                --without-km                  \
-                --with-initdir=/etc/init.d    \
-                --without-pacemaker           \
-                --without-rgmanager           \
-                --without-bashcompletion      \
-                --with-distro debian          \
-               "
-
-do_configure (){
-    oe_runconf
-}
-
-SYSTEMD_SERVICE_${PN} = "drbd.service"
-SYSTEMD_AUTO_ENABLE = "disable"
-
-do_install_append() {
-    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        install -d ${D}/${systemd_unitdir}/system
-        install -m 644 ${WORKDIR}/drbd.service ${D}/${systemd_unitdir}/system
-        install -d ${D}/${libexecdir}
-        install -m 755 ${D}/etc/init.d/drbd ${D}/${libexecdir}/drbd-helper
-    fi
-}
-
-FILES_${PN} += "run"
-FILES_${PN} += "${base_libdir}/drbd"
-FILES_${PN}-dbg += "${base_libdir}/drbd/.debug"
diff --git a/meta-oe/recipes-extended/drbd/files/drbd.service b/meta-oe/recipes-extended/drbd/files/drbd.service
deleted file mode 100644
index 22f853f..0000000
--- a/meta-oe/recipes-extended/drbd/files/drbd.service
+++ /dev/null
@@ -1,12 +0,0 @@
-[Unit]
-Description=DRBD Service
-After=network.target
-
-[Service]
-Type=oneshot
-RemainAfterExit=yes
-ExecStart=/usr/lib/drbd/drbd-helper start
-ExecStop=/usr/lib/drbd/drbd-helper stop
-
-[Install]
-WantedBy=multi-user.target
-- 
1.9.1


