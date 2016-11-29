Return-Path: <daniela.plascencia@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A5CAB71A1C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 17:16:48 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP; 29 Nov 2016 09:16:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,717,1473145200"; d="scan'208";a="36973385"
Received: from yctb04.ostc.intel.com ([10.54.69.58])
	by fmsmga005.fm.intel.com with ESMTP; 29 Nov 2016 09:16:49 -0800
From: daniela.plascencia@linux.intel.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Nov 2016 09:22:08 +0000
Message-Id: <1480411330-20888-5-git-send-email-daniela.plascencia@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1480411330-20888-1-git-send-email-daniela.plascencia@linux.intel.com>
References: <1480411330-20888-1-git-send-email-daniela.plascencia@linux.intel.com>
Cc: Daniela Plascencia <daniela.plascencia@linux.intel.com>,
	leonardo.sandoval.gonzalez@linux.intel.com
Subject: [meta-python][PATCH V2 4/6] python-lazy-object-proxy: add new recipe
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
X-List-Received-Date: Tue, 29 Nov 2016 17:16:48 -0000

From: Daniela Plascencia <daniela.plascencia@linux.intel.com>

The recipe defines the lazy-object-proxy
python module: a fast and thorough lazy
object proxy.

Signed-off-by: Daniela Plascencia <daniela.plascencia@linux.intel.com>
---
 .../recipes-devtools/python/python-lazy-object-proxy_1.2.2.bb  | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-lazy-object-proxy_1.2.2.bb

diff --git a/meta-python/recipes-devtools/python/python-lazy-object-proxy_1.2.2.bb b/meta-python/recipes-devtools/python/python-lazy-object-proxy_1.2.2.bb
new file mode 100644
index 0000000..ded9cfa
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-lazy-object-proxy_1.2.2.bb
@@ -0,0 +1,10 @@
+SUMMARY = "A fast and thorough lazy object proxy"
+HOMEPAGE = "https://python-lazy-object-proxy.readthedocs.io/"
+LICENSE = "BSD"
+SECTION = "devel/python"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=96b1673d10167cb31b78e64f561c3286"
+
+SRC_URI[md5sum] = "841b5592bc12c6ef7e48ed1d7a5f9066"
+SRC_URI[sha256sum] = "ddd4cf1c74279c349cb7b9c54a2efa5105854f57de5f2d35829ee93631564268"
+
+inherit setuptools pypi
-- 
2.6.6


