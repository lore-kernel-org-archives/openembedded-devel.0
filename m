Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.2861.1612492325143753879
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 18:32:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,154,1610380800"; 
   d="scan'208";a="104222283"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 05 Feb 2021 10:32:04 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 3AC0C4CE6033
	for <openembedded-devel@lists.openembedded.org>; Fri,  5 Feb 2021 10:32:02 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 5 Feb 2021 10:32:02 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] gd: upgrade 2.3.0 -> 2.3.1
Date: Fri, 5 Feb 2021 10:32:01 +0800
Message-ID: <1612492321-18377-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 3AC0C4CE6033.A58CC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

- Fix potential integer overflow detected by oss-fuzz
- Fix #615 using libraqm
- Fix #303: gdlib.pc: use Requires instead of Libs (#537)
- Fixed #472: Adjusting CMakeLists.txt (#582)
- Fix #615: gdImageStringFT() fails for empty strings as of libgd 2.3.0 (#633)
- Fix typo but preserve BC
- Compute average in gdGuessBackgroundColorFromCorners properly (#483)
- CMakeLists.txt: zlib is enabled implicitly
- src/config.h.cmake: replace #cmakedefine01 with #define in macro ENABLE_GD_FOORMATS (#622)
- gdlib.pc: use prefixes for pkgconfig file
- cmake: remove required host includes (#617)
- Move initial declaration out of `for` loop
- distribute getlib script
- Make gd_nnquant.c less likely to introduce duplicate definitions (#601)
- webp: support pkg-config file
- gd_io: replace internal Putchar with gdPutC
- gd_io: trim unused Putword function

- Add REQUIRED to FIND_PACKAGE(ZLIB)
- README: add some libraries info (#631)
- VMS/README.VMS: Add dropping support information (#614)

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/gd/{gd_2.3.0.bb => gd_2.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/gd/{gd_2.3.0.bb => gd_2.3.1.bb} (96%)

diff --git a/meta-oe/recipes-support/gd/gd_2.3.0.bb b/meta-oe/recipes-support/gd/gd_2.3.1.bb
similarity index 96%
rename from meta-oe/recipes-support/gd/gd_2.3.0.bb
rename to meta-oe/recipes-support/gd/gd_2.3.1.bb
index 554e07fd3..60abe73a1 100644
--- a/meta-oe/recipes-support/gd/gd_2.3.0.bb
+++ b/meta-oe/recipes-support/gd/gd_2.3.1.bb
@@ -16,7 +16,7 @@ DEPENDS = "freetype libpng jpeg zlib tiff"
 SRC_URI = "git://github.com/libgd/libgd.git;branch=master \
           "
 
-SRCREV = "b079fa06223c3ab862c8f0eea58a968727971988"
+SRCREV = "75ef79c9b013fb5eafd92710b3867827682fd52d"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1



