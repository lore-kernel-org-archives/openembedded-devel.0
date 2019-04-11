Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D0CF26C3B1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2019 05:29:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,336,1549900800"; d="scan'208";a="59007519"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Apr 2019 13:29:46 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 63A304CD8127
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2019 13:29:47 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 11 Apr 2019 13:29:42 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 11 Apr 2019 13:30:24 +0800
Message-ID: <20190411053024.23351-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 63A304CD8127.A71FD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-lxml: upgrade 4.3.1 -> 4.3.3
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
X-List-Received-Date: Thu, 11 Apr 2019 05:29:47 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-lxml_4.3.1.bb to python-lxml_4.3.3.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-lxml.inc           | 4 ++--
 .../python/{python-lxml_4.3.1.bb => python-lxml_4.3.3.bb}     | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-lxml_4.3.1.bb => python-lxml_4.3.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
index 14897c06e..63532c756 100644
--- a/meta-python/recipes-devtools/python/python-lxml.inc
+++ b/meta-python/recipes-devtools/python/python-lxml.inc
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[md5sum] = "d2b2eb305bfa9ed15aebe61affb3ffa4"
-SRC_URI[sha256sum] = "da5e7e941d6e71c9c9a717c93725cda0708c2474f532e3680ac5e39ec57d224d"
+SRC_URI[md5sum] = "d35e90d9de17e1370fbb7e6059bd95ed"
+SRC_URI[sha256sum] = "4a03dd682f8e35a10234904e0b9508d705ff98cf962c5851ed052e9340df3d90"
 
 DISTUTILS_BUILD_ARGS += " \
                      --with-xslt-config='pkg-config libxslt' \
diff --git a/meta-python/recipes-devtools/python/python-lxml_4.3.1.bb b/meta-python/recipes-devtools/python/python-lxml_4.3.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-lxml_4.3.1.bb
rename to meta-python/recipes-devtools/python/python-lxml_4.3.3.bb
-- 
2.20.1




