Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 14B8D78995
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Mar 2018 23:22:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Mar 2018 15:22:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,414,1515484800"; d="scan'208";a="21674549"
Received: from wrath.jf.intel.com ([10.54.31.19])
	by fmsmga008.fm.intel.com with ESMTP; 02 Mar 2018 15:22:35 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Mar 2018 15:22:34 -0800
Message-Id: <20180302232234.27834-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
Subject: [meta-python][PATCH] python-pytest.inc: add ${PYTHON_PN}-doctest to RDEPENDS
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
X-List-Received-Date: Fri, 02 Mar 2018 23:22:35 -0000

If pytest fallsback to pdb, it needs python-doctest module or
else it fails with:

Traceback (most recent call last):
  File \"/usr/bin/pytest\", line 11, in <module>
    load_entry_point('pytest==3.4.1', 'console_scripts', 'pytest')()
  File \"/usr/lib64/python3.5/site-packages/pkg_resources/__init__.py\", line 572, in load_entry_point
    return get_distribution(dist).load_entry_point(group, name)
  File \"/usr/lib64/python3.5/site-packages/pkg_resources/__init__.py\", line 2755, in load_entry_point
    return ep.load()
  File \"/usr/lib64/python3.5/site-packages/pkg_resources/__init__.py\", line 2408, in load
    return self.resolve()
  File \"/usr/lib64/python3.5/site-packages/pkg_resources/__init__.py\", line 2414, in resolve
    module = __import__(self.module_name, fromlist=['__name__'], level=0)
  File \"/usr/lib64/python3.5/site-packages/pytest.py\", line 17, in <module>
    from _pytest.debugging import pytestPDB as __pytestPDB
  File \"/usr/lib64/python3.5/site-packages/_pytest/debugging.py\", line 5, in <module>
    from doctest import UnexpectedException
ImportError: No module named 'doctest'

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta-python/recipes-devtools/python/python-pytest.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-pytest.inc b/meta-python/recipes-devtools/python/python-pytest.inc
index ecb729331..60ff83008 100644
--- a/meta-python/recipes-devtools/python/python-pytest.inc
+++ b/meta-python/recipes-devtools/python/python-pytest.inc
@@ -12,6 +12,7 @@ SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools
 RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-attrs \
     ${PYTHON_PN}-debugger \
+    ${PYTHON_PN}-doctest \
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-pluggy \
     ${PYTHON_PN}-py \
-- 
2.13.6


