Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.8466.1604909365502899688
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2020 00:09:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,463,1596470400"; 
   d="scan'208";a="101085878"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 09 Nov 2020 16:09:05 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 32BB74CE3A51
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Nov 2020 16:09:01 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 9 Nov 2020 16:09:02 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] xmlsec1: upgrade 1.2.30 -> 1.2.31
Date: Mon, 9 Nov 2020 16:09:01 +0800
Message-ID: <1604909341-64970-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 32BB74CE3A51.A1DF8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../xmlsec1/{xmlsec1_1.2.30.bb => xmlsec1_1.2.31.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/xmlsec1/{xmlsec1_1.2.30.bb => xmlsec1_1.2.31.bb} (93%)

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.30.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.31.bb
similarity index 93%
rename from meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.30.bb
rename to meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.31.bb
index 93b0d6a67..803016c96 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.30.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.31.bb
@@ -21,8 +21,8 @@ SRC_URI = "http://www.aleksey.com/xmlsec/download/${BP}.tar.gz \
     file://run-ptest \
     "
 
-SRC_URI[md5sum] = "b66ec21e0a0ac331afb4b1bc5c9ef966"
-SRC_URI[sha256sum] = "2d84360b03042178def1d9ff538acacaed2b3a27411db7b2874f1612ed71abc8"
+SRC_URI[md5sum] = "182f5cbdfb8ddbac535c04470c170dc3"
+SRC_URI[sha256sum] = "9b10bc52cc31e4f76162e3975e50db26b71ab49c571d810b311ca626be5a0b26"
 
 inherit autotools-brokensep ptest pkgconfig
 
-- 
2.25.1



