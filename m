Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.2851.1587723094710657046
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Apr 2020 03:11:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,311,1583164800"; 
   d="scan'208";a="90117577"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 24 Apr 2020 18:11:25 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id D9A964BCC895
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Apr 2020 18:00:45 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 24 Apr 2020 18:11:22 +0800
Received: from localhost.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 24 Apr 2020 18:11:24 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] vboxguestdrivers: upgrade 6.1.4 -> 6.1.6
Date: Fri, 24 Apr 2020 11:11:08 -0700
Message-ID: <20200424181111.21063-1-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: D9A964BCC895.A3D37
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{vboxguestdrivers_6.1.4.bb => vboxguestdrivers_6.1.6.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.4.bb => vboxguestdrivers_6.1.6.bb} (95%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.4.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.6.bb
similarity index 95%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.4.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.6.bb
index 1227e42ea..89b1ee11e 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.4.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.6.bb
@@ -14,8 +14,8 @@ VBOX_NAME = "VirtualBox-${PV}"
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
 "
-SRC_URI[md5sum] = "b3ffc51c1f082743f22bfcb71b75a396"
-SRC_URI[sha256sum] = "59f8f5774473f593e3eb5940e2a337e0674bcd9854164b2578fd43f896260c99"
+SRC_URI[md5sum] = "fe6328d22dfb20ea372daa4b58b12374"
+SRC_URI[sha256sum] = "b031c30d770f28c5f884071ad933e8c1f83e65b93aaba03a4012077c1d90a54f"
 
 S = "${WORKDIR}/vbox_module"
 
-- 
2.17.1



