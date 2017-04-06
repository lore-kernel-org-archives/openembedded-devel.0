Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 70CD377C9C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Apr 2017 12:05:29 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v36C5QVE031838
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 6 Apr 2017 14:05:26 +0200
Received: from dev.sbt.siemens.com ([139.16.73.34])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v36C5Q9n021427;
	Thu, 6 Apr 2017 14:05:26 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Apr 2017 14:05:21 +0200
Message-Id: <1491480321-23280-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-python][PATCH] python-paho-mqtt: make recipe available as python3 version
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
X-List-Received-Date: Thu, 06 Apr 2017 12:05:30 -0000

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta-python/recipes-devtools/python/python-paho-mqtt.inc | 14 ++++++++++++++
 .../recipes-devtools/python/python-paho-mqtt_1.2.bb      | 16 ++--------------
 .../recipes-devtools/python/python3-paho-mqtt_1.2.bb     |  3 +++
 3 files changed, 19 insertions(+), 14 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-paho-mqtt.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-paho-mqtt_1.2.bb

diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt.inc b/meta-python/recipes-devtools/python/python-paho-mqtt.inc
new file mode 100644
index 0000000..7ff3fb2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-paho-mqtt.inc
@@ -0,0 +1,14 @@
+SUMMARY = "MQTT version 3.1/3.1.1 client library"
+LICENSE = "EPL-1.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=eb48c6ee2cb9f5b8b9fe75e6f817bdfc"
+SRCNAME = "paho-mqtt"
+
+inherit pypi
+SRC_URI[md5sum] = "241150b3fcb920ddca4d33181f3238b1"
+SRC_URI[sha256sum] = "9100a6aa706ab699d414ec02705a21eb66f436184691d0bf1f2a85a6213c6c1f"
+
+RDEPENDS_${PN} = "\
+               ${PYTHON_PN}-math \
+               ${PYTHON_PN}-io \
+               ${PYTHON_PN}-threading \
+"
diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt_1.2.bb b/meta-python/recipes-devtools/python/python-paho-mqtt_1.2.bb
index c8acfc5..f369b2e 100644
--- a/meta-python/recipes-devtools/python/python-paho-mqtt_1.2.bb
+++ b/meta-python/recipes-devtools/python/python-paho-mqtt_1.2.bb
@@ -1,15 +1,3 @@
-SUMMARY = "MQTT version 3.1/3.1.1 client library"
-LICENSE = "EPL-1.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=eb48c6ee2cb9f5b8b9fe75e6f817bdfc"
-SRCNAME = "paho-mqtt"
+inherit setuptools
+require python-paho-mqtt.inc
 
-inherit pypi setuptools
-
-RDEPENDS_${PN} = "\
-               python-math \
-               python-io \
-               python-threading \
-"
-
-SRC_URI[md5sum] = "241150b3fcb920ddca4d33181f3238b1"
-SRC_URI[sha256sum] = "9100a6aa706ab699d414ec02705a21eb66f436184691d0bf1f2a85a6213c6c1f"
diff --git a/meta-python/recipes-devtools/python/python3-paho-mqtt_1.2.bb b/meta-python/recipes-devtools/python/python3-paho-mqtt_1.2.bb
new file mode 100644
index 0000000..4981e61
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-paho-mqtt_1.2.bb
@@ -0,0 +1,3 @@
+inherit setuptools3
+require python-paho-mqtt.inc
+
-- 
2.1.4


