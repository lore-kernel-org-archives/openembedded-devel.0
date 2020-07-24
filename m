Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.1742.1595577474301727452
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jul 2020 00:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,389,1589212800"; 
   d="scan'208";a="96848097"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 24 Jul 2020 15:57:53 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 6312A4CE506E
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2020 15:57:48 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 24 Jul 2020 15:57:50 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] iozone3: upgrade 489 -> 490
Date: Fri, 24 Jul 2020 15:57:37 +0800
Message-ID: <1595577459-84025-4-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1595577459-84025-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1595577459-84025-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6312A4CE506E.A2DE6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../iozone3/{iozone3_489.bb => iozone3_490.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-benchmark/iozone3/{iozone3_489.bb => iozone3_490.bb} (97%)

diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3_489.bb b/meta-oe/recipes-benchmark/iozone3/iozone3_490.bb
similarity index 97%
rename from meta-oe/recipes-benchmark/iozone3/iozone3_489.bb
rename to meta-oe/recipes-benchmark/iozone3/iozone3_490.bb
index e4b7e4f490..ecf08cb33c 100644
--- a/meta-oe/recipes-benchmark/iozone3/iozone3_489.bb
+++ b/meta-oe/recipes-benchmark/iozone3/iozone3_490.bb
@@ -11,8 +11,8 @@ SRC_URI = "http://www.iozone.org/src/current/${BPN}_${PV}.tar \
     file://0001-let-system-headers-provide-pread64.patch \
     file://copyright.txt \
 "
-SRC_URI[md5sum] = "e863281987689cd6d9729e535637b77d"
-SRC_URI[sha256sum] = "6155850d1019f2450dc926bbdb5a24abf423ee3bb928ab1e68569cf60a908584"
+SRC_URI[md5sum] = "95cb73dfdd58a0dfa42804f016dbb83c"
+SRC_URI[sha256sum] = "5eadb4235ae2a956911204c50ebf2d8d8d59ddcd4a2841a1baf42f3145ad4fed"
 
 UPSTREAM_CHECK_REGEX = "iozone3_(?P<pver>\d+).tar"
 
-- 
2.25.1



