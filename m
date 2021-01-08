Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.2523.1610071672197559272
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jan 2021 18:07:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,330,1602518400"; 
   d="scan'208";a="103293133"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Jan 2021 10:07:41 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id EA1C848990D2
	for <openembedded-devel@lists.openembedded.org>; Fri,  8 Jan 2021 10:07:35 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 8 Jan 2021 10:07:36 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] rdma-core: upgrade 32.0 -> 33.0
Date: Fri, 8 Jan 2021 22:07:34 +0800
Message-ID: <1610114854-4652-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: EA1C848990D2.A1262
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../rdma-core/{rdma-core_32.0.bb => rdma-core_33.0.bb}      | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-support/rdma-core/{rdma-core_32.0.bb => rdma-core_33.0.bb} (85%)

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_32.0.bb b/meta-networking/recipes-support/rdma-core/rdma-core_33.0.bb
similarity index 85%
rename from meta-networking/recipes-support/rdma-core/rdma-core_32.0.bb
rename to meta-networking/recipes-support/rdma-core/rdma-core_33.0.bb
index 7772120ee6..1c1569cfb0 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_32.0.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_33.0.bb
@@ -5,10 +5,8 @@ SECTION = "libs"
 DEPENDS = "libnl"
 RDEPENDS_${PN} = "bash perl"
 
-BRANCH = "stable-v${@d.getVar('PV').split('.')[0]}"
-SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=${BRANCH} \
-           "
-SRCREV = "7a4f9ad9a1d906c5f2bbb18b588309c3d12460ac"
+SRC_URI = "git://github.com/linux-rdma/rdma-core.git"
+SRCREV = "e66ca0832e58dafac7af7ad9e6799eaef438061a"
 S = "${WORKDIR}/git"
 
 #Default Dual License https://github.com/linux-rdma/rdma-core/blob/master/COPYING.md
-- 
2.25.1



