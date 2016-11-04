Return-Path: <ruben.de.smet@rubdos.be>
Received: from mail.glycos.org (mail.glycos.org [178.62.217.237])
	by mail.openembedded.org (Postfix) with ESMTP id 0A78F71A88
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Nov 2016 19:36:05 +0000 (UTC)
Received: from arch-club.local (unknown [84.198.89.1])
	by mail.glycos.org (Postfix) with ESMTPSA id 5E1D944A6A;
	Fri,  4 Nov 2016 19:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rubdos.be;
	s=default; t=1478288166;
	bh=K6/AA6tNlyDammlu6Qd0DHSPe9JMigVT6IC2cG79noA=;
	h=From:To:Cc:Subject:Date;
	b=C2L9VFv/Z3RTA4PE/25UD8IMrsJNYLF64MTu7qeV7gOdl/+GeeFYwRWuMVecD9fNU
	QTLlyRO9W+sBHOvLGaDRy3rAd5fnGyhfI7/EBFp2d7WHSTEEKwnx5PZ08iWLTTifAy
	FGMebUUuyehrDRH6vebnHwDmCQ0+r43iRd8mjFng=
From: Ruben De Smet <ruben.de.smet@rubdos.be>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Nov 2016 20:35:53 +0100
Message-Id: <20161104193553.1493-1-ruben.de.smet@rubdos.be>
X-Mailer: git-send-email 2.10.2
Subject: [meta-python][PATCH v3] python-cassandra-driver: add recipe for version 3.7.1
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
X-List-Received-Date: Fri, 04 Nov 2016 19:36:06 -0000

A Python library for Apache Cassandra

Signed-off-by: Ruben De Smet <ruben.de.smet@rubdos.be>
---
 .../python/python-cassandra-driver.inc             | 33 ++++++++++++++++++++++
 .../python/python3-cassandra-driver_3.7.1.bb       |  2 ++
 2 files changed, 35 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-cassandra-driver.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-cassandra-driver_3.7.1.bb

diff --git a/meta-python/recipes-devtools/python/python-cassandra-driver.inc b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
new file mode 100644
index 0000000..bc83592
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
@@ -0,0 +1,33 @@
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
+SRC_URI[md5sum] = "e01822b1e08940f300c0013765e070be"
+SRC_URI[sha256sum] = "cd76355a6bf30b9cb9f1dd12327b6db2f4b883d5521eb6cac5e6b905000d688e"
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
+
+DEPENDS_${PN} += "\
+    ${PYTHON_PN}-cython \
+"
diff --git a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.7.1.bb b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.7.1.bb
new file mode 100644
index 0000000..4f5c019
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.7.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-cassandra-driver.inc
-- 
2.10.2


