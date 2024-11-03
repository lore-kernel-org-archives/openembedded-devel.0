Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E31D11194
	for <webhook@archiver.kernel.org>; Sun,  3 Nov 2024 21:54:28 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.44812.1730670861152618004
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Nov 2024 13:54:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=b6VL5n0/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D1951BF204;
	Sun,  3 Nov 2024 21:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730670859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FvoM7EOtPgQ8dF3M3b0XBbRP7K1eXmN0cGarU6IcCs0=;
	b=b6VL5n0/NVxbXbE3jqLHIQvZ7aNg0+gMgtSsJuylaUBYMggRPmPQvpTthSnIqiu2ccHl2i
	2j4dkS7wY8D+v6yEpfjF8JcILn+q9q5fpZq5Onx1butVjXIEebbqI8OjdncJ3dDtUWl7Ls
	d8x0Qsr1VMEtHrAIbB/U+2F5JprInJPgAYIK4bWKn+jxdCRJyFoiVEF8wamUOQ2v/wdspd
	Tap+skoqJ9N5hFbLZuKZ0reiJMafXoYz99ggRnwWJCx3KFp5LfwnR4fcXt4gLgPz1qu8c0
	6XtEGxk6odbyAmwTAorcdGncAaQpy/rDFjk84JG7/LtiqGuknd0PrrQHGTR33g==
From: thomas.perrot@bootlin.com
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [oe][meta-python][PATCH] python3-zstandard: add a recipe for version 0.23.0
Date: Sun,  3 Nov 2024 22:54:09 +0100
Message-ID: <20241103215409.1409757-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 03 Nov 2024 21:54:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113399

From: Thomas Perrot <thomas.perrot@bootlin.com>

This package offers Python bindings to interface with the
Zstandard compression library.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 .../packagegroups/packagegroup-meta-python.bb |  1 +
 .../python3-zstandard_0.23.0.bb               | 23 +++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python3-zstandard/python3-zstandard_0.23.0.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 81f45fb78dd6..8ee1cdc10152 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -465,6 +465,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-yappi \
     python3-yarl \
     python3-zopeinterface \
+    python3-zstandard \
     telepathy-python3 \
     unattended-upgrades \
 "
diff --git a/meta-python/recipes-devtools/python3-zstandard/python3-zstandard_0.23.0.bb b/meta-python/recipes-devtools/python3-zstandard/python3-zstandard_0.23.0.bb
new file mode 100644
index 000000000000..e44e04038c16
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-zstandard/python3-zstandard_0.23.0.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Python bindings for interfacing with the Zstandard compression library"
+DESCRIPTION = "This project provides Python bindings for interfacing with the \
+               Zstandard compression library. A C extension and CFFI interface \
+	       are provided."
+HOMEPAGE = "https://github.com/indygreg/python-zstandard"
+BUGTRACKER = "https://github.com/indygreg/python-zstandard/issues"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3ae87c50fd64b6f0942823686871e758"
+
+DEPENDS = "python3-cffi"
+
+RDEPENDS_${PN} = "\
+    libzstd (>= 1.4.0) \
+    python3-cffi \
+"
+
+inherit setuptools3 pypi
+
+SRC_URI[sha256sum] = "b2d8c62d08e7255f68f7a740bae85b3c9b8e5466baa9cbf7f57f1cde0ac6bc09"
+
+# Because the pyproject.toml is still in development and it contains invalid
+# requirements.
+INSANE_SKIP += "pep517-backend"
-- 
2.47.0


