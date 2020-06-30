Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.6108.1593480290036786537
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 18:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,296,1589212800"; 
   d="scan'208";a="95532415"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 30 Jun 2020 09:24:45 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 78AC84CE4B1D
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 09:14:16 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 30 Jun 2020 09:24:43 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] ccid: upgrade 1.4.32 -> 1.4.33
Date: Tue, 30 Jun 2020 09:24:43 +0800
Message-ID: <1593480283-4805-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 78AC84CE4B1D.A61E6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-support/ccid/{ccid_1.4.32.bb => ccid_1.4.33.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/ccid/{ccid_1.4.32.bb => ccid_1.4.33.bb} (78%)

diff --git a/meta-oe/recipes-support/ccid/ccid_1.4.32.bb b/meta-oe/recipes-support/ccid/ccid_1.4.33.bb
similarity index 78%
rename from meta-oe/recipes-support/ccid/ccid_1.4.32.bb
rename to meta-oe/recipes-support/ccid/ccid_1.4.33.bb
index 394d0e887..3c5889425 100644
--- a/meta-oe/recipes-support/ccid/ccid_1.4.32.bb
+++ b/meta-oe/recipes-support/ccid/ccid_1.4.33.bb
@@ -11,8 +11,8 @@ SRC_URI = "https://ccid.apdu.fr/files/ccid-${PV}.tar.bz2 \
     file://0001-Add-build-rule-for-README.patch \
 "
 
-SRC_URI[md5sum] = "c4c70e928455f6ac3c4d02c4d2a654e9"
-SRC_URI[sha256sum] = "545f4ab7887d512aa4b6967b80ef18a77b790c34769718452737a633cefc1639"
+SRC_URI[md5sum] = "b11907894ce2d345439635e2b967e7e5"
+SRC_URI[sha256sum] = "5256da939711deb42b74d05d2bd6bd0c73c4d564feb0c1a50212609eb680e424"
 
 inherit autotools pkgconfig
 
-- 
2.17.1



