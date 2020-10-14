Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.2900.1602644108359073193
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 19:55:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,373,1596470400"; 
   d="scan'208";a="100137632"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 14 Oct 2020 10:55:07 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 51C7A48990F8
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2020 10:55:07 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 14 Oct 2020 10:55:06 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] wireshark: upgrade 3.2.6 -> 3.2.7
Date: Wed, 14 Oct 2020 10:55:05 +0800
Message-ID: <1602644105-119696-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 51C7A48990F8.A11C9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../wireshark/{wireshark_3.2.6.bb => wireshark_3.2.7.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.2.6.bb => wireshark_3.2.7.bb} (96%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.6.bb b/meta-networking/recipes-support/wireshark/wireshark_3.2.7.bb
similarity index 96%
rename from meta-networking/recipes-support/wireshark/wireshark_3.2.6.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.2.7.bb
index 916c5b7a4b..65f925ce1f 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.2.6.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.7.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "ebb1eebe39bcecee02195dc328dd25f6862fc9e9dea4c2e29eae50537d5eb4f2"
+SRC_URI[sha256sum] = "be832fb86d9c455c5be8b225a755cdc77cb0e92356bdfc1fe4b000d93f7d70da"
 
 PE = "1"
 
-- 
2.25.1



