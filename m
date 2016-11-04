Return-Path: <ruben.de.smet@rubdos.be>
Received: from mail.glycos.org (mail.glycos.org [178.62.217.237])
	by mail.openembedded.org (Postfix) with ESMTP id 82C0871B2F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Nov 2016 10:16:43 +0000 (UTC)
Received: from arch-club.local (unknown [85.27.50.55])
	by mail.glycos.org (Postfix) with ESMTPSA id 9475A45557;
	Fri,  4 Nov 2016 10:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rubdos.be;
	s=default; t=1478254604;
	bh=JXXqOwT40nVQdavr7Qpzloz+lnTf+P5/grRq80W5ja8=;
	h=From:To:Cc:Subject:Date;
	b=dE+GDK5o9X2tHFKbsU8q20YcurVXP4OYSE19e0qTYKoq0xJGc4L9xoXG+lFvra0fo
	iCv1pIfKSXZ6rL9Y0eex84UGX/Cjk0JGoOjLzKUO5sQwRJ6d0rFSEC5RYFX5lbaTb1
	P4xsotmgj13KUmkb/Qeowf7jorH/ZnCeERxPCGjM=
From: Ruben De Smet <ruben.de.smet@rubdos.be>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Nov 2016 11:16:39 +0100
Message-Id: <20161104101639.20665-1-ruben.de.smet@rubdos.be>
X-Mailer: git-send-email 2.10.2
Subject: [meta-python][PATCH v2] python-cassandra-driver: add recipe for version 3.6.0
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
X-List-Received-Date: Fri, 04 Nov 2016 10:16:46 -0000

A Python library for Apache Cassandra

Signed-off-by: Ruben De Smet <ruben.de.smet@rubdos.be>
---
 .../python/python-cassandra-driver.inc             | 29 ++++++++++++++++++++++
 .../python/python3-cassandra-driver_3.6.0.bb       |  7 ++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-cassandra-driver.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-cassandra-driver_3.6.0.bb

diff --git a/meta-python/recipes-devtools/python/python-cassandra-driver.inc b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
new file mode 100644
index 0000000..0e6113d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
@@ -0,0 +1,29 @@
+SUMMARY = "DataStax Python Driver for Apache Cassandra"
+DESCRIPTION = "A modern, feature-rich and highly-tunable Python client \
+library for Apache Cassandra (1.2+) and DataStax Enterprise (3.1+) using \
+exclusively Cassandra's binary protocol and Cassandra Query Language v3."
+HOMEPAGE = "https://github.com/datastax/python-driver"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
+SRCNAME = "cassandra-driver"
+
+SRC_URI[md5sum] = "756a3b235c5766c3072ed62e1083c9ef"
+SRC_URI[sha256sum] = "049c8a871e49052c7b72fddb6569f1bfe738bbfea0a562eeeb5404abeff015ab"
+
+DISTUTILS_BUILD_ARGS += " \
+    --no-libev \
+"
+DISTUTILS_INSTALL_ARGS += " \
+    --no-libev \
+"
+
+inherit pypi
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-cython \
+    ${PYTHON_PN}-multiprocessing \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-json \
+    libevent \
+"
diff --git a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.6.0.bb b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.6.0.bb
new file mode 100644
index 0000000..6d7ed20
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.6.0.bb
@@ -0,0 +1,7 @@
+inherit setuptools3
+require python-cassandra-driver.inc
+RDEPENDS_${PN}_class-native = ""
+
+DEPENDS_${PN} += "\
+    python3-cython \
+"
-- 
2.10.2


