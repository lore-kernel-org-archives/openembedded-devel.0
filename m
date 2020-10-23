Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.4744.1603432781686654917
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2020 22:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,404,1596470400"; 
   d="scan'208";a="100435482"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 23 Oct 2020 13:59:40 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 0751D486A854
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2020 13:59:37 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 23 Oct 2020 13:59:37 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libp11: upgrade 0.4.10 -> 0.4.11
Date: Fri, 23 Oct 2020 13:59:35 +0800
Message-ID: <1603432775-100371-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 0751D486A854.A124F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../libp11/{libp11_0.4.10.bb => libp11_0.4.11.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libp11/{libp11_0.4.10.bb => libp11_0.4.11.bb} (93%)

diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.10.bb b/meta-oe/recipes-support/libp11/libp11_0.4.11.bb
similarity index 93%
rename from meta-oe/recipes-support/libp11/libp11_0.4.10.bb
rename to meta-oe/recipes-support/libp11/libp11_0.4.11.bb
index 7fe0640d94..1c5cc52bf4 100644
--- a/meta-oe/recipes-support/libp11/libp11_0.4.10.bb
+++ b/meta-oe/recipes-support/libp11/libp11_0.4.11.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
 DEPENDS = "libtool openssl"
 
 SRC_URI = "git://github.com/OpenSC/libp11.git"
-SRCREV = "973d31f3f58d5549ddd8b1f822ce8f72186f9d68"
+SRCREV = "9ca6a71c890b5583c8af3b4900172626bca55e72"
 
 UPSTREAM_CHECK_GITTAGREGEX = "libp11-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.25.1



