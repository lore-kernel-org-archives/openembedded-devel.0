Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.32330.1599441989717191672
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Sep 2020 18:26:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,400,1592841600"; 
   d="scan'208";a="98949231"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 07 Sep 2020 09:26:28 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 82AAF48990E1
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Sep 2020 09:26:27 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 7 Sep 2020 09:26:25 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] gperftools: upgrade 2.7.90 -> 2.8
Date: Mon, 7 Sep 2020 21:26:17 +0800
Message-ID: <1599485177-64893-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 82AAF48990E1.A40F9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../gperftools/{gperftools_2.7.90.bb => gperftools_2.8.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/gperftools/{gperftools_2.7.90.bb => gperftools_2.8.bb} (97%)

diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.7.90.bb b/meta-oe/recipes-support/gperftools/gperftools_2.8.bb
similarity index 97%
rename from meta-oe/recipes-support/gperftools/gperftools_2.7.90.bb
rename to meta-oe/recipes-support/gperftools/gperftools_2.8.bb
index b7b783931..662777b47 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.7.90.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/gperftools/gperftools"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=762732742c73dc6c7fbe8632f06c059a"
 
-SRCREV = "db7aa547abb5abdd558587a15502584cbc825438"
+SRCREV = "180bfa10d7cb38e8b3784d60943d50e8fcef0dcb"
 SRC_URI = "git://github.com/gperftools/gperftools \
            file://0001-Support-Atomic-ops-on-clang.patch \
            file://0001-fix-build-with-musl-libc.patch \
-- 
2.25.1



