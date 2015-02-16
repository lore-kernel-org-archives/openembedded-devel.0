Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 64F4365C85
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 05:29:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="57778807"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Feb 2015 13:25:44 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t1G5SVZB001395
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 13:28:31 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 16 Feb 2015 13:29:19 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Feb 2015 13:24:16 +0800
Message-ID: <1424064256-59202-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-networking][PATCH] ptpd: add systemd supported
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
X-List-Received-Date: Mon, 16 Feb 2015 05:29:25 -0000
Content-Type: text/plain

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 meta-networking/recipes-daemons/ptpd/ptpd/ptpd.conf |  7 +++++++
 .../recipes-daemons/ptpd/ptpd/ptpd.service          | 10 ++++++++++
 .../recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb          | 21 +++++++++++++++++++--
 3 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/ptpd/ptpd/ptpd.conf
 create mode 100644 meta-networking/recipes-daemons/ptpd/ptpd/ptpd.service

diff --git a/meta-networking/recipes-daemons/ptpd/ptpd/ptpd.conf b/meta-networking/recipes-daemons/ptpd/ptpd/ptpd.conf
new file mode 100644
index 0000000..ddd5710
--- /dev/null
+++ b/meta-networking/recipes-daemons/ptpd/ptpd/ptpd.conf
@@ -0,0 +1,7 @@
+#
+# PTPD Configuration
+#
+# See man ptpd2 for arguments.
+#
+# Example arguments
+PTPDARGS="-d 1 -i eth0"
diff --git a/meta-networking/recipes-daemons/ptpd/ptpd/ptpd.service b/meta-networking/recipes-daemons/ptpd/ptpd/ptpd.service
new file mode 100644
index 0000000..f84799e
--- /dev/null
+++ b/meta-networking/recipes-daemons/ptpd/ptpd/ptpd.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=ptpd time precision daemon
+
+[Service]
+Type=forking
+EnvironmentFile=-@SYSCONFDIR@/default/ptpd
+ExecStart=@BINDIR@/ptpd2 $PTPDARGS
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
index 274ea33..50cdc7f 100644
--- a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
+++ b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://README;md5=2452033fe374283f29579898663b1aa8"
 
 DEPENDS = "libpcap"
 
-inherit autotools
+inherit autotools systemd
 
 # return something like '1.2.3' or '1.2.3/rc1'
 #
@@ -22,7 +22,9 @@ def get_sub(d):
         return parts[0]
 
 SRC_URI = "http://downloads.sourceforge.net/project/ptpd/ptpd/${@get_sub(d)}/ptpd-${PV}.tar.gz \
-	file://ptpd-add-dpaa-etsec-support.patch \
+           file://ptpd-add-dpaa-etsec-support.patch \
+           file://ptpd.service \
+           file://ptpd.conf \
 "
 
 SRC_URI[md5sum] = "1ef2f1f2825080a865bbce0eb61246d4"
@@ -38,4 +40,19 @@ do_install() {
     install -d ${D}${bindir} ${D}${mandir}/man8
     install -m 0755 ${B}/src/ptpd2 ${D}${bindir}
     install -m 0644 ${B}/src/ptpd2.8 ${D}${mandir}/man8
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/ptpd.service ${D}${systemd_unitdir}/system
+
+        sed -i -e 's#@SYSCONFDIR@#${sysconfdir}#g' ${D}${systemd_unitdir}/system/ptpd.service
+        sed -i -e 's#@BINDIR@#${bindir}#g' ${D}${systemd_unitdir}/system/ptpd.service
+
+        install -d ${D}${sysconfdir}/default/
+        install -m 0644 ${WORKDIR}/ptpd.conf ${D}${sysconfdir}/default/ptpd
+    fi
 }
+
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE_${PN} = "ptpd.service"
+SYSTEMD_AUTO_ENABLE = "disable"
-- 
1.9.1


