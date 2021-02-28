Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.6941.1614522646093378210
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Feb 2021 06:30:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,213,1610380800"; 
   d="scan'208";a="104951481"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Feb 2021 22:30:45 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 7D8CE4CE77B1
	for <openembedded-devel@lists.openembedded.org>; Sun, 28 Feb 2021 22:30:44 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sun, 28 Feb 2021 22:30:41 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] [oe] [meta-oe] [PATCH] tesseract-lang: upgrade 4.0.0 -> 4.1.0
Date: Sun, 28 Feb 2021 22:30:37 +0800
Message-ID: <1614522637-90476-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 7D8CE4CE77B1.A465C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

From: Wang Mingyu <wangmy@cn.fujitsu.com>

There is no file COPYING in version 4.1.0, so the file LICENSE is used instead.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{tesseract-lang_4.0.0.bb => tesseract-lang_4.1.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/tesseract/{tesseract-lang_4.0.0.bb => tesseract-lang_4.1.0.bb} (84%)

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.0.0.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb
similarity index 84%
rename from meta-oe/recipes-graphics/tesseract/tesseract-lang_4.0.0.bb
rename to meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb
index 75c2bc00e2..fd2973bc2b 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.0.0.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract-lang_4.1.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "tesseract-ocr language files"
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=9648bd7af63bd3cc4f5ac046d12c49e4"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "590567f20dc044f6948a8e2c61afc714c360ad0e"
+SRCREV = "4767ea922bcc460e70b87b1d303ebdfed0897da8"
 SRC_URI = "git://github.com/tesseract-ocr/tessdata.git"
 
 S = "${WORKDIR}/git"
-- 
2.25.1



