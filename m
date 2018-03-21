Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 257DE71A5E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 03:36:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="38026059"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Mar 2018 11:36:14 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id D431D4D0EFD1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 11:36:13 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 21 Mar 2018 11:36:12 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Mar 2018 11:36:06 +0800
Message-ID: <1521603377-34881-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: D431D4D0EFD1.A82D3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] quagga: 1.2.2 -> 1.2.4
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
X-List-Received-Date: Wed, 21 Mar 2018 03:36:14 -0000
Content-Type: text/plain

Upgrade quagga from 1.2.2 to 1.2.4.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 meta-networking/recipes-protocols/quagga/quagga_1.2.2.bb | 4 ----
 meta-networking/recipes-protocols/quagga/quagga_1.2.4.bb | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/quagga/quagga_1.2.2.bb
 create mode 100644 meta-networking/recipes-protocols/quagga/quagga_1.2.4.bb

diff --git a/meta-networking/recipes-protocols/quagga/quagga_1.2.2.bb b/meta-networking/recipes-protocols/quagga/quagga_1.2.2.bb
deleted file mode 100644
index 653f46b..0000000
--- a/meta-networking/recipes-protocols/quagga/quagga_1.2.2.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require quagga.inc
-
-SRC_URI[md5sum] = "e84be2938c26c0c872792090f1a6a866"
-SRC_URI[sha256sum] = "522e22f2beee64e3f0c2cde3d0155f3b8103f4f6fc8abef92cb40bc3a4cc2931"
diff --git a/meta-networking/recipes-protocols/quagga/quagga_1.2.4.bb b/meta-networking/recipes-protocols/quagga/quagga_1.2.4.bb
new file mode 100644
index 0000000..a7697a1
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/quagga_1.2.4.bb
@@ -0,0 +1,4 @@
+require quagga.inc
+
+SRC_URI[md5sum] = "eced21b054d71c9e1b7c6ac43286a166"
+SRC_URI[sha256sum] = "e364c082c3309910e1eb7b068bf39ee298e2f2f3f31a6431a5c115193bd653d3"
-- 
2.7.4




