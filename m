Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 40449731CC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 02:13:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2172209"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Jan 2016 10:13:13 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id DA08B4092564
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 10:12:55 +0800 (CST)
Received: from localhost.localdomain (10.167.226.51) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 4 Jan 2016 10:12:55 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 3 Jan 2016 18:12:54 -0800
Message-ID: <1451873574-5587-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.51]
X-yoursite-MailScanner-ID: DA08B4092564.AF608
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] postgresql: 9.4.4 -> 9.4.5
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
X-List-Received-Date: Mon, 04 Jan 2016 02:13:13 -0000
Content-Type: text/plain

Upgrade postgresql from 9.4.4 to 9.4.5.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../postgresql/{postgresql_9.4.4.bb => postgresql_9.4.5.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/postgresql/{postgresql_9.4.4.bb => postgresql_9.4.5.bb} (61%)

diff --git a/meta-oe/recipes-support/postgresql/postgresql_9.4.4.bb b/meta-oe/recipes-support/postgresql/postgresql_9.4.5.bb
similarity index 61%
rename from meta-oe/recipes-support/postgresql/postgresql_9.4.4.bb
rename to meta-oe/recipes-support/postgresql/postgresql_9.4.5.bb
index 266206b..54b660e 100644
--- a/meta-oe/recipes-support/postgresql/postgresql_9.4.4.bb
+++ b/meta-oe/recipes-support/postgresql/postgresql_9.4.5.bb
@@ -9,6 +9,6 @@ SRC_URI += "\
     file://not-check-libperl.patch \
 "
 
-SRC_URI[md5sum] = "1fe952c44ed26d7e6a335cf991a9c1c6"
-SRC_URI[sha256sum] = "538ed99688d6fdbec6fd166d1779cf4588bf2f16c52304e5ef29f904c43b0013"
+SRC_URI[md5sum] = "8b2e3472a8dc786649b4d02d02e039a0"
+SRC_URI[sha256sum] = "b87c50c66b6ea42a9712b5f6284794fabad0616e6ae420cf0f10523be6d94a39"
 
-- 
1.9.1




