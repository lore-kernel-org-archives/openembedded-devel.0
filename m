Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.9318.1604037031266556598
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2020 22:50:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,432,1596470400"; 
   d="scan'208";a="100749846"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 30 Oct 2020 13:50:30 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 9BEDB4CE34DB
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2020 13:50:28 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 30 Oct 2020 13:50:28 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] nvme-cli: upgrade 1.12 -> 1.13
Date: Fri, 30 Oct 2020 13:50:26 +0800
Message-ID: <1604037026-71475-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 9BEDB4CE34DB.A5BAE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-bsp/nvme-cli/{nvme-cli_1.12.bb => nvme-cli_1.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-bsp/nvme-cli/{nvme-cli_1.12.bb => nvme-cli_1.13.bb} (95%)

diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.12.bb b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.13.bb
similarity index 95%
rename from meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.12.bb
rename to meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.13.bb
index a18b71a7c..2f5e25c29 100644
--- a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.12.bb
+++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.13.bb
@@ -8,7 +8,7 @@ DEPENDS = "util-linux"
 PV .= "+git${SRCPV}"
 
 SRC_URI = "git://github.com/linux-nvme/nvme-cli.git"
-SRCREV = "949d0aea730136d04af1fb9e0efd4427c20dee6d"
+SRCREV = "f0e9569df9289d6ee55ba2c23615cc7c73a9b088"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1



