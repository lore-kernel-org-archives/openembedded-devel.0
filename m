Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id CE55C7D69D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 May 2019 07:35:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,449,1549900800"; d="scan'208";a="62229899"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 May 2019 15:35:40 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 043AF4CDB924
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 May 2019 15:35:39 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 9 May 2019 15:35:41 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 9 May 2019 15:36:35 +0800
Message-ID: <20190509073635.19463-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 043AF4CDB924.ADCB9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pymongo: upgrade 3.7.2 -> 3.8.0
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
X-List-Received-Date: Thu, 09 May 2019 07:35:41 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-pymongo_3.7.2.bb to python-pymongo_3.8.0.bb.

-Upgrade from python3-pymongo_3.7.2.bb to python3-pymongo_3.8.0.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pymongo.inc        | 4 ++--
 .../{python-pymongo_3.7.2.bb => python-pymongo_3.8.0.bb}      | 0
 .../{python3-pymongo_3.7.2.bb => python3-pymongo_3.8.0.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymongo_3.7.2.bb => python-pymongo_3.8.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymongo_3.7.2.bb => python3-pymongo_3.8.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pymongo.inc b/meta-python/recipes-devtools/python/python-pymongo.inc
index 50bf52b4b..88786ec67 100644
--- a/meta-python/recipes-devtools/python/python-pymongo.inc
+++ b/meta-python/recipes-devtools/python/python-pymongo.inc
@@ -8,8 +8,8 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[md5sum] = "7a1a774160cfdc5e6942b6914a912e95"
-SRC_URI[sha256sum] = "8c74e2a9b594f7962c62cef7680a4cb92a96b4e6e3c2f970790da67cc0213a7e"
+SRC_URI[md5sum] = "3e8035f85cfb2be95207724c59bddfaa"
+SRC_URI[sha256sum] = "9d50c99c6388863cbfdc5db9bad62e3a7c2e5fc151554a07c7f3c2530334a34f"
 
 PACKAGES =+ "${PYTHON_PN}-bson"
 
diff --git a/meta-python/recipes-devtools/python/python-pymongo_3.7.2.bb b/meta-python/recipes-devtools/python/python-pymongo_3.8.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymongo_3.7.2.bb
rename to meta-python/recipes-devtools/python/python-pymongo_3.8.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.7.2.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.8.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pymongo_3.7.2.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_3.8.0.bb
-- 
2.20.1




