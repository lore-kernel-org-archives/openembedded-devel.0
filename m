Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.8264.1607047274014461068
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Dec 2020 18:01:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,390,1599494400"; 
   d="scan'208";a="102046034"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Dec 2020 10:01:11 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id DB88D4CE6011
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Dec 2020 10:01:10 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 4 Dec 2020 10:01:10 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] dialog: upgrade 1.3-20200327 -> 1.3-20201126
Date: Fri, 4 Dec 2020 10:01:08 +0800
Message-ID: <1607047268-62331-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: DB88D4CE6011.A2854
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../dialog/{dialog_1.3-20200327.bb => dialog_1.3-20201126.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/dialog/{dialog_1.3-20200327.bb => dialog_1.3-20201126.bb} (88%)

diff --git a/meta-oe/recipes-extended/dialog/dialog_1.3-20200327.bb b/meta-oe/recipes-extended/dialog/dialog_1.3-20201126.bb
similarity index 88%
rename from meta-oe/recipes-extended/dialog/dialog_1.3-20200327.bb
rename to meta-oe/recipes-extended/dialog/dialog_1.3-20201126.bb
index 4c3177c05..5097788ed 100644
--- a/meta-oe/recipes-extended/dialog/dialog_1.3-20200327.bb
+++ b/meta-oe/recipes-extended/dialog/dialog_1.3-20201126.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 SRC_URI = "ftp://ftp.invisible-island.net/${BPN}/${BP}.tgz \
           "
-SRC_URI[md5sum] = "f7a3c240af305b5282af590541e8f4b7"
-SRC_URI[sha256sum] = "466163e8b97c2b7709d00389199add3156bd813f60ccb0335d0a30f2d4a17f99"
+SRC_URI[md5sum] = "14bf3b33de348838ff30aff0aa9d1c2e"
+SRC_URI[sha256sum] = "c9233a6c8ea33a59e2378e5146ae2bd13b519744cfdb647af7420adac5ad3866"
 
 # hardcoded here for use in dialog-static recipe
 S = "${WORKDIR}/dialog-${PV}"
-- 
2.25.1



