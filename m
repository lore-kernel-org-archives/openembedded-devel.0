Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.6168.1593480539989844452
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 18:29:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,296,1589212800"; 
   d="scan'208";a="95532720"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 30 Jun 2020 09:28:54 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id AA3464CE4B14
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 09:18:22 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 30 Jun 2020 09:28:49 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-perl] [PATCH] libnet-dns-perl: upgrade 1.24 -> 1.25
Date: Tue, 30 Jun 2020 09:28:47 +0800
Message-ID: <1593480527-5252-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: AA3464CE4B14.A4167
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{libnet-dns-perl_1.24.bb => libnet-dns-perl_1.25.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.24.bb => libnet-dns-perl_1.25.bb} (92%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.24.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.25.bb
similarity index 92%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.24.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.25.bb
index 8994f692b..bda6ec1eb 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.24.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.25.bb
@@ -9,8 +9,8 @@ DEPENDS += "perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "1bf07817bb272d412a737ecc2347d70b"
-SRC_URI[sha256sum] = "11a6c2ba6cb1c6640f01c9bbf2036bcbe3974232e9b939ab94985230c92cde63"
+SRC_URI[md5sum] = "5c0d1a6de317993e146ce6d37c897be5"
+SRC_URI[sha256sum] = "10931927d32d771817f9cd7d5502794f245a86cb403310db33656e493f67ff25"
 
 UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.17.1



