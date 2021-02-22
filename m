Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.32050.1613979912149736231
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Feb 2021 23:45:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,196,1610380800"; 
   d="scan'208";a="104718678"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Feb 2021 15:45:11 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id D1E0D4CE730C
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Feb 2021 15:45:08 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 22 Feb 2021 15:45:09 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] postgresql: upgrade 13.1 -> 13.2
Date: Mon, 22 Feb 2021 15:45:05 +0800
Message-ID: <1613979905-44185-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: D1E0D4CE730C.A999A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-License-Update: Copyright year updated to 2021.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../postgresql/{postgresql_13.1.bb => postgresql_13.2.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_13.1.bb => postgresql_13.2.bb} (59%)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_13.1.bb b/meta-oe/recipes-dbs/postgresql/postgresql_13.2.bb
similarity index 59%
rename from meta-oe/recipes-dbs/postgresql/postgresql_13.1.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_13.2.bb
index f2a29a59d9..ca8a6c7cee 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_13.1.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_13.2.bb
@@ -1,6 +1,6 @@
 require postgresql.inc
 
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=fc4ce21960f0c561460d750bc270d11f"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=255f15687738db8068fbe9b938c90217"
 
 SRC_URI += "\
    file://not-check-libperl.patch \
@@ -9,4 +9,4 @@ SRC_URI += "\
    file://0001-configure.in-bypass-autoconf-2.69-version-check.patch \
 "
 
-SRC_URI[sha256sum] = "12345c83b89aa29808568977f5200d6da00f88a035517f925293355432ffe61f"
+SRC_URI[sha256sum] = "5fd7fcd08db86f5b2aed28fcfaf9ae0aca8e9428561ac547764c2a2b0f41adfc"
-- 
2.25.1



