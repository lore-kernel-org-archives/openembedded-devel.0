Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.3465.1585100599541147565
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2020 18:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,302,1580745600"; 
   d="scan'208";a="87206015"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 25 Mar 2020 09:43:18 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id A4BB949DF12A
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2020 09:33:02 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 25 Mar 2020 09:43:12 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 25 Mar 2020 09:43:22 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-perl][PATCH] libnet-dns-perl: upgrade 1.22 -> 1.23
Date: Tue, 24 Mar 2020 23:47:18 -0700
Message-ID: <1585118838-33916-5-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1585118838-33916-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1585118838-33916-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: A4BB949DF12A.A6800
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{libnet-dns-perl_1.22.bb => libnet-dns-perl_1.23.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.22.bb => libnet-dns-perl_1.23.bb} (92%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.22.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.23.bb
similarity index 92%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.22.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.23.bb
index 621908b3a..e10daf2ef 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.22.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.23.bb
@@ -9,8 +9,8 @@ DEPENDS += "perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "f9b4f0b2613398d27434d94b456583ef"
-SRC_URI[sha256sum] = "03cd6a733e1cab6f817b4c4dcb7b29575002f8c543fb85e94c6290bc224d4c12"
+SRC_URI[md5sum] = "105517139b39650f78c21b2e461ac97e"
+SRC_URI[sha256sum] = "cf327f31063b96cd3421be43a1d6cb41eaa61d0595450032e57905b1bd6b2c3e"
 
 UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.17.1



