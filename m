Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.42207.1609134885962350865
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Dec 2020 21:54:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,454,1599494400"; 
   d="scan'208";a="102979352"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Dec 2020 13:54:43 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id B152B4CE601C
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Dec 2020 13:54:39 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 28 Dec 2020 13:54:40 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] opensaf: upgrade 5.20.08 -> 5.20.11
Date: Mon, 28 Dec 2020 13:54:31 +0800
Message-ID: <1609134871-89936-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: B152B4CE601C.A6AF6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../opensaf/{opensaf_5.20.08.bb => opensaf_5.20.11.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/opensaf/{opensaf_5.20.08.bb => opensaf_5.20.11.bb} (96%)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.20.08.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.20.11.bb
similarity index 96%
rename from meta-networking/recipes-daemons/opensaf/opensaf_5.20.08.bb
rename to meta-networking/recipes-daemons/opensaf/opensaf_5.20.11.bb
index 5516fc43a..ade2816f5 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.20.08.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.20.11.bb
@@ -29,8 +29,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://0001-Fix-build-with-fno-common.patch \
            file://0001-Use-correct-printf-format-for-__fsblkcnt_t.patch \
            "
-SRC_URI[md5sum] = "02cfe732d194339237da6adce8e54384"
-SRC_URI[sha256sum] = "84268b90dc48a6675e5a77e2b20390a04bb59deb48a829102a9dbc4b9ac27483"
+SRC_URI[md5sum] = "9c7871a2b45f262b7aee2e9d073798e4"
+SRC_URI[sha256sum] = "11b62e6d20c449a297da0c0c15b560747c9ec884305beffed4ca4c192fa9f22c"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/opensaf/files/releases"
 
-- 
2.25.1



