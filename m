Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 196AA7CB4F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Apr 2019 02:57:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,403,1549900800"; d="scan'208";a="60878228"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Apr 2019 10:57:56 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 9AAEA4CDBF74
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Apr 2019 10:57:58 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Sun, 28 Apr 2019 10:58:03 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 28 Apr 2019 10:58:50 +0800
Message-ID: <20190428025850.12049-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 9AAEA4CDBF74.AA1A5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pyasn1: upgrade 0.4.4 -> 0.4.5
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
X-List-Received-Date: Sun, 28 Apr 2019 02:57:57 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-pyasn1_0.4.4.bb to python-pyasn1_0.4.5.bb.

-Upgrade from python3-pyasn1_0.4.4.bb to python3-pyasn1_0.4.5.bb

-License-Update: Copyright year updated to 2019.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pyasn1.inc       | 6 +++---
 .../{python-pyasn1_0.4.4.bb => python-pyasn1_0.4.5.bb}      | 0
 .../{python3-pyasn1_0.4.4.bb => python3-pyasn1_0.4.5.bb}    | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyasn1_0.4.4.bb => python-pyasn1_0.4.5.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyasn1_0.4.4.bb => python3-pyasn1_0.4.5.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyasn1.inc b/meta-python/recipes-devtools/python/python-pyasn1.inc
index ab34d2508..3827feaba 100644
--- a/meta-python/recipes-devtools/python/python-pyasn1.inc
+++ b/meta-python/recipes-devtools/python/python-pyasn1.inc
@@ -1,10 +1,10 @@
 SUMMARY = "Python library implementing ASN.1 types."
 HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=815ac3f9ca693006349094b358ab3155"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=a14482d15c2249de3b6f0e8a47e021fd"
 
-SRC_URI[md5sum] = "0d182b71e1f72fe147d7957bc90be7f2"
-SRC_URI[sha256sum] = "f58f2a3d12fd754aa123e9fa74fb7345333000a035f3921dbdaa08597aa53137"
+SRC_URI[md5sum] = "f3c0cfbf882a20811be5ad5a41f74b82"
+SRC_URI[sha256sum] = "da2420fe13a9452d8ae97a0e478adde1dee153b11ba832a95b223a2ba01c10f7"
 
 RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-codecs \
diff --git a/meta-python/recipes-devtools/python/python-pyasn1_0.4.4.bb b/meta-python/recipes-devtools/python/python-pyasn1_0.4.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyasn1_0.4.4.bb
rename to meta-python/recipes-devtools/python/python-pyasn1_0.4.5.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyasn1_0.4.4.bb b/meta-python/recipes-devtools/python/python3-pyasn1_0.4.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyasn1_0.4.4.bb
rename to meta-python/recipes-devtools/python/python3-pyasn1_0.4.5.bb
-- 
2.20.1




