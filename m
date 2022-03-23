Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D71C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 23:49:23 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web09.4537.1648079362187344718
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 16:49:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57,
 mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net (ip203.trans.bevcomm.net
 [76.164.132.203] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 22NNnKUU027700
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 18:49:21 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-devel@lists.openembedded.org
Subject: [RFC][meta-python][PATCH] python3-kaleido: Add a lightweight graphics
 library
Date: Wed, 23 Mar 2022 18:49:19 -0500
Message-Id: <20220323234919.586572-1-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Mar 2022 23:49:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96174

From: Mark Hatle <mark.hatle@xilinx.com>

Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 .../python/python3-kaleido_0.2.1.bb           | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-kaleido_0.2.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-kaleido_0.2.1.bb b/meta-python/recipes-devtools/python/python3-kaleido_0.2.1.bb
new file mode 100644
index 0000000000..3b95f3cb18
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-kaleido_0.2.1.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Cross-platform library for generating static images"
+DESCRIPTION = "Kaleido is a cross-platform library for generating static images \
+(e.g. png, svg, pdf, etc.) for web-based visualization libraries, with a particular \
+focus on eliminating external dependencies."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=33ee0e1da4dbba9e5232bb1dcabfd47f"
+
+SRC_URI = "git://github.com/plotly/Kaleido.git;protocol=https"
+SRCREV = "624c30ca29b3a120215264b3b2e9341bf1bb4247"
+
+inherit python3native setuptools3
+
+DEPENDS += "python3-wheel-native"
+
+DISTUTILS_SETUP_PATH = "${WORKDIR}/git/repos/kaleido/py"
+S = "${WORKDIR}/git"
+
+DISTUTILS_BUILD_ARGS = "package"
+
+do_compile:prepend() {
+        mkdir -p ${S}/repos/build/kaleido
+
+        cp ${S}/README.md ${S}/repos/kaleido/.
+        cp ${S}/LICENSE.txt ${S}/repos/kaleido/.
+
+	python3 ${S}/repos/version/build_pep440_version.py
+}
-- 
2.17.1


