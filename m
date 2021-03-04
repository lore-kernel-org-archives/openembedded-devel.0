Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.3862.1614846561788487412
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Mar 2021 00:29:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,222,1610380800"; 
   d="scan'208";a="105152025"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Mar 2021 16:29:20 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id D39754CE9E5E
	for <openembedded-devel@lists.openembedded.org>; Thu,  4 Mar 2021 16:29:19 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 4 Mar 2021 16:29:14 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] opensaf: upgrade 5.20.11 -> 5.21.03
Date: Thu, 4 Mar 2021 16:29:12 +0800
Message-ID: <1614846552-104687-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: D39754CE9E5E.A4FAD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../opensaf/{opensaf_5.20.11.bb => opensaf_5.21.03.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/opensaf/{opensaf_5.20.11.bb => opensaf_5.21.03.bb} (96%)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.20.11.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.21.03.bb
similarity index 96%
rename from meta-networking/recipes-daemons/opensaf/opensaf_5.20.11.bb
rename to meta-networking/recipes-daemons/opensaf/opensaf_5.21.03.bb
index ade2816f58..118c5fea30 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.20.11.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.21.03.bb
@@ -29,8 +29,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://0001-Fix-build-with-fno-common.patch \
            file://0001-Use-correct-printf-format-for-__fsblkcnt_t.patch \
            "
-SRC_URI[md5sum] = "9c7871a2b45f262b7aee2e9d073798e4"
-SRC_URI[sha256sum] = "11b62e6d20c449a297da0c0c15b560747c9ec884305beffed4ca4c192fa9f22c"
+SRC_URI[md5sum] = "0433650ba9c25f2cf36145e11bf96a2a"
+SRC_URI[sha256sum] = "ed40386852e34bbec0ca7e9534ce315b93a17b587614c8118aea1ecd082e1723"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/opensaf/files/releases"
 
-- 
2.25.1



