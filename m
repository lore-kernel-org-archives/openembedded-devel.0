Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7E58B7FC8C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jan 2020 09:31:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,409,1571673600"; d="scan'208";a="81480873"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Jan 2020 17:31:13 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id A2E0449E9335
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jan 2020 17:22:11 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 8 Jan 2020 17:31:11 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 8 Jan 2020 17:31:20 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 8 Jan 2020 05:41:07 -0800
Message-ID: <1578490868-66073-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: A2E0449E9335.A2CAB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] cscope: upgrade 15.8b -> 15.9
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
X-List-Received-Date: Wed, 08 Jan 2020 09:31:14 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../cscope/{cscope_15.8b.bb => cscope_15.9.bb}              | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/cscope/{cscope_15.8b.bb => cscope_15.9.bb} (83%)

diff --git a/meta-oe/recipes-devtools/cscope/cscope_15.8b.bb b/meta-oe/recipes-devtools/cscope/cscope_15.9.bb
similarity index 83%
rename from meta-oe/recipes-devtools/cscope/cscope_15.8b.bb
rename to meta-oe/recipes-devtools/cscope/cscope_15.9.bb
index 199c31e15..99f3ba85d 100644
--- a/meta-oe/recipes-devtools/cscope/cscope_15.8b.bb
+++ b/meta-oe/recipes-devtools/cscope/cscope_15.9.bb
@@ -18,7 +18,7 @@ inherit autotools
 
 DEPENDS += "ncurses"
 
-SRC_URI = "http://downloads.sourceforge.net/project/cscope/cscope/${PV}/${BP}.tar.gz"
+SRC_URI = "http://downloads.sourceforge.net/project/cscope/cscope/v${PV}/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "8f9409a238ee313a96f9f87fe0f3b176"
-SRC_URI[sha256sum] = "4889d091f05aa0845384b1e4965aa31d2b20911fb2c001b2cdcffbcb7212d3af"
+SRC_URI[md5sum] = "16f3cce078b6c0e42299def4028eea6f"
+SRC_URI[sha256sum] = "c5505ae075a871a9cd8d9801859b0ff1c09782075df281c72c23e72115d9f159"
-- 
2.17.1




