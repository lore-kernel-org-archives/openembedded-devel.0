Return-Path: <ml@embed.me.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 25217731C7
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 May 2016 16:31:14 +0000 (UTC)
From: ml@embed.me.uk
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 May 2016 17:31:29 +0100
Message-Id: <1462811489-16960-1-git-send-email-ml@embed.me.uk>
X-Mailer: git-send-email 2.8.2
Cc: Jack Mitchell <jack@embed.me.uk>
Subject: [meta-oe][PATCHv3] libsoc: update to 0.8.1
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
X-List-Received-Date: Mon, 09 May 2016 16:31:15 -0000

From: Jack Mitchell <jack@embed.me.uk>

- New python bindings supported
- New board config options supported
- PACKAGECONFIG options added for other configure flags

Signed-off-by: Jack Mitchell <jack@embed.me.uk>
---

v3
 - re-order variables to be in the right style
 - add forgotten signed-off-by

v2
 - remove $FILES_{PN}-dbg as it's not required

 meta-oe/recipes-support/libsoc/libsoc_0.7.1.bb | 17 --------------
 meta-oe/recipes-support/libsoc/libsoc_0.8.1.bb | 32 ++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 17 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libsoc/libsoc_0.7.1.bb
 create mode 100644 meta-oe/recipes-support/libsoc/libsoc_0.8.1.bb

diff --git a/meta-oe/recipes-support/libsoc/libsoc_0.7.1.bb b/meta-oe/recipes-support/libsoc/libsoc_0.7.1.bb
deleted file mode 100644
index 911e0ba..0000000
--- a/meta-oe/recipes-support/libsoc/libsoc_0.7.1.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "Library for interfacing with common SoC peripherals"
-DESCRIPTION = "libsoc is a C library to interface with common peripherals (gpio, i2c, spi, pwm) \
-               found in SoC (System on Chips) through generic Linux Kernel interfaces."
-
-HOMEPAGE = "https://github.com/jackmitch/libsoc"
-
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e0bfebea12a718922225ba987b2126a5"
-
-inherit autotools
-
-SRCREV = "2919c35e706fe7c311f83f9343865420fa4b37fe"
-SRC_URI = "git://github.com/jackmitch/libsoc.git"
-
-S = "${WORKDIR}/git"
-
-RDEPENDS_${PN} = "libgcc"
diff --git a/meta-oe/recipes-support/libsoc/libsoc_0.8.1.bb b/meta-oe/recipes-support/libsoc/libsoc_0.8.1.bb
new file mode 100644
index 0000000..cf39278
--- /dev/null
+++ b/meta-oe/recipes-support/libsoc/libsoc_0.8.1.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Library for interfacing with common SoC peripherals"
+DESCRIPTION = "libsoc is a C library to interface with common peripherals (gpio, i2c, spi, pwm) \
+               found in SoC (System on Chips) through generic Linux Kernel interfaces."
+
+HOMEPAGE = "https://github.com/jackmitch/libsoc"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e0bfebea12a718922225ba987b2126a5"
+
+inherit autotools pkgconfig python-dir
+
+SRCREV = "7fc953f980f4a51f0272ad691d3aa06b6aedbf16"
+SRC_URI = "git://github.com/jackmitch/libsoc.git"
+
+S = "${WORKDIR}/git"
+
+BOARD ??= "devboard"
+
+PACKAGECONFIG ?= ""
+
+PACKAGECONFIG[disabledebug] = "--disable-debug,,"
+PACKAGECONFIG[allboardconfigs] = "--with-board-configs,,"
+PACKAGECONFIG[enableboardconfig] = "--enable-board=${BOARD},,"
+PACKAGECONFIG[python] = "--enable-python=${PYTHON_PN},,${PYTHON_PN}"
+
+PACKAGES =+ "${@bb.utils.contains('PACKAGECONFIG', 'python', \
+	'${PYTHON_PN}-libsoc-staticdev ${PYTHON_PN}-libsoc', '', d)}"
+
+RDEPENDS_${PN} = "libgcc"
+
+FILES_${PYTHON_PN}-libsoc-staticdev += "${PYTHON_SITEPACKAGES_DIR}/*/*.a"
+FILES_${PYTHON_PN}-libsoc += "${PYTHON_SITEPACKAGES_DIR}"
-- 
2.8.2


