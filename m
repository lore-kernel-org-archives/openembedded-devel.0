Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.30590.1590740040888007123
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 May 2020 01:14:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,447,1583164800"; 
   d="scan'208";a="93343290"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 May 2020 16:13:56 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 809354BCC89D
	for <openembedded-devel@lists.openembedded.org>; Fri, 29 May 2020 16:13:51 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 29 May 2020 16:13:50 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] logwatch: upgrade 7.5.1 -> 7.5.3
Date: Sat, 30 May 2020 01:13:48 +0800
Message-ID: <1590772430-43159-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 809354BCC89D.A64B3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../logwatch/{logwatch_7.5.1.bb => logwatch_7.5.3.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/logwatch/{logwatch_7.5.1.bb => logwatch_7.5.3.bb} (95%)

diff --git a/meta-oe/recipes-extended/logwatch/logwatch_7.5.1.bb b/meta-oe/recipes-extended/logwatch/logwatch_7.5.3.bb
similarity index 95%
rename from meta-oe/recipes-extended/logwatch/logwatch_7.5.1.bb
rename to meta-oe/recipes-extended/logwatch/logwatch_7.5.3.bb
index b6ab43ccf7..644e420711 100644
--- a/meta-oe/recipes-extended/logwatch/logwatch_7.5.1.bb
+++ b/meta-oe/recipes-extended/logwatch/logwatch_7.5.3.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ad199c8aca74e70f296f731ad9a1521c"
 RDEPENDS_${PN} = "perl"
 
 SRC_URI = "http://jaist.dl.sourceforge.net/project/${BPN}/${BP}/${BP}.tar.gz"
-SRC_URI[md5sum] = "3d14fa6e0fb56f890d2b3fd9cbc3162f"
-SRC_URI[sha256sum] = "9d4a00625065f25058f8966e7fb11f9f72db25507b4dd9c05f57e14447c33295"
+SRC_URI[md5sum] = "8bcf3edc5a4687c8aad1b9c01e2be54b"
+SRC_URI[sha256sum] = "1b2b96879dec01cd02754fe00f8989b11ff16158c3dc7c4aff0faa4b1d34974b"
 
 do_install() {
     install -m 0755 -d ${D}${sysconfdir}/logwatch/scripts
-- 
2.17.1



