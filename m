Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4FA4D7E66A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Sep 2019 07:27:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,484,1559491200"; d="scan'208";a="75156581"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Sep 2019 15:27:21 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 3BD804CE030A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Sep 2019 15:27:16 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 9 Sep 2019 15:27:27 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 9 Sep 2019 15:26:09 +0800
Message-ID: <1568013969-114401-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: 3BD804CE030A.A6DEC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-python][PATCH] python3-colorama: New recipe
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
X-List-Received-Date: Mon, 09 Sep 2019 07:27:37 -0000
Content-Type: text/plain

Add new recipe python3-colorama as it is RDEPEND of python3-cmd2.
Import from meta-virtualization and upgrade it from 0.3.9 to 0.4.1.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python3-colorama_0.4.1.bb  | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-colorama_0.4.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-colorama_0.4.1.bb b/meta-python/recipes-devtools/python/python3-colorama_0.4.1.bb
new file mode 100644
index 000000000..9cfca094e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-colorama_0.4.1.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Cross-platform colored terminal text."
+HOMEPAGE = "https://github.com/tartley/colorama"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b4936429a56a652b84c5c01280dcaa26"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "f927529cd1735f6f50ee2c61628e9c1f"
+SRC_URI[sha256sum] = "05eed71e2e327246ad6b38c540c4a3117230b19679b875190486ddd2d721422d"
+
-- 
2.17.1




