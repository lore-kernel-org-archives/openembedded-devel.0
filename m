Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id F30047C7D3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Mar 2019 09:09:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.58,443,1544457600"; d="scan'208";a="55947200"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Mar 2019 17:09:35 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 8450F4C7F2D5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Mar 2019 17:09:19 +0800 (CST)
Received: from localhost.localdomain (10.167.225.47) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Tue, 5 Mar 2019 17:09:43 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 5 Mar 2019 17:10:48 +0800
Message-ID: <20190305091048.9490-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.47]
X-yoursite-MailScanner-ID: 8450F4C7F2D5.AA0A1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-networking][PATCH] radvd:upgrade to 2.18
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
X-List-Received-Date: Tue, 05 Mar 2019 09:09:36 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Upgrade radvd from 2.17 to 2.18

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta-networking/recipes-daemons/radvd/radvd_2.17.bb | 5 -----
 meta-networking/recipes-daemons/radvd/radvd_2.18.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/radvd/radvd_2.17.bb
 create mode 100644 meta-networking/recipes-daemons/radvd/radvd_2.18.bb

diff --git a/meta-networking/recipes-daemons/radvd/radvd_2.17.bb b/meta-networking/recipes-daemons/radvd/radvd_2.17.bb
deleted file mode 100644
index 4baea01d0..000000000
--- a/meta-networking/recipes-daemons/radvd/radvd_2.17.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-
-require radvd.inc
-
-SRC_URI[md5sum] = "64ee3fdb5544bcddef1c6cd80d77fa0a"
-SRC_URI[sha256sum] = "53757e7f2164899e1145482f1ae91829600a6e2f6fec29cfb3b350a3bb45bd5d"
diff --git a/meta-networking/recipes-daemons/radvd/radvd_2.18.bb b/meta-networking/recipes-daemons/radvd/radvd_2.18.bb
new file mode 100644
index 000000000..6097b209d
--- /dev/null
+++ b/meta-networking/recipes-daemons/radvd/radvd_2.18.bb
@@ -0,0 +1,5 @@
+
+require radvd.inc
+
+SRC_URI[md5sum] = "26ead3a0d5cfbe4c81c3089eaf7b3250"
+SRC_URI[sha256sum] = "4f573e36b96ba92d03b5abbbd5f059b9c8994967812c77852f44049ac5a448fd"
-- 
2.20.1




