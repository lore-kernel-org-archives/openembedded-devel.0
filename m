Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.3715.1599787589342030969
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2020 18:26:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,413,1592841600"; 
   d="scan'208";a="99114491"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Sep 2020 09:26:28 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 1AE7848990D3
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2020 09:26:23 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 11 Sep 2020 09:26:22 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] ostree: upgrade 2020.5 -> 2020.6
Date: Fri, 11 Sep 2020 21:26:23 +0800
Message-ID: <1599830783-15309-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 1AE7848990D3.A489B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../ostree/{ostree_2020.5.bb => ostree_2020.6.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2020.5.bb => ostree_2020.6.bb} (99%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2020.5.bb b/meta-oe/recipes-extended/ostree/ostree_2020.6.bb
similarity index 99%
rename from meta-oe/recipes-extended/ostree/ostree_2020.5.bb
rename to meta-oe/recipes-extended/ostree/ostree_2020.6.bb
index 7527298c2..1e22d3abe 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2020.5.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2020.6.bb
@@ -25,7 +25,7 @@ SRC_URI = " \
     gitsm://github.com/ostreedev/ostree \
     file://run-ptest \
 "
-SRCREV = "63797cb750b4b2a05c5143613d89de9df99df9df"
+SRCREV = "5d2183f63ef5ecf0e6e555c3214dd3fc17a8e5a1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+)"
 
-- 
2.25.1



