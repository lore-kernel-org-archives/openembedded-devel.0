Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.9460.1604037049242676564
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2020 22:50:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,432,1596470400"; 
   d="scan'208";a="100749855"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 30 Oct 2020 13:50:48 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id B900E4CE3119
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2020 13:50:43 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 30 Oct 2020 13:50:44 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] ostree: upgrade 2020.6 -> 2020.7
Date: Fri, 30 Oct 2020 13:50:36 +0800
Message-ID: <1604037036-71547-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: B900E4CE3119.AFF4C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../ostree/{ostree_2020.6.bb => ostree_2020.7.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2020.6.bb => ostree_2020.7.bb} (99%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2020.6.bb b/meta-oe/recipes-extended/ostree/ostree_2020.7.bb
similarity index 99%
rename from meta-oe/recipes-extended/ostree/ostree_2020.6.bb
rename to meta-oe/recipes-extended/ostree/ostree_2020.7.bb
index 1e22d3abe..def122b02 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2020.6.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2020.7.bb
@@ -25,7 +25,7 @@ SRC_URI = " \
     gitsm://github.com/ostreedev/ostree \
     file://run-ptest \
 "
-SRCREV = "5d2183f63ef5ecf0e6e555c3214dd3fc17a8e5a1"
+SRCREV = "32a3a1297312e566df3141c6c7e3b99709e474b1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+)"
 
-- 
2.25.1



