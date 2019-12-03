Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id EB1587C326
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Dec 2019 08:26:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,272,1571673600"; d="scan'208";a="79505847"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Dec 2019 16:26:27 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id DD1204CE1BED
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Dec 2019 16:17:56 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 3 Dec 2019 16:26:23 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 3 Dec 2019 06:50:56 -0800
Message-ID: <1575384656-121548-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1575384656-121548-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1575384656-121548-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: DD1204CE1BED.A9E9E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python-lxml: 4.4.1 -> 4.4.2
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
X-List-Received-Date: Tue, 03 Dec 2019 08:26:31 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-lxml.inc                   | 4 ++--
 .../python/{python-lxml_4.4.1.bb => python-lxml_4.4.2.bb}             | 0
 .../python/{python3-lxml_4.4.1.bb => python3-lxml_4.4.2.bb}           | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-lxml_4.4.1.bb => python-lxml_4.4.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-lxml_4.4.1.bb => python3-lxml_4.4.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
index a97167f..1f7e5ab 100644
--- a/meta-python/recipes-devtools/python/python-lxml.inc
+++ b/meta-python/recipes-devtools/python/python-lxml.inc
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[md5sum] = "ce976a2d3c630d7fde86d3a4c3a1c606"
-SRC_URI[sha256sum] = "c81cb40bff373ab7a7446d6bbca0190bccc5be3448b47b51d729e37799bb5692"
+SRC_URI[md5sum] = "235c1a22d97a174144e76b66ce62ae46"
+SRC_URI[sha256sum] = "eff69ddbf3ad86375c344339371168640951c302450c5d3e9936e98d6459db06"
 
 DISTUTILS_BUILD_ARGS += " \
                      --with-xslt-config='pkg-config libxslt' \
diff --git a/meta-python/recipes-devtools/python/python-lxml_4.4.1.bb b/meta-python/recipes-devtools/python/python-lxml_4.4.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-lxml_4.4.1.bb
rename to meta-python/recipes-devtools/python/python-lxml_4.4.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.4.1.bb b/meta-python/recipes-devtools/python/python3-lxml_4.4.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-lxml_4.4.1.bb
rename to meta-python/recipes-devtools/python/python3-lxml_4.4.2.bb
-- 
2.7.4




