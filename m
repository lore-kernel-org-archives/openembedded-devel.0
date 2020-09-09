Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web12.9309.1599640946713978170
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2020 01:42:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: mtr@pengutronix.de)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mtr@pengutronix.de>)
	id 1kFvgN-0007Ic-Hj; Wed, 09 Sep 2020 10:42:24 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
	(envelope-from <mtr@dude03.red.stw.pengutronix.de>)
	id 1kFvgM-003Mom-3G; Wed, 09 Sep 2020 10:42:22 +0200
From: "Michael Tretter" <m.tretter@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Tretter <m.tretter@pengutronix.de>
Date: Wed,  9 Sep 2020 10:42:18 +0200
Message-Id: <20200909084218.802654-1-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=4.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no autolearn_force=no
	version=3.4.2
Subject: [meta-oe][PATCH] apitrace: add new recipe
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Content-Transfer-Encoding: 8bit

apitrace consists of a set of tools to:

 - trace OpenGL, OpenGL ES, Direct3D, and DirectDraw APIs calls to a file;

 - replay OpenGL and OpenGL ES calls from a file;

 - inspect OpenGL state at any call while retracing;

 - visualize and edit trace files.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 .../recipes-devtools/apitrace/apitrace_9.0.bb | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/apitrace/apitrace_9.0.bb

diff --git a/meta-oe/recipes-devtools/apitrace/apitrace_9.0.bb b/meta-oe/recipes-devtools/apitrace/apitrace_9.0.bb
new file mode 100644
index 000000000000..6e61683cde92
--- /dev/null
+++ b/meta-oe/recipes-devtools/apitrace/apitrace_9.0.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Tools for tracing OpenGL, Direct3D, and other graphics APIs"
+HOMEPAGE = "http://apitrace.github.io/"
+SECTION = "console/tools"
+LICENSE = "MIT & BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=aeb969185a143c3c25130bc2c3ef9a50 \
+                    file://thirdparty/snappy/COPYING;md5=f62f3080324a97b3159a7a7e61812d0c"
+
+SRCREV = "cae55f54c53449fd07f8a917dcd0874db2c15032"
+SRC_URI = "git://github.com/${BPN}/${BPN}.git"
+
+S = "${WORKDIR}/git"
+
+DEPENDS += "zlib libpng python3-native"
+
+inherit cmake
+
+EXTRA_OECMAKE += "\
+    -DENABLE_GUI=OFF \
+    -DENABLE_X11=OFF \
+    -DENABLE_STATIC_LIBGCC=OFF \
+    -DENABLE_STATIC_LIBSTDCXX=OFF \
+    -DPython3_ROOT_DIR=/usr/bin/python3-native \
+"
+
+# Use the bundled snappy library
+EXTRA_OECMAKE += "\
+    -DENABLE_STATIC_SNAPPY=ON \
+"
-- 
2.20.1

