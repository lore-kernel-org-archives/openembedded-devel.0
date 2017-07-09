Return-Path: <krzk@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 811E26FFD8
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Jul 2017 15:47:46 +0000 (UTC)
Received: from localhost.localdomain (pub082136089155.dh-hfc.datazug.ch
	[82.136.89.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 13B3122BE3;
	Sun,  9 Jul 2017 15:47:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13B3122BE3
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzk@kernel.org
From: Krzysztof Kozlowski <krzk@kernel.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Jul 2017 17:47:21 +0200
Message-Id: <20170709154723.4623-1-krzk@kernel.org>
X-Mailer: git-send-email 2.11.0
Subject: [meta-python][PATCH 1/3] meta-python: Add Protobuf and gRPC Python recipes
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
X-List-Received-Date: Sun, 09 Jul 2017 15:47:46 -0000

Add recipes for Python PIP packages for Google's Protobuf, gRPC and gRPC
tools.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../python/python-grpcio-tools_1.4.0.bb            | 17 ++++++++++++++++
 .../recipes-devtools/python/python-grpcio_1.4.0.bb | 23 ++++++++++++++++++++++
 .../python/python-protobuf_3.3.0.bb                | 16 +++++++++++++++
 3 files changed, 56 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-grpcio-tools_1.4.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python-grpcio_1.4.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python-protobuf_3.3.0.bb

diff --git a/meta-python/recipes-devtools/python/python-grpcio-tools_1.4.0.bb b/meta-python/recipes-devtools/python/python-grpcio-tools_1.4.0.bb
new file mode 100644
index 000000000000..f9cfd9967f3e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-grpcio-tools_1.4.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Google gRPC tools"
+HOMEPAGE = "http://www.grpc.io/"
+SECTION = "devel/python"
+
+DEPENDS = "python-grpcio"
+RDEPENDS_${PN} = "python-grpcio"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
+
+inherit pypi setuptools
+
+SRC_URI[md5sum] = "b0d585872c69f207a05c55566e8afb38"
+SRC_URI[sha256sum] = "bddc98f063755a5df9d285666db49c49201f93d416c45d4f4924cf752b68c99c"
+
+# For usage in other recipies when compiling protobuf files (e.g. by grpcio-tools)
+BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-grpcio_1.4.0.bb b/meta-python/recipes-devtools/python/python-grpcio_1.4.0.bb
new file mode 100644
index 000000000000..5412e0243392
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-grpcio_1.4.0.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Google gRPC"
+HOMEPAGE = "http://www.grpc.io/"
+SECTION = "devel/python"
+
+DEPENDS = "python-protobuf"
+
+RDEPENDS_${PN} = "python-enum34 \
+                  python-futures \
+                  python-protobuf \
+                  python-setuptools \
+                  python-six \
+"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
+
+inherit pypi setuptools
+
+SRC_URI[md5sum] = "d882ae4eeef4f32ac9c1d32052bf05ad"
+SRC_URI[sha256sum] = "a3a213a4c24b5c572b386d752e3b74a3f1b8fa5d03c07b6166fa39f3a6cdef34"
+
+# For usage in other recipies when compiling protobuf files (e.g. by grpcio-tools)
+BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-protobuf_3.3.0.bb b/meta-python/recipes-devtools/python/python-protobuf_3.3.0.bb
new file mode 100644
index 000000000000..61b8fef0027b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-protobuf_3.3.0.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Protocol Buffers"
+HOMEPAGE = "https://developers.google.com/protocol-buffers/"
+SECTION = "devel/python"
+
+RDEPENDS_${PN} = "python-six"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
+
+inherit pypi setuptools
+
+SRC_URI[md5sum] = "27941e8e42e83d5183605054576882dd"
+SRC_URI[sha256sum] = "1cbcee2c45773f57cb6de7ee0eceb97f92b9b69c0178305509b162c0160c1f04"
+
+# For usage in other recipies when compiling protobuf files (e.g. by grpcio-tools)
+BBCLASSEXTEND = "native"
-- 
2.11.0


