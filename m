Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 877207F7E2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 06:22:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,223,1569254400"; d="scan'208";a="77397422"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Oct 2019 14:22:17 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 9E1DC4CE1508
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 14:14:24 +0800 (CST)
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 24 Oct 2019 14:22:18 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 24 Oct 2019 14:22:32 +0800
Message-ID: <20191024062232.2223-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 9E1DC4CE1508.AB069
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-bcrypt: upgrade 3.1.4 -> 3.1.7
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
X-List-Received-Date: Thu, 24 Oct 2019 06:22:19 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-bcrypt.inc                 | 4 ++--
 .../python/{python-bcrypt_3.1.4.bb => python-bcrypt_3.1.7.bb}         | 0
 .../python/{python3-bcrypt_3.1.4.bb => python3-bcrypt_3.1.7.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-bcrypt_3.1.4.bb => python-bcrypt_3.1.7.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-bcrypt_3.1.4.bb => python3-bcrypt_3.1.7.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-bcrypt.inc b/meta-python/recipes-devtools/python/python-bcrypt.inc
index 4490969..a264003 100644
--- a/meta-python/recipes-devtools/python/python-bcrypt.inc
+++ b/meta-python/recipes-devtools/python/python-bcrypt.inc
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8f7bb094c7232b058c7e9f2e431f389c"
 
 DEPENDS += "${PYTHON_PN}-cffi-native"
 
-SRC_URI[md5sum] = "8408abc974446e64862a9742104e97b6"
-SRC_URI[sha256sum] = "67ed1a374c9155ec0840214ce804616de49c3df9c5bc66740687c1c9b1cd9e8d"
+SRC_URI[md5sum] = "5d6f93b575ce52470af37a8e7dce76fe"
+SRC_URI[sha256sum] = "0b0069c752ec14172c5f78208f1863d7ad6755a6fae6fe76ec2c80d13be41e42"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-bcrypt_3.1.4.bb b/meta-python/recipes-devtools/python/python-bcrypt_3.1.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-bcrypt_3.1.4.bb
rename to meta-python/recipes-devtools/python/python-bcrypt_3.1.7.bb
diff --git a/meta-python/recipes-devtools/python/python3-bcrypt_3.1.4.bb b/meta-python/recipes-devtools/python/python3-bcrypt_3.1.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-bcrypt_3.1.4.bb
rename to meta-python/recipes-devtools/python/python3-bcrypt_3.1.7.bb
-- 
2.7.4




