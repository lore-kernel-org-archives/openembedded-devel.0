Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.7517.1611313058534889598
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jan 2021 02:57:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,366,1602518400"; 
   d="scan'208";a="103737246"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Jan 2021 18:57:37 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id E56404CE603C
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Jan 2021 18:57:36 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 22 Jan 2021 18:57:36 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] zeromq: upgrade 4.3.3 -> 4.3.4
Date: Fri, 22 Jan 2021 18:57:29 +0800
Message-ID: <1611313049-27695-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: E56404CE603C.A4168
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../zeromq/{zeromq_4.3.3.bb => zeromq_4.3.4.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/zeromq/{zeromq_4.3.3.bb => zeromq_4.3.4.bb} (87%)

diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.3.bb b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.4.bb
similarity index 87%
rename from meta-oe/recipes-connectivity/zeromq/zeromq_4.3.3.bb
rename to meta-oe/recipes-connectivity/zeromq/zeromq_4.3.4.bb
index a10500475c..4381f2d6d6 100644
--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.3.bb
+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.4.bb
@@ -10,8 +10,8 @@ SRC_URI = "http://github.com/zeromq/libzmq/releases/download/v${PV}/zeromq-${PV}
     file://0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch \
     file://run-ptest \
 "
-SRC_URI[md5sum] = "78acc277d95e10812d71b2b3c3c3c9a9"
-SRC_URI[sha256sum] = "9d9285db37ae942ed0780c016da87060497877af45094ff9e1a1ca736e3875a2"
+SRC_URI[md5sum] = "c897d4005a3f0b8276b00b7921412379"
+SRC_URI[sha256sum] = "c593001a89f5a85dd2ddf564805deb860e02471171b3f204944857336295c3e5"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/libzmq/releases"
 
-- 
2.25.1



