Return-Path: <ruben.de.smet@rubdos.be>
Received: from mail.glycos.org (mail.glycos.org [178.62.217.237])
	by mail.openembedded.org (Postfix) with ESMTP id 9059773257
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 14:31:36 +0000 (UTC)
Received: from localhost.localdomain (unknown [85.27.50.55])
	by mail.glycos.org (Postfix) with ESMTPSA id 511453FCEB;
	Mon, 22 Aug 2016 14:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rubdos.be;
	s=default; t=1471876297;
	bh=3aZAyHJwhozN96LfVO3NCkqKpWeBq8M4kh11nr1zj60=;
	h=From:To:Cc:Subject:Date;
	b=jMODlnJtvtiSVzqIv7tZ9Y/JHJMooag1Li8jSmtX0lds248QFAahBGb5yH7nP1EFp
	4o//87TzeIL/6SgC6FuA5QqgY/XkW5NaGWpEIkLHvFHatWtFkTNo+k4tfaNM5hyJAL
	vvi+9QPfy4NzVrICx8xTDZBZU+FAZuNqYVcb7Vcs=
From: Ruben De Smet <ruben.de.smet@rubdos.be>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2016 16:31:24 +0200
Message-Id: <20160822143124.6300-1-ruben.de.smet@rubdos.be>
X-Mailer: git-send-email 2.9.3
Subject: [meta-oe][krogoth][PATCH] python-scales: add recipe for version 1.0.9
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
X-List-Received-Date: Mon, 22 Aug 2016 14:31:36 -0000

A python module for tracking server state and statisticst
---
 meta-python/recipes-devtools/python/python-scales.inc       | 13 +++++++++++++
 meta-python/recipes-devtools/python/python3-scales_1.0.9.bb | 11 +++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-scales.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-scales_1.0.9.bb

diff --git a/meta-python/recipes-devtools/python/python-scales.inc b/meta-python/recipes-devtools/python/python-scales.inc
new file mode 100644
index 0000000..5a46e2b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-scales.inc
@@ -0,0 +1,13 @@
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
diff --git a/meta-python/recipes-devtools/python/python3-scales_1.0.9.bb b/meta-python/recipes-devtools/python/python3-scales_1.0.9.bb
new file mode 100644
index 0000000..ecf6c67
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-scales_1.0.9.bb
@@ -0,0 +1,11 @@
+inherit setuptools3
+require python-scales.inc
+
+RDEPENDS_${PN} += "\
+    python3-six \
+"
+
+DEPENDS_${PN} += "\
+    python3-setuptools \
+"
+
-- 
2.9.3


