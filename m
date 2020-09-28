Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.30571.1601273600504880944
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2020 23:13:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: yi.zhao@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08S6Cxtq006447
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2020 23:13:09 -0700
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Sun, 27 Sep
 2020 23:12:48 -0700
From: "Yi Zhao" <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <wonjong.lee@windriver.com>
Subject: [meta-oe][PATCH 2/2] minifi-cpp: set the default repositories location to /var/lib
Date: Mon, 28 Sep 2020 14:12:36 +0800
Message-ID: <20200928061236.7572-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200928061236.7572-1-yi.zhao@windriver.com>
References: <20200928061236.7572-1-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Content-Type: text/plain

Currently, the provenance repository, flowfile repository and content
repository are created in /var/run/ directory which is mounted as tmpfs.
Since the minifi uses RocksDB repositories with direct IO, we will
encounter an error when restart minifi service:

[org::apache::nifi::minifi::provenance::ProvenanceRepository] [error]
MiNiFi Provenance Repository database open /var/run/minifi/provenance_repository failed: IO error:
While open a file for appending: /var/run/minifi/provenance_repository/000004.sst: Invalid argument

Set the default repositories directory to /var/lib to fix this issue.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../minifi-cpp/files/minifi.service           |  2 +-
 .../minifi-cpp/files/systemd-volatile.conf    |  1 -
 .../minifi-cpp/files/sysvinit-volatile.conf   |  1 -
 .../minifi-cpp/minifi-cpp_0.7.0.bb            | 23 +++++++------------
 4 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/meta-oe/recipes-extended/minifi-cpp/files/minifi.service b/meta-oe/recipes-extended/minifi-cpp/files/minifi.service
index 5802a7b2f..059cdbcc2 100644
--- a/meta-oe/recipes-extended/minifi-cpp/files/minifi.service
+++ b/meta-oe/recipes-extended/minifi-cpp/files/minifi.service
@@ -5,7 +5,7 @@ RequiresMountsFor=/var
 
 [Service]
 Type=simple
-WorkingDirectory=@LOCALSTATEDIR@/run/minifi
+WorkingDirectory=@LOCALSTATEDIR@/lib/minifi
 Environment=MINIFI_HOME=@SYSCONFDIR@/minifi
 ExecStart=@BINDIR@/minifi
 
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/systemd-volatile.conf b/meta-oe/recipes-extended/minifi-cpp/files/systemd-volatile.conf
index c828b49fa..6da442da3 100644
--- a/meta-oe/recipes-extended/minifi-cpp/files/systemd-volatile.conf
+++ b/meta-oe/recipes-extended/minifi-cpp/files/systemd-volatile.conf
@@ -1,2 +1 @@
-d @MINIFI_RUN@ 0755 root root -
 d @MINIFI_LOG@ 0755 root root -
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/sysvinit-volatile.conf b/meta-oe/recipes-extended/minifi-cpp/files/sysvinit-volatile.conf
index 2ad14e677..db149d01f 100644
--- a/meta-oe/recipes-extended/minifi-cpp/files/sysvinit-volatile.conf
+++ b/meta-oe/recipes-extended/minifi-cpp/files/sysvinit-volatile.conf
@@ -1,2 +1 @@
-d root root 0755 @MINIFI_RUN@ none
 d root root 0755 @MINIFI_LOG@ none
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
index d6f92128c..926dd755b 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
@@ -70,13 +70,14 @@ TARGET_CXXFLAGS_append_riscv64 += "-fpic"
 do_install() {
     DESTDIR='${B}/minifi-install' cmake_runcmake_build --target ${OECMAKE_TARGET_INSTALL}
 
-    MINIFI_BIN=${base_prefix}${bindir}
-    MINIFI_HOME=${base_prefix}${sysconfdir}/minifi
-    MINIFI_RUN=${base_prefix}${localstatedir}/run/minifi
-    MINIFI_LOG=${base_prefix}${localstatedir}/log/minifi
+    MINIFI_BIN=${bindir}
+    MINIFI_HOME=${sysconfdir}/minifi
+    MINIFI_RUN=${localstatedir}/lib/minifi
+    MINIFI_LOG=${localstatedir}/log/minifi
 
     install -d ${D}${MINIFI_BIN}
     install -d ${D}${MINIFI_HOME}/conf
+    install -m 755 -d ${D}${localstatedir}/lib/minifi
     cp -a ${B}/minifi-install/usr/bin/*   ${D}${MINIFI_BIN}/
     cp -a ${B}/minifi-install/usr/conf/*  ${D}${MINIFI_HOME}/conf/
 
@@ -93,11 +94,11 @@ do_install() {
 
     sed -i 's|export MINIFI_HOME=.*|export MINIFI_HOME='${MINIFI_HOME}'|g' ${D}${MINIFI_BIN}/minifi.sh
     sed -i 's|bin_dir=${MINIFI_HOME}/bin|bin_dir='${MINIFI_BIN}'|g' ${D}${MINIFI_BIN}/minifi.sh
-    sed -i 's|pid_file=${bin_dir}|pid_file='${MINIFI_RUN}'|g' ${D}${MINIFI_BIN}/minifi.sh
+    sed -i 's|pid_file=${bin_dir}/.|pid_file='${localstatedir}/run/'|g' ${D}${MINIFI_BIN}/minifi.sh
 
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}${sysconfdir}/tmpfiles.d/
-        install -m 0644 ${WORKDIR}/systemd-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
+        install -m 0644 ${WORKDIR}/systemd-volatile.conf ${D}${sysconfdir}/tmpfiles.d/minifi.conf
         install -m 0755 -d ${D}${systemd_unitdir}/system
         install -m 0644 ${WORKDIR}/minifi.service ${D}${systemd_unitdir}/system/
 
@@ -105,14 +106,12 @@ do_install() {
         sed -i 's|@SYSCONFDIR@|${sysconfdir}|g' ${D}${systemd_unitdir}/system/minifi.service
         sed -i 's|@BINDIR@|${bindir}|g' ${D}${systemd_unitdir}/system/minifi.service
 
-        sed -i 's|@MINIFI_RUN@|'${MINIFI_RUN}'|g' ${D}${sysconfdir}/tmpfiles.d/systemd-volatile.conf
-        sed -i 's|@MINIFI_LOG@|'${MINIFI_LOG}'|g' ${D}${sysconfdir}/tmpfiles.d/systemd-volatile.conf
+        sed -i 's|@MINIFI_LOG@|'${MINIFI_LOG}'|g' ${D}${sysconfdir}/tmpfiles.d/minifi.conf
 
     elif ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/default/volatiles
         install -m 0644 ${WORKDIR}/sysvinit-volatile.conf ${D}${sysconfdir}/default/volatiles/99_minifi
 
-        sed -i 's|@MINIFI_RUN@|'${MINIFI_RUN}'|g' ${D}${sysconfdir}/default/volatiles/99_minifi
         sed -i 's|@MINIFI_LOG@|'${MINIFI_LOG}'|g' ${D}${sysconfdir}/default/volatiles/99_minifi
     fi
 }
@@ -126,9 +125,3 @@ pkg_postinst_${PN}() {
         fi
     fi
 }
-
-FILES_${PN} = " \
-        ${bindir} \
-        ${sysconfdir} \
-        ${systemd_unitdir} \
-        "
-- 
2.17.1

