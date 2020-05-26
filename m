Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.44628.1590464062306340939
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 May 2020 20:34:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,435,1583164800"; 
   d="scan'208";a="93092980"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 26 May 2020 11:34:19 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id DC13E4BCC89D
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 May 2020 11:34:16 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 26 May 2020 11:34:15 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] gsoap: upgrade 2.8.100 -> 2.8.103
Date: Tue, 26 May 2020 20:34:10 +0800
Message-ID: <1590496450-24878-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: DC13E4BCC89D.A87CF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../gsoap/{gsoap_2.8.100.bb => gsoap_2.8.103.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/gsoap/{gsoap_2.8.100.bb => gsoap_2.8.103.bb} (89%)

diff --git a/meta-oe/recipes-support/gsoap/gsoap_2.8.100.bb b/meta-oe/recipes-support/gsoap/gsoap_2.8.103.bb
similarity index 89%
rename from meta-oe/recipes-support/gsoap/gsoap_2.8.100.bb
rename to meta-oe/recipes-support/gsoap/gsoap_2.8.103.bb
index 0b4eac8897..8543c6f484 100644
--- a/meta-oe/recipes-support/gsoap/gsoap_2.8.100.bb
+++ b/meta-oe/recipes-support/gsoap/gsoap_2.8.103.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4f40a941379143186f9602242c3fb729 \
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}2/${BPN}_${PV}.zip \
            "
-SRC_URI[md5sum] = "f0fc5394286753eff657cf62b46d024b"
-SRC_URI[sha256sum] = "11b4f99d28392e3e1aeb29bfd006a4f1f40e7fdd7a3f3444ee69014d415f09f2"
+SRC_URI[md5sum] = "3207ece9fc8ceb787091de93838f5952"
+SRC_URI[sha256sum] = "afe2ba08d2fa56adc3c774b6741587203a72140a255346e9947b8d2ee6c7d4b6"
 
 inherit autotools
 
-- 
2.17.1



