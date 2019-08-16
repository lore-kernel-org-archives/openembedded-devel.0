Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id A09A360807
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 07:50:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,391,1559491200"; d="scan'208";a="73757510"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Aug 2019 15:50:30 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id E11354CE03C0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 15:50:29 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 16 Aug 2019 15:50:31 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 16 Aug 2019 15:49:52 +0800
Message-ID: <20190816074952.5020-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: E11354CE03C0.A830D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pymongo: upgrade 3.8.0 -> 3.9.0
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
X-List-Received-Date: Fri, 16 Aug 2019 07:50:33 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pymongo.inc                | 4 ++--
 .../python/{python-pymongo_3.8.0.bb => python-pymongo_3.9.0.bb}       | 0
 .../python/{python3-pymongo_3.8.0.bb => python3-pymongo_3.9.0.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymongo_3.8.0.bb => python-pymongo_3.9.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymongo_3.8.0.bb => python3-pymongo_3.9.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pymongo.inc b/meta-python/recipes-devtools/python/python-pymongo.inc
index 88786ec..cd11d98 100644
--- a/meta-python/recipes-devtools/python/python-pymongo.inc
+++ b/meta-python/recipes-devtools/python/python-pymongo.inc
@@ -8,8 +8,8 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[md5sum] = "3e8035f85cfb2be95207724c59bddfaa"
-SRC_URI[sha256sum] = "9d50c99c6388863cbfdc5db9bad62e3a7c2e5fc151554a07c7f3c2530334a34f"
+SRC_URI[md5sum] = "531786df7ad98f15c43f1b17edf5f84c"
+SRC_URI[sha256sum] = "4249c6ba45587b959292a727532826c5032d59171f923f7f823788f413c2a5a3"
 
 PACKAGES =+ "${PYTHON_PN}-bson"
 
diff --git a/meta-python/recipes-devtools/python/python-pymongo_3.8.0.bb b/meta-python/recipes-devtools/python/python-pymongo_3.9.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymongo_3.8.0.bb
rename to meta-python/recipes-devtools/python/python-pymongo_3.9.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.8.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.9.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pymongo_3.8.0.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_3.9.0.bb
-- 
2.7.4




