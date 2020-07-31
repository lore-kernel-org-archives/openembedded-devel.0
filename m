Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.14547.1596184972859131028
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2020 01:42:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,417,1589212800"; 
   d="scan'208";a="97210928"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 31 Jul 2020 16:42:47 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id BF0974CE5059
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2020 16:42:41 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 31 Jul 2020 16:42:43 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libmicrohttpd: upgrade 0.9.70 -> 0.9.71
Date: Sat, 1 Aug 2020 04:42:40 +0800
Message-ID: <1596228160-6530-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1596228160-6530-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1596228160-6530-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: BF0974CE5059.A3C92
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{libmicrohttpd_0.9.70.bb => libmicrohttpd_0.9.71.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.70.bb => libmicrohttpd_0.9.71.bb} (86%)

diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.70.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.71.bb
similarity index 86%
rename from meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.70.bb
rename to meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.71.bb
index 94976d2e98..2bd8148e3f 100644
--- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.70.bb
+++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.71.bb
@@ -8,8 +8,8 @@ DEPENDS = "file"
 
 SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz \
 "
-SRC_URI[md5sum] = "dcd6045ecb4ea18c120afedccbd1da74"
-SRC_URI[sha256sum] = "90d0a3d396f96f9bc41eb0f7e8187796049285fabef82604acd4879590977307"
+SRC_URI[md5sum] = "c7e230e9b899282b43d9a9faa41e893d"
+SRC_URI[sha256sum] = "e8f445e85faf727b89e9f9590daea4473ae00ead38b237cf1eda55172b89b182"
 
 inherit autotools lib_package pkgconfig gettext
 
-- 
2.25.1



