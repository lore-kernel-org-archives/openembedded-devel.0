Return-Path: <ruben.de.smet@rubdos.be>
Received: from mail.glycos.org (mail.glycos.org [178.62.217.237])
	by mail.openembedded.org (Postfix) with ESMTP id AC925731F7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 14:29:55 +0000 (UTC)
Received: from localhost.localdomain (unknown [85.27.50.55])
	by mail.glycos.org (Postfix) with ESMTPSA id 514B93FE11;
	Mon, 22 Aug 2016 14:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rubdos.be;
	s=default; t=1471876195;
	bh=YcQaksW20Sni8J+jA5/UASxGCqk43XwanPrXNdbOoqc=;
	h=From:To:Cc:Subject:Date;
	b=k4KebmfpOreRK6/dbnxr/Yb3WOkSRExjswNneE2XFLKzu3ZsB63rpxXcFKs2WmaKo
	eX2ul4cwQ6eKejKie/H9hDH5NaebSJk4w0GN2rsn20UaDRKbbuzT1pACIbjijmhIIO
	PqPHx3XIIet7XLE9t5O4RPqvIziQq1iBaKc9R7lA=
From: Ruben De Smet <ruben.de.smet@rubdos.be>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2016 16:29:32 +0200
Message-Id: <20160822142932.21336-1-ruben.de.smet@rubdos.be>
X-Mailer: git-send-email 2.9.3
Subject: [meta-oe][krogoth][PATCH] python-spidev: add recipe for version 3.2
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
X-List-Received-Date: Mon, 22 Aug 2016 14:29:56 -0000

A python module for interfacing with SPI

Signed-off-by: Ruben De Smet <ruben.de.smet@rubdos.be>
---
 meta-python/recipes-devtools/python/python-spidev.inc   | 17 +++++++++++++++++
 .../recipes-devtools/python/python3-spidev_3.2.bb       | 10 ++++++++++
 2 files changed, 27 insertions(+)
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
index 0000000..4794e61
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-spidev_3.2.bb
@@ -0,0 +1,10 @@
+inherit setuptools3
+require python-spidev.inc
+
+RDEPENDS_${PN} += "\
+"
+RDEPENDS_${PN}_class-native = ""
+
+DEPENDS_${PN} += "\
+    python3-setuptools \
+"
-- 
2.9.3


