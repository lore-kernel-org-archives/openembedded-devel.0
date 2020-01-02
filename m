Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 276EB7FC86
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 07:13:21 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,385,1571673600"; d="scan'208";a="81232177"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Jan 2020 15:13:22 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 19C7649E9310
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 15:04:26 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 2 Jan 2020 15:13:20 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 2 Jan 2020 15:13:18 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Jan 2020 15:14:36 +0800
Message-ID: <20200102071436.30369-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 19C7649E9310.A9C08
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pymongo: upgrade 3.9.0 -> 3.10.0
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
X-List-Received-Date: Thu, 02 Jan 2020 07:13:22 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pymongo.inc        | 4 ++--
 .../{python-pymongo_3.9.0.bb => python-pymongo_3.10.0.bb}     | 0
 .../{python3-pymongo_3.9.0.bb => python3-pymongo_3.10.0.bb}   | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymongo_3.9.0.bb => python-pymongo_3.10.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymongo_3.9.0.bb => python3-pymongo_3.10.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pymongo.inc b/meta-python/recipes-devtools/python/python-pymongo.inc
index cd11d9812..dc78b10f8 100644
--- a/meta-python/recipes-devtools/python/python-pymongo.inc
+++ b/meta-python/recipes-devtools/python/python-pymongo.inc
@@ -8,8 +8,8 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[md5sum] = "531786df7ad98f15c43f1b17edf5f84c"
-SRC_URI[sha256sum] = "4249c6ba45587b959292a727532826c5032d59171f923f7f823788f413c2a5a3"
+SRC_URI[md5sum] = "fb98d896f0eb14d9b4fe9baac24d772a"
+SRC_URI[sha256sum] = "c43879fe427ea6aa6e84dae9fbdc5aa14428a4cfe613fe0fee2cc004bf3f307c"
 
 PACKAGES =+ "${PYTHON_PN}-bson"
 
diff --git a/meta-python/recipes-devtools/python/python-pymongo_3.9.0.bb b/meta-python/recipes-devtools/python/python-pymongo_3.10.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymongo_3.9.0.bb
rename to meta-python/recipes-devtools/python/python-pymongo_3.10.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.9.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.10.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pymongo_3.9.0.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_3.10.0.bb
-- 
2.20.1




