Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B1AE07FBA0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 11:22:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,243,1569254400"; d="scan'208";a="77636808"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Oct 2019 19:22:30 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 85D274B6EC6D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 19:14:32 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 29 Oct 2019 19:22:29 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 30 Oct 2019 03:16:48 +0800
Message-ID: <1572376608-16137-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 85D274B6EC6D.A8EBF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] grpc: upgrade 1.24.1 -> 1.24.3
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
X-List-Received-Date: Tue, 29 Oct 2019 11:22:31 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/grpc/{grpc_1.24.1.bb => grpc_1.24.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-devtools/grpc/{grpc_1.24.1.bb => grpc_1.24.3.bb} (97%)

diff --git a/meta-networking/recipes-devtools/grpc/grpc_1.24.1.bb b/meta-networking/recipes-devtools/grpc/grpc_1.24.3.bb
similarity index 97%
rename from meta-networking/recipes-devtools/grpc/grpc_1.24.1.bb
rename to meta-networking/recipes-devtools/grpc/grpc_1.24.3.bb
index 5cfa3aa..2d7694a 100644
--- a/meta-networking/recipes-devtools/grpc/grpc_1.24.1.bb
+++ b/meta-networking/recipes-devtools/grpc/grpc_1.24.3.bb
@@ -11,7 +11,7 @@ DEPENDS_append_class-target = " googletest grpc-native "
 DEPENDS_append_class-nativesdk = " grpc-native "
 
 S = "${WORKDIR}/git"
-SRCREV_grpc = "fe494ff4104b6f6a78117ab2da71d29c93053267"
+SRCREV_grpc = "2de2e8dd8921e1f7d043e01faf7fe8a291fbb072"
 SRCREV_upb = "9effcbcb27f0a665f9f345030188c0b291e32482"
 BRANCH = "v1.24.x"
 SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
-- 
2.7.4




