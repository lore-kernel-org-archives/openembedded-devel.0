Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.8514.1609727091847973333
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Jan 2021 18:24:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,472,1599494400"; 
   d="scan'208";a="103151089"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Jan 2021 10:24:50 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 90C4A4CE601D
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Jan 2021 10:24:47 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 4 Jan 2021 10:24:48 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] asio: upgrade 1.18.0 -> 1.18.1
Date: Mon, 4 Jan 2021 22:24:39 +0800
Message-ID: <1609770279-7893-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 90C4A4CE601D.A3686
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-support/asio/{asio_1.18.0.bb => asio_1.18.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/asio/{asio_1.18.0.bb => asio_1.18.1.bb} (85%)

diff --git a/meta-oe/recipes-support/asio/asio_1.18.0.bb b/meta-oe/recipes-support/asio/asio_1.18.1.bb
similarity index 85%
rename from meta-oe/recipes-support/asio/asio_1.18.0.bb
rename to meta-oe/recipes-support/asio/asio_1.18.1.bb
index 7709075fe..36aff7503 100644
--- a/meta-oe/recipes-support/asio/asio_1.18.0.bb
+++ b/meta-oe/recipes-support/asio/asio_1.18.1.bb
@@ -17,8 +17,8 @@ ALLOW_EMPTY_${PN} = "1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=de86c8210a433f72bd3cc98e797a6084"
 
-SRC_URI[md5sum] = "ed1f2dc4cf24aa2da8361179ade01682"
-SRC_URI[sha256sum] = "9d539e7c09aa6394d512c433c5601c1f26dc4975f022ad7d5e8e57c3b635b370"
+SRC_URI[md5sum] = "00807b2e976f467b3cec85d1589f0825"
+SRC_URI[sha256sum] = "4af9875df5497fdd507231f4b7346e17d96fc06fe10fd30e2b3750715a329113"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2"
 
-- 
2.25.1



