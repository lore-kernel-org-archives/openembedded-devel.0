Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.6190.1590114020242188676
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 May 2020 19:20:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,419,1583164800"; 
   d="scan'208";a="92763932"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 May 2020 10:20:18 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 6178D4BCC89E
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2020 10:20:16 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 22 May 2020 10:20:17 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] fetchmail: upgrade 6.4.3 -> 6.4.4
Date: Fri, 22 May 2020 19:19:59 +0800
Message-ID: <1590146399-3470-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6178D4BCC89E.A363D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../fetchmail/{fetchmail_6.4.3.bb => fetchmail_6.4.4.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/fetchmail/{fetchmail_6.4.3.bb => fetchmail_6.4.4.bb} (86%)

diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.3.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.4.bb
similarity index 86%
rename from meta-networking/recipes-support/fetchmail/fetchmail_6.4.3.bb
rename to meta-networking/recipes-support/fetchmail/fetchmail_6.4.4.bb
index 5e2d1be1e4..efab0c808d 100644
--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.3.bb
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.4.bb
@@ -9,8 +9,8 @@ DEPENDS = "openssl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[md5sum] = "614d5a05ac9a042bfc9317e5499bafd4"
-SRC_URI[sha256sum] = "b0360e14b9aa5d065eef8ff99ad0347ef6cbbfc934c8114908295a402a09d3e4"
+SRC_URI[md5sum] = "53d52179c8bf8e2f57489538b49bfda9"
+SRC_URI[sha256sum] = "511b60daabf7543a01de06af07c8772290c6807cd53c42a8504960e978f3abea"
 
 inherit autotools gettext python3-dir python3native
 
-- 
2.17.1



