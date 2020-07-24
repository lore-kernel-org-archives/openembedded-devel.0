Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.1676.1595577472319949353
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jul 2020 00:57:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,389,1589212800"; 
   d="scan'208";a="96848091"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 24 Jul 2020 15:57:47 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 7C2CD4CE5059
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2020 15:57:46 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 24 Jul 2020 15:57:48 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] fping: upgrade 4.2 -> 4.3
Date: Fri, 24 Jul 2020 15:57:34 +0800
Message-ID: <1595577459-84025-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 7C2CD4CE5059.A47A2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-support/fping/{fping_4.2.bb => fping_4.3.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/fping/{fping_4.2.bb => fping_4.3.bb} (86%)

diff --git a/meta-networking/recipes-support/fping/fping_4.2.bb b/meta-networking/recipes-support/fping/fping_4.3.bb
similarity index 86%
rename from meta-networking/recipes-support/fping/fping_4.2.bb
rename to meta-networking/recipes-support/fping/fping_4.3.bb
index 594f5b9cff..e1daa4d5dc 100644
--- a/meta-networking/recipes-support/fping/fping_4.2.bb
+++ b/meta-networking/recipes-support/fping/fping_4.3.bb
@@ -12,8 +12,8 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c6170fbadddfcd74f011515291d96901"
 
 SRC_URI = "http://www.fping.org/dist/fping-${PV}.tar.gz"
-SRC_URI[md5sum] = "218e71764177a8ce25564a7810f8e729"
-SRC_URI[sha256sum] = "7d339674b6a95aae1d8ad487ff5056fd95b474c3650938268f6a905c3771b64a"
+SRC_URI[md5sum] = "9bb202552930edbe6a7147709104daf1"
+SRC_URI[sha256sum] = "92040ae842f7b8942d5cf26d8f58702a8d84c40a1fd492b415bd01b622bf372d"
 
 S = "${WORKDIR}/fping-${PV}"
 
-- 
2.25.1



