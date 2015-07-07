Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AAFED734B8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jul 2015 02:28:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t672SwKQ010169
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Jul 2015 19:28:58 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Mon, 6 Jul 2015 19:28:57 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 7 Jul 2015 10:28:11 +0800
Message-ID: <1436236091-31779-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-networking] ypbind-mt: get parameters from dhcp
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
X-List-Received-Date: Tue, 07 Jul 2015 02:28:59 -0000
Content-Type: text/plain

From: Li Wang <li.wang@windriver.com>

the script nis.sh is called by dhcp client,
it can get some parameters from dhcp.

Signed-off-by: Li Wang <li.wang@windriver.com>
---
 .../recipes-support/nis/ypbind-mt/nis.sh           | 41 ++++++++++++++++++++++
 .../recipes-support/nis/ypbind-mt/yp.conf          |  1 +
 .../recipes-support/nis/ypbind-mt_1.38.bb          |  6 ++++
 3 files changed, 48 insertions(+)
 create mode 100755 meta-networking/recipes-support/nis/ypbind-mt/nis.sh
 create mode 100644 meta-networking/recipes-support/nis/ypbind-mt/yp.conf

diff --git a/meta-networking/recipes-support/nis/ypbind-mt/nis.sh b/meta-networking/recipes-support/nis/ypbind-mt/nis.sh
new file mode 100755
index 0000000..a06a977
--- /dev/null
+++ b/meta-networking/recipes-support/nis/ypbind-mt/nis.sh
@@ -0,0 +1,41 @@
+#!/bin/bash
+#
+# nis.sh: dhclient-script plugin for NIS settings,
+#         place in /etc/dhcp/dhclient.d and 'chmod +x nis.sh' to enable
+#
+
+CONF=/etc/yp.conf
+SAVECONF=${SAVEDIR}/${CONF##*/}.predhclient.${interface}
+
+nis_replace_conf() {
+        echo "$1" | diff -q ${CONF} - > /dev/null 2>&1
+        if [ $? -eq 1 ]; then
+            echo "$1" > ${CONF}
+#            restorecon ${CONF} >/dev/null 2>&1
+            service ypbind restart >/dev/null 2>&1
+        fi
+}
+
+nis_config() {
+    if [ -n "${new_nis_domain}" ] && [ -n "${new_nis_servers}" ] &&
+        [ -e ${CONF} ] && [ -d ${SAVEDIR} ]; then
+        local conf=$(grep -v '^domain .*  # added by /sbin/dhclient-script$' < ${CONF})
+
+        conf=$(echo "$conf"
+            for s in ${new_nis_servers}; do
+                echo "domain ${new_nis_domain} server ${s}  # added by /sbin/dhclient-script"
+            done)
+
+        [ -f ${SAVECONF} ] || touch ${SAVECONF}
+        nis_replace_conf "$conf"
+    fi
+}
+
+nis_restore() {
+    if [ -e ${CONF} ] && [ -f ${SAVECONF} ]; then
+        local conf=$(grep -v '^domain .*  # added by /sbin/dhclient-script$' < ${CONF})
+
+        nis_replace_conf "$conf"
+        rm -f ${SAVECONF}
+    fi
+}
diff --git a/meta-networking/recipes-support/nis/ypbind-mt/yp.conf b/meta-networking/recipes-support/nis/ypbind-mt/yp.conf
new file mode 100644
index 0000000..792d600
--- /dev/null
+++ b/meta-networking/recipes-support/nis/ypbind-mt/yp.conf
@@ -0,0 +1 @@
+#
diff --git a/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb b/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
index d25ef5c..f0c1cea 100644
--- a/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
+++ b/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
@@ -28,6 +28,8 @@ PROVIDES += "ypbind"
 SRC_URI = "http://www.linux-nis.org/download/ypbind-mt/${BP}.tar.bz2 \
            file://ypbind-yocto.init \
            file://ypbind.service \
+           file://yp.conf \
+           file://nis.sh \
 "
 SRC_URI[md5sum] = "094088c0e282fa7f3b3dd6cc51d0a4e1"
 SRC_URI[sha256sum] = "1930ce19f6ccfe10400f3497b31867f71690d2bcd3f5b575199fa915559b7746"
@@ -44,10 +46,14 @@ do_install_append () {
     install -d ${D}${sysconfdir}/init.d
     install -d ${D}${sysconfdir}/rcS.d
 
+    install -m 0744 ${WORKDIR}/yp.conf ${D}${sysconfdir}/
     install -m 0755 ${WORKDIR}/ypbind-yocto.init ${D}${sysconfdir}/init.d/ypbind
 
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/ypbind.service ${D}${systemd_unitdir}/system
+
+    install -d ${D}/${sysconfdir}/dhcp/dhclient.d
+    install -m 755 ${WORKDIR}/nis.sh ${D}/${sysconfdir}/dhcp/dhclient.d/
 }
 
 
-- 
1.9.1


