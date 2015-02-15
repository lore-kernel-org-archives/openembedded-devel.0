Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id BB86D71F05
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Feb 2015 06:51:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="57615183"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Feb 2015 14:47:26 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t1F6oDSF005842
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Feb 2015 14:50:13 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Sun, 15 Feb 2015 14:51:00 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 15 Feb 2015 14:45:56 +0800
Message-ID: <1423982756-45953-3-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1423982756-45953-1-git-send-email-biannm@cn.fujitsu.com>
References: <1423982756-45953-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-oe][PATCH 2/2] lmsensors: add systemd supported.
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
X-List-Received-Date: Sun, 15 Feb 2015 06:51:09 -0000
Content-Type: text/plain

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 .../lm_sensors/lmsensors/sensord.service              | 11 +++++++++++
 meta-oe/recipes-support/lm_sensors/lmsensors_3.3.5.bb | 19 +++++++++++++++++--
 2 files changed, 28 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/lm_sensors/lmsensors/sensord.service

diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors/sensord.service b/meta-oe/recipes-support/lm_sensors/lmsensors/sensord.service
new file mode 100644
index 0000000..4836d8f
--- /dev/null
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors/sensord.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Sensor Information Logging
+
+[Service]
+Type=forking
+EnvironmentFile=-@SYSCONFDIR@/sensord.conf
+PIDFile=@LOCALSTATEDIR@/run/sensord.pid
+ExecStart=@SBINDIR@/sensord $SENSORD_ARGS
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.5.bb b/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.5.bb
index 113c6fc..d2cd317 100644
--- a/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.5.bb
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors_3.3.5.bb
@@ -10,11 +10,12 @@ DEPENDS = "sysfsutils virtual/libiconv bison-native flex-native rrdtool"
 SRC_URI = "http://dl.lm-sensors.org/lm-sensors/releases/lm_sensors-${PV}.tar.bz2 \
            file://fancontrol.init \
            file://sensord.init \
+           file://sensord.service \
 "
 SRC_URI[md5sum] = "da506dedceb41822e64865f6ba34828a"
 SRC_URI[sha256sum] = "5dae6a665e1150159a93743c4ff1943a7efe02cd9d3bb12c4805e7d7adcf4fcf"
 
-inherit update-rc.d
+inherit update-rc.d systemd
 
 RDEPENDS_${PN}-dev = ""
 
@@ -24,6 +25,10 @@ INITSCRIPT_NAME_${PN}-sensord = "sensord"
 INITSCRIPT_PARAMS_${PN}-fancontrol = "defaults 66"
 INITSCRIPT_PARAMS_${PN}-sensord = "defaults 67"
 
+SYSTEMD_PACKAGES = "${PN}-sensord"
+SYSTEMD_SERVICE_${PN}-sensord = "sensord.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
 S = "${WORKDIR}/lm_sensors-${PV}"
 
 EXTRA_OEMAKE = 'LINUX=${STAGING_KERNEL_DIR} EXLDFLAGS="${LDFLAGS}" \
@@ -49,6 +54,16 @@ do_install() {
 
     # Install sensord init script
     install -m 0755 ${WORKDIR}/sensord.init ${D}${sysconfdir}/init.d/sensord
+
+    # Insall sensord service script
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/sensord.service ${D}${systemd_unitdir}/system
+
+        sed -i -e 's#@SYSCONFDIR@#${sysconfdir}#g' ${D}${systemd_unitdir}/system/sensord.service
+        sed -i -e 's#@LOCALSTATEDIR@#${localstatedir}#g' ${D}${systemd_unitdir}/system/sensord.service
+        sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/sensord.service
+    fi
 }
 
 # libsensors packages
@@ -90,7 +105,7 @@ FILES_${PN}-sensors-doc = "${mandir}/man1 ${mandir}/man5"
 RDEPENDS_${PN}-sensors = "${PN}-libsensors"
 
 # sensord logging daemon
-FILES_${PN}-sensord = "${sbindir}/sensord ${sysconfdir}/init.d/sensord"
+FILES_${PN}-sensord = "${sbindir}/sensord ${sysconfdir}/init.d/sensord ${systemd_unitdir}/system/sensord.service"
 FILES_${PN}-sensord-dbg = "${bindir}/.debug/sensord"
 FILES_${PN}-sensord-doc = "${mandir}/man8/sensord.8"
 RDEPENDS_${PN}-sensord = "${PN}-sensors rrdtool"
-- 
1.9.1


