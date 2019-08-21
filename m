Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AE04F6C1C4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Aug 2019 08:07:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Aug 2019 01:07:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,412,1559545200"; d="scan'208";a="202945615"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.72.192])
	by fmsmga004.fm.intel.com with ESMTP; 21 Aug 2019 01:07:16 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Aug 2019 16:07:13 +0800
Message-Id: <20190821080713.11495-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] clinfo: add recipe
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
X-List-Received-Date: Wed, 21 Aug 2019 08:07:16 -0000
Content-Transfer-Encoding: 8bit

clinfo is a simple command-line application that enumerates all possible
(known) properties of the OpenCL platform and devices available on the
system.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../opencl/clinfo_2.2.18.04.06.bb             | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencl/clinfo_2.2.18.04.06.bb

diff --git a/meta-oe/recipes-support/opencl/clinfo_2.2.18.04.06.bb b/meta-oe/recipes-support/opencl/clinfo_2.2.18.04.06.bb
new file mode 100644
index 000000000..9fd88ced9
--- /dev/null
+++ b/meta-oe/recipes-support/opencl/clinfo_2.2.18.04.06.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Enumerate all known properties of OpenCL platform and devices."
+DESCRIPTION = "clinfo is a simple command-line application that enumerates \
+all possible (known) properties of the OpenCL platform and devices \
+available on the system."
+HOMEPAGE = "https://github.com/Oblomov/clinfo"
+
+LICENSE = "CC0-1.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fd8857f774dfb0eefe1e80c8f9240a7e"
+
+SRC_URI = "git://github.com/Oblomov/clinfo.git;protocol=https"
+
+SRCREV = "59d0daf898e48d76ccbb788acbba258fa0a8ba7c"
+
+S = "${WORKDIR}/git"
+
+DEPENDS += "opencl-headers opencl-icd-loader"
+
+do_install() {
+        install -D -m 755 clinfo ${D}${bindir}/clinfo
+}
-- 
2.21.0


