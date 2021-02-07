Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.15010.1612661323631364606
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 17:28:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,158,1610380800"; 
   d="scan'208";a="104284741"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 07 Feb 2021 09:28:42 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 188464CE6033
	for <openembedded-devel@lists.openembedded.org>; Sun,  7 Feb 2021 09:28:39 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sun, 7 Feb 2021 09:28:40 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] libtalloc: upgrade 2.3.1 -> 2.3.2
Date: Sun, 7 Feb 2021 21:28:38 +0800
Message-ID: <1612704518-4811-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 188464CE6033.A00C9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../libtalloc/{libtalloc_2.3.1.bb => libtalloc_2.3.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libtalloc/{libtalloc_2.3.1.bb => libtalloc_2.3.2.bb} (93%)

diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.3.1.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.3.2.bb
similarity index 93%
rename from meta-networking/recipes-support/libtalloc/libtalloc_2.3.1.bb
rename to meta-networking/recipes-support/libtalloc/libtalloc_2.3.2.bb
index 07d54b71f..ae92de2db 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.3.1.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.3.2.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://talloc.h;beginline=3;endline=27;md5=a301712782cad6dd6
 SRC_URI = "https://www.samba.org/ftp/talloc/talloc-${PV}.tar.gz \
            file://options-2.2.0.patch \
 "
-SRC_URI[md5sum] = "ce40593428c0de6b85946189dcc37b5e"
-SRC_URI[sha256sum] = "ef4822d2fdafd2be8e0cabc3ec3c806ae29b8268e932c5e9a4cd5585f37f9f77"
+SRC_URI[md5sum] = "3376a86bdf9dd4abc6b8d8d645390902"
+SRC_URI[sha256sum] = "27a03ef99e384d779124df755deb229cd1761f945eca6d200e8cfd9bf5297bd7"
 
 inherit waf-samba
 
-- 
2.25.1



