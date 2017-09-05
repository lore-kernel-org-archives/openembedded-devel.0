Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 53AC377D12
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Sep 2017 02:26:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v852Qmob024193
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 4 Sep 2017 19:26:48 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 4 Sep 2017 19:26:47 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Sep 2017 19:26:47 -0700
Message-ID: <20170905022647.22992-1-wenzong.fan@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH] python-networkx: add python-2to3 to RDEPENDS
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
X-List-Received-Date: Tue, 05 Sep 2017 02:26:47 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Fix runtime error:
  File "/usr/lib/python2.7/site-packages/networkx/readwrite/gml.py", \
    line 44, in <module>
    from lib2to3.pgen2.parse import ParseError
  ImportError: No module named lib2to3.pgen2.parse

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta-python/recipes-devtools/python/python-networkx_1.11.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-networkx_1.11.bb b/meta-python/recipes-devtools/python/python-networkx_1.11.bb
index 28a7baae0..bda8ae32e 100644
--- a/meta-python/recipes-devtools/python/python-networkx_1.11.bb
+++ b/meta-python/recipes-devtools/python/python-networkx_1.11.bb
@@ -6,3 +6,5 @@ SRC_URI[md5sum] = "6ef584a879e9163013e9a762e1cf7cd1"
 SRC_URI[sha256sum] = "0d0e70e10dfb47601cbb3425a00e03e2a2e97477be6f80638fef91d54dd1e4b8"
 
 inherit pypi setuptools
+
+RDEPENDS_${PN} += "python-2to3"
-- 
2.13.0


