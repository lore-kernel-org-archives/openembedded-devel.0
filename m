Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4A67F76FF2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Oct 2015 01:32:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="102030625"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Oct 2015 09:35:00 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t9K1W9PK032112
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Oct 2015 09:32:09 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 20 Oct 2015 09:32:38 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 20 Oct 2015 09:32:29 +0800
Message-ID: <1445304749-3362-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [meta-oe][PATCH] lmsensors: remove unused service file
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
X-List-Received-Date: Tue, 20 Oct 2015 01:32:43 -0000
Content-Type: text/plain

From: Li Xin <lixin.fnst@cn.fujitsu.com>

* Upstream ships a systemd service file sensord.service now,
  so we don't need this anymore.
* Install lm_sensors.service and fancontrol.service to support systemd systems.
  lm_sensors.service: Initialize hardware monitoring sensors.
  fancontrol.service: Start fan control, if configured.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/lm_sensors/lmsensors/sensord.service | 11 -----------
 meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb        |  9 ++-------
 2 files changed, 2 insertions(+), 18 deletions(-)
 delete mode 100644 meta-oe/recipes-support/lm_sensors/lmsensors/sensord.service

diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors/sensord.service b/meta-oe/recipes-support/lm_sensors/lmsensors/sensord.service
deleted file mode 100644
index 4836d8f..0000000
--- a/meta-oe/recipes-support/lm_sensors/lmsensors/sensord.service
+++ /dev/null
@@ -1,11 +0,0 @@
-[Unit]
-Description=Sensor Information Logging
-
-[Service]
-Type=forking
-EnvironmentFile=-@SYSCONFDIR@/sensord.conf
-PIDFile=@LOCALSTATEDIR@/run/sensord.pid
-ExecStart=@SBINDIR@/sensord $SENSORD_ARGS
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb b/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
index 66e8923..a483fb3 100644
--- a/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
@@ -10,7 +10,6 @@ DEPENDS = "sysfsutils virtual/libiconv bison-native flex-native rrdtool"
 SRC_URI = "http://dl.lm-sensors.org/lm-sensors/releases/lm_sensors-${PV}.tar.bz2 \
            file://fancontrol.init \
            file://sensord.init \
-           file://sensord.service \
 "
 SRC_URI[md5sum] = "c03675ae9d43d60322110c679416901a"
 SRC_URI[sha256sum] = "e0579016081a262dd23eafe1d22b41ebde78921e73a1dcef71e05e424340061f"
@@ -26,7 +25,7 @@ INITSCRIPT_PARAMS_${PN}-fancontrol = "defaults 66"
 INITSCRIPT_PARAMS_${PN}-sensord = "defaults 67"
 
 SYSTEMD_PACKAGES = "${PN}-sensord"
-SYSTEMD_SERVICE_${PN}-sensord = "sensord.service"
+SYSTEMD_SERVICE_${PN}-sensord = "sensord.service lm_sensors.service fancontrol.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
 S = "${WORKDIR}/lm_sensors-${PV}"
@@ -58,11 +57,7 @@ do_install() {
     # Insall sensord service script
     if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${WORKDIR}/sensord.service ${D}${systemd_unitdir}/system
-
-        sed -i -e 's#@SYSCONFDIR@#${sysconfdir}#g' ${D}${systemd_unitdir}/system/sensord.service
-        sed -i -e 's#@LOCALSTATEDIR@#${localstatedir}#g' ${D}${systemd_unitdir}/system/sensord.service
-        sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/sensord.service
+        install -m 0644 ${S}/prog/init/*.service ${D}${systemd_unitdir}/system
     fi
 }
 
-- 
1.8.4.2


