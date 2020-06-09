Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.5921.1591667898494939220
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2020 18:58:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,490,1583164800"; 
   d="scan'208";a="94130312"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 09 Jun 2020 09:58:11 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id DB9334CE280B
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2020 09:58:06 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 9 Jun 2020 09:58:05 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-perl] [PATCH] libcgi-perl: upgrade 4.47 -> 4.48
Date: Tue, 9 Jun 2020 21:58:04 +0800
Message-ID: <1591711084-3206-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: DB9334CE280B.A4B95
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../libcgi/{libcgi-perl_4.47.bb => libcgi-perl_4.48.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcgi/{libcgi-perl_4.47.bb => libcgi-perl_4.48.bb} (90%)

diff --git a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.47.bb b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.48.bb
similarity index 90%
rename from meta-perl/recipes-perl/libcgi/libcgi-perl_4.47.bb
rename to meta-perl/recipes-perl/libcgi/libcgi-perl_4.48.bb
index a1842f37c..1ae470ee6 100644
--- a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.47.bb
+++ b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.48.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=415fc49abed2728f9480cd32c8d67beb"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/L/LE/LEEJO/CGI-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "2743bc4161dd2de9c71318e26cbeea06"
-SRC_URI[sha256sum] = "d9fbef33c503b250af25e792b95ef19ff40ea40da226f0d666b1548d21f52ca9"
+SRC_URI[md5sum] = "0e81952bb42e00361abc4d33696b08f5"
+SRC_URI[sha256sum] = "102cd7562983b85e8354ebcbb3be94a35f7f6706b2b49fdb790135da4d1d55d2"
 
 S = "${WORKDIR}/CGI-${PV}"
 
-- 
2.17.1



