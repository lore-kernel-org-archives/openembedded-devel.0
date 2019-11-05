Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A48557F7E6
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Nov 2019 09:01:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xA591JGg021932
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Nov 2019 01:01:19 -0800
Received: from 41ce8e763d5a.wrs.com (128.224.153.74) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Tue, 5 Nov 2019 01:01:18 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 5 Nov 2019 08:59:53 +0000
Message-ID: <20191105085954.190962-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/2] python-pluggy: add python-importlib-metadata to RDEPENDS
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
X-List-Received-Date: Tue, 05 Nov 2019 09:01:20 -0000
Content-Type: text/plain

$ python3
$ >>> import pluggy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib64/python2.7/site-packages/pluggy/__init__.py", line 16, in <module>
    from .manager import PluginManager, PluginValidationError
  File "/usr/lib64/python2.7/site-packages/pluggy/manager.py", line 11, in <module>
    import importlib_metadata
ImportError: No module named importlib_metadata

$ python
$ >>> import pluggy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib64/python2.7/site-packages/pluggy/__init__.py", line 16, in <module>
    from .manager import PluginManager, PluginValidationError
  File "/usr/lib64/python2.7/site-packages/pluggy/manager.py", line 11, in <module>
    import importlib_metadata
  File "/usr/lib64/python2.7/site-packages/importlib_metadata/__init__.py", line 9, in <module>
    import zipp
  File "/usr/lib64/python2.7/site-packages/zipp.py", line 12, in <module>
    import more_itertools
ImportError: No module named more_itertools

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-python/recipes-devtools/python/python-pluggy.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-pluggy.inc b/meta-python/recipes-devtools/python/python-pluggy.inc
index 57660060c..1931532a9 100644
--- a/meta-python/recipes-devtools/python/python-pluggy.inc
+++ b/meta-python/recipes-devtools/python/python-pluggy.inc
@@ -7,5 +7,8 @@ SRC_URI[md5sum] = "4b8384b69cddbc2e104fdd3ff5631788"
 SRC_URI[sha256sum] = "fa5fa1622fa6dd5c030e9cad086fa19ef6a0cf6d7a2d12318e10cb49d6d68f34"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+RDEPENDS_${PN} += "${PYTHON_PN}-importlib-metadata \
+                   ${PYTHON_PN}-more-itertools \
+"
 
 inherit pypi
-- 
2.23.0


