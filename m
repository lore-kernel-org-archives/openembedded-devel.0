Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 081D57DD86
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 May 2019 05:28:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,464,1549900800"; d="scan'208";a="62700410"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 May 2019 13:28:06 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 84E0A4CDB74D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 May 2019 13:28:06 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 13 May 2019 13:28:05 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 13 May 2019 13:29:03 +0800
Message-ID: <20190513052903.2318-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 84E0A4CDB74D.AA47A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pyparsing: upgrade 2.2.0 -> 2.4.0
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
X-List-Received-Date: Mon, 13 May 2019 05:28:07 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-pyparsing_2.2.0.bb to python-pyparsing_2.4.0.bb.

-Upgrade from python3-pyparsing_2.2.0.bb to python3-pyparsing_2.4.0.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pyparsing.inc    | 6 +++---
 ...{python-pyparsing_2.2.0.bb => python-pyparsing_2.4.0.bb} | 0
 ...ython3-pyparsing_2.2.0.bb => python3-pyparsing_2.4.0.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyparsing_2.2.0.bb => python-pyparsing_2.4.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyparsing_2.2.0.bb => python3-pyparsing_2.4.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyparsing.inc b/meta-python/recipes-devtools/python/python-pyparsing.inc
index e30839f87..e0df4e9b8 100644
--- a/meta-python/recipes-devtools/python/python-pyparsing.inc
+++ b/meta-python/recipes-devtools/python/python-pyparsing.inc
@@ -1,10 +1,10 @@
 SUMMARY = "Python parsing module"
 HOMEPAGE = "http://pyparsing.wikispaces.com/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fb46329938e6bc829b256e37d5c1e31a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
 
-SRC_URI[md5sum] = "0214e42d63af850256962b6744c948d9"
-SRC_URI[sha256sum] = "0832bcf47acd283788593e7a0f542407bd9550a55a8a8435214a1960e04bcb04"
+SRC_URI[md5sum] = "e534c0ca755155823bf45fdd8d084922"
+SRC_URI[sha256sum] = "1873c03321fc118f4e9746baf201ff990ceb915f433f23b395f5580d1840cb2a"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-pyparsing_2.2.0.bb b/meta-python/recipes-devtools/python/python-pyparsing_2.4.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyparsing_2.2.0.bb
rename to meta-python/recipes-devtools/python/python-pyparsing_2.4.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyparsing_2.2.0.bb b/meta-python/recipes-devtools/python/python3-pyparsing_2.4.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyparsing_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pyparsing_2.4.0.bb
-- 
2.20.1




