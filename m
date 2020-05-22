Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.6265.1590114349268674841
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 May 2020 19:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,419,1583164800"; 
   d="scan'208";a="92764537"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 May 2020 10:25:48 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 749FF4BCC8A5
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2020 10:25:46 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 22 May 2020 10:25:44 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libqmi: upgrade 1.24.8 -> 1.24.12
Date: Fri, 22 May 2020 19:25:29 +0800
Message-ID: <1590146729-3779-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 749FF4BCC8A5.A7FA7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Add md5 check.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../libqmi/{libqmi_1.24.8.bb => libqmi_1.24.12.bb}             | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.24.8.bb => libqmi_1.24.12.bb} (85%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.8.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.12.bb
similarity index 85%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.24.8.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.24.12.bb
index 124b0f1b00..6f8638544e 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.8.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.24.12.bb
@@ -14,7 +14,8 @@ inherit autotools pkgconfig bash-completion
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
            "
 
-SRC_URI[sha256sum] = "c793db2c91d7928160341b357b26315d9c879ecb36699cb7a6b36054cba60893"
+SRC_URI[md5sum] = "7e6e49fddb9ae2b6fcde14619d6cfe49"
+SRC_URI[sha256sum] = "2d3b91a2b8a882b17b16403c9ef7bdce522db4f0ceaa3e4dff76033885428b69"
 
 PACKAGECONFIG ??= "udev mbim"
 PACKAGECONFIG[udev] = ",--without-udev,libgudev"
-- 
2.17.1



