Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4AE7C7F34A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Aug 2019 08:45:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,349,1559491200"; d="scan'208";a="72988107"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Aug 2019 16:45:08 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 3D1604CDB941
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Aug 2019 16:45:09 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 5 Aug 2019 16:45:12 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 5 Aug 2019 16:44:27 +0800
Message-ID: <20190805084427.32016-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 3D1604CDB941.A9D3B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-configparser: upgrade 3.5.0 -> 3.7.4
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
X-List-Received-Date: Mon, 05 Aug 2019 08:45:09 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>

-License-Update: LICENSE in PKG-INFO file changed from MIT to UNKNOWN.

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-configparser.inc       | 8 ++++----
 ...{python-configparser_3.5.0.bb => python-configparser_3.7.4.bb} | 0
 ...ython3-configparser_3.5.0.bb => python3-configparser_3.7.4.bb} | 0
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python-configparser_3.5.0.bb => python-configparser_3.7.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-configparser_3.5.0.bb => python3-configparser_3.7.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-configparser.inc b/meta-python/recipes-devtools/python/python-configparser.inc
index 133dbba..2860989 100644
--- a/meta-python/recipes-devtools/python/python-configparser.inc
+++ b/meta-python/recipes-devtools/python/python-configparser.inc
@@ -1,11 +1,11 @@
 SUMMARY = "This module provides the ConfigParser class which implements a basic configuration language which provides a structure similar to what's found in Microsoft Windows INI files."
 SECTION = "devel/python"
 HOMEPAGE = "https://docs.python.org/3/library/configparser.html"
-LICENSE = "MIT"
+LICENSE = "unknown"
 
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=10;endline=10;md5=23f9ad5cad3d8cc0336e2a5d8a87e1fa"
 
-SRC_URI[md5sum] = "cfdd915a5b7a6c09917a64a573140538"
-SRC_URI[sha256sum] = "5308b47021bc2340965c371f0f058cc6971a04502638d4244225c49d80db273a"
+SRC_URI[md5sum] = "aaa80b58b6b0810e54f66486860b3ed1"
+SRC_URI[sha256sum] = "da60d0014fd8c55eb48c1c5354352e363e2d30bbf7057e5e171a468390184c75"
 
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-configparser_3.5.0.bb b/meta-python/recipes-devtools/python/python-configparser_3.7.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-configparser_3.5.0.bb
rename to meta-python/recipes-devtools/python/python-configparser_3.7.4.bb
diff --git a/meta-python/recipes-devtools/python/python3-configparser_3.5.0.bb b/meta-python/recipes-devtools/python/python3-configparser_3.7.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-configparser_3.5.0.bb
rename to meta-python/recipes-devtools/python/python3-configparser_3.7.4.bb
-- 
2.7.4




