Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.30554.1590739816903024628
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 May 2020 01:10:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,447,1583164800"; 
   d="scan'208";a="93343087"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 29 May 2020 16:10:05 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 878FC4BCC8B6
	for <openembedded-devel@lists.openembedded.org>; Fri, 29 May 2020 16:10:05 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 29 May 2020 16:10:06 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] wireshark: upgrade 3.2.2 -> 3.2.4
Date: Sat, 30 May 2020 01:10:01 +0800
Message-ID: <1590772202-42997-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1590772202-42997-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1590772202-42997-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 878FC4BCC8B6.A4D57
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../wireshark/{wireshark_3.2.2.bb => wireshark_3.2.4.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.2.2.bb => wireshark_3.2.4.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.2.bb b/meta-networking/recipes-support/wireshark/wireshark_3.2.4.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_3.2.2.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.2.4.bb
index db545028f2..c3caaefde9 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.2.2.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.4.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[md5sum] = "e468b78e1176e0212b13ef809f59dcbb"
-SRC_URI[sha256sum] = "5f5923ef4c3fee370ed0ca1bb324f37c246015eba4a7e74ab95d9208feeded79"
+SRC_URI[md5sum] = "4bbee1bdd5b88343733590fabfffddf3"
+SRC_URI[sha256sum] = "d17d461e849e2d0b033431c45f71d8ee8ec3c8faa232a6ad63069a47927db8aa"
 
 PE = "1"
 
-- 
2.17.1



