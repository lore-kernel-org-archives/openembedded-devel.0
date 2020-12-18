Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.6833.1608278994182650329
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Dec 2020 00:09:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; 
   d="scan'208";a="102708855"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 Dec 2020 16:09:53 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id D5A214CE6017
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Dec 2020 16:09:52 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 18 Dec 2020 16:09:52 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] uhubctl: upgrade 2.2.0 -> 2.3.0
Date: Fri, 18 Dec 2020 16:09:55 +0800
Message-ID: <1608278995-111775-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: D5A214CE6017.A7C69
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../uhubctl/{uhubctl_2.2.0.bb => uhubctl_2.3.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/uhubctl/{uhubctl_2.2.0.bb => uhubctl_2.3.0.bb} (92%)

diff --git a/meta-oe/recipes-support/uhubctl/uhubctl_2.2.0.bb b/meta-oe/recipes-support/uhubctl/uhubctl_2.3.0.bb
similarity index 92%
rename from meta-oe/recipes-support/uhubctl/uhubctl_2.2.0.bb
rename to meta-oe/recipes-support/uhubctl/uhubctl_2.3.0.bb
index fb60446cb..7970ca3c4 100644
--- a/meta-oe/recipes-support/uhubctl/uhubctl_2.2.0.bb
+++ b/meta-oe/recipes-support/uhubctl/uhubctl_2.3.0.bb
@@ -6,7 +6,7 @@ DEPENDS = "libusb1"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "5ee8260c71647f687b5e71af11f45244814835d7"
+SRCREV = "1b52efddbd68b4395df3ac9cd10eeb984af22439"
 SRC_URI = "git://github.com/mvp/${BPN}"
 S = "${WORKDIR}/git"
 
-- 
2.25.1



