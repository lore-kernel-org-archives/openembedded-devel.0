Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id BE7D1770F2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2015 09:16:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="102002862"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Oct 2015 17:18:17 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t9J9FQWB004180
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2015 17:15:26 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 19 Oct 2015 17:15:55 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 19 Oct 2015 17:15:50 +0800
Message-ID: <1445246150-1657-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [meta-oe][PATCH] lmsensors-config: add configuration file sensord
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
X-List-Received-Date: Mon, 19 Oct 2015 09:16:02 -0000
Content-Type: text/plain

From: Li Xin <lixin.fnst@cn.fujitsu.com>

It is needed to start sensord.service.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../recipes-support/lm_sensors/lmsensors-config/sensord  | 16 ++++++++++++++++
 .../recipes-support/lm_sensors/lmsensors-config_1.0.bb   |  5 +++--
 2 files changed, 19 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/lm_sensors/lmsensors-config/sensord

diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors-config/sensord b/meta-oe/recipes-support/lm_sensors/lmsensors-config/sensord
new file mode 100644
index 0000000..a58362e
--- /dev/null
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors-config/sensord
@@ -0,0 +1,16 @@
+# configuration for hardware sensors monitoring daemon
+# in intervals use suffix "m" for minutes, "s" for seconds, "h" for hours
+# 0 means turning facility off
+
+# interval between scanning alarms
+INTERVAL=1m
+
+# interval between logging
+LOG_INTERVAL=20m
+
+# interval between RRD logging
+# RRD_INTERVAL=1m
+
+# RRD db location
+# RRD_LOGFILE=/var/log/sensors.rrd
+
diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb b/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb
index df834a3..4f632cb 100644
--- a/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb
@@ -10,6 +10,7 @@ SRC_URI = "file://fancontrol \
            file://sensord.cgi \
            file://sensord.conf \
            file://sensors.conf \
+           file://sensord \
 "
 S = "${WORKDIR}"
 
@@ -17,9 +18,9 @@ RDEPENDS_${PN}-dev = ""
 
 do_install() {
     # Install fancontrol configuration file
-    install -d ${D}${sysconfdir}
+    install -d ${D}${sysconfdir}/sysconfig
     install -m 0644 ${WORKDIR}/fancontrol ${D}${sysconfdir}
-
+    install -m 0644 ${WORKDIR}/sensord ${D}${sysconfdir}/sysconfig
     # Install libsensors configuration file
     install -d ${D}${sysconfdir}/sensors.d
     install -m 0644 ${WORKDIR}/sensors.conf ${D}${sysconfdir}/sensors.d
-- 
1.8.4.2


