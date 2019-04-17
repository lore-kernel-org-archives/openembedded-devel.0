Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5B8067D39A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Apr 2019 05:36:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,360,1549900800"; d="scan'208";a="59503680"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Apr 2019 13:36:38 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 776184CD84CA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Apr 2019 13:36:38 +0800 (CST)
Received: from localhost.local (10.167.225.84) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 17 Apr 2019 13:36:38 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Apr 2019 13:37:28 +0800
Message-ID: <20190417053728.1751-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.84]
X-yoursite-MailScanner-ID: 776184CD84CA.AA95C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python] [PATCH] python-pbr: upgrade 4.2.0 -> 5.1.3
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
X-List-Received-Date: Wed, 17 Apr 2019 05:36:38 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from python-pbr_4.2.0.bb to python-pbr_5.1.3.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-pbr_4.2.0.bb | 7 -------
 meta-python/recipes-devtools/python/python-pbr_5.1.3.bb | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pbr_4.2.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python-pbr_5.1.3.bb

diff --git a/meta-python/recipes-devtools/python/python-pbr_4.2.0.bb b/meta-python/recipes-devtools/python/python-pbr_4.2.0.bb
deleted file mode 100644
index 32487723b..000000000
--- a/meta-python/recipes-devtools/python/python-pbr_4.2.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-inherit setuptools
-# The inc file is in oe-core
-require recipes-devtools/python/python-pbr.inc
-
-SRC_URI[md5sum] = "6619780896ca81c7cd19c6e2f439b6c9"
-SRC_URI[sha256sum] = "1b8be50d938c9bb75d0eaf7eda111eec1bf6dc88a62a6412e33bf077457e0f45"
-
diff --git a/meta-python/recipes-devtools/python/python-pbr_5.1.3.bb b/meta-python/recipes-devtools/python/python-pbr_5.1.3.bb
new file mode 100644
index 000000000..568db21e3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pbr_5.1.3.bb
@@ -0,0 +1,7 @@
+inherit setuptools
+# The inc file is in oe-core
+require recipes-devtools/python/python-pbr.inc
+
+SRC_URI[md5sum] = "08972dca5fd2a959f27842090973edd6"
+SRC_URI[sha256sum] = "8c361cc353d988e4f5b998555c88098b9d5964c2e11acf7b0d21925a66bb5824"
+
-- 
2.20.1




