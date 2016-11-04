Return-Path: <ruben.de.smet@rubdos.be>
Received: from mail.glycos.org (mail.glycos.org [178.62.217.237])
	by mail.openembedded.org (Postfix) with ESMTP id ACE8271B2F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Nov 2016 10:16:52 +0000 (UTC)
Received: from arch-club.local (unknown [85.27.50.55])
	by mail.glycos.org (Postfix) with ESMTPSA id A05B945557;
	Fri,  4 Nov 2016 10:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rubdos.be;
	s=default; t=1478254613;
	bh=hnLTjju+CUJEEmRNvbF/y6irqTD4tMt+cEi1vCW0wvU=;
	h=From:To:Cc:Subject:Date;
	b=aE/u+zRMrtLR00HhsAsu2EKuIU5Sg7oDwJv2B7hw3QRGg+YdtyIxPaJWeYKJyEWLH
	MLmaMguMCEiHuoM8Jg7JjtsRQS28sZxbTUmPT2FZCnhgLh3YH3R0zbeqW8D+Vy4Urn
	wDM3Ms9otz25GSya4Dbxu3NHJIhKQyfbCB9DF0d0=
From: Ruben De Smet <ruben.de.smet@rubdos.be>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Nov 2016 11:16:49 +0100
Message-Id: <20161104101649.20749-1-ruben.de.smet@rubdos.be>
X-Mailer: git-send-email 2.10.2
Subject: [meta-python][PATCH v2] python-spidev: add recipe for version 3.2
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
X-List-Received-Date: Fri, 04 Nov 2016 10:16:52 -0000

A python module for interfacing with SPI

Signed-off-by: Ruben De Smet <ruben.de.smet@rubdos.be>
---
 meta-python/recipes-devtools/python/python-spidev.inc   | 17 +++++++++++++++++
 .../recipes-devtools/python/python3-spidev_3.2.bb       |  6 ++++++
 2 files changed, 23 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-spidev.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-spidev_3.2.bb

diff --git a/meta-python/recipes-devtools/python/python-spidev.inc b/meta-python/recipes-devtools/python/python-spidev.inc
new file mode 100644
index 0000000..1b93763
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-spidev.inc
@@ -0,0 +1,17 @@
+SUMMARY = "Python bindings for Linux SPI access through spidev"
+DESCRIPTION = "This project contains a python module for interfacing with SPI\
+devices from user space via the spidev linux kernel driver.\
+This is a modified version of the code originally found\
+[here](http://elk.informatik.fh-augsburg.de/da/da-49/trees/pyap7k/lang/py-spi)\
+All code is GPLv2 licensed unless explicitly stated otherwise."
+HOMEPAGE = "http://github.com/doceme/py-spidev"
+SECTION = "devel/python"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=54bdb9022ebb75ab68399cdaab97da60"
+SRCNAME = "spidev"
+
+SRC_URI[md5sum] = "f601676f1bb48b9aa3b3897f95216365"
+SRC_URI[sha256sum] = "09d2b5122f0dd79910713a11f9a0020f71537224bf829916def4fffc0ea59456"
+
+
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python3-spidev_3.2.bb b/meta-python/recipes-devtools/python/python3-spidev_3.2.bb
new file mode 100644
index 0000000..59f1c4f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-spidev_3.2.bb
@@ -0,0 +1,6 @@
+inherit setuptools3
+require python-spidev.inc
+
+RDEPENDS_${PN} += "\
+"
+RDEPENDS_${PN}_class-native = ""
-- 
2.10.2


