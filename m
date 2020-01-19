Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id F38157FC32
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 06:09:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,336,1574092800"; d="scan'208";a="82254185"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Jan 2020 14:09:37 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id BA2F35010EB1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 14:00:24 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Sun, 19 Jan 2020 14:09:36 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Sun, 19 Jan 2020 14:09:34 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 19 Jan 2020 14:11:02 +0800
Message-ID: <20200119061102.16512-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: BA2F35010EB1.A7628
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pymongo: upgrade 3.10.0 -> 3.10.1
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
X-List-Received-Date: Sun, 19 Jan 2020 06:09:40 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pymongo.inc        | 4 ++--
 .../{python-pymongo_3.10.0.bb => python-pymongo_3.10.1.bb}    | 0
 .../{python3-pymongo_3.10.0.bb => python3-pymongo_3.10.1.bb}  | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymongo_3.10.0.bb => python-pymongo_3.10.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymongo_3.10.0.bb => python3-pymongo_3.10.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pymongo.inc b/meta-python/recipes-devtools/python/python-pymongo.inc
index dc78b10f8..2b9794f9c 100644
--- a/meta-python/recipes-devtools/python/python-pymongo.inc
+++ b/meta-python/recipes-devtools/python/python-pymongo.inc
@@ -8,8 +8,8 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[md5sum] = "fb98d896f0eb14d9b4fe9baac24d772a"
-SRC_URI[sha256sum] = "c43879fe427ea6aa6e84dae9fbdc5aa14428a4cfe613fe0fee2cc004bf3f307c"
+SRC_URI[md5sum] = "e31b9c0190c9eaf1f792d0277b2a8ebe"
+SRC_URI[sha256sum] = "993257f6ca3cde55332af1f62af3e04ca89ce63c08b56a387cdd46136c72f2fa"
 
 PACKAGES =+ "${PYTHON_PN}-bson"
 
diff --git a/meta-python/recipes-devtools/python/python-pymongo_3.10.0.bb b/meta-python/recipes-devtools/python/python-pymongo_3.10.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymongo_3.10.0.bb
rename to meta-python/recipes-devtools/python/python-pymongo_3.10.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.10.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.10.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pymongo_3.10.0.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_3.10.1.bb
-- 
2.20.1




