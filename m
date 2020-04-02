Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.5328.1585792067413191814
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2020 18:47:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,333,1580745600"; 
   d="scan'208";a="88363824"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 02 Apr 2020 09:47:46 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 898B250A9974
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2020 09:37:25 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 2 Apr 2020 09:47:44 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-perl][PATCH] libcgi-perl: upgrade 4.44 -> 4.46
Date: Thu, 2 Apr 2020 18:47:40 +0800
Message-ID: <1585824460-15814-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 898B250A9974.A611A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../libcgi/{libcgi-perl_4.44.bb => libcgi-perl_4.46.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcgi/{libcgi-perl_4.44.bb => libcgi-perl_4.46.bb} (90%)

diff --git a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.44.bb b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.46.bb
similarity index 90%
rename from meta-perl/recipes-perl/libcgi/libcgi-perl_4.44.bb
rename to meta-perl/recipes-perl/libcgi/libcgi-perl_4.46.bb
index cde187d8b..33ec73770 100644
--- a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.44.bb
+++ b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.46.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=415fc49abed2728f9480cd32c8d67beb"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/L/LE/LEEJO/CGI-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "2cbe560fdadbb8b9237744e39bbfc3eb"
-SRC_URI[sha256sum] = "12435fb7ebd3585c47b6d60ee4f5c7d6a7c114a2827d2b5acf3d62aa9fcf1208"
+SRC_URI[md5sum] = "c2ae443de78a69d85e3931c8c29596d1"
+SRC_URI[sha256sum] = "788998ddc33ca382e5d7ce72c6c0ea1d8366c93067371fe2f14239ddea2e4298"
 
 S = "${WORKDIR}/CGI-${PV}"
 
-- 
2.17.1



