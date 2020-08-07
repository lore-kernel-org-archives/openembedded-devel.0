Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.3045.1596768208107280924
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2020 19:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,443,1589212800"; 
   d="scan'208";a="97744119"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 07 Aug 2020 10:43:22 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 034724CE34E8
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Aug 2020 10:43:19 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 7 Aug 2020 10:43:20 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-perl] [PATCH] libcgi-perl: upgrade 4.48 -> 4.50
Date: Fri, 7 Aug 2020 22:43:18 +0800
Message-ID: <1596811399-7392-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1596811399-7392-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1596811399-7392-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 034724CE34E8.A2BC1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../libcgi/{libcgi-perl_4.48.bb => libcgi-perl_4.50.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcgi/{libcgi-perl_4.48.bb => libcgi-perl_4.50.bb} (90%)

diff --git a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.48.bb b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.50.bb
similarity index 90%
rename from meta-perl/recipes-perl/libcgi/libcgi-perl_4.48.bb
rename to meta-perl/recipes-perl/libcgi/libcgi-perl_4.50.bb
index 1ae470ee6c..61ed78b6fe 100644
--- a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.48.bb
+++ b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.50.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=415fc49abed2728f9480cd32c8d67beb"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/L/LE/LEEJO/CGI-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "0e81952bb42e00361abc4d33696b08f5"
-SRC_URI[sha256sum] = "102cd7562983b85e8354ebcbb3be94a35f7f6706b2b49fdb790135da4d1d55d2"
+SRC_URI[md5sum] = "6c7c9d0c272849f3c3c1859cb78962fe"
+SRC_URI[sha256sum] = "d8c7a2143352842a9b4962c314ee7e0385273c8b9d8314dcbd04a09c008eef46"
 
 S = "${WORKDIR}/CGI-${PV}"
 
-- 
2.25.1



