Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 98C4E7E718
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2019 04:11:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,363,1557158400"; d="scan'208";a="67024721"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Jun 2019 12:11:00 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id E41804CDD479
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2019 12:11:01 +0800 (CST)
Received: from localhost.localdomain (10.167.226.46) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 12 Jun 2019 12:11:01 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Jun 2019 12:12:15 +0800
Message-ID: <20190612041215.32625-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.46]
X-yoursite-MailScanner-ID: E41804CDD479.A853C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-lxml: upgrade 4.3.3 -> 4.3.4
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
X-List-Received-Date: Wed, 12 Jun 2019 04:11:02 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-lxml_4.3.3.bb to python-lxml_4.3.4.bb.

-Upgrade from python3-lxml_4.3.3.bb to python3-lxml_4.3.4.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-lxml.inc           | 4 ++--
 .../python/{python-lxml_4.3.3.bb => python-lxml_4.3.4.bb}     | 0
 .../python/{python3-lxml_4.3.3.bb => python3-lxml_4.3.4.bb}   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-lxml_4.3.3.bb => python-lxml_4.3.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-lxml_4.3.3.bb => python3-lxml_4.3.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
index 63532c756..d67c17883 100644
--- a/meta-python/recipes-devtools/python/python-lxml.inc
+++ b/meta-python/recipes-devtools/python/python-lxml.inc
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[md5sum] = "d35e90d9de17e1370fbb7e6059bd95ed"
-SRC_URI[sha256sum] = "4a03dd682f8e35a10234904e0b9508d705ff98cf962c5851ed052e9340df3d90"
+SRC_URI[md5sum] = "aec44da0457dca385261e5ceb3fe36f9"
+SRC_URI[sha256sum] = "3ce1c49d4b4a7bc75fb12acb3a6247bb7a91fe420542e6d671ba9187d12a12c2"
 
 DISTUTILS_BUILD_ARGS += " \
                      --with-xslt-config='pkg-config libxslt' \
diff --git a/meta-python/recipes-devtools/python/python-lxml_4.3.3.bb b/meta-python/recipes-devtools/python/python-lxml_4.3.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-lxml_4.3.3.bb
rename to meta-python/recipes-devtools/python/python-lxml_4.3.4.bb
diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.3.3.bb b/meta-python/recipes-devtools/python/python3-lxml_4.3.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-lxml_4.3.3.bb
rename to meta-python/recipes-devtools/python/python3-lxml_4.3.4.bb
-- 
2.20.1




