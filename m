Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.130733.1598000867890893393
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2020 02:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,335,1592841600"; 
   d="scan'208";a="98384380"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Aug 2020 17:07:40 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 379F248990D0
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2020 17:07:40 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 21 Aug 2020 17:07:41 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-perl] [PATCH] libnet-dns-perl: upgrade 1.25 -> 1.26
Date: Sat, 22 Aug 2020 05:07:34 +0800
Message-ID: <1598044054-6555-5-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1598044054-6555-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1598044054-6555-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 379F248990D0.A06A3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{libnet-dns-perl_1.25.bb => libnet-dns-perl_1.26.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.25.bb => libnet-dns-perl_1.26.bb} (92%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.25.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.26.bb
similarity index 92%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.25.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.26.bb
index bda6ec1eb..3b960778c 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.25.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.26.bb
@@ -9,8 +9,8 @@ DEPENDS += "perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "5c0d1a6de317993e146ce6d37c897be5"
-SRC_URI[sha256sum] = "10931927d32d771817f9cd7d5502794f245a86cb403310db33656e493f67ff25"
+SRC_URI[md5sum] = "6db2562b6c42619e9c7d7e62422af8c4"
+SRC_URI[sha256sum] = "eabaecd0fdb3e6adef8c9e016e8509319f19caa8c76836253f7db72bafe56498"
 
 UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.25.1



