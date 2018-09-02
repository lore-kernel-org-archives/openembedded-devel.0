Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 83C7071A8D
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Sep 2018 23:33:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Sep 2018 16:33:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,322,1531810800"; d="scan'208";a="229660095"
Received: from zhenmeih-mobl.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.170.9])
	by orsmga004.jf.intel.com with ESMTP; 02 Sep 2018 16:32:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Sep 2018 11:32:15 +1200
Message-Id: <949605627c4ae0720e30b418b6aba508b0daab0e.1535931120.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1535931120.git.paul.eggleton@linux.intel.com>
References: <cover.1535931120.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking][PATCH 1/1] mosquitto: upgrade to 1.5.1
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
X-List-Received-Date: Sun, 02 Sep 2018 23:33:48 -0000

This includes one security fix and numerous other bugfixes. MQTT version
3.1.1 is now the default protocol.

See the following for details:

https://mosquitto.org/blog/2018/08/version-151-released/
https://mosquitto.org/blog/2018/05/version-1-5-released/

Changes to the recipe:
* Drop explicit installation of the libmosquitto.a static library
  because this no longer gets built by default, and the normal
  "make install" which we are running will install it anyway if it were
  to be enabled.
* Drop our service file since there is one supplied in the source tree
* Enable systemd notify support when systemd is being used
* Update comments in the init script

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../mosquitto/files/mosquitto.init                |  4 ++--
 .../mosquitto/files/mosquitto.service             | 15 ---------------
 .../{mosquitto_1.4.15.bb => mosquitto_1.5.1.bb}   | 11 ++++-------
 3 files changed, 6 insertions(+), 24 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/mosquitto/files/mosquitto.service
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_1.4.15.bb => mosquitto_1.5.1.bb} (89%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/files/mosquitto.init b/meta-networking/recipes-connectivity/mosquitto/files/mosquitto.init
index d2a27b273..6a0c12760 100644
--- a/meta-networking/recipes-connectivity/mosquitto/files/mosquitto.init
+++ b/meta-networking/recipes-connectivity/mosquitto/files/mosquitto.init
@@ -8,9 +8,9 @@
 # Required-Stop:    $remote_fs $syslog
 # Default-Start:    2 3 4 5
 # Default-Stop:     0 1 6
-# Short-Description:    mosquitto MQTT v3.1 message broker
+# Short-Description:    mosquitto MQTT message broker
 # Description: 
-#  This is a message broker that supports version 3.1 of the MQ Telemetry
+#  This is a message broker that supports version 3.1/3.1.1 of the MQ Telemetry
 #  Transport (MQTT) protocol.
 #  
 #  MQTT provides a method of carrying out messaging using a publish/subscribe
diff --git a/meta-networking/recipes-connectivity/mosquitto/files/mosquitto.service b/meta-networking/recipes-connectivity/mosquitto/files/mosquitto.service
deleted file mode 100644
index 25f68fae0..000000000
--- a/meta-networking/recipes-connectivity/mosquitto/files/mosquitto.service
+++ /dev/null
@@ -1,15 +0,0 @@
-[Unit]
-Description=Mosquitto - lightweight server implementation of the MQTT and MQTT-SN protocols
-ConditionPathExists=/etc/mosquitto/mosquitto.conf
-After=network.target
-
-[Service]
-Type=simple
-ExecStartPre=/bin/rm -f /var/run/mosquitto.pid
-ExecStart=/usr/sbin/mosquitto -c /etc/mosquitto/mosquitto.conf
-ExecReload=/bin/kill -HUP $MAINPID
-PIDFile=/var/run/mosquitto.pid
-Restart=on-failure
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.15.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.1.bb
similarity index 89%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.15.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.1.bb
index f451687a6..fa51f4e76 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.15.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.1.bb
@@ -12,12 +12,11 @@ DEPENDS = "uthash"
 
 SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://0002-uthash-remove-in-tree-version.patch \
-           file://mosquitto.service \
            file://mosquitto.init \
 "
 
-SRC_URI[md5sum] = "546cb1ce35cc3f7d23e6d2f1f9a962e7"
-SRC_URI[sha256sum] = "7d3b3e245a3b4ec94b05678c8199c806359737949f4cfe0bf936184f6ca89a83"
+SRC_URI[md5sum] = "f98c99998a36a234f3a9d9b402b991db"
+SRC_URI[sha256sum] = "8557bc7ae34dfaf32a0fb56d2491b7a7f731269c88337227233013502df4d5b0"
 
 inherit systemd update-rc.d useradd
 
@@ -34,6 +33,7 @@ EXTRA_OEMAKE = " \
     ${@bb.utils.contains('PACKAGECONFIG', 'dns-srv', 'WITH_SRV=yes', 'WITH_SRV=no', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'ssl', 'WITH_TLS=yes WITH_TLS_PSK=yes', 'WITH_TLS=no WITH_TLS_PSK=no', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'uuid', 'WITH_UUID=yes', 'WITH_UUID=no', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'WITH_SYSTEMD=yes', 'WITH_SYSTEMD=no', d)} \
     STRIP=/bin/true \
     WITH_DOCS=no \
 "
@@ -43,11 +43,8 @@ export LIB_SUFFIX = "${@d.getVar('baselib', True).replace('lib', '')}"
 do_install() {
     oe_runmake 'DESTDIR=${D}' install
 
-    install -d ${D}${libdir}
-    install -m 0644 lib/libmosquitto.a ${D}${libdir}/
-
     install -d ${D}${systemd_unitdir}/system/
-    install -m 0644 ${WORKDIR}/mosquitto.service ${D}${systemd_unitdir}/system/
+    install -m 0644 ${S}/service/systemd/mosquitto.service.notify ${D}${systemd_unitdir}/system/mosquitto.service
 
     install -d ${D}${sysconfdir}/mosquitto
     install -m 0644 ${D}${sysconfdir}/mosquitto/mosquitto.conf.example \
-- 
2.17.1


