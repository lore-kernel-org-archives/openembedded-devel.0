Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 767D87ED16
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2019 08:27:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,470,1559491200"; d="scan'208";a="74881173"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Sep 2019 16:27:41 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 6EC4F4CDFCE9
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2019 16:27:41 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 5 Sep 2019 16:27:44 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 5 Sep 2019 17:27:18 +0900
Message-ID: <20190905082718.41748-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: 6EC4F4CDFCE9.A3794
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pyasn1: upgrade 0.4.6 -> 0.4.7
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
X-List-Received-Date: Thu, 05 Sep 2019 08:27:42 -0000
Content-Type: text/plain

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pyasn1.inc         | 4 ++--
 .../python/{python-pyasn1_0.4.6.bb => python-pyasn1_0.4.7.bb} | 0
 .../{python3-pyasn1_0.4.6.bb => python3-pyasn1_0.4.7.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyasn1_0.4.6.bb => python-pyasn1_0.4.7.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyasn1_0.4.6.bb => python3-pyasn1_0.4.7.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyasn1.inc b/meta-python/recipes-devtools/python/python-pyasn1.inc
index 1086f30bf..014fcf9a3 100644
--- a/meta-python/recipes-devtools/python/python-pyasn1.inc
+++ b/meta-python/recipes-devtools/python/python-pyasn1.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=a14482d15c2249de3b6f0e8a47e021fd"
 
-SRC_URI[md5sum] = "67f1da0cf680761d29169e54e7d53159"
-SRC_URI[sha256sum] = "b773d5c9196ffbc3a1e13bdf909d446cad80a039aa3340bcad72f395b76ebc86"
+SRC_URI[md5sum] = "50290e833395016c49903f4f9c7e47e5"
+SRC_URI[sha256sum] = "a9495356ca1d66ed197a0f72b41eb1823cf7ea8b5bd07191673e8147aecf8604"
 
 RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-codecs \
diff --git a/meta-python/recipes-devtools/python/python-pyasn1_0.4.6.bb b/meta-python/recipes-devtools/python/python-pyasn1_0.4.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyasn1_0.4.6.bb
rename to meta-python/recipes-devtools/python/python-pyasn1_0.4.7.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyasn1_0.4.6.bb b/meta-python/recipes-devtools/python/python3-pyasn1_0.4.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyasn1_0.4.6.bb
rename to meta-python/recipes-devtools/python/python3-pyasn1_0.4.7.bb
-- 
2.17.1




