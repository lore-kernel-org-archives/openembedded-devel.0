Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 0695D77D29
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Mar 2017 16:27:29 +0000 (UTC)
Received: from seahawk.toradex.int
	(75-146-58-181-Washington.hfc.comcastbusiness.net [75.146.58.181])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 827A55C0499;
	Thu, 30 Mar 2017 18:17:03 +0200 (CEST)
From: Stefan Agner <stefan@agner.ch>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Mar 2017 09:27:21 -0700
Message-Id: <1490891241-6804-1-git-send-email-stefan@agner.ch>
X-Mailer: git-send-email 2.7.4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1490890624; bh=cc0nEaMBEGHSLMCWRgnaTnfP1+cGTI/u96SzNJFQvfs=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=BwW0o8p8fVl2Jejboyri4kViWxDCnkan23jodLxAW7mS1PtNweBAFKNSgfIYf9HXN1Tb4pU8LyaGRnkEmgCFADLn/mkdDwNmd3IMC9x0/IjLo9KG2HUARA9n+PCtPalb5QyxtzSztgj+9RHb4Yyv91MMtBqQM1WPwLorRgNWAdM=
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [meta-python][PATCH v2] python-smbus: upgrade to 3.1.2
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
X-List-Received-Date: Thu, 30 Mar 2017 16:27:31 -0000

From: Stefan Agner <stefan.agner@toradex.com>

Upgrade to 3.1.2 and use Yocto source mirror to follow commit f76fe46e098d
("i2c-tools: point SRC_URI at Yocto source mirrors") in OpenEmbedded cores
i2c-tools recipe.

With the upgrade to i2c-tools 3.1.2 Python 3 support has been added. To
support Python 3 add a common recipe for all common information and one for
each supported Python version 2 and 3.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
Changes since v1:
- Use DEPENDS += to avoid overwriting dependencies added by distutils.

 meta-python/recipes-devtools/python/python-smbus.inc | 18 ++++++++++++++++++
 .../recipes-devtools/python/python-smbus_3.1.1.bb    | 20 --------------------
 .../recipes-devtools/python/python-smbus_3.1.2.bb    |  2 ++
 .../recipes-devtools/python/python3-smbus_3.1.2.bb   |  2 ++
 4 files changed, 22 insertions(+), 20 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-smbus.inc
 delete mode 100644 meta-python/recipes-devtools/python/python-smbus_3.1.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python-smbus_3.1.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-smbus_3.1.2.bb

diff --git a/meta-python/recipes-devtools/python/python-smbus.inc b/meta-python/recipes-devtools/python/python-smbus.inc
new file mode 100644
index 0000000..ded30ce
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-smbus.inc
@@ -0,0 +1,18 @@
+SUMMARY = "Set of i2c tools for linux - Python module"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://smbusmodule.c;startline=1;endline=17;md5=fa24df321a520ff8e10f203425ab9fa8"
+
+SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/i2c-tools-${PV}.tar.bz2 \
+"
+SRC_URI[md5sum] = "7104a1043d11a5e2c7b131614eb1b962"
+SRC_URI[sha256sum] = "db5e69f2e2a6e3aa2ecdfe6a5f490b149c504468770f58921c8c5b8a7860a441"
+
+DEPENDS += "i2c-tools"
+
+S = "${WORKDIR}/i2c-tools-${PV}/py-smbus/"
+
+do_configure_prepend() {
+    # Adjust for OE header rename
+    sed -i s:linux/i2c-dev.h:linux/i2c-dev-user.h: Module.mk
+    sed -i s:linux/i2c-dev.h:linux/i2c-dev-user.h: smbusmodule.c
+}
diff --git a/meta-python/recipes-devtools/python/python-smbus_3.1.1.bb b/meta-python/recipes-devtools/python/python-smbus_3.1.1.bb
deleted file mode 100644
index df47df6..0000000
--- a/meta-python/recipes-devtools/python/python-smbus_3.1.1.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Set of i2c tools for linux - Python module"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://smbusmodule.c;startline=1;endline=17;md5=fa24df321a520ff8e10f203425ab9fa8"
-
-SRC_URI = "http://dl.lm-sensors.org/i2c-tools/releases/i2c-tools-${PV}.tar.bz2 \
-"
-SRC_URI[md5sum] = "0fdbff53ebd0b8d9249256d6c56480b1"
-SRC_URI[sha256sum] = "14d4d7d60d1c12e43f2befe239c682a5c44c27682f153d4b58c1e392d2db1700"
-
-DEPENDS = "i2c-tools"
-
-inherit distutils
-
-S = "${WORKDIR}/i2c-tools-${PV}/py-smbus/"
-
-do_configure_prepend() {
-    # Adjust for OE header rename
-    sed -i s:linux/i2c-dev.h:linux/i2c-dev-user.h: Module.mk
-    sed -i s:linux/i2c-dev.h:linux/i2c-dev-user.h: smbusmodule.c
-}
diff --git a/meta-python/recipes-devtools/python/python-smbus_3.1.2.bb b/meta-python/recipes-devtools/python/python-smbus_3.1.2.bb
new file mode 100644
index 0000000..1b95778
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-smbus_3.1.2.bb
@@ -0,0 +1,2 @@
+inherit distutils
+require python-smbus.inc
diff --git a/meta-python/recipes-devtools/python/python3-smbus_3.1.2.bb b/meta-python/recipes-devtools/python/python3-smbus_3.1.2.bb
new file mode 100644
index 0000000..b357bcd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-smbus_3.1.2.bb
@@ -0,0 +1,2 @@
+inherit distutils3
+require python-smbus.inc
-- 
2.7.4


