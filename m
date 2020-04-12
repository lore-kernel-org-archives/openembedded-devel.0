Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.13049.1586703823379249761
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Apr 2020 08:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=SSG0LE2j;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id EB0D06039E;
	Sun, 12 Apr 2020 17:03:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1586703822;
	bh=Y/TuQ1Bs5uxmAc0YCbpLCWhus3Hvt4VtoHPYGYmIB20=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SSG0LE2jzqHPzxP6RhhvJi9BM/kc+3sZfC770c9S30JrA14Cu/LJLDw7vNn5zv46F
	 iy+8/4euPSJU6CDOJCVVKHEmNN2OZiQCvfRbp8y0oqLk2mkzMNaAtyAl8l6TwmwIGm
	 eKLIWOnorqxdndIz2QFcCF33WD+s8WVKtz2mWzbQPhSgBw6iGMtHgbu+TeKwgL/aP0
	 fT2vsLsvqfFouou7/jKhRZrD5TCVTMNplmbabeA3mCy0a4gKpJa9/d2TJ6y5dkO9sv
	 gDPWFV4K/OoIhMeiVyJ2Vb0ztY/iYZRqlxpnpAVuiOH5V6QGc1aL27giwRhgmahvkv
	 JSdimn+Hw3ZNA==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-python][PATCH 5/5] python3-paho-mqtt: consolidate into a single file
Date: Sun, 12 Apr 2020 17:03:34 +0200
Message-Id: <1586703814-15536-5-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586703814-15536-1-git-send-email-pjtexier@koncepto.io>
References: <1586703814-15536-1-git-send-email-pjtexier@koncepto.io>

For details see [1]

[1] - https://lists.openembedded.org/g/openembedded-devel/topic/72718415

Suggested-by: Tim Orling <ticotimo@gmail.com>
Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../recipes-devtools/python/python-paho-mqtt.inc   | 22 ---------------------
 .../python/python3-paho-mqtt_1.5.0.bb              | 23 ++++++++++++++++++++--
 2 files changed, 21 insertions(+), 24 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-paho-mqtt.inc

diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt.inc b/meta-python/recipes-devtools/python/python-paho-mqtt.inc
deleted file mode 100644
index 0a0e610..0000000
--- a/meta-python/recipes-devtools/python/python-paho-mqtt.inc
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "MQTT version 3.1/3.1.1 client library"
-LICENSE = "EPL-1.0 | EDL-1.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=eb48c6ee2cb9f5b8b9fe75e6f817bdfc \
-                    file://epl-v10;md5=8d383c379e91d20ba18a52c3e7d3a979 \
-                    file://edl-v10;md5=c09f121939f063aeb5235972be8c722c \
-"
-SRCNAME = "paho-mqtt"
-
-inherit pypi
-
-SRC_URI[md5sum] = "45e80d9b8066a8d0ba1ecfffe271bd3d"
-SRC_URI[sha256sum] = "e3d286198baaea195c8b3bc221941d25a3ab0e1507fc1779bdb7473806394be4"
-
-DEPENDS += "${PYTHON_PN}-pytest-runner-native"
-
-RDEPENDS_${PN} = "\
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-math \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-threading \
-"
diff --git a/meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.0.bb b/meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.0.bb
index 4981e61..cc6f4dc 100644
--- a/meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-paho-mqtt_1.5.0.bb
@@ -1,3 +1,22 @@
-inherit setuptools3
-require python-paho-mqtt.inc
+SUMMARY = "MQTT version 3.1/3.1.1 client library"
+LICENSE = "EPL-1.0 | EDL-1.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=eb48c6ee2cb9f5b8b9fe75e6f817bdfc \
+                    file://epl-v10;md5=8d383c379e91d20ba18a52c3e7d3a979 \
+                    file://edl-v10;md5=c09f121939f063aeb5235972be8c722c \
+"
+SRCNAME = "paho-mqtt"
 
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "45e80d9b8066a8d0ba1ecfffe271bd3d"
+SRC_URI[sha256sum] = "e3d286198baaea195c8b3bc221941d25a3ab0e1507fc1779bdb7473806394be4"
+
+DEPENDS += "${PYTHON_PN}-pytest-runner-native"
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-math \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-threading \
+"
-- 
2.7.4

