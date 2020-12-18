Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.6563.1608276780017775132
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Dec 2020 23:33:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; 
   d="scan'208";a="102707336"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 Dec 2020 15:32:57 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 6BE404CE600B
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Dec 2020 15:32:52 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 18 Dec 2020 15:32:52 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] ocl-icd: upgrade 2.2.13 -> 2.2.14
Date: Sat, 19 Dec 2020 03:32:50 +0800
Message-ID: <1608319970-5117-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6BE404CE600B.A266F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-core/opencl/ocl-icd_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/opencl/ocl-icd_git.bb b/meta-oe/recipes-core/opencl/ocl-icd_git.bb
index 36355dd92..2e43939b9 100644
--- a/meta-oe/recipes-core/opencl/ocl-icd_git.bb
+++ b/meta-oe/recipes-core/opencl/ocl-icd_git.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1238d5bccbb6bda30654e48dcc0a554b"
 
 SRC_URI = "git://github.com/OCL-dev/ocl-icd.git;protocol=https"
 
-PV = "2.2.13+git${SRCPV}"
-SRCREV = "3b7ded60ebb7e1afddcbae6f82ac8645b276e358"
+PV = "2.2.14+git${SRCPV}"
+SRCREV = "109694ef2686fe25538c05f3c856912f8ef571a9"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1



