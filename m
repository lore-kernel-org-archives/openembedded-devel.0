Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.7172.1602746936236132741
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2020 00:28:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,378,1596470400"; 
   d="scan'208";a="100184737"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Oct 2020 15:28:54 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id CC82648990D3
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2020 15:28:53 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 15 Oct 2020 15:28:53 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-perl] [PATCH] libcgi-perl: upgrade 4.50 -> 4.51
Date: Thu, 15 Oct 2020 15:28:52 +0800
Message-ID: <1602746932-13633-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: CC82648990D3.A23A1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../libcgi/{libcgi-perl_4.50.bb => libcgi-perl_4.51.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcgi/{libcgi-perl_4.50.bb => libcgi-perl_4.51.bb} (90%)

diff --git a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.50.bb b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.51.bb
similarity index 90%
rename from meta-perl/recipes-perl/libcgi/libcgi-perl_4.50.bb
rename to meta-perl/recipes-perl/libcgi/libcgi-perl_4.51.bb
index 61ed78b6fe..e3a83679ed 100644
--- a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.50.bb
+++ b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.51.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=415fc49abed2728f9480cd32c8d67beb"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/L/LE/LEEJO/CGI-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "6c7c9d0c272849f3c3c1859cb78962fe"
-SRC_URI[sha256sum] = "d8c7a2143352842a9b4962c314ee7e0385273c8b9d8314dcbd04a09c008eef46"
+SRC_URI[md5sum] = "87b6cf5bc68739c9310ca501adad998e"
+SRC_URI[sha256sum] = "0bd215e7012f9f52e6a7d3fe695ee30ef959d796e8e53472fa0ed8c53fba600a"
 
 S = "${WORKDIR}/CGI-${PV}"
 
-- 
2.25.1



