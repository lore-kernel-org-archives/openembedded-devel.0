Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8C1177E743
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2019 06:09:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,363,1557158400"; d="scan'208";a="67038772"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Jun 2019 14:09:41 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id E69784CDD440
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jun 2019 14:09:41 +0800 (CST)
Received: from localhost.localdomain (10.167.226.46) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 12 Jun 2019 14:09:39 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Jun 2019 14:10:55 +0800
Message-ID: <20190612061055.19819-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.46]
X-yoursite-MailScanner-ID: E69784CDD440.A8CA1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-urllib3: upgrade 1.25.2 -> 1.25.3
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
X-List-Received-Date: Wed, 12 Jun 2019 06:09:42 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-urllib3_1.25.2.bb to python-urllib3_1.25.3.bb.

-Upgrade from python3-urllib3_1.25.2.bb to python3-urllib3_1.25.3.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-urllib3.inc        | 4 ++--
 .../{python-urllib3_1.25.2.bb => python-urllib3_1.25.3.bb}    | 0
 .../{python3-urllib3_1.25.2.bb => python3-urllib3_1.25.3.bb}  | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-urllib3_1.25.2.bb => python-urllib3_1.25.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-urllib3_1.25.2.bb => python3-urllib3_1.25.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-urllib3.inc b/meta-python/recipes-devtools/python/python-urllib3.inc
index 2ce6d1050..e8cb1ae6e 100644
--- a/meta-python/recipes-devtools/python/python-urllib3.inc
+++ b/meta-python/recipes-devtools/python/python-urllib3.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=65715c2eb961313d71b297dd5a04f85e"
 
-SRC_URI[md5sum] = "1ebfbbec8bee21dbb686c009b37f4963"
-SRC_URI[sha256sum] = "a53063d8b9210a7bdec15e7b272776b9d42b2fd6816401a0d43006ad2f9902db"
+SRC_URI[md5sum] = "f09e95a5c42a7cc7ff7cb6a14c55fb69"
+SRC_URI[sha256sum] = "dbe59173209418ae49d485b87d1681aefa36252ee85884c31346debd19463232"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-certifi \
diff --git a/meta-python/recipes-devtools/python/python-urllib3_1.25.2.bb b/meta-python/recipes-devtools/python/python-urllib3_1.25.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-urllib3_1.25.2.bb
rename to meta-python/recipes-devtools/python/python-urllib3_1.25.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.25.2.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.25.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-urllib3_1.25.2.bb
rename to meta-python/recipes-devtools/python/python3-urllib3_1.25.3.bb
-- 
2.20.1




