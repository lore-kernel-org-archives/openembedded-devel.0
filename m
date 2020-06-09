Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.5141.1591664866145727817
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2020 18:07:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,490,1583164800"; 
   d="scan'208";a="94126129"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 09 Jun 2020 09:07:41 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 07CBB4CE032B
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2020 09:07:38 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 9 Jun 2020 09:07:37 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] mercurial: upgrade 5.2 -> 5.4
Date: Tue, 9 Jun 2020 09:07:36 +0800
Message-ID: <1591664856-3907-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 07CBB4CE032B.A3328
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../mercurial/{mercurial_5.2.bb => mercurial_5.4.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/mercurial/{mercurial_5.2.bb => mercurial_5.4.bb} (87%)

diff --git a/meta-oe/recipes-devtools/mercurial/mercurial_5.2.bb b/meta-oe/recipes-devtools/mercurial/mercurial_5.4.bb
similarity index 87%
rename from meta-oe/recipes-devtools/mercurial/mercurial_5.2.bb
rename to meta-oe/recipes-devtools/mercurial/mercurial_5.4.bb
index 6dedb02aa..fa3c73451 100644
--- a/meta-oe/recipes-devtools/mercurial/mercurial_5.2.bb
+++ b/meta-oe/recipes-devtools/mercurial/mercurial_5.4.bb
@@ -10,8 +10,8 @@ RDEPENDS_${PN} = "python3 python3-modules"
 inherit python3native
 
 SRC_URI = "https://www.mercurial-scm.org/release/${BP}.tar.gz"
-SRC_URI[md5sum] = "9ba9d59157c002db8d8cab680de08eb5"
-SRC_URI[sha256sum] = "ff030e923f03ee15c91191996fcb099bfcfa60c7df263be227f67b6a65d36194"
+SRC_URI[md5sum] = "0859029d0bb54bcf7c583c55680573cb"
+SRC_URI[sha256sum] = "1df8d1978aefcbb65dc51e3666a452583f47aeaf3c5682e4c00a3b23cd805d6a"
 
 S = "${WORKDIR}/mercurial-${PV}"
 
-- 
2.17.1



