Return-Path: <daniela.plascencia@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C1A61719E4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 17:16:48 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP; 29 Nov 2016 09:16:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,717,1473145200"; d="scan'208";a="36973386"
Received: from yctb04.ostc.intel.com ([10.54.69.58])
	by fmsmga005.fm.intel.com with ESMTP; 29 Nov 2016 09:16:49 -0800
From: daniela.plascencia@linux.intel.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Nov 2016 09:22:09 +0000
Message-Id: <1480411330-20888-6-git-send-email-daniela.plascencia@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1480411330-20888-1-git-send-email-daniela.plascencia@linux.intel.com>
References: <1480411330-20888-1-git-send-email-daniela.plascencia@linux.intel.com>
Cc: Daniela Plascencia <daniela.plascencia@linux.intel.com>,
	leonardo.sandoval.gonzalez@linux.intel.com
Subject: [meta-python][PATCH V2 5/6] python-setuptools-scm: add native to BBCLASSEXTEND
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

Enables a native variant of python-setuptools-scm
by adding BBCLASSEXTEND to the recipe.

Signed-off-by: Daniela Plascencia <daniela.plascencia@linux.intel.com>
---
 meta-python/recipes-devtools/python/python-setuptools-scm_1.15.0.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-setuptools-scm_1.15.0.bb b/meta-python/recipes-devtools/python/python-setuptools-scm_1.15.0.bb
index 45204c9..afbc83e 100644
--- a/meta-python/recipes-devtools/python/python-setuptools-scm_1.15.0.bb
+++ b/meta-python/recipes-devtools/python/python-setuptools-scm_1.15.0.bb
@@ -6,8 +6,10 @@ SRC_URI[md5sum] = "b6916c78ed6253d6602444fad4279c5b"
 SRC_URI[sha256sum] = "daf12d05aa2155a46aa357453757ffdc47d87f839e62114f042bceac6a619e2f"
 
 PYPI_PACKAGE = "setuptools_scm"
-inherit pypi setuptools
 
-RDEPENDS_${PN} = "python-py python-setuptools python-argparse python-debugger python-json"
+RDEPENDS_${PN}_class-target = "python-py python-setuptools python-argparse python-debugger python-json"
+RDEPENDS_${PN}_class-native = "python-setuptools-native"
 
+BBCLASSEXTEND =+ "native"
 
+inherit pypi setuptools
-- 
2.6.6


