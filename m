Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.6429.1611305340784357696
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jan 2021 00:49:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,366,1602518400"; 
   d="scan'208";a="103733249"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Jan 2021 16:48:54 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 6F41F4CE602D
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Jan 2021 16:48:48 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 22 Jan 2021 16:48:49 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] dialog: upgrade 1.3-20201126 -> 1.3-20210117
Date: Sat, 23 Jan 2021 04:48:47 +0800
Message-ID: <1611348527-4662-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6F41F4CE602D.A1B61
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../dialog/{dialog_1.3-20201126.bb => dialog_1.3-20210117.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/dialog/{dialog_1.3-20201126.bb => dialog_1.3-20210117.bb} (88%)

diff --git a/meta-oe/recipes-extended/dialog/dialog_1.3-20201126.bb b/meta-oe/recipes-extended/dialog/dialog_1.3-20210117.bb
similarity index 88%
rename from meta-oe/recipes-extended/dialog/dialog_1.3-20201126.bb
rename to meta-oe/recipes-extended/dialog/dialog_1.3-20210117.bb
index 5097788ed2..4f49fb9062 100644
--- a/meta-oe/recipes-extended/dialog/dialog_1.3-20201126.bb
+++ b/meta-oe/recipes-extended/dialog/dialog_1.3-20210117.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 SRC_URI = "ftp://ftp.invisible-island.net/${BPN}/${BP}.tgz \
           "
-SRC_URI[md5sum] = "14bf3b33de348838ff30aff0aa9d1c2e"
-SRC_URI[sha256sum] = "c9233a6c8ea33a59e2378e5146ae2bd13b519744cfdb647af7420adac5ad3866"
+SRC_URI[md5sum] = "c27db8bb67f71ee32ab1b54a3b3cebc3"
+SRC_URI[sha256sum] = "3c1ed08f44bcf6f159f2aa6fde765db94e8997b3eefb49d8b4c86691693c43e1"
 
 # hardcoded here for use in dialog-static recipe
 S = "${WORKDIR}/dialog-${PV}"
-- 
2.25.1



