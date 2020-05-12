Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.714.1589262116693882430
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 May 2020 22:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,382,1583164800"; 
   d="scan'208";a="91937664"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 12 May 2020 13:41:54 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 9DC0E4BCC88A
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2020 13:41:49 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 12 May 2020 13:41:48 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-perl][PATCH] libcgi-perl: upgrade 4.46 -> 4.47
Date: Tue, 12 May 2020 22:42:10 +0800
Message-ID: <1589294530-97187-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 9DC0E4BCC88A.A62E8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../libcgi/{libcgi-perl_4.46.bb => libcgi-perl_4.47.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcgi/{libcgi-perl_4.46.bb => libcgi-perl_4.47.bb} (90%)

diff --git a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.46.bb b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.47.bb
similarity index 90%
rename from meta-perl/recipes-perl/libcgi/libcgi-perl_4.46.bb
rename to meta-perl/recipes-perl/libcgi/libcgi-perl_4.47.bb
index 33ec737708..a1842f37ca 100644
--- a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.46.bb
+++ b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.47.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=415fc49abed2728f9480cd32c8d67beb"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/L/LE/LEEJO/CGI-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "c2ae443de78a69d85e3931c8c29596d1"
-SRC_URI[sha256sum] = "788998ddc33ca382e5d7ce72c6c0ea1d8366c93067371fe2f14239ddea2e4298"
+SRC_URI[md5sum] = "2743bc4161dd2de9c71318e26cbeea06"
+SRC_URI[sha256sum] = "d9fbef33c503b250af25e792b95ef19ff40ea40da226f0d666b1548d21f52ca9"
 
 S = "${WORKDIR}/CGI-${PV}"
 
-- 
2.17.1



