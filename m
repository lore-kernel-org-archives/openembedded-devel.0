Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.14546.1596184971389887728
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2020 01:42:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,417,1589212800"; 
   d="scan'208";a="97210926"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 31 Jul 2020 16:42:47 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id DC9D64CE1505
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2020 16:42:40 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 31 Jul 2020 16:42:42 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] dash: upgrade 0.5.11 -> 0.5.11.1
Date: Sat, 1 Aug 2020 04:42:38 +0800
Message-ID: <1596228160-6530-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: DC9D64CE1505.A3BA4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-shells/dash/{dash_0.5.11.bb => dash_0.5.11.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-shells/dash/{dash_0.5.11.bb => dash_0.5.11.1.bb} (85%)

diff --git a/meta-oe/recipes-shells/dash/dash_0.5.11.bb b/meta-oe/recipes-shells/dash/dash_0.5.11.1.bb
similarity index 85%
rename from meta-oe/recipes-shells/dash/dash_0.5.11.bb
rename to meta-oe/recipes-shells/dash/dash_0.5.11.1.bb
index b3a36651fc..c6914007db 100644
--- a/meta-oe/recipes-shells/dash/dash_0.5.11.bb
+++ b/meta-oe/recipes-shells/dash/dash_0.5.11.1.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b5262b4a1a1bff72b48e935531976d2e"
 inherit autotools update-alternatives
 
 SRC_URI = "http://gondor.apana.org.au/~herbert/${BPN}/files/${BP}.tar.gz"
-SRC_URI[md5sum] = "027236e48b9202607b1418fee42c473e"
-SRC_URI[sha256sum] = "4dd9a6ed5fe7546095157918fe5d784bb0b7887ae13de50e1e2d11e1b5a391cb"
+SRC_URI[md5sum] = "df978fd0324f60a6ff45f686fe269fdc"
+SRC_URI[sha256sum] = "73c881f146e329ac54962766760fd62cb8bdff376cd6c2f5772eecc1570e1611"
 
 EXTRA_OECONF += "--bindir=${base_bindir}"
 
-- 
2.25.1



