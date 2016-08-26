Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4D57870030
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Aug 2016 08:02:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10320380"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Aug 2016 16:02:49 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id C7E1F42EB260
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Aug 2016 16:02:46 +0800 (CST)
Received: from localhost.localdomain (10.167.226.90) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Fri, 26 Aug 2016 16:02:46 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <1465103229-8927-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.90]
X-yoursite-MailScanner-ID: C7E1F42EB260.AFBCF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] postfix: 3.0.3 -> 3.0.5
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
Date: Fri, 26 Aug 2016 08:02:55 -0000
X-Original-Date: Sun, 5 Jun 2016 13:07:09 +0800
X-List-Received-Date: Fri, 26 Aug 2016 08:02:55 -0000
Content-Type: text/plain

Upgrade postfix from 3.0.3 to 3.0.5.

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 meta-networking/recipes-daemons/postfix/postfix_3.0.3.bb | 4 ----
 meta-networking/recipes-daemons/postfix/postfix_3.0.5.bb | 5 +++++
 2 files changed, 5 insertions(+), 4 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/postfix/postfix_3.0.3.bb
 create mode 100644 meta-networking/recipes-daemons/postfix/postfix_3.0.5.bb

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.0.3.bb b/meta-networking/recipes-daemons/postfix/postfix_3.0.3.bb
deleted file mode 100644
index 7104a9d..0000000
--- a/meta-networking/recipes-daemons/postfix/postfix_3.0.3.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require postfix.inc
-
-SRC_URI[md5sum] = "61caffae689c11d09b4c972a394ae3b1"
-SRC_URI[sha256sum] = "401e46ec3450569dcce60d1d8ca22a19ab1f7f817b0cc730cdf4875ba608ac02"
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.0.5.bb b/meta-networking/recipes-daemons/postfix/postfix_3.0.5.bb
new file mode 100644
index 0000000..5bb6b21
--- /dev/null
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.0.5.bb
@@ -0,0 +1,5 @@
+require postfix.inc
+
+SRC_URI[md5sum] = "28a5c7a10d3238dded23c880d1f22871"
+SRC_URI[sha256sum] = "dbe20d011a6fe79d28b5f7e6e86681dafd30f7ed8ad663bec244fc4694c87d1c"
+
-- 
2.7.4




