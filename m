Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.14891.1605232967747414139
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2020 18:02:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,473,1596470400"; 
   d="scan'208";a="101312161"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 13 Nov 2020 10:02:45 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id B8CE648990D3
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2020 10:02:44 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 13 Nov 2020 10:02:44 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libio-pty-perl: upgrade 1.14 -> 1.15
Date: Fri, 13 Nov 2020 22:02:42 +0800
Message-ID: <1605276162-25612-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: B8CE648990D3.A3071
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../perl/{libio-pty-perl_1.14.bb => libio-pty-perl_1.15.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/perl/{libio-pty-perl_1.14.bb => libio-pty-perl_1.15.bb} (73%)

diff --git a/meta-oe/recipes-devtools/perl/libio-pty-perl_1.14.bb b/meta-oe/recipes-devtools/perl/libio-pty-perl_1.15.bb
similarity index 73%
rename from meta-oe/recipes-devtools/perl/libio-pty-perl_1.14.bb
rename to meta-oe/recipes-devtools/perl/libio-pty-perl_1.15.bb
index 1ab21d1dc..7b1a8a639 100644
--- a/meta-oe/recipes-devtools/perl/libio-pty-perl_1.14.bb
+++ b/meta-oe/recipes-devtools/perl/libio-pty-perl_1.15.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=12;md5=b2562f94907eeb42
 
 SRC_URI = "http://www.cpan.org/modules/by-module/IO/IO-Tty-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "70bcec4b1b19838ed209fb96a13f3e89"
-SRC_URI[sha256sum] = "51f3e4e311128bdb2c6a15f02c51376cb852ccf9df9bebe8dfbb5f9561eb95b5"
+SRC_URI[md5sum] = "060103c6d6e4d9833fa7715860f2923b"
+SRC_URI[sha256sum] = "43f9cc0f87620bbb159e0890e196b23a8e6419cbd04224c10f3dcee948f6b51a"
 
 S = "${WORKDIR}/IO-Tty-${PV}"
 
-- 
2.25.1



