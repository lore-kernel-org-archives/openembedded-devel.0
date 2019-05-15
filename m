Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D8EFB6BA10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 May 2019 06:14:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,471,1549900800"; d="scan'208";a="63111085"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 May 2019 14:14:58 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 4B33B4CDBF4B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 May 2019 14:14:58 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 15 May 2019 14:14:57 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 15 May 2019 14:15:55 +0800
Message-ID: <20190515061555.25571-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 4B33B4CDBF4B.AC2AD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-urllib3: upgrade 1.23 -> 1.25.2
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
X-List-Received-Date: Wed, 15 May 2019 06:14:59 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-urllib3_1.23.bb to python-urllib3_1.25.2.bb.

-Upgrade from python3-urllib3_1.23.bb to python3-urllib3_1.25.2.bb.

-License-Update: Copyright year updated to 2019.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-urllib3.inc      | 6 +++---
 .../{python-urllib3_1.23.bb => python-urllib3_1.25.2.bb}    | 0
 .../{python3-urllib3_1.23.bb => python3-urllib3_1.25.2.bb}  | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-urllib3_1.23.bb => python-urllib3_1.25.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-urllib3_1.23.bb => python3-urllib3_1.25.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-urllib3.inc b/meta-python/recipes-devtools/python/python-urllib3.inc
index 34f147877..2ce6d1050 100644
--- a/meta-python/recipes-devtools/python/python-urllib3.inc
+++ b/meta-python/recipes-devtools/python/python-urllib3.inc
@@ -1,10 +1,10 @@
 SUMMARY = "Python HTTP library with thread-safe connection pooling, file post support, sanity friendly, and more"
 HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ea114851ad9a8c311aac8728a681a067"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=65715c2eb961313d71b297dd5a04f85e"
 
-SRC_URI[md5sum] = "1ad43e4b5ab7a0794c89dc057e1d7179"
-SRC_URI[sha256sum] = "a68ac5e15e76e7e5dd2b8f94007233e01effe3e50e8daddf69acfd81cb686baf"
+SRC_URI[md5sum] = "1ebfbbec8bee21dbb686c009b37f4963"
+SRC_URI[sha256sum] = "a53063d8b9210a7bdec15e7b272776b9d42b2fd6816401a0d43006ad2f9902db"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-certifi \
diff --git a/meta-python/recipes-devtools/python/python-urllib3_1.23.bb b/meta-python/recipes-devtools/python/python-urllib3_1.25.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-urllib3_1.23.bb
rename to meta-python/recipes-devtools/python/python-urllib3_1.25.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.23.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.25.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-urllib3_1.23.bb
rename to meta-python/recipes-devtools/python/python3-urllib3_1.25.2.bb
-- 
2.20.1




