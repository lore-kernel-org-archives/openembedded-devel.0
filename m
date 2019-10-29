Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9814F7FBC8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 11:22:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,243,1569254400"; d="scan'208";a="77636813"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Oct 2019 19:22:54 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 16B924B6EC86
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 19:14:55 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 29 Oct 2019 19:22:51 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 30 Oct 2019 03:17:18 +0800
Message-ID: <1572376638-16194-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 16B924B6EC86.A834B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] corosync: upgrade 2.4.4 -> 2.4.5
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
X-List-Received-Date: Tue, 29 Oct 2019 11:22:54 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../corosync/{corosync_2.4.4.bb => corosync_2.4.5.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-extended/corosync/{corosync_2.4.4.bb => corosync_2.4.5.bb} (95%)

diff --git a/meta-networking/recipes-extended/corosync/corosync_2.4.4.bb b/meta-networking/recipes-extended/corosync/corosync_2.4.5.bb
similarity index 95%
rename from meta-networking/recipes-extended/corosync/corosync_2.4.4.bb
rename to meta-networking/recipes-extended/corosync/corosync_2.4.5.bb
index e5fa16a..1f4a3e1 100644
--- a/meta-networking/recipes-extended/corosync/corosync_2.4.4.bb
+++ b/meta-networking/recipes-extended/corosync/corosync_2.4.5.bb
@@ -11,8 +11,8 @@ SRC_URI = "http://build.clusterlabs.org/corosync/releases/${BP}.tar.gz \
            file://corosync.conf \
           "
 
-SRC_URI[md5sum] = "69db29ff4bc035936946be44fc8be5cd"
-SRC_URI[sha256sum] = "9bd4707bb271df16f8d543ec782eb4c35ec0330b7be696b797da4bd8f058a25d"
+SRC_URI[md5sum] = "e36a056b893c313c4ec1fe0d7e6cdebd"
+SRC_URI[sha256sum] = "ab6eafdb8f43a23794fc15d4c5198bbd6759060cb13c8d2d1e78a6c8360aba5f"
 
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.(?!99)\d+(\.\d+)+)"
 
-- 
2.7.4




