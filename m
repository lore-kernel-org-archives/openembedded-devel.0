Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 261B376724
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2015 04:43:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99627558"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Aug 2015 12:47:18 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t7E4huGx012402
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2015 12:43:56 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 14 Aug 2015 12:43:57 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 14 Aug 2015 12:43:59 +0800
Message-ID: <1439527440-33965-6-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1439527440-33965-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1439527440-33965-1-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [meta-oe][PATCH v5 5/6] cim-schema-exper: add new recipe for openlmi
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
X-List-Received-Date: Fri, 14 Aug 2015 04:44:01 -0000
Content-Type: text/plain

- Cim-schema(Experimental-MOFs) is dependence of openlmi.
- Cim-schema_2.40.0.bb is renamed to cim-schema-final_2.40.0.bb.

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../cim-schema/cim-schema-exper_2.39.0.bb          | 26 +++++++++++++++++
 ...schema_2.40.0.bb => cim-schema-final_2.40.0.bb} |  0
 .../cim-schema/cim-schema/files/LICENSE            | 34 ++++++++++++++++++++++
 3 files changed, 60 insertions(+)
 create mode 100644 meta-networking/recipes-support/cim-schema/cim-schema-exper_2.39.0.bb
 rename meta-networking/recipes-support/cim-schema/{cim-schema_2.40.0.bb => cim-schema-final_2.40.0.bb} (100%)
 create mode 100644 meta-networking/recipes-support/cim-schema/cim-schema/files/LICENSE

diff --git a/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.39.0.bb b/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.39.0.bb
new file mode 100644
index 0000000..3b973bf
--- /dev/null
+++ b/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.39.0.bb
@@ -0,0 +1,26 @@
+require cim-schema.inc
+
+LICENSE = "DMTF"
+
+SRC_URI = "http://dmtf.org/sites/default/files/cim/cim_schema_v2390/cim_schema_${PV}Experimental-MOFs.zip;subdir=${BPN}-${PV} \
+           file://LICENSE \
+          "
+SRC_URI[md5sum] = "b82b31c609c6bcc69521829409f58ccc"
+SRC_URI[sha256sum] = "ed2096ef1ea25d189a02bbc6603fed7a48297f2987f254265763a6eecb7fc870"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=eecc6f71a56ff3caf17f15bf7aeac7b4"
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
diff --git a/meta-networking/recipes-support/cim-schema/cim-schema_2.40.0.bb b/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb
similarity index 100%
rename from meta-networking/recipes-support/cim-schema/cim-schema_2.40.0.bb
rename to meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb
diff --git a/meta-networking/recipes-support/cim-schema/cim-schema/files/LICENSE b/meta-networking/recipes-support/cim-schema/cim-schema/files/LICENSE
new file mode 100644
index 0000000..54a2812
--- /dev/null
+++ b/meta-networking/recipes-support/cim-schema/cim-schema/files/LICENSE
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


