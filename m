Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 684577E797
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2019 06:03:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,376,1559491200"; d="scan'208";a="73487741"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Aug 2019 14:03:56 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 5946B4CE030F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2019 14:03:58 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 12 Aug 2019 14:04:00 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 12 Aug 2019 14:03:17 +0800
Message-ID: <20190812060317.29326-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 5946B4CE030F.A96BF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-lxml: upgrade 4.4.0 -> 4.4.1
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
X-List-Received-Date: Mon, 12 Aug 2019 06:03:57 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-lxml.inc                   | 4 ++--
 .../python/{python-lxml_4.4.0.bb => python-lxml_4.4.1.bb}             | 0
 .../python/{python3-lxml_4.4.0.bb => python3-lxml_4.4.1.bb}           | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-lxml_4.4.0.bb => python-lxml_4.4.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-lxml_4.4.0.bb => python3-lxml_4.4.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
index 45e52b5..a97167f 100644
--- a/meta-python/recipes-devtools/python/python-lxml.inc
+++ b/meta-python/recipes-devtools/python/python-lxml.inc
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[md5sum] = "7d585daedcd51011c3217a61982afd3d"
-SRC_URI[sha256sum] = "3b57dc5ed7b6a7d852c961f2389ca99404c2b59fd2088baec6fbaca02f688be4"
+SRC_URI[md5sum] = "ce976a2d3c630d7fde86d3a4c3a1c606"
+SRC_URI[sha256sum] = "c81cb40bff373ab7a7446d6bbca0190bccc5be3448b47b51d729e37799bb5692"
 
 DISTUTILS_BUILD_ARGS += " \
                      --with-xslt-config='pkg-config libxslt' \
diff --git a/meta-python/recipes-devtools/python/python-lxml_4.4.0.bb b/meta-python/recipes-devtools/python/python-lxml_4.4.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-lxml_4.4.0.bb
rename to meta-python/recipes-devtools/python/python-lxml_4.4.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.4.0.bb b/meta-python/recipes-devtools/python/python3-lxml_4.4.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-lxml_4.4.0.bb
rename to meta-python/recipes-devtools/python/python3-lxml_4.4.1.bb
-- 
2.7.4




