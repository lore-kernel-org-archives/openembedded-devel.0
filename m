Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.8118.1602668136441429045
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2020 02:35:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,374,1596470400"; 
   d="scan'208";a="100151278"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 14 Oct 2020 17:35:35 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 15D2A48990FC
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2020 17:35:35 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 14 Oct 2020 17:35:31 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] mm-common: upgrade 1.0.1 -> 1.0.2
Date: Wed, 14 Oct 2020 17:35:30 +0800
Message-ID: <1602668130-125385-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 15D2A48990FC.A2564
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../mm-common/{mm-common_1.0.1.bb => mm-common_1.0.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/mm-common/{mm-common_1.0.1.bb => mm-common_1.0.2.bb} (66%)

diff --git a/meta-oe/recipes-core/mm-common/mm-common_1.0.1.bb b/meta-oe/recipes-core/mm-common/mm-common_1.0.2.bb
similarity index 66%
rename from meta-oe/recipes-core/mm-common/mm-common_1.0.1.bb
rename to meta-oe/recipes-core/mm-common/mm-common_1.0.2.bb
index 64b58db548..207d9394e9 100644
--- a/meta-oe/recipes-core/mm-common/mm-common_1.0.1.bb
+++ b/meta-oe/recipes-core/mm-common/mm-common_1.0.2.bb
@@ -6,8 +6,8 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase
 
-SRC_URI[archive.md5sum] = "5b5a589f648bd83bfa6291081ebf5864"
-SRC_URI[archive.sha256sum] = "28a2d775afbf05c5c957b24b220ed6e9b2023179b98ecde471d89e9754ea5ac9"
+SRC_URI[archive.md5sum] = "440133a2676275ae26770b3651f89827"
+SRC_URI[archive.sha256sum] = "a2a99f3fa943cf662f189163ed39a2cfc19a428d906dd4f92b387d3659d1641d"
 SRC_URI += "file://0001-meson.build-do-not-ask-for-python-installation-versi.patch"
 
 BBCLASSEXTEND = "native"
-- 
2.25.1



