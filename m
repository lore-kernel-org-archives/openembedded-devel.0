Return-Path: <yaoxp@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9C2886FC0F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Jun 2014 05:45:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.00,711,1396972800"; d="scan'208";a="31927660"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Jun 2014 13:42:40 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id s5F5jIcX024284
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Jun 2014 13:45:18 +0800
Received: from FEDORA20.fnst.cn.fujitsu.com (10.167.226.101) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Sun, 15 Jun 2014 13:45:18 +0800
From: Yao Xinpan <yaoxp@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 15 Jun 2014 13:45:09 +0800
Message-ID: <1402811109-29290-1-git-send-email-yaoxp@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.4.2
MIME-Version: 1.0
X-Originating-IP: [10.167.226.101]
Subject: [meta-oe][meta-networking][PATCH] add recipe cim-schema, cim-schema-docs and license file DMTF.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Jun 2014 05:45:30 -0000
Content-Type: text/plain

Common Information Model (CIM) is a model for describing overall
management information in a network or enterprise environment. CIM
consists of a specification and a schema. The specification defines the
details for integration with other management models. The schema
provides the actual model descriptions.

Signed-off-by: Yao Xinpan <yaoxp@cn.fujitsu.com>
---
 meta-networking/licenses/DMTF                      | 34 ++++++++++++++++++++++
 .../cim-schema/cim-schema-docs_2.40.0.bb           | 23 +++++++++++++++
 .../recipes-support/cim-schema/cim-schema.inc      |  9 ++++++
 .../cim-schema/cim-schema_2.40.0.bb                | 31 ++++++++++++++++++++
 .../recipes-support/cim-schema/files/LICENSE       | 34 ++++++++++++++++++++++
 5 files changed, 131 insertions(+)
 create mode 100644 meta-networking/licenses/DMTF
 create mode 100644 meta-networking/recipes-support/cim-schema/cim-schema-docs_2.40.0.bb
 create mode 100644 meta-networking/recipes-support/cim-schema/cim-schema.inc
 create mode 100644 meta-networking/recipes-support/cim-schema/cim-schema_2.40.0.bb
 create mode 100644 meta-networking/recipes-support/cim-schema/files/LICENSE

diff --git a/meta-networking/licenses/DMTF b/meta-networking/licenses/DMTF
new file mode 100644
index 0000000..54a2812
--- /dev/null
+++ b/meta-networking/licenses/DMTF
@@ -0,0 +1,34 @@
+// Copyright 1998-2008 Distributed Management Task Force, Inc. (DMTF).
+// All rights reserved.
+// DMTF is a not-for-profit association of industry members dedicated
+// to promoting enterprise and systems management and interoperability.
+// DMTF specifications and documents may be reproduced by
+// members and non-members, provided that correct attribution is given.
+// As DMTF specifications may be revised from time to time,
+// the particular version and release date should always be noted.
+// 
+// Implementation of certain elements of this standard or proposed
+// standard may be subject to third party patent rights, including
+// provisional patent rights (herein "patent rights"). DMTF makes
+// no representations to users of the standard as to the existence
+// of such rights, and is not responsible to recognize, disclose, or
+// identify any or all such third party patent right, owners or
+// claimants, nor for any incomplete or inaccurate identification or
+// disclosure of such rights, owners or claimants. DMTF shall have no
+// liability to any party, in any manner or circumstance, under any
+// legal theory whatsoever, for failure to recognize, disclose, or
+// identify any such third party patent rights, or for such party's
+// reliance on the standard or incorporation thereof in its product,
+// protocols or testing procedures. DMTF shall have no liability to
+// any party implementing such standard, whether such implementation
+// is foreseeable or not, nor to any patent owner or claimant, and shall
+// have no liability or responsibility for costs or losses incurred if
+// a standard is withdrawn or modified after publication, and shall be
+// indemnified and held harmless by any party implementing the
+// standard from any and all claims of infringement by a patent owner
+// for such implementations.
+// 
+// For information about patents held by third-parties which have
+// notified the DMTF that, in their opinion, such patent may relate to
+// or impact implementations of DMTF standards, visit
+// http://www.dmtf.org/about/policies/disclosures.php.
diff --git a/meta-networking/recipes-support/cim-schema/cim-schema-docs_2.40.0.bb b/meta-networking/recipes-support/cim-schema/cim-schema-docs_2.40.0.bb
new file mode 100644
index 0000000..06c0dd9
--- /dev/null
+++ b/meta-networking/recipes-support/cim-schema/cim-schema-docs_2.40.0.bb
@@ -0,0 +1,23 @@
+require cim-schema.inc
+
+LICENSE = "DMTF"
+
+SRC_URI = "http://dmtf.org/sites/default/files/cim/cim_schema_v2400/cim_schema_${PV}Final-Doc.zip \
+           file://LICENSE \
+          "
+SRC_URI[md5sum] = "3d01940bc1085c6c42184c25fb61f739"
+SRC_URI[sha256sum] = "3174cf0f8657b19d80dc59e184778d8e553da424728cb2966fe9d5428dd84267"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=eecc6f71a56ff3caf17f15bf7aeac7b4"
+
+do_unpack() {
+        unzip -q ${DL_DIR}/cim_schema_${PV}Final-Doc.zip -d ${S}
+        cp -f ${FILE_DIRNAME}/files/LICENSE ${WORKDIR}/
+}
+
+do_install() {
+        install -d -m 0755 ${D}${datadir}/doc/cim-schema-${PV}-docs
+        cp -a ${S}/* ${D}${datadir}/doc/cim-schema-${PV}-docs
+}
+
+FILES_${PN} = "${datadir}/doc/*"
+FILES_${PN}-doc = ""
diff --git a/meta-networking/recipes-support/cim-schema/cim-schema.inc b/meta-networking/recipes-support/cim-schema/cim-schema.inc
new file mode 100644
index 0000000..e35bff6
--- /dev/null
+++ b/meta-networking/recipes-support/cim-schema/cim-schema.inc
@@ -0,0 +1,9 @@
+SUMMARY = "Common Information Model (CIM) Schema"
+DESCRIPTION = "Common Information Model (CIM) is a model for describing overall\
+management information in a network or enterprise environment. CIM\
+consists of a specification and a schema. The specification defines the\
+details for integration with other management models. The schema\
+provides the actual model descriptions."
+
+HOMEPAGE = "http://www.dmtf.org/"
+SECTION = "Development/Libraries"
diff --git a/meta-networking/recipes-support/cim-schema/cim-schema_2.40.0.bb b/meta-networking/recipes-support/cim-schema/cim-schema_2.40.0.bb
new file mode 100644
index 0000000..ff6c29d
--- /dev/null
+++ b/meta-networking/recipes-support/cim-schema/cim-schema_2.40.0.bb
@@ -0,0 +1,31 @@
+require cim-schema.inc
+
+LICENSE = "DMTF"
+
+SRC_URI = "http://dmtf.org/sites/default/files/cim/cim_schema_v2400/cim_schema_${PV}Final-MOFs.zip \
+           file://LICENSE \
+          "
+SRC_URI[md5sum] = "a9bdf17c7374e3b5b7adeaac4842c4ad"
+SRC_URI[sha256sum] = "dbfa3064ea427acd71a4bebbc172ca2dc44b0b09a6d83b0945b9ffa988a9058a"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=eecc6f71a56ff3caf17f15bf7aeac7b4"
+
+do_unpack() {
+        unzip -q ${DL_DIR}/cim_schema_${PV}Final-MOFs.zip -d ${S}
+        cp -f ${FILE_DIRNAME}/files/LICENSE ${WORKDIR}/
+}
+
+do_install() {
+        install -d -m 0755 ${D}${datadir}/mof/cimv${PV}/
+        install -d -m 0755 ${D}${datadir}/doc/cim-schema-${PV}
+        install -m 644 ${WORKDIR}/LICENSE ${D}${datadir}/doc/cim-schema-${PV}
+
+        cp -a ${S}/* ${D}${datadir}/mof/cimv${PV}/	
+        for i in `find ${D}${datadir}/mof/cimv${PV} -name "*.mof"`; do
+                sed -i -e 's/\r//g' $i
+        done
+        ln -s cimv${PV} ${D}${datadir}/mof/cim-current
+        ln -s cim_schema_${PV}.mof ${D}${datadir}/mof/cim-current/CIM_Schema.mof
+}
+
+FILES_${PN} = "${datadir}/mof/* ${datadir}/doc/*"
+FILES_${PN}-doc = ""
diff --git a/meta-networking/recipes-support/cim-schema/files/LICENSE b/meta-networking/recipes-support/cim-schema/files/LICENSE
new file mode 100644
index 0000000..54a2812
--- /dev/null
+++ b/meta-networking/recipes-support/cim-schema/files/LICENSE
@@ -0,0 +1,34 @@
+// Copyright 1998-2008 Distributed Management Task Force, Inc. (DMTF).
+// All rights reserved.
+// DMTF is a not-for-profit association of industry members dedicated
+// to promoting enterprise and systems management and interoperability.
+// DMTF specifications and documents may be reproduced by
+// members and non-members, provided that correct attribution is given.
+// As DMTF specifications may be revised from time to time,
+// the particular version and release date should always be noted.
+// 
+// Implementation of certain elements of this standard or proposed
+// standard may be subject to third party patent rights, including
+// provisional patent rights (herein "patent rights"). DMTF makes
+// no representations to users of the standard as to the existence
+// of such rights, and is not responsible to recognize, disclose, or
+// identify any or all such third party patent right, owners or
+// claimants, nor for any incomplete or inaccurate identification or
+// disclosure of such rights, owners or claimants. DMTF shall have no
+// liability to any party, in any manner or circumstance, under any
+// legal theory whatsoever, for failure to recognize, disclose, or
+// identify any such third party patent rights, or for such party's
+// reliance on the standard or incorporation thereof in its product,
+// protocols or testing procedures. DMTF shall have no liability to
+// any party implementing such standard, whether such implementation
+// is foreseeable or not, nor to any patent owner or claimant, and shall
+// have no liability or responsibility for costs or losses incurred if
+// a standard is withdrawn or modified after publication, and shall be
+// indemnified and held harmless by any party implementing the
+// standard from any and all claims of infringement by a patent owner
+// for such implementations.
+// 
+// For information about patents held by third-parties which have
+// notified the DMTF that, in their opinion, such patent may relate to
+// or impact implementations of DMTF standards, visit
+// http://www.dmtf.org/about/policies/disclosures.php.
-- 
1.8.4.2


