Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.41713.1585532783481096808
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2020 18:46:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,322,1580745600"; 
   d="scan'208";a="87782962"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 30 Mar 2020 09:46:22 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 1352350A9992
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2020 09:36:03 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 30 Mar 2020 09:46:20 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Mon, 30 Mar 2020 09:46:23 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libbytesize: upgrade 2.1 -> 2.2
Date: Mon, 30 Mar 2020 02:26:57 -0700
Message-ID: <1585560419-98714-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1585560419-98714-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1585560419-98714-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 1352350A9992.A3B86
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../libbytesize/{libbytesize_2.1.bb => libbytesize_2.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libbytesize/{libbytesize_2.1.bb => libbytesize_2.2.bb} (93%)

diff --git a/meta-oe/recipes-support/libbytesize/libbytesize_2.1.bb b/meta-oe/recipes-support/libbytesize/libbytesize_2.2.bb
similarity index 93%
rename from meta-oe/recipes-support/libbytesize/libbytesize_2.1.bb
rename to meta-oe/recipes-support/libbytesize/libbytesize_2.2.bb
index 1a5c1848b..a954499c6 100644
--- a/meta-oe/recipes-support/libbytesize/libbytesize_2.1.bb
+++ b/meta-oe/recipes-support/libbytesize/libbytesize_2.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c07cb499d259452f324bb90c3067d85c"
 S = "${WORKDIR}/git"
 B = "${S}"
 
-SRCREV = "9ecc1042109528051983261ffd491d45e7c471e1"
+SRCREV = "e64e752a28a4a41b0a43cba3bedf9571c22af807"
 SRC_URI = "git://github.com/rhinstaller/libbytesize;branch=master"
 
 inherit gettext autotools python3native
-- 
2.17.1



