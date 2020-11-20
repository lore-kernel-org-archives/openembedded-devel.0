Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.20384.1605843016951344729
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2020 19:30:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,354,1599494400"; 
   d="scan'208";a="101571054"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Nov 2020 11:30:16 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 7A76E4CE545A
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2020 11:30:15 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 20 Nov 2020 11:30:15 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] rdma-core: upgrade 31.1 -> 32.0
Date: Fri, 20 Nov 2020 21:11:20 +0800
Message-ID: <1605877880-35024-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 7A76E4CE545A.A1725
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../rdma-core/{rdma-core_31.1.bb => rdma-core_32.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/rdma-core/{rdma-core_31.1.bb => rdma-core_32.0.bb} (95%)

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_31.1.bb b/meta-networking/recipes-support/rdma-core/rdma-core_32.0.bb
similarity index 95%
rename from meta-networking/recipes-support/rdma-core/rdma-core_31.1.bb
rename to meta-networking/recipes-support/rdma-core/rdma-core_32.0.bb
index dc07c267c..7772120ee 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_31.1.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_32.0.bb
@@ -8,7 +8,7 @@ RDEPENDS_${PN} = "bash perl"
 BRANCH = "stable-v${@d.getVar('PV').split('.')[0]}"
 SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=${BRANCH} \
            "
-SRCREV = "a4013e3d94cb5819f0e4cd93b298f775d5542a66"
+SRCREV = "7a4f9ad9a1d906c5f2bbb18b588309c3d12460ac"
 S = "${WORKDIR}/git"
 
 #Default Dual License https://github.com/linux-rdma/rdma-core/blob/master/COPYING.md
-- 
2.25.1



