Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 62FBF6058C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 08:40:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8T8e4NB008363
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 01:40:04 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Sun, 29 Sep 2019 01:39:45 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 29 Sep 2019 16:28:28 +0800
Message-ID: <1569745708-12228-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-pika: add recipes for python2 and python3
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
X-List-Received-Date: Sun, 29 Sep 2019 08:40:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Jackie Huang <jackie.huang@windriver.com>

Pika is a pure-Python implementation of the AMQP 0-9-1
protocol including RabbitMQ’s extensions.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-devtools/python/python-pika.inc        | 22 ++++++++++++++++++++++
 .../recipes-devtools/python/python-pika_1.1.0.bb   |  2 ++
 .../recipes-devtools/python/python3-pika_1.1.0.bb  |  2 ++
 3 files changed, 26 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pika.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pika_1.1.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pika_1.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python-pika.inc b/meta-python/recipes-devtools/python/python-pika.inc
new file mode 100644
index 0000000..10be5bb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pika.inc
@@ -0,0 +1,22 @@
+SUMMARY = "Pika is a RabbitMQ (AMQP 0-9-1) client library for Python."
+DESCRIPTION = " \
+Pika is a pure-Python implementation of the AMQP 0-9-1 protocol \
+including RabbitMQ’s extensions. \
+"
+SECTION = "devel/python"
+HOMEPAGE = "https://pika.readthedocs.io"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=535836bf0a5de515a7bfee026075701d"
+
+SRC_URI[md5sum] = "6002400cdd33bf85ec8680ece72910d4"
+SRC_URI[sha256sum] = "9fa76ba4b65034b878b2b8de90ff8660a59d925b087c5bb88f8fdbb4b64a1dbf"
+
+inherit pypi
+
+PYPI_PACKAGE = "pika"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-tornado \
+    ${PYTHON_PN}-twisted \
+"
diff --git a/meta-python/recipes-devtools/python/python-pika_1.1.0.bb b/meta-python/recipes-devtools/python/python-pika_1.1.0.bb
new file mode 100644
index 0000000..f7e0198
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pika_1.1.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-pika.inc
diff --git a/meta-python/recipes-devtools/python/python3-pika_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pika_1.1.0.bb
new file mode 100644
index 0000000..a151588
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pika_1.1.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-pika.inc
-- 
2.7.4


