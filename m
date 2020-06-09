Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.3634.1591695697621155045
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2020 02:41:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,491,1583164800"; 
   d="scan'208";a="94160919"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 09 Jun 2020 17:41:35 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id F10884CE26D8
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2020 17:41:34 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 9 Jun 2020 17:41:34 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] mm-common: upgrade 1.0..0 -> 1.0.1
Date: Wed, 10 Jun 2020 05:41:33 +0800
Message-ID: <1591738893-3242-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: F10884CE26D8.A3CEE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../mm-common/{mm-common_1.0.0.bb => mm-common_1.0.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/mm-common/{mm-common_1.0.0.bb => mm-common_1.0.1.bb} (66%)

diff --git a/meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb b/meta-oe/recipes-core/mm-common/mm-common_1.0.1.bb
similarity index 66%
rename from meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb
rename to meta-oe/recipes-core/mm-common/mm-common_1.0.1.bb
index c7d1f2b73..64b58db54 100644
--- a/meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb
+++ b/meta-oe/recipes-core/mm-common/mm-common_1.0.1.bb
@@ -6,8 +6,8 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase
 
-SRC_URI[archive.md5sum] = "9087b8612d75cbc1fad0c99e15c2a718"
-SRC_URI[archive.sha256sum] = "b97d9b041e5952486cab620b44ab09f6013a478f43b6699ae899b8a4da189cd4"
+SRC_URI[archive.md5sum] = "5b5a589f648bd83bfa6291081ebf5864"
+SRC_URI[archive.sha256sum] = "28a2d775afbf05c5c957b24b220ed6e9b2023179b98ecde471d89e9754ea5ac9"
 SRC_URI += "file://0001-meson.build-do-not-ask-for-python-installation-versi.patch"
 
 BBCLASSEXTEND = "native"
-- 
2.17.1



