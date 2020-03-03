Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8449C61964
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2020 05:28:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,510,1574092800"; d="scan'208";a="85488800"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Mar 2020 13:28:20 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 3F87350A997C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2020 13:18:27 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Tue, 3 Mar 2020 13:28:15 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 3 Mar 2020 13:28:23 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 3 Mar 2020 03:51:55 -0800
Message-ID: <1583236320-114088-5-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1583236320-114088-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1583236320-114088-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 3F87350A997C.A2B24
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] jsonrpc: upgrade 1.2.0 -> 1.3.0
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
X-List-Received-Date: Tue, 03 Mar 2020 05:28:21 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../jsonrpc/{jsonrpc_1.2.0.bb => jsonrpc_1.3.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/jsonrpc/{jsonrpc_1.2.0.bb => jsonrpc_1.3.0.bb} (94%)

diff --git a/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.2.0.bb b/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.3.0.bb
similarity index 94%
rename from meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.2.0.bb
rename to meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.3.0.bb
index dbf44d796..ca9675ed6 100644
--- a/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.2.0.bb
+++ b/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.3.0.bb
@@ -10,7 +10,7 @@ SECTION = "libs"
 DEPENDS = "curl jsoncpp libmicrohttpd hiredis"
 
 SRC_URI = "git://github.com/cinemast/libjson-rpc-cpp"
-SRCREV = "4ed5b00dcc409405a19e6d8c6478f703153430e1"
+SRCREV = "c696f6932113b81cd20cd4a34fdb1808e773f23e"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1




