Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.13020.1591188806356751223
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jun 2020 05:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,467,1583164800"; 
   d="scan'208";a="93762369"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 03 Jun 2020 20:53:22 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id EF73A4BCC8AC
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Jun 2020 20:53:21 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 3 Jun 2020 20:53:21 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-networking][PATCH] opensaf: upgrade 5.19.10 -> 5.20.05
Date: Wed, 3 Jun 2020 20:53:10 +0800
Message-ID: <1591188793-15698-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: EF73A4BCC8AC.A7400
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../opensaf/{opensaf_5.19.10.bb => opensaf_5.20.05.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/opensaf/{opensaf_5.19.10.bb => opensaf_5.20.05.bb} (95%)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.19.10.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.20.05.bb
similarity index 95%
rename from meta-networking/recipes-daemons/opensaf/opensaf_5.19.10.bb
rename to meta-networking/recipes-daemons/opensaf/opensaf_5.20.05.bb
index 3ab4757c3..f11df49f8 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.19.10.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.20.05.bb
@@ -28,8 +28,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://0001-create_empty_library-Use-CC-variable-intead-of-hardc.patch \
            file://0001-immom_python-convert-to-python3.patch \
            "
-SRC_URI[md5sum] = "9b61df01d1a092101c4a626692edae19"
-SRC_URI[sha256sum] = "6da9af96e8ee58d11031d305bf4804a00deb6108e12e422722882a2091bd34bd"
+SRC_URI[md5sum] = "d56bacf4c234c134e60e9b25f6f26671"
+SRC_URI[sha256sum] = "2478e298c0bce3b2cfdeb20875022cc11d7d3b53ecd3255422d22eb64c04953b"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/opensaf/files/releases"
 
-- 
2.17.1



