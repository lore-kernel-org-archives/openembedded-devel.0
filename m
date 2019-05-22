Return-Path: <naveen.kumar.saini@intel.com>
X-Greylist: delayed 426 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 22 May 2019 06:58:53 UTC
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 9621B7E382
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 06:58:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 May 2019 23:51:48 -0700
X-ExtLoop1: 1
Received: from optimus-prime.png.intel.com ([172.30.199.130])
	by fmsmga004.fm.intel.com with ESMTP; 21 May 2019 23:51:47 -0700
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 May 2019 14:52:46 +0800
Message-Id: <20190522065246.14793-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH] pm-graph: add recipe
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
X-List-Received-Date: Wed, 22 May 2019 06:58:53 -0000

This tool suite is designed to assist kernel and OS developers
in optimizing their linux stack's suspend/resume & boot time.

For more details and usage, please check:
https://01.org/pm-graph

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 .../recipes-kernel/pm-graph/pm-graph_5.3.bb   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb

diff --git a/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
new file mode 100644
index 000000000..de2d46dca
--- /dev/null
+++ b/meta-oe/recipes-kernel/pm-graph/pm-graph_5.3.bb
@@ -0,0 +1,19 @@
+SUMMARY  = "Timing analysis tools for suspend/resume/boot"
+DESCRIPTION = "This tool suite is designed to assist kernel and OS developers \
+in optimizing their linux stack's suspend/resume & boot time."
+HOMEPAGE = "https://01.org/pm-graph"
+LICENSE  = "GPL-2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
+
+SRCREV = "5be9a16547234cef5aca8bfaccd920490ea1cfa7"
+SRC_URI = "git://github.com/intel/pm-graph.git"
+S = "${WORKDIR}/git"
+
+COMPATIBLE_HOST='(i.86|x86_64).*'
+EXTRA_OEMAKE = "PREFIX=${prefix} DESTDIR=${D}"
+
+do_install() {
+        oe_runmake install
+}
+
+RDEPENDS_${PN} += "python-core python-threading python-datetime python-subprocess python-compression"
-- 
2.17.0


