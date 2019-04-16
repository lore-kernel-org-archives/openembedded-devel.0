Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 795 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 16 Apr 2019 06:54:24 UTC
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 087997D2DD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2019 06:54:24 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x3G6f9oM011699
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2019 08:41:09 +0200
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.79.72])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id x3G6f9O1028886;
	Tue, 16 Apr 2019 08:41:09 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 3070F10D496A;
	Tue, 16 Apr 2019 08:41:09 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Apr 2019 08:41:03 +0200
Message-Id: <20190416064103.28802-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH] paho-mqtt-c: 1.2.1 -> 1.3.0
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
X-List-Received-Date: Tue, 16 Apr 2019 06:54:25 -0000

Switch to cmake instead of manually installing everything.

Paho-mqtt still adds some unnecessary files into /usr we have to delete them.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../{paho-mqtt-c_1.2.1.bb => paho-mqtt-c_1.3.0.bb}    | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)
 rename meta-oe/recipes-connectivity/paho-mqtt-c/{paho-mqtt-c_1.2.1.bb => paho-mqtt-c_1.3.0.bb} (53%)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.2.1.bb b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.0.bb
similarity index 53%
rename from meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.2.1.bb
rename to meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.0.bb
index a7a9b5a6c..79a8f43d7 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.2.1.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.0.bb
@@ -13,23 +13,16 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "git://github.com/eclipse/paho.mqtt.c;protocol=http"
 
-SRCREV = "09fe0744e02f317b907e96dd5afcc02224ddbb85"
+SRCREV = "9f715d0862a8e16099b5837c4e53a1bf6a6a0675"
 
 DEPENDS = "openssl"
 
 S = "${WORKDIR}/git"
 
-TARGET_CC_ARCH += "${LDFLAGS}"
+inherit cmake
 
-do_install() {
-    install -d ${D}${libdir}
-    oe_libinstall -C build/output -so libpaho-mqtt3a ${D}${libdir}
-    oe_libinstall -C build/output -so libpaho-mqtt3as ${D}${libdir}
-    oe_libinstall -C build/output -so libpaho-mqtt3c  ${D}${libdir}
-    oe_libinstall -C build/output -so libpaho-mqtt3cs ${D}${libdir}
-    install -d ${D}${includedir}
-    install -m 644 src/MQTTAsync.h ${D}${includedir}
-    install -m 644 src/MQTTClient.h ${D}${includedir}
-    install -m 644 src/MQTTClientPersistence.h ${D}${includedir}
+do_install_append() {
+    # paho-mqtt installes some thing that we don't want.
+    rm -rf ${D}${prefix}/samples
+    find ${D}${prefix} -maxdepth 1 -type f -delete
 }
-
-- 
2.11.0


