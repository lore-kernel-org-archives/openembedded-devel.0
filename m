Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8A3FF78453
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Sep 2017 04:03:20 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Aug 2017 21:03:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,456,1498546800"; d="scan'208";a="124583329"
Received: from kcheng8-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.71.81])
	by orsmga004.jf.intel.com with ESMTP; 31 Aug 2017 21:03:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Sep 2017 16:02:33 +1200
Message-Id: <385dfd3c60bcebaf2b96ad65b75b1ce07f706be3.1504238509.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1504238509.git.paul.eggleton@linux.intel.com>
References: <cover.1504238509.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 2/2] paho-mqtt-c: add recipe from meta-intel-iot-middleware and update
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
X-List-Received-Date: Fri, 01 Sep 2017 04:03:20 -0000

The following improvements have been made over the recipe that was in
meta-intel-iot-middleware (a layer which is no longer actively
maintained):

* Upgrade to 1.2.0. The version number being used previously (3.1) was
  bogus - I guess someone saw that it supported the MQTT *protocol*
  version 3.1 and assumed that was the library version. Since we are
  renaming it to paho-mqtt-c at the same time to distinguish it from
  other Eclipse Paho MQTT library flavours, we don't need to bump PE.
* Fix SRC_URI since the repository has been moved
* Fix "No GNU_HASH in the elf binary" QA error
* Add notice.html and about.html to LIC_FILES_CHKSUM since they cover
  licensing
* Add description, Signed-off-by and Upstream-Status to makefile.patch
* Set short description in SUMMARY
* Drop unnecessary custom do_compile - the default implementation
  basically does the same thing
* Drop RDEPENDS on openssl - linking already ensures runtime
  dependencies get set correctly
* Move DEPENDS further up

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../paho-mqtt-c/files/makefile.patch               | 25 ++++++++++++++++
 .../paho-mqtt-c/paho-mqtt-c_1.2.0.bb               | 35 ++++++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/paho-mqtt-c/files/makefile.patch
 create mode 100644 meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.2.0.bb

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/files/makefile.patch b/meta-oe/recipes-connectivity/paho-mqtt-c/files/makefile.patch
new file mode 100644
index 0000000..a31bfaa
--- /dev/null
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/files/makefile.patch
@@ -0,0 +1,25 @@
+Disable building some things we don't need
+
+Upstream-Status: Inappropriate [config]
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+---
+ Makefile |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 33bd2d0..84262bd 100644
+--- a/Makefile
++++ b/Makefile
+@@ -115,7 +115,8 @@ LDFLAGS_AS = -shared -Wl,-soname,lib${MQTTLIB_AS}.so.${MAJOR_VERSION} -lpthread
+ 
+ all: build
+ 	
+-build: | mkdir ${MQTTLIB_C_TARGET} ${MQTTLIB_CS_TARGET} ${MQTTLIB_A_TARGET} ${MQTTLIB_AS_TARGET} ${MQTTVERSION_TARGET} ${SYNC_SAMPLES} ${ASYNC_SAMPLES} ${SYNC_TESTS} ${SYNC_SSL_TESTS} ${ASYNC_TESTS} ${ASYNC_SSL_TESTS}
++build: | mkdir ${MQTTLIB_C_TARGET} ${MQTTLIB_CS_TARGET} ${MQTTLIB_A_TARGET} ${MQTTLIB_AS_TARGET}
++#${MQTTVERSION_TARGET} ${SYNC_SAMPLES} ${ASYNC_SAMPLES} ${SYNC_TESTS} ${SYNC_SSL_TESTS} ${ASYNC_TESTS} ${ASYNC_SSL_TESTS}
+ 
+ clean:
+ 	rm -rf ${blddir}/*
+-- 
diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.2.0.bb b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.2.0.bb
new file mode 100644
index 0000000..fec380c
--- /dev/null
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.2.0.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Paho MQTT - C libraries for the MQTT and MQTT-SN protocols"
+DESCRIPTION = "Client implementation of open and standard messaging protocols for Machine-to-Machine (M2M) and Internet of Things (IoT)."
+HOMEPAGE = "http://www.eclipse.org/paho/"
+SECTION = "console/network"
+LICENSE = "EPL-1.0 | EDL-1.0"
+
+LIC_FILES_CHKSUM = " \
+        file://edl-v10;md5=3adfcc70f5aeb7a44f3f9b495aa1fbf3 \
+        file://epl-v10;md5=659c8e92a40b6df1d9e3dccf5ae45a08 \
+        file://notice.html;md5=a00d6f9ab542be7babc2d8b80d5d2a4c \
+        file://about.html;md5=dcde438d73cf42393da9d40fabc0c9bc \
+"
+
+SRC_URI = "git://github.com/eclipse/paho.mqtt.c;protocol=http"
+
+SRCREV = "e8d34da24ad807f5e698b327d67591fd4b4bfa7e"
+
+DEPENDS = "openssl"
+
+S = "${WORKDIR}/git"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_install() {
+    install -d ${D}${libdir}
+    oe_libinstall -C build/output -so libpaho-mqtt3a ${D}${libdir}
+    oe_libinstall -C build/output -so libpaho-mqtt3as ${D}${libdir}
+    oe_libinstall -C build/output -so libpaho-mqtt3c  ${D}${libdir}
+    oe_libinstall -C build/output -so libpaho-mqtt3cs ${D}${libdir}
+    install -d ${D}${includedir}
+    install -m 644 src/MQTTAsync.h ${D}${includedir}
+    install -m 644 src/MQTTClient.h ${D}${includedir}
+    install -m 644 src/MQTTClientPersistence.h ${D}${includedir}
+}
+
-- 
2.9.5


