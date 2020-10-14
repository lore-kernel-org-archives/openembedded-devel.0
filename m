Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.2894.1602644090250469696
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 19:54:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,373,1596470400"; 
   d="scan'208";a="100137621"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 14 Oct 2020 10:54:48 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 6317348990F9
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2020 10:54:48 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 14 Oct 2020 10:54:47 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] mtr: upgrade 0.93 -> 0.94
Date: Wed, 14 Oct 2020 10:54:46 +0800
Message-ID: <1602644086-119646-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6317348990F9.AE8A1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-support/mtr/{mtr_0.93.bb => mtr_0.94.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/mtr/{mtr_0.93.bb => mtr_0.94.bb} (93%)

diff --git a/meta-networking/recipes-support/mtr/mtr_0.93.bb b/meta-networking/recipes-support/mtr/mtr_0.94.bb
similarity index 93%
rename from meta-networking/recipes-support/mtr/mtr_0.93.bb
rename to meta-networking/recipes-support/mtr/mtr_0.94.bb
index dd150700a9..265eefb94b 100644
--- a/meta-networking/recipes-support/mtr/mtr_0.93.bb
+++ b/meta-networking/recipes-support/mtr/mtr_0.94.bb
@@ -8,7 +8,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://ui/mtr.c;beginline=5;endline=16;md5=00a894a39d53726a27386534d1c4e468"
 
-SRCREV = "304349bad86229aedbc62c07d5e98a8292967991"
+SRCREV = "2c73cbf4094e4eed343ed11ae5bab2580f3122d1"
 SRC_URI = "git://github.com/traviscross/mtr"
 
 S = "${WORKDIR}/git"
-- 
2.25.1



