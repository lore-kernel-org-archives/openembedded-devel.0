Return-Path: <daniela.plascencia@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DC35071A03
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 17:16:48 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP; 29 Nov 2016 09:16:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,717,1473145200"; d="scan'208";a="36973387"
Received: from yctb04.ostc.intel.com ([10.54.69.58])
	by fmsmga005.fm.intel.com with ESMTP; 29 Nov 2016 09:16:49 -0800
From: daniela.plascencia@linux.intel.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Nov 2016 09:22:10 +0000
Message-Id: <1480411330-20888-7-git-send-email-daniela.plascencia@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1480411330-20888-1-git-send-email-daniela.plascencia@linux.intel.com>
References: <1480411330-20888-1-git-send-email-daniela.plascencia@linux.intel.com>
Cc: Daniela Plascencia <daniela.plascencia@linux.intel.com>,
	leonardo.sandoval.gonzalez@linux.intel.com
Subject: [meta-python][PATCH V2 6/6] python-pylint: modifies package bin to match source and adds dependencies
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
X-List-Received-Date: Tue, 29 Nov 2016 17:16:49 -0000

From: Daniela Plascencia <daniela.plascencia@linux.intel.com>

The pylint script mismatches from source in the target, producing runtime
errors, such as:
    "pkg_resources.DistributionNotFound: The 'configparser'
     was not found and is required by pylint"
This exception is raised mainly because pkg_resources, which is used by
pylint, looks for modules named as in Py3, but the target has only Py2.
For instance, 'ConfigParser' (already installed), has been renamed to
'configparser' in Py3, and thus not found by pkg_resources.
To ensure none of these compatibility issues happen, the pylint script
handles all the imports.
Thus, /usr/bin/pylint has to be installed in the same fashion as in
source, and the recipe in this patch states the content of such script
and deletes the previous one.

Also, a set of runtime dependencies is added to the recipe.

Signed-off-by: Daniela Plascencia <daniela.plascencia@linux.intel.com>
---
 .../recipes-devtools/python/python-pylint_1.6.4.bb     | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pylint_1.6.4.bb b/meta-python/recipes-devtools/python/python-pylint_1.6.4.bb
index b9219dd..c5d08dd 100644
--- a/meta-python/recipes-devtools/python/python-pylint_1.6.4.bb
+++ b/meta-python/recipes-devtools/python/python-pylint_1.6.4.bb
@@ -22,6 +22,22 @@ RDEPENDS_${PN} += "python-codecs \
                    python-stringold \
                    python-subprocess \
                    python-textutils \
-                   python-unittest"
+                   python-unittest \
+                   python-backports-functools-lru-cache \
+                   python-setuptools \
+                   python-astroid \
+                   python-wrapt \
+                   python-lazy-object-proxy \
+                   "
 
 inherit pypi setuptools
+
+do_install_append(){
+    rm ${D}${bindir}/pylint
+    cat >> ${D}${bindir}/pylint <<EOF
+#!/usr/bin/env python
+from pylint import run_pylint
+run_pylint()
+EOF
+    chmod 755 ${D}${bindir}/pylint
+}
-- 
2.6.6


