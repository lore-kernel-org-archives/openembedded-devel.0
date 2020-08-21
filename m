Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web12.127423.1597988054250929534
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2020 22:34:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,335,1592841600"; 
   d="scan'208";a="98374600"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Aug 2020 13:34:09 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 181CE48990D8
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2020 13:34:06 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 21 Aug 2020 13:34:06 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] wireshark: upgrade 3.2.5 -> 3.2.6
Date: Sat, 22 Aug 2020 01:33:54 +0800
Message-ID: <1598031241-3582-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1598031241-3582-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1598031241-3582-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 181CE48990D8.A3B63
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../wireshark/{wireshark_3.2.5.bb => wireshark_3.2.6.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.2.5.bb => wireshark_3.2.6.bb} (96%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.5.bb b/meta-networking/recipes-support/wireshark/wireshark_3.2.6.bb
similarity index 96%
rename from meta-networking/recipes-support/wireshark/wireshark_3.2.5.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.2.6.bb
index a6c09d47b..916c5b7a4 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.2.5.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.6.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "bd89052a5766cce08b1090df49628567e48cdd24bbaa47667c851bac6aaac940"
+SRC_URI[sha256sum] = "ebb1eebe39bcecee02195dc328dd25f6862fc9e9dea4c2e29eae50537d5eb4f2"
 
 PE = "1"
 
-- 
2.25.1



