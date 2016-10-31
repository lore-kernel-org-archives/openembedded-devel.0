Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 518EA71A7D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 02:05:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u9V25PT7014840
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Oct 2016 19:05:25 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Sun, 30 Oct 2016 19:05:25 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 31 Oct 2016 10:05:11 +0800
Message-ID: <20161031020511.11743-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [meta-networking][PATCH] iscsi-initiator-utils: fix postinstall and systemd service file
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
X-List-Received-Date: Mon, 31 Oct 2016 02:05:25 -0000
Content-Type: text/plain

Fix postinstall and systemd service file so that the postinstall script does
not fail at rootfs time.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../files/iscsi-initiator.service                  |  1 +
 .../iscsi-initiator-utils/files/set_initiatorname  | 12 ++++++++++
 .../iscsi-initiator-utils_2.0-873.bb               | 27 +++++++++-------------
 3 files changed, 24 insertions(+), 16 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/set_initiatorname

diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/iscsi-initiator.service b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/iscsi-initiator.service
index b139751..3790dae 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/iscsi-initiator.service
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/iscsi-initiator.service
@@ -5,6 +5,7 @@ After=syslog.target
 [Service]
 EnvironmentFile=/etc/default/iscsi-initiator
 ExecStartPre=/sbin/modprobe iscsi_tcp
+ExecStartPre=/usr/lib/iscsi/set_initiatorname
 ExecStart=/usr/sbin/iscsid -f $OPTS_ISCSID
 
 [Install]
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/set_initiatorname b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/set_initiatorname
new file mode 100644
index 0000000..a196c6b
--- /dev/null
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/set_initiatorname
@@ -0,0 +1,12 @@
+#!/bin/sh
+if [ ! -f /etc/iscsi/initiatorname.iscsi ]; then
+    INITIATORNAME=$(iscsi-iname)
+    cat >/etc/iscsi/initiatorname.iscsi <<EOF
+## DO NOT EDIT OR REMOVE THIS FILE!
+## If you remove this file, the iSCSI daemon will not start.
+## If you change the InitiatorName, existing access control lists
+## may reject this initiator.  The InitiatorName must be unique
+## for each iSCSI initiator.  Do NOT duplicate iSCSI InitiatorNames.
+InitiatorName=$INITIATORNAME
+EOF
+fi
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb
index 03f6459..4b13155 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://www.open-iscsi.org/bits/open-iscsi-${PV}.tar.gz \
            file://iscsi-initiator \
            file://iscsi-initiator.service \
            file://iscsi-initiator-targets.service \
+           file://set_initiatorname \
 "
 SRC_URI[md5sum] = "8b8316d7c9469149a6cc6234478347f7"
 SRC_URI[sha256sum] = "7dd9f2f97da417560349a8da44ea4fcfe98bfd5ef284240a2cc4ff8e88ac7cd9"
@@ -82,6 +83,8 @@ do_install () {
         install -m 0644 ${WORKDIR}/iscsi-initiator.service \
                         ${WORKDIR}/iscsi-initiator-targets.service \
                         ${D}${systemd_unitdir}/system/
+	install -d ${D}${nonarch_libdir}/iscsi
+	install -m 0755 ${WORKDIR}/set_initiatorname ${D}${nonarch_libdir}/iscsi
     else
         install -d ${D}/etc/default/volatiles
         install -m 0644 ${WORKDIR}/99_iscsi-initiator-utils ${D}/etc/default/volatiles
@@ -89,25 +92,17 @@ do_install () {
 }
 
 pkg_postinst_${PN}() {
-    #default there is no initiatorname.iscsi installed
-    #but it is needed or iscsid will fail
-
-    #will run only when postinst on target
-    if [ "x$D" != "x" ]; then
-        exit 1
-    fi
-    if [ ! -f ${sysconfdir}/iscsi/initiatorname.iscsi ]; then
-        echo "InitiatorName=$(${sbindir}/iscsi-iname)" > \
-        ${sysconfdir}/iscsi/initiatorname.iscsi
-    fi
-
-    if [ -e /etc/init.d/populate-volatile.sh ]; then
-        /etc/init.d/populate-volatile.sh update
-    elif command -v systemd-tmpfiles >/dev/null; then
-        systemd-tmpfiles --create ${sysconfdir}/tmpfiles.d/iscsi.conf
+    if [ "x$D" = "x" ]; then
+	if [ -e /etc/init.d/populate-volatile.sh ]; then
+            /etc/init.d/populate-volatile.sh update
+	elif command -v systemd-tmpfiles >/dev/null; then
+            systemd-tmpfiles --create ${sysconfdir}/tmpfiles.d/iscsi.conf
+	fi
     fi
 }
 
 SYSTEMD_SERVICE = " iscsi-initiator.service iscsi-initiator-targets.service "
 INITSCRIPT_NAME = "iscsid"
 INITSCRIPT_PARAMS = "start 30 1 2 3 4 5 . stop 70 0 1 2 3 4 5 6 ."
+
+FILES_${PN} += "${nonarch_libdir}/iscsi"
-- 
2.8.3


