Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.3636.1599787315985888043
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2020 18:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,413,1592841600"; 
   d="scan'208";a="99114347"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 11 Sep 2020 09:21:55 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 2CEF448990E5
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2020 09:21:49 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 11 Sep 2020 09:21:49 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] asio: upgrade 1.16.1 -> 1.18.0
Date: Fri, 11 Sep 2020 21:21:49 +0800
Message-ID: <1599830509-14828-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 2CEF448990E5.A4D4F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../recipes-support/asio/{asio_1.16.1.bb => asio_1.18.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/asio/{asio_1.16.1.bb => asio_1.18.0.bb} (85%)

diff --git a/meta-oe/recipes-support/asio/asio_1.16.1.bb b/meta-oe/recipes-support/asio/asio_1.18.0.bb
similarity index 85%
rename from meta-oe/recipes-support/asio/asio_1.16.1.bb
rename to meta-oe/recipes-support/asio/asio_1.18.0.bb
index 0f79c0787..7709075fe 100644
--- a/meta-oe/recipes-support/asio/asio_1.16.1.bb
+++ b/meta-oe/recipes-support/asio/asio_1.18.0.bb
@@ -17,8 +17,8 @@ ALLOW_EMPTY_${PN} = "1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=de86c8210a433f72bd3cc98e797a6084"
 
-SRC_URI[md5sum] = "569f4b082c652ae8a8ad94fb470016f9"
-SRC_URI[sha256sum] = "e271db76dbbcda9835ed1c9c94deb2ba3f4589c3ebcaa71d99ac694b8d62638c"
+SRC_URI[md5sum] = "ed1f2dc4cf24aa2da8361179ade01682"
+SRC_URI[sha256sum] = "9d539e7c09aa6394d512c433c5601c1f26dc4975f022ad7d5e8e57c3b635b370"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2"
 
-- 
2.25.1



