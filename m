Return-Path: <sjl@vctlabs.com>
Received: from dent.vctlabs.com (net-cf9a4187.iis.impulse.net [207.154.65.135])
	by mail.openembedded.org (Postfix) with ESMTP id 40703770C4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jun 2016 18:26:40 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id 363A62808CA; Thu,  2 Jun 2016 11:26:41 -0700 (PDT)
Date: Thu, 2 Jun 2016 11:26:41 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160602182641.GX7939@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembedded-devel@lists.openembedded.org
References: <20160602182426.GW7939@vctlabs.com>
MIME-Version: 1.0
In-Reply-To: <20160602182426.GW7939@vctlabs.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [meta-python][PATCHv3 1/3] python-backports-abc: initial recipe for version 0.4 RDEPENDS
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
X-List-Received-Date: Thu, 02 Jun 2016 18:26:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Tornado 4.3 needs a couple more backport modules to prevent tornado/gen.py
from bombing on import errors when running on python2 rather than python3.4

  ImportError: No module named backports_abc

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
---
 .../python/python-backports-abc_0.4.bb                 | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-backports-abc_0.4.bb

diff --git a/meta-python/recipes-devtools/python/python-backports-abc_0.4.bb b/meta-python/recipes-devtools/python/python-backports-abc_0.4.bb
new file mode 100644
index 0000000..6a4d267
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-backports-abc_0.4.bb
@@ -0,0 +1,18 @@
+SUMMARY = "collections.abc from Python 3.4"
+DESCRIPTION = "A backport of recent additions to the 'collections.abc' module"
+
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=dd98d01d471fac8d8dbdd975229dba03"
+
+# pypi package doesn't have valid entry for license
+SRC_URI += "https://raw.githubusercontent.com/cython/backports_abc/master/LICENSE;name=license"
+
+SRC_URI[md5sum] = "0b65a216ce9dc9c1a7e20a729dd7c05b"
+SRC_URI[sha256sum] = "8b3e4092ba3d541c7a2f9b7d0d9c0275b21c6a01c53a61c731eba6686939d0a5"
+SRC_URI[license.md5sum] = "dd98d01d471fac8d8dbdd975229dba03"
+SRC_URI[license.sha256sum] = "0a4f3b38055f50f047a42521568fa6ddb9a5976c2884f6ae138796d0f71150ca"
+
+
+
+PYPI_PACKAGE = "backports_abc"
+inherit pypi setuptools
-- 
1.9.1


