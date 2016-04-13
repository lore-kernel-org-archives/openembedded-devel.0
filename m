Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id D185B73169
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2016 15:01:19 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id u3DF1H1u005006
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2016 17:01:17 +0200
Received: from dev.sbt.siemens.com ([139.22.132.96])
	by mail3.siemens.de (8.15.2/8.15.2) with SMTP id u3DF1Gj0009674;
	Wed, 13 Apr 2016 17:01:16 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Apr 2016 17:00:54 +0200
Message-Id: <1460559654-28301-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] libmodbus: add support for the libmodbus development release
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
X-List-Received-Date: Wed, 13 Apr 2016 15:01:21 -0000

libmodbus has two release streams:
- stable: which currently is 3.0.x and does only receive fixes
- development: 3.1.x which receives new features and according to upstream is also very stable

Some users require access to the newer features.
So a recipe for the development branch but leave the stable branch the default.
This is similar to what is done for the nginx recipe which also has two release streams.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta-oe/recipes-extended/libmodbus/libmodbus.inc      | 13 +++++++++++++
 meta-oe/recipes-extended/libmodbus/libmodbus_3.0.6.bb | 14 +-------------
 meta-oe/recipes-extended/libmodbus/libmodbus_3.1.2.bb |  7 +++++++
 3 files changed, 21 insertions(+), 13 deletions(-)
 create mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus.inc
 create mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus_3.1.2.bb

diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus.inc b/meta-oe/recipes-extended/libmodbus/libmodbus.inc
new file mode 100644
index 0000000..a01659a
--- /dev/null
+++ b/meta-oe/recipes-extended/libmodbus/libmodbus.inc
@@ -0,0 +1,13 @@
+SUMMARY = "A Modbus library"
+DESCRIPTION = "libmodbus is a C library designed to provide a fast and robust \
+implementation of the Modbus protocol. It runs on Linux, Mac OS X, FreeBSD, \
+QNX and Windows."
+HOMEPAGE = "http://www.libmodbus.org/"
+SECTION = "libs"
+
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI = "http://libmodbus.org/releases/${BP}.tar.gz"
+
+inherit autotools pkgconfig
diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.6.bb b/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.6.bb
index c5e6ae8..b4d32fb 100644
--- a/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.6.bb
+++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.6.bb
@@ -1,16 +1,4 @@
-SUMMARY = "A Modbus library"
-DESCRIPTION = "libmodbus is a C library designed to provide a fast and robust \
-implementation of the Modbus protocol. It runs on Linux, Mac OS X, FreeBSD, \
-QNX and Windows."
-HOMEPAGE = "http://www.libmodbus.org/"
-SECTION = "libs"
-
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
-
-SRC_URI = "http://libmodbus.org/site_media/build/${BP}.tar.gz"
-
-inherit autotools pkgconfig
+require libmodbus.inc
 
 SRC_URI[md5sum] = "c80f88b6ca19cabc4ceffc195ca07771"
 SRC_URI[sha256sum] = "046d63f10f755e2160dc56ef681e5f5ad3862a57c1955fd82e0ce036b69471b6"
diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.2.bb b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.2.bb
new file mode 100644
index 0000000..6fcfc3a
--- /dev/null
+++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.2.bb
@@ -0,0 +1,7 @@
+require libmodbus.inc
+
+# Use the stable branch by default
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI[md5sum] = "dd4262f87ed835c4d1e560f8321a222c"
+SRC_URI[sha256sum] = "661e14f9dc904f3f1b034464ddaa5fd4b8472f8f5d1ea10a1148af85591b7ee9"
-- 
2.1.4


