Return-Path: <linus.svensson@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id E303173208
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 11:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id AA5592E627
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 12:54:02 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 5co1Lc3fhw9T
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 12:54:02 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 6C3582E628
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 12:54:02 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1FC171A070
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 12:54:02 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 150201A061
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 12:54:02 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 12:54:02 +0100 (CET)
Received: from lnxlinussn.se.axis.com (lnxlinussn.se.axis.com [10.94.48.1])
	by seth.se.axis.com (Postfix) with ESMTP id 09E21DD4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 12:54:02 +0100 (CET)
Received: by lnxlinussn.se.axis.com (Postfix, from userid 21014)
	id F0BE13A099; Thu, 16 Feb 2017 12:54:01 +0100 (CET)
From: linus.svensson@axis.com
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Feb 2017 12:53:58 +0100
Message-Id: <1487246039-9185-1-git-send-email-linus.svensson@axis.com>
X-Mailer: git-send-email 2.1.4
X-TM-AS-GCONF: 00
Subject: [meta-oe][PATCH v2 1/2] meson: Add recipe for the meson build system
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
X-List-Received-Date: Thu, 16 Feb 2017 11:54:04 -0000

From: Linus Svensson <linussn@axis.com>

Meson is a build system designed to be fast and as user firendly as
possible. Find out more about meson at mesonbuild.com.

This patch is based on a prototype patch by
Ross Burton <ross.burton@intel.com>.

Signed-off-by: Linus Svensson <linussn@axis.com>
---
 meta-oe/recipes-devtools/meson/meson_0.36.0.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/meson/meson_0.36.0.bb

diff --git a/meta-oe/recipes-devtools/meson/meson_0.36.0.bb b/meta-oe/recipes-devtools/meson/meson_0.36.0.bb
new file mode 100644
index 0000000..9349fcb
--- /dev/null
+++ b/meta-oe/recipes-devtools/meson/meson_0.36.0.bb
@@ -0,0 +1,18 @@
+HOMEPAGE = "http://mesonbuild.com"
+SUMMARY = "A high performance build system"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI = "git://github.com/mesonbuild/meson.git"
+
+SRCREV = "4e3073f90a7b4f225ce7d89034d61cd978399eba"
+PV = "0.36.0"
+
+S = "${WORKDIR}/git"
+
+inherit setuptools3
+
+RDEPENDS_${PN} = "ninja python3-core python3-modules"
+
+BBCLASSEXTEND = "native"
-- 
2.1.4


