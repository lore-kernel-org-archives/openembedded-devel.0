Return-Path: <ruben.de.smet@rubdos.be>
Received: from mail.glycos.org (mail.glycos.org [178.62.217.237])
	by mail.openembedded.org (Postfix) with ESMTP id CB76676806
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 14:35:03 +0000 (UTC)
Received: from localhost.localdomain (unknown [85.27.50.55])
	by mail.glycos.org (Postfix) with ESMTPSA id 43A513FCD9;
	Mon, 22 Aug 2016 14:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rubdos.be;
	s=default; t=1471876504;
	bh=6x3LUvs1WvAuXMx2jHXBj6oUpu9lFtWR6tlN8MHzRwk=;
	h=From:To:Cc:Subject:Date;
	b=UlZSN4ExWd+UmEUhKKuzu3yaquQzNRfb/T1h5r1sncYLPxPwzkg/r8agLgugsZdAt
	H15z4RwyM3xKLeYcIVlrpGWCO559NwuK2uuI1KNtWOGF5YZmffRh+qfq1tfgQs+w/d
	O5JaYkZ0p6pnMxG+4IV06IsgILNH95yyZN6unbuM=
From: Ruben De Smet <ruben.de.smet@rubdos.be>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2016 16:34:57 +0200
Message-Id: <20160822143457.6378-1-ruben.de.smet@rubdos.be>
X-Mailer: git-send-email 2.9.3
Subject: [meta-oe][krogoth][PATCH] python-cassandra-driver: add recipe for version 3.6.0
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
X-List-Received-Date: Mon, 22 Aug 2016 14:35:05 -0000

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
2.9.3


