Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 543B97F876
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2019 10:30:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,266,1569254400"; d="scan'208";a="77888177"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Nov 2019 18:30:38 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 96DDE4CE14F8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2019 18:22:34 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 4 Nov 2019 18:30:37 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Nov 2019 22:10:14 +0800
Message-ID: <1572876614-6152-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 96DDE4CE14F8.A9651
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] mm-common: upgrade 0.9.12 -> 1.0.0
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
X-List-Received-Date: Mon, 04 Nov 2019 10:30:40 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-core/mm-common/mm-common_0.9.12.bb | 9 ---------
 meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb  | 9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 meta-oe/recipes-core/mm-common/mm-common_0.9.12.bb
 create mode 100644 meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb

diff --git a/meta-oe/recipes-core/mm-common/mm-common_0.9.12.bb b/meta-oe/recipes-core/mm-common/mm-common_0.9.12.bb
deleted file mode 100644
index 4f91f31..0000000
--- a/meta-oe/recipes-core/mm-common/mm-common_0.9.12.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-inherit gnomebase
-
-SRC_URI[archive.md5sum] = "be1c61587db989c7677375a729b94672"
-SRC_URI[archive.sha256sum] = "ceffdcce1e5b52742884c233ec604bf6fded12eea9da077ce7a62c02c87e7c0b"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb b/meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb
new file mode 100644
index 0000000..3dccbd8
--- /dev/null
+++ b/meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb
@@ -0,0 +1,9 @@
+inherit gnomebase
+
+SRC_URI[archive.md5sum] = "9087b8612d75cbc1fad0c99e15c2a718"
+SRC_URI[archive.sha256sum] = "b97d9b041e5952486cab620b44ab09f6013a478f43b6699ae899b8a4da189cd4"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+BBCLASSEXTEND = "native"
-- 
2.7.4




