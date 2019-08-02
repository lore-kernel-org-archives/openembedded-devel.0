Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0C9D57F2E4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Aug 2019 01:00:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,336,1559491200"; d="scan'208";a="72700998"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Aug 2019 09:00:26 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 41DFD4CDFCD2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Aug 2019 09:00:21 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 2 Aug 2019 09:00:23 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 2 Aug 2019 08:59:40 +0800
Message-ID: <20190802005940.17858-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 41DFD4CDFCD2.AB1B3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-python] [PATCH] python-lxml: upgrade 4.3.4 -> 4.4.0
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
X-List-Received-Date: Fri, 02 Aug 2019 01:00:32 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-lxml.inc                   | 4 ++--
 .../python/{python-lxml_4.3.4.bb => python-lxml_4.4.0.bb}             | 0
 .../python/{python3-lxml_4.3.4.bb => python3-lxml_4.4.0.bb}           | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-lxml_4.3.4.bb => python-lxml_4.4.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-lxml_4.3.4.bb => python3-lxml_4.4.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
index dd73a41..45e52b5 100644
--- a/meta-python/recipes-devtools/python/python-lxml.inc
+++ b/meta-python/recipes-devtools/python/python-lxml.inc
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[md5sum] = "aec44da0457dca385261e5ceb3fe36f9"
-SRC_URI[sha256sum] = "3ce1c49d4b4a7bc75fb12acb3a6247bb7a91fe420542e6d671ba9187d12a12c2"
+SRC_URI[md5sum] = "7d585daedcd51011c3217a61982afd3d"
+SRC_URI[sha256sum] = "3b57dc5ed7b6a7d852c961f2389ca99404c2b59fd2088baec6fbaca02f688be4"
 
 DISTUTILS_BUILD_ARGS += " \
                      --with-xslt-config='pkg-config libxslt' \
diff --git a/meta-python/recipes-devtools/python/python-lxml_4.3.4.bb b/meta-python/recipes-devtools/python/python-lxml_4.4.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-lxml_4.3.4.bb
rename to meta-python/recipes-devtools/python/python-lxml_4.4.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.3.4.bb b/meta-python/recipes-devtools/python/python3-lxml_4.4.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-lxml_4.3.4.bb
rename to meta-python/recipes-devtools/python/python3-lxml_4.4.0.bb
-- 
2.7.4




