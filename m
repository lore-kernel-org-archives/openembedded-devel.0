Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.2577.1610071967527360971
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jan 2021 18:12:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,330,1602518400"; 
   d="scan'208";a="103293312"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Jan 2021 10:12:46 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 556FD4CE6026
	for <openembedded-devel@lists.openembedded.org>; Fri,  8 Jan 2021 10:12:42 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 8 Jan 2021 10:12:42 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] haveged: upgrade 1.9.13 -> 1.9.14
Date: Fri, 8 Jan 2021 22:12:41 +0800
Message-ID: <1610115161-4926-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 556FD4CE6026.A084F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../haveged/{haveged_1.9.13.bb => haveged_1.9.14.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/haveged/{haveged_1.9.13.bb => haveged_1.9.14.bb} (96%)

diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.13.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.14.bb
similarity index 96%
rename from meta-oe/recipes-extended/haveged/haveged_1.9.13.bb
rename to meta-oe/recipes-extended/haveged/haveged_1.9.14.bb
index 50326ea2f4..b56b2271b1 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.13.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.14.bb
@@ -5,8 +5,8 @@ HOMEPAGE = "http://www.issihosts.com/haveged/index.html"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM="file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-# v1.9.9
-SRCREV = "1283a65c541c4a83e152024a63faf7b267b9b1cd"
+# v1.9.14
+SRCREV = "4da3080ad4587860e5da73072d6ed54d0052938c"
 SRC_URI = "git://github.com/jirka-h/haveged.git \
 "
 S = "${WORKDIR}/git"
-- 
2.25.1



