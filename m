Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4F0757FC3F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 04:49:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,336,1574092800"; d="scan'208";a="82250778"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Jan 2020 12:49:02 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 14F2D406AB15
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 12:39:50 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Sun, 19 Jan 2020 12:49:01 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Sun, 19 Jan 2020 12:48:59 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 19 Jan 2020 12:50:26 +0800
Message-ID: <20200119045026.30367-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 14F2D406AB15.ACA83
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python3-regex: upgrade 2019.08.19 -> 2020.1.8
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
X-List-Received-Date: Sun, 19 Jan 2020 04:49:02 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-License-Update: Update PKG-INFO.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/python3-regex_2019.08.19.bb               | 12 ------------
 .../python/python3-regex_2020.1.8.bb                 | 12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)
 delete mode 100755 meta-python/recipes-devtools/python/python3-regex_2019.08.19.bb
 create mode 100755 meta-python/recipes-devtools/python/python3-regex_2020.1.8.bb

diff --git a/meta-python/recipes-devtools/python/python3-regex_2019.08.19.bb b/meta-python/recipes-devtools/python/python3-regex_2019.08.19.bb
deleted file mode 100755
index 80194d60f..000000000
--- a/meta-python/recipes-devtools/python/python3-regex_2019.08.19.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = ""
-HOMEPAGE = "http://pythonhosted.org/regex"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=51cb124129fa4d157b4aebb77df73629"
-
-inherit pypi setuptools3
-
-SRC_URI[md5sum] = "d31ec392ab75b894404d8db76dacd191"
-SRC_URI[sha256sum] = "587b62d48ca359d2d4f02d486f1f0aa9a20fbaf23a9d4198c4bed72ab2f6c849"
-
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-regex_2020.1.8.bb b/meta-python/recipes-devtools/python/python3-regex_2020.1.8.bb
new file mode 100755
index 000000000..6bdc03995
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-regex_2020.1.8.bb
@@ -0,0 +1,12 @@
+SUMMARY = ""
+HOMEPAGE = "http://pythonhosted.org/regex"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=3d9edb84b293ab5a9ed5bcaf1b769ab6"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "73abc3d7e902e94b4281fd2652f5a94f"
+SRC_URI[sha256sum] = "d0f424328f9822b0323b3b6f2e4b9c90960b24743d220763c7f07071e0778351"
+
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1




