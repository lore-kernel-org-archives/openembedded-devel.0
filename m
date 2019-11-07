Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E4A647F7D3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 08:23:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,277,1569254400"; d="scan'208";a="77995521"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Nov 2019 16:23:50 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id AC7CF4CE20C0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 16:15:45 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 7 Nov 2019 16:23:51 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 7 Nov 2019 20:03:32 +0800
Message-ID: <1573128212-61709-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: AC7CF4CE20C0.A7814
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] mariadb: upgrade 10.3.16 -> 10.3.18
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
X-List-Received-Date: Thu, 07 Nov 2019 08:23:52 -0000
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../mysql/{mariadb-native_10.3.16.bb => mariadb-native_10.3.18.bb}    | 0
 meta-oe/recipes-dbs/mysql/mariadb.inc                                 | 4 ++--
 meta-oe/recipes-dbs/mysql/{mariadb_10.3.16.bb => mariadb_10.3.18.bb}  | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.3.16.bb => mariadb-native_10.3.18.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.3.16.bb => mariadb_10.3.18.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.3.16.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.3.18.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.3.16.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.3.18.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index f1c71fe..e1ae58a 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -19,8 +19,8 @@ SRC_URI = "http://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://clang_version_header_conflict.patch \
            file://fix-arm-atomic.patch \
           "
-SRC_URI[md5sum] = "11220d0b94c5c24caa2e1e9eaba38e31"
-SRC_URI[sha256sum] = "39e9723eaf620afd99b0925b2c2a5a50a89110ba50040adf14cce7cf89e5e21b"
+SRC_URI[md5sum] = "b3524c0825c3a1c255496daea38304a0"
+SRC_URI[sha256sum] = "69456ca85bf9d96c6d28b4ade2a9f6787d79a602e27ef941f9ba4e0b55dddedc"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.3.16.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.3.18.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.3.16.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.3.18.bb
-- 
2.7.4




