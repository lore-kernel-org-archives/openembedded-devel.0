Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.127423.1597988054250929534
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2020 22:34:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,335,1592841600"; 
   d="scan'208";a="98374598"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Aug 2020 13:34:09 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 77F7D48990D3
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2020 13:34:04 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 21 Aug 2020 13:34:04 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] lftp: upgrade 4.9.1 -> 4.9.2
Date: Sat, 22 Aug 2020 01:33:53 +0800
Message-ID: <1598031241-3582-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 77F7D48990D3.A458C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../lftp/{lftp_4.9.1.bb => lftp_4.9.2.bb}                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/lftp/{lftp_4.9.1.bb => lftp_4.9.2.bb} (89%)

diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.9.1.bb b/meta-networking/recipes-connectivity/lftp/lftp_4.9.2.bb
similarity index 89%
rename from meta-networking/recipes-connectivity/lftp/lftp_4.9.1.bb
rename to meta-networking/recipes-connectivity/lftp/lftp_4.9.2.bb
index 79a380ada..e6240a58e 100644
--- a/meta-networking/recipes-connectivity/lftp/lftp_4.9.1.bb
+++ b/meta-networking/recipes-connectivity/lftp/lftp_4.9.2.bb
@@ -7,8 +7,8 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "http://lftp.yar.ru/ftp/lftp-${PV}.tar.bz2"
-SRC_URI[md5sum] = "19ce64012bc722ad61667372fa262382"
-SRC_URI[sha256sum] = "a692fd081c19e2cc045869ab721a4fb3d7571040849a4406c4042f735232414c"
+SRC_URI[md5sum] = "42ec1793c386702bc2734ffbc8a5cff1"
+SRC_URI[sha256sum] = "8a07cbf4df09b107fe3fc41d133ee2f6cea6ef4c33ccf06c8448ad058cd96b7e"
 
 inherit autotools gettext pkgconfig
 
-- 
2.25.1



