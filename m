Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9B0EE77CD1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 08:22:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3Q8MarX029772
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 01:22:36 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 26 Apr 2017 01:22:35 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 26 Apr 2017 16:22:07 +0800
Message-ID: <76fdc4b05a9159d681cee97abd136e21a54f8395.1493194374.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1493194374.git.jackie.huang@windriver.com>
References: <cover.1493194374.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 8/8 v2] ipmitool: add new recipe
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
X-List-Received-Date: Wed, 26 Apr 2017 08:22:34 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Utility for IPMI control which is for interfacing with
devices that support the Intelligent Platform Management
Interface specification.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-support/ipmitool/ipmitool_1.8.18.bb    | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-support/ipmitool/ipmitool_1.8.18.bb

diff --git a/meta-oe/recipes-support/ipmitool/ipmitool_1.8.18.bb b/meta-oe/recipes-support/ipmitool/ipmitool_1.8.18.bb
new file mode 100644
index 000000000..9f73d2799
--- /dev/null
+++ b/meta-oe/recipes-support/ipmitool/ipmitool_1.8.18.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Utility for IPMI control"
+DESCRIPTION = "This package contains a utility for interfacing with devices that support \
+the Intelligent Platform Management Interface specification. IPMI is \
+an open standard for machine health, inventory, and remote power control. \
+\
+This utility can communicate with IPMI-enabled devices through either a \
+kernel driver such as OpenIPMI or over the RMCP LAN protocol defined in \
+the IPMI specification. IPMIv2 adds support for encrypted LAN \
+communications and remote Serial-over-LAN functionality. \
+\
+It provides commands for reading the Sensor Data Repository (SDR) and \
+displaying sensor values, displaying the contents of the System Event \
+Log (SEL), printing Field Replaceable Unit (FRU) information, reading and \
+setting LAN configuration, and chassis power control. \
+"
+
+HOMEPAGE = "http://ipmitool.sourceforge.net/"
+SECTION = "kernel/userland"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9aa91e13d644326bf281924212862184"
+
+DEPENDS = "openssl readline ncurses"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/ipmitool/ipmitool-${PV}.tar.bz2"
+SRC_URI[md5sum] = "bab7ea104c7b85529c3ef65c54427aa3"
+SRC_URI[sha256sum] = "0c1ba3b1555edefb7c32ae8cd6a3e04322056bc087918f07189eeedfc8b81e01"
+
+inherit autotools
+
+# --disable-dependency-tracking speeds up the build
+# --enable-file-security adds some security checks
+# --disable-intf-free disables FreeIPMI support - we don't want to depend on
+#   FreeIPMI libraries, FreeIPMI has its own ipmitoool-like utility.
+#
+EXTRA_OECONF = "--disable-dependency-tracking --enable-file-security --disable-intf-free"
-- 
2.11.0


