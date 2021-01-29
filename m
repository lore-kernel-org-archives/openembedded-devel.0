Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.6779.1611909545906880644
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jan 2021 00:39:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,384,1602518400"; 
   d="scan'208";a="103978984"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 Jan 2021 16:39:03 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 121564CE6792
	for <openembedded-devel@lists.openembedded.org>; Fri, 29 Jan 2021 16:39:00 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 29 Jan 2021 16:39:00 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libio-pty-perl: upgrade 1.15 -> 1.16
Date: Sat, 30 Jan 2021 04:38:58 +0800
Message-ID: <1611952738-4055-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 121564CE6792.AFEC1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../perl/{libio-pty-perl_1.15.bb => libio-pty-perl_1.16.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/perl/{libio-pty-perl_1.15.bb => libio-pty-perl_1.16.bb} (73%)

diff --git a/meta-oe/recipes-devtools/perl/libio-pty-perl_1.15.bb b/meta-oe/recipes-devtools/perl/libio-pty-perl_1.16.bb
similarity index 73%
rename from meta-oe/recipes-devtools/perl/libio-pty-perl_1.15.bb
rename to meta-oe/recipes-devtools/perl/libio-pty-perl_1.16.bb
index 7b1a8a639..b6bc80784 100644
--- a/meta-oe/recipes-devtools/perl/libio-pty-perl_1.15.bb
+++ b/meta-oe/recipes-devtools/perl/libio-pty-perl_1.16.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=12;md5=b2562f94907eeb42
 
 SRC_URI = "http://www.cpan.org/modules/by-module/IO/IO-Tty-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "060103c6d6e4d9833fa7715860f2923b"
-SRC_URI[sha256sum] = "43f9cc0f87620bbb159e0890e196b23a8e6419cbd04224c10f3dcee948f6b51a"
+SRC_URI[md5sum] = "5ee30bf7c76f00cc69f92388ad776e2a"
+SRC_URI[sha256sum] = "8f1a09c070738adc695df903f2e7f74308dd8d991b914c0bc390a0e6021294dd"
 
 S = "${WORKDIR}/IO-Tty-${PV}"
 
-- 
2.25.1



