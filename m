Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 64BEB734B8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jul 2015 02:29:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t672T5Ti004749
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Jul 2015 19:29:06 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Mon, 6 Jul 2015 19:29:05 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 7 Jul 2015 10:28:19 +0800
Message-ID: <1436236099-31819-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-networking] ntp: get parameters from dhcp
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
X-List-Received-Date: Tue, 07 Jul 2015 02:29:09 -0000
Content-Type: text/plain

From: Li Wang <li.wang@windriver.com>

the script ntp.sh is called by dhcp client,
it can get some parameters from dhcp.

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-networking/recipes-support/ntp/files/ntp.sh   | 59 ++++++++++++++++++++++
 meta-networking/recipes-support/ntp/ntp_4.2.8p2.bb |  5 ++
 2 files changed, 64 insertions(+)
 create mode 100755 meta-networking/recipes-support/ntp/files/ntp.sh

diff --git a/meta-networking/recipes-support/ntp/files/ntp.sh b/meta-networking/recipes-support/ntp/files/ntp.sh
new file mode 100755
index 0000000..fc109b5
--- /dev/null
+++ b/meta-networking/recipes-support/ntp/files/ntp.sh
@@ -0,0 +1,59 @@
+#!/bin/bash
+#
+# ntp.sh: dhclient-script plugin for NTP settings,
+#         place in /etc/dhcp/dhclient.d and 'chmod +x ntp.sh' to enable
+#
+# Copyright (C) 2008 Red Hat, Inc.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+# Author(s): David Cantrell <dcantrell@redhat.com>
+#            Miroslav Lichvar <mlichvar@redhat.com>
+#
+
+CONF=/etc/ntp.conf
+SAVECONF=${SAVEDIR}/${CONF##*/}.predhclient.${interface}
+
+ntp_replace_conf() {
+        echo "$1" | diff -q ${CONF} - > /dev/null 2>&1
+        if [ $? -eq 1 ]; then
+            echo "$1" > ${CONF}
+#            restorecon ${CONF} >/dev/null 2>&1
+            service ntpd restart >/dev/null 2>&1
+        fi
+}
+
+ntp_config() {
+    if [ ! "${PEERNTP}" = "no" ] && [ -n "${new_ntp_servers}" ] &&
+        [ -e ${CONF} ] && [ -d ${SAVEDIR} ]; then
+        local conf=$(grep -v '^server .*  # added by /sbin/dhclient-script$' < ${CONF})
+
+        conf=$(echo "$conf"
+            for s in ${new_ntp_servers}; do
+                echo "server ${s} ${NTPSERVERARGS}  # added by /sbin/dhclient-script"
+            done)
+
+        [ -f ${SAVECONF} ] || touch ${SAVECONF}
+        ntp_replace_conf "$conf"
+    fi
+}
+
+ntp_restore() {
+    if [ -e ${CONF} ] && [ -f ${SAVECONF} ]; then
+        local conf=$(grep -v '^server .*  # added by /sbin/dhclient-script$' < ${CONF})
+
+        ntp_replace_conf "$conf"
+        rm -f ${SAVECONF}
+    fi
+}
diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p2.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p2.bb
index c54da43..b963584 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p2.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p2.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://sntp.service \
            file://sntp \
            file://ntpd.list \
+           file://ntp.sh \
 "
 
 SRC_URI[md5sum] = "fa37049383316322d060ec9061ac23a9"
@@ -93,6 +94,9 @@ do_install_append() {
 
     install -d ${D}${systemd_unitdir}/ntp-units.d
     install -m 0644 ${WORKDIR}/ntpd.list ${D}${systemd_unitdir}/ntp-units.d/60-ntpd.list
+
+    install -d ${D}/${sysconfdir}/dhcp/dhclient.d
+    install -m 755 ${WORKDIR}/ntp.sh ${D}/${sysconfdir}/dhcp/dhclient.d/
 }
 
 PACKAGES += "ntpdate sntp ${PN}-tickadj ${PN}-utils"
@@ -124,6 +128,7 @@ RSUGGESTS_${PN} = "iana-etc"
 FILES_${PN} = "${sbindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd ${libdir} \
     ${NTP_USER_HOME} \
     ${systemd_unitdir}/ntp-units.d/60-ntpd.list \
+    ${sysconfdir}/dhcp/dhclient.d/ntp.sh \
 "
 FILES_${PN}-tickadj = "${sbindir}/tickadj"
 FILES_${PN}-utils = "${sbindir} ${datadir}/ntp/lib"
-- 
1.9.1


