Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.5920.1593480259964944318
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 18:24:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,296,1589212800"; 
   d="scan'208";a="95532368"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 30 Jun 2020 09:24:14 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 2F70E4CE4B1C
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 09:13:43 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 30 Jun 2020 09:24:10 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] nftables: upgrade 0.9.5 -> 0.9.6
Date: Tue, 30 Jun 2020 09:24:09 +0800
Message-ID: <1593480249-4723-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 2F70E4CE4B1C.A4E36
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../nftables/{nftables_0.9.5.bb => nftables_0.9.6.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/nftables/{nftables_0.9.5.bb => nftables_0.9.6.bb} (93%)

diff --git a/meta-networking/recipes-filter/nftables/nftables_0.9.5.bb b/meta-networking/recipes-filter/nftables/nftables_0.9.6.bb
similarity index 93%
rename from meta-networking/recipes-filter/nftables/nftables_0.9.5.bb
rename to meta-networking/recipes-filter/nftables/nftables_0.9.6.bb
index 0fd187f1b..41f7f4c91 100644
--- a/meta-networking/recipes-filter/nftables/nftables_0.9.5.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_0.9.6.bb
@@ -10,7 +10,7 @@ DEPENDS = "libmnl libnftnl bison-native \
 UPSTREAM_CHECK_REGEX = "nftables-(?P<pver>\d+(\.\d+){2,}).tar.bz2"
 
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "f2c1957eabc370057c4576b8f33a71d91a6ad019b8b335abafe61c9c42cc7e16"
+SRC_URI[sha256sum] = "68d6fdfe8ab02303e6b1f13968a4022da5b0120110eaee3233d806857937b66e"
 
 inherit autotools manpages pkgconfig
 
-- 
2.17.1



