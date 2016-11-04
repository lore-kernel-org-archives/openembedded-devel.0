Return-Path: <ruben.de.smet@rubdos.be>
Received: from mail.glycos.org (mail.glycos.org [178.62.217.237])
	by mail.openembedded.org (Postfix) with ESMTP id 7FE4F71AE2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Nov 2016 10:14:25 +0000 (UTC)
Received: from arch-club.local (unknown [85.27.50.55])
	by mail.glycos.org (Postfix) with ESMTPSA id 9FE9445558;
	Fri,  4 Nov 2016 10:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rubdos.be;
	s=default; t=1478254466;
	bh=T2ZPZtEysSxGIfWtSganCtG7MMpzAwbD+9IvPNCyKHY=;
	h=From:To:Cc:Subject:Date;
	b=ex+kxUPCVBLxaKD/0jPRCu2afFNUiYRbNo129Q1Szwdp3LlDPC6C4/+Vgu8b6EIco
	XUZ1ElMliygKZzFFG7Pt28AjR5zpnHcdatS6VkAPgRgsvBC39NeuH17/btLovXHSs/
	eUjFuTNlxA0lCNvTFg6dSFMggzx0NJ/xyUwZ8VIc=
From: Ruben De Smet <ruben.de.smet@rubdos.be>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Nov 2016 11:14:23 +0100
Message-Id: <20161104101423.20557-1-ruben.de.smet@rubdos.be>
X-Mailer: git-send-email 2.10.2
Subject: [meta-python][PATCH v2] python-scales: add recipe for version 1.0.9
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
X-List-Received-Date: Fri, 04 Nov 2016 10:14:26 -0000

A python module for tracking server state and statisticst

Signed-off-by: Ruben De Smet <ruben.de.smet@rubdos.be>
---
 meta-python/recipes-devtools/python/python-scales.inc   | 17 +++++++++++++++++
 .../recipes-devtools/python/python3-scales_1.0.9.bb     |  2 ++
 2 files changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-scales.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-scales_1.0.9.bb

diff --git a/meta-python/recipes-devtools/python/python-scales.inc b/meta-python/recipes-devtools/python/python-scales.inc
new file mode 100644
index 0000000..4a10a78
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-scales.inc
@@ -0,0 +1,17 @@
+SUMMARY = "Metrics for Python"
+DESCRIPTION = "Tracks server state and statistics, allowing you to see what \
+your server is doing. It can also send metrics to Graphite for graphing or to \
+a file for crash forensics."
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+# LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+SRCNAME = "scales"
+
+SRC_URI[md5sum] = "c61167f2b5f506f0a34a7b8a295a9567"
+SRC_URI[sha256sum] = "8b6930f7d4bf115192290b44c757af5e254e3fcfcb75ff9a51f5c96a404e2753"
+
+inherit pypi
+
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-six \
diff --git a/meta-python/recipes-devtools/python/python3-scales_1.0.9.bb b/meta-python/recipes-devtools/python/python3-scales_1.0.9.bb
new file mode 100644
index 0000000..91b48c2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-scales_1.0.9.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-scales.inc
-- 
2.10.2


