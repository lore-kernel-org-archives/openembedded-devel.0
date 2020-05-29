Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.30590.1590740040888007123
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 May 2020 01:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,447,1583164800"; 
   d="scan'208";a="93343292"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 May 2020 16:13:56 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 2DF6A4BCC8AC
	for <openembedded-devel@lists.openembedded.org>; Fri, 29 May 2020 16:13:54 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 29 May 2020 16:13:53 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libnet-dns-perl: upgrade 1.23 -> 1.24
Date: Sat, 30 May 2020 01:13:50 +0800
Message-ID: <1590772430-43159-3-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1590772430-43159-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1590772430-43159-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 2DF6A4BCC8AC.A9FA4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../{libnet-dns-perl_1.23.bb => libnet-dns-perl_1.24.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.23.bb => libnet-dns-perl_1.24.bb} (92%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.23.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.24.bb
similarity index 92%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.23.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.24.bb
index e10daf2efd..8994f692b4 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.23.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.24.bb
@@ -9,8 +9,8 @@ DEPENDS += "perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "105517139b39650f78c21b2e461ac97e"
-SRC_URI[sha256sum] = "cf327f31063b96cd3421be43a1d6cb41eaa61d0595450032e57905b1bd6b2c3e"
+SRC_URI[md5sum] = "1bf07817bb272d412a737ecc2347d70b"
+SRC_URI[sha256sum] = "11a6c2ba6cb1c6640f01c9bbf2036bcbe3974232e9b939ab94985230c92cde63"
 
 UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.17.1



