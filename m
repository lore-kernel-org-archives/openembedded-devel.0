Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.3603.1599787212663255124
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2020 18:20:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,413,1592841600"; 
   d="scan'208";a="99114296"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Sep 2020 09:20:11 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id C8A0E48990E7
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2020 09:20:10 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 11 Sep 2020 09:20:10 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] cifs-utils: upgrade 6.10 -> 6.11
Date: Fri, 11 Sep 2020 21:20:11 +0800
Message-ID: <1599830411-14677-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: C8A0E48990E7.A43A1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../cifs/{cifs-utils_6.10.bb => cifs-utils_6.11.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/cifs/{cifs-utils_6.10.bb => cifs-utils_6.11.bb} (96%)

diff --git a/meta-networking/recipes-support/cifs/cifs-utils_6.10.bb b/meta-networking/recipes-support/cifs/cifs-utils_6.11.bb
similarity index 96%
rename from meta-networking/recipes-support/cifs/cifs-utils_6.10.bb
rename to meta-networking/recipes-support/cifs/cifs-utils_6.11.bb
index 8d82ee454..09b793119 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_6.10.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_6.11.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 PV = "6.10"
 
-SRCREV = "5ff5fc2ecc10353fd39ad508db5c2828fd2d8d9a"
+SRCREV = "ded4e81796a18cde73329e838357f084aa05720f"
 SRC_URI = "git://git.samba.org/cifs-utils.git"
 
 S = "${WORKDIR}/git"
-- 
2.25.1



