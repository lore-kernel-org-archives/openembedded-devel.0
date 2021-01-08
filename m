Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.2522.1610072059010558830
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jan 2021 18:14:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,330,1602518400"; 
   d="scan'208";a="103293370"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Jan 2021 10:14:18 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id B725648990D2
	for <openembedded-devel@lists.openembedded.org>; Fri,  8 Jan 2021 10:14:14 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 8 Jan 2021 10:14:14 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] smartmontools: upgrade 7.1 -> 7.2
Date: Fri, 8 Jan 2021 22:14:13 +0800
Message-ID: <1610115253-5085-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: B725648990D2.AE6EC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{smartmontools_7.1.bb => smartmontools_7.2.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/smartmontools/{smartmontools_7.1.bb => smartmontools_7.2.bb} (93%)

diff --git a/meta-oe/recipes-extended/smartmontools/smartmontools_7.1.bb b/meta-oe/recipes-extended/smartmontools/smartmontools_7.2.bb
similarity index 93%
rename from meta-oe/recipes-extended/smartmontools/smartmontools_7.1.bb
rename to meta-oe/recipes-extended/smartmontools/smartmontools_7.2.bb
index b401272d24..3c01e589ca 100644
--- a/meta-oe/recipes-extended/smartmontools/smartmontools_7.1.bb
+++ b/meta-oe/recipes-extended/smartmontools/smartmontools_7.2.bb
@@ -22,8 +22,8 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'libcap-ng selinux', d)
 PACKAGECONFIG[libcap-ng] = "--with-libcap-ng=yes,--with-libcap-ng=no,libcap-ng"
 PACKAGECONFIG[selinux] = "--with-selinux=yes,--with-selinux=no,libselinux"
 
-SRC_URI[md5sum] = "430cd5f64caa4524018b536e5ecd9c29"
-SRC_URI[sha256sum] = "3f734d2c99deb1e4af62b25d944c6252de70ca64d766c4c7294545a2e659b846"
+SRC_URI[md5sum] = "e8d134c69ae4959a05cb56b31172ffb1"
+SRC_URI[sha256sum] = "5cd98a27e6393168bc6aaea070d9e1cd551b0f898c52f66b2ff2e5d274118cd6"
 
 inherit autotools update-rc.d systemd
 
-- 
2.25.1



