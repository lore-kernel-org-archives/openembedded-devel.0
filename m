Return-Path: <sjl@vctlabs.com>
Received: from dent.vctlabs.com (net-cf9a4187.iis.impulse.net [207.154.65.135])
	by mail.openembedded.org (Postfix) with ESMTP id 550E8770C4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jun 2016 18:27:25 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id 0586A2808CA; Thu,  2 Jun 2016 11:27:26 -0700 (PDT)
Date: Thu, 2 Jun 2016 11:27:26 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160602182725.GY7939@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembedded-devel@lists.openembedded.org
References: <20160602182426.GW7939@vctlabs.com>
MIME-Version: 1.0
In-Reply-To: <20160602182426.GW7939@vctlabs.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [meta-python][PATCHv3 2/3] python-singledispatch: initial recipe for version 3.4.0.3
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
X-List-Received-Date: Thu, 02 Jun 2016 18:27:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Tornado 4.3 needs a couple more backport modules to prevent tornado/gen.py
from bombing on import errors when running on python2 rather than python3.4

  ImportError: No module named singledispatch

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
---
 .../python/python-singledispatch_3.4.0.3.bb                 | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-singledispatch_3.4.0.3.bb

diff --git a/meta-python/recipes-devtools/python/python-singledispatch_3.4.0.3.bb b/meta-python/recipes-devtools/python/python-singledispatch_3.4.0.3.bb
new file mode 100644
index 0000000..87f46e5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-singledispatch_3.4.0.3.bb
@@ -0,0 +1,13 @@
+SUMMARY = "functools.singledispatch from Python 3.4"
+DESCRIPTION = "PEP 443 proposed to expose a mechanism in the functools standard library module \
+in Python 3.4 that provides a simple form of generic programming known as single-dispatch \
+generic functions.  This library is a backport of this functionality to Python 2.6 - 3.3"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://README.rst;md5=ee3cd67264adc7eb07981f3644dc17dc"
+
+SRC_URI[md5sum] = "af2fc6a3d6cc5a02d0bf54d909785fcb"
+SRC_URI[sha256sum] = "5b06af87df13818d14f08a028e42f566640aef80805c3b50c5056b086e3c2b9c"
+
+PYPI_PACKAGE = "singledispatch"
+inherit pypi setuptools
-- 
1.9.1


