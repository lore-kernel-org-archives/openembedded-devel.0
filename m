Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.8393.1609726803905258125
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Jan 2021 18:20:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,472,1599494400"; 
   d="scan'208";a="103150984"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Jan 2021 10:20:02 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 448344CE546D
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Jan 2021 10:20:01 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 4 Jan 2021 10:20:02 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-perl] [PATCH] libnet-ldap-perl: upgrade 0.66 -> 0.67
Date: Mon, 4 Jan 2021 22:19:59 +0800
Message-ID: <1609769999-7742-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 448344CE546D.A1AD1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{libnet-ldap-perl_0.66.bb => libnet-ldap-perl_0.67.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libnet/{libnet-ldap-perl_0.66.bb => libnet-ldap-perl_0.67.bb} (88%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.66.bb b/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.67.bb
similarity index 88%
rename from meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.66.bb
rename to meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.67.bb
index 26c7c389d..57b5fbf89 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.66.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.67.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://README;beginline=3;endline=5;md5=4d6588c2fa0d38ae162f
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/M/MA/MARSCHAP/perl-ldap-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "c4c1ae9299cd488e75c1b82904458bef"
-SRC_URI[sha256sum] = "09263ce6166e80c98d689d41d09995b813389fd069b784601f6dc57f8e2b4102"
+SRC_URI[md5sum] = "a949a2bab07b44cc043b965485fe493a"
+SRC_URI[sha256sum] = "19a2f7f7959fe23d16367475772c325109f8604d2949e34b96dddb2dfa031170"
 
 S = "${WORKDIR}/perl-ldap-${PV}"
 
-- 
2.25.1



