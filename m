Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.1676.1595577472319949353
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jul 2020 00:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,389,1589212800"; 
   d="scan'208";a="96848094"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 24 Jul 2020 15:57:53 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id BAF284CE5059
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2020 15:57:47 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 24 Jul 2020 15:57:49 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] c-ares: upgrade 1.16.0 -> 1.16.1
Date: Fri, 24 Jul 2020 15:57:36 +0800
Message-ID: <1595577459-84025-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1595577459-84025-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1595577459-84025-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: BAF284CE5059.A443E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../c-ares/{c-ares_1.16.0.bb => c-ares_1.16.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.16.0.bb => c-ares_1.16.1.bb} (92%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.16.0.bb b/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
similarity index 92%
rename from meta-oe/recipes-support/c-ares/c-ares_1.16.0.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
index e235b9b954..67dd701807 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.16.0.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
@@ -12,7 +12,7 @@ SRC_URI = "\
     file://cmake-install-libcares.pc.patch \
     file://0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch \
 "
-SRCREV = "077a587dccbe2f0d8a1987fbd3525333705c2249"
+SRCREV = "74a1426ba60e2cd7977e53a22ef839c87415066e"
 
 UPSTREAM_CHECK_GITTAGREGEX = "cares-(?P<pver>\d+_(\d_?)+)"
 
-- 
2.25.1



