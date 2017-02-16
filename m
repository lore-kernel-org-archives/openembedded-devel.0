Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 30CFF731CD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 09:55:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1G9tYNh010737
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 01:55:35 -0800 (PST)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Feb 2017 01:55:34 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Feb 2017 01:55:34 -0800
Message-ID: <1487238934-215853-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-python][PATCH v2] python-networkx: add package
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
X-List-Received-Date: Thu, 16 Feb 2017 09:55:35 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Python package for creating and manipulating graphs and networks.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta-python/recipes-devtools/python/python-networkx_1.11.bb | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-networkx_1.11.bb

diff --git a/meta-python/recipes-devtools/python/python-networkx_1.11.bb b/meta-python/recipes-devtools/python/python-networkx_1.11.bb
new file mode 100644
index 0000000..28a7baa
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-networkx_1.11.bb
@@ -0,0 +1,8 @@
+DESCRIPTION = "Python package for creating and manipulating graphs and networks"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=925586ea588eb990de840dc71ea3752f"
+
+SRC_URI[md5sum] = "6ef584a879e9163013e9a762e1cf7cd1"
+SRC_URI[sha256sum] = "0d0e70e10dfb47601cbb3425a00e03e2a2e97477be6f80638fef91d54dd1e4b8"
+
+inherit pypi setuptools
-- 
2.7.4


