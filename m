Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 05D2572EB7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Jun 2019 11:23:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,431,1557158400"; d="scan'208";a="70145880"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Jun 2019 19:22:54 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 3F5124CDDD4A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Jun 2019 19:22:56 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Sat, 29 Jun 2019 19:22:55 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 29 Jun 2019 19:24:20 +0800
Message-ID: <20190629112420.7604-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 3F5124CDDD4A.AA32E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] postgresql: upgrade 11.3 -> 11.4
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
X-List-Received-Date: Sat, 29 Jun 2019 11:23:05 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-Upgrade from postgresql_11.3.bb to postgresql_11.4.bb.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../postgresql/{postgresql_11.3.bb => postgresql_11.4.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_11.3.bb => postgresql_11.4.bb} (63%)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_11.3.bb b/meta-oe/recipes-dbs/postgresql/postgresql_11.4.bb
similarity index 63%
rename from meta-oe/recipes-dbs/postgresql/postgresql_11.3.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_11.4.bb
index a18eca320..0e7ddc801 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_11.3.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_11.4.bb
@@ -8,5 +8,5 @@ SRC_URI += "\
    file://0001-Improve-reproducibility.patch \
 "
 
-SRC_URI[md5sum] = "c2a729b754b8de86a969c86ec25db076"
-SRC_URI[sha256sum] = "2a85e082fc225944821dfd23990e32dfcd2284c19060864b0ad4ca537d30522d"
+SRC_URI[md5sum] = "dab5eed8a5f9204bf2f03a209eead4c3"
+SRC_URI[sha256sum] = "02802ddffd1590805beddd1e464dd28a46a41a5f1e1df04bab4f46663195cc8b"
-- 
2.20.1




