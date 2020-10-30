Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.9386.1604037549024880154
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2020 22:59:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,432,1596470400"; 
   d="scan'208";a="100750129"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 30 Oct 2020 13:58:55 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 7FAD548990D2
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2020 13:58:50 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 30 Oct 2020 13:58:50 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH 2/2] nftables: upgrade 0.9.6 -> 0.9.7
Date: Fri, 30 Oct 2020 13:58:49 +0800
Message-ID: <1604037529-71916-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 7FAD548990D2.A02B4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../nftables/{nftables_0.9.6.bb => nftables_0.9.7.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/nftables/{nftables_0.9.6.bb => nftables_0.9.7.bb} (93%)

diff --git a/meta-networking/recipes-filter/nftables/nftables_0.9.6.bb b/meta-networking/recipes-filter/nftables/nftables_0.9.7.bb
similarity index 93%
rename from meta-networking/recipes-filter/nftables/nftables_0.9.6.bb
rename to meta-networking/recipes-filter/nftables/nftables_0.9.7.bb
index 41f7f4c91..e5dfef92b 100644
--- a/meta-networking/recipes-filter/nftables/nftables_0.9.6.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_0.9.7.bb
@@ -10,7 +10,7 @@ DEPENDS = "libmnl libnftnl bison-native \
 UPSTREAM_CHECK_REGEX = "nftables-(?P<pver>\d+(\.\d+){2,}).tar.bz2"
 
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "68d6fdfe8ab02303e6b1f13968a4022da5b0120110eaee3233d806857937b66e"
+SRC_URI[sha256sum] = "fe6b8a8c326a2c09c02ca162b840d7d4aadb043ce7a367c166d6455b0e112cb0"
 
 inherit autotools manpages pkgconfig
 
-- 
2.25.1



