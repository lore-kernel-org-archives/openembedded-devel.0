Return-Path: <ruben.de.smet@rubdos.be>
Received: from mail.glycos.org (mail.glycos.org [178.62.217.237])
	by mail.openembedded.org (Postfix) with ESMTP id 5BAEC6E5CB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Sep 2016 13:34:59 +0000 (UTC)
Received: from arch-club.local (unknown [85.27.50.55])
	by mail.glycos.org (Postfix) with ESMTPSA id DFEA8400A0;
	Thu, 29 Sep 2016 13:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rubdos.be;
	s=default; t=1475156101;
	bh=YeJT9SVZyiN6j6vfLhCS6u97GZ6C6PvDwRBrEvflfZU=;
	h=From:To:Cc:Subject:Date;
	b=J7W+zQOYk8fo/2RUqqyRYskcDmyFeH7X9IaDfjUDFzkIAMgtsEdoBHCY5V/H1mmrc
	XjKznYTSIrFi7k4kjuP6Jucp8IlgCtgZ7C5oApXAuLDzynW51fX0bxQV+4etcFwJSL
	PDtlkWcghca+LVQgfKAm7liAKuE5l0169fdvR+mM=
From: Ruben De Smet <ruben.de.smet@rubdos.be>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Sep 2016 15:34:55 +0200
Message-Id: <20160929133455.26272-1-ruben.de.smet@rubdos.be>
X-Mailer: git-send-email 2.10.0
Subject: [meta-python][PATCH] python-cassandra-driver: add recipe for version 3.6.0
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
X-List-Received-Date: Thu, 29 Sep 2016 13:34:59 -0000

A Python library for Apache Cassandra

Signed-off-by: Ruben De Smet <ruben.de.smet@rubdos.be>
---
 .../python/python-cassandra-driver.inc              | 21 +++++++++++++++++++++
 .../python/python3-cassandra-driver_3.6.0.bb        | 16 ++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-cassandra-driver.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-cassandra-driver_3.6.0.bb

diff --git a/meta-python/recipes-devtools/python/python-cassandra-driver.inc b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
new file mode 100644
index 0000000..d3e4cf6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
@@ -0,0 +1,21 @@
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
diff --git a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.6.0.bb b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.6.0.bb
new file mode 100644
index 0000000..65fd2c0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.6.0.bb
@@ -0,0 +1,16 @@
+inherit setuptools3
+require python-cassandra-driver.inc
+
+RDEPENDS_${PN} += "\
+    python3-cython \
+    python3-multiprocessing \
+    python3-six \
+    python3-json \
+    libevent \
+"
+RDEPENDS_${PN}_class-native = ""
+
+DEPENDS_${PN} += "\
+    python3-setuptools \
+    python3-cython \
+"
-- 
2.10.0


