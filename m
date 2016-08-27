Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 809B7601B8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Aug 2016 10:09:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10345933"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Aug 2016 18:09:16 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 81B4242EB270
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Aug 2016 18:09:13 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Sat, 27 Aug 2016 18:09:13 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 27 Aug 2016 06:09:07 -0400
Message-ID: <1472292547-1742-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: 81B4242EB270.A42C6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] radvd: 2.11 -> 2.14
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
X-List-Received-Date: Sat, 27 Aug 2016 10:09:17 -0000
Content-Type: text/plain

Upgrade radvd from 2.11 to 2.14.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 meta-networking/recipes-daemons/radvd/radvd_2.11.bb | 5 -----
 meta-networking/recipes-daemons/radvd/radvd_2.14.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/radvd/radvd_2.11.bb
 create mode 100644 meta-networking/recipes-daemons/radvd/radvd_2.14.bb

diff --git a/meta-networking/recipes-daemons/radvd/radvd_2.11.bb b/meta-networking/recipes-daemons/radvd/radvd_2.11.bb
deleted file mode 100644
index c0b7532..0000000
--- a/meta-networking/recipes-daemons/radvd/radvd_2.11.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-
-require radvd.inc
-
-SRC_URI[md5sum] = "57fc6021f6a5e5472e455937685472a3"
-SRC_URI[sha256sum] = "80ad60b15689e9591a5af393a57a1d93304deeff2e46482f0fd98046c00622f8"
diff --git a/meta-networking/recipes-daemons/radvd/radvd_2.14.bb b/meta-networking/recipes-daemons/radvd/radvd_2.14.bb
new file mode 100644
index 0000000..2525249
--- /dev/null
+++ b/meta-networking/recipes-daemons/radvd/radvd_2.14.bb
@@ -0,0 +1,5 @@
+
+require radvd.inc
+
+SRC_URI[md5sum] = "acd3883dece2c7888d15596b05c9fae4"
+SRC_URI[sha256sum] = "46d31c05daea11c3d1e3dc092997d3631b3bc72b20a4f279b05304b83dbd7aa8"
-- 
2.7.4




