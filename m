Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3547F6BD08
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Aug 2019 06:11:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,337,1559491200"; d="scan'208";a="72732402"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Aug 2019 14:11:10 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 31B144CDF07B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Aug 2019 14:11:06 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019 14:11:09 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 2 Aug 2019 14:10:24 +0800
Message-ID: <20190802061024.21808-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 31B144CDF07B.A82C5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pyasn1: upgrade 0.4.5 -> 0.4.6
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
X-List-Received-Date: Fri, 02 Aug 2019 06:11:10 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pyasn1.inc                 | 4 ++--
 .../python/{python-pyasn1_0.4.5.bb => python-pyasn1_0.4.6.bb}         | 0
 .../python/{python3-pyasn1_0.4.5.bb => python3-pyasn1_0.4.6.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyasn1_0.4.5.bb => python-pyasn1_0.4.6.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyasn1_0.4.5.bb => python3-pyasn1_0.4.6.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyasn1.inc b/meta-python/recipes-devtools/python/python-pyasn1.inc
index 3827fea..1086f30 100644
--- a/meta-python/recipes-devtools/python/python-pyasn1.inc
+++ b/meta-python/recipes-devtools/python/python-pyasn1.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=a14482d15c2249de3b6f0e8a47e021fd"
 
-SRC_URI[md5sum] = "f3c0cfbf882a20811be5ad5a41f74b82"
-SRC_URI[sha256sum] = "da2420fe13a9452d8ae97a0e478adde1dee153b11ba832a95b223a2ba01c10f7"
+SRC_URI[md5sum] = "67f1da0cf680761d29169e54e7d53159"
+SRC_URI[sha256sum] = "b773d5c9196ffbc3a1e13bdf909d446cad80a039aa3340bcad72f395b76ebc86"
 
 RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-codecs \
diff --git a/meta-python/recipes-devtools/python/python-pyasn1_0.4.5.bb b/meta-python/recipes-devtools/python/python-pyasn1_0.4.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyasn1_0.4.5.bb
rename to meta-python/recipes-devtools/python/python-pyasn1_0.4.6.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyasn1_0.4.5.bb b/meta-python/recipes-devtools/python/python3-pyasn1_0.4.6.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyasn1_0.4.5.bb
rename to meta-python/recipes-devtools/python/python3-pyasn1_0.4.6.bb
-- 
2.7.4




