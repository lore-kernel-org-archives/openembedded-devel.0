Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.53875.1612280318718661795
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Feb 2021 07:38:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,395,1602518400"; 
   d="scan'208";a="104108332"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 02 Feb 2021 23:38:29 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 947994CE6D6E
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Feb 2021 23:38:25 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 2 Feb 2021 23:38:25 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] [oe] [meta-python] [PATCH] python3-pytz: upgrade 2020.1 -> 2021.1
Date: Wed, 3 Feb 2021 11:38:24 +0800
Message-ID: <1612323504-5557-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 947994CE6D6E.A0F92
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python3-pytz_2020.1.bb => python3-pytz_2021.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytz_2020.1.bb => python3-pytz_2021.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pytz_2020.1.bb b/meta-python/recipes-devtools/python/python3-pytz_2021.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pytz_2020.1.bb
rename to meta-python/recipes-devtools/python/python3-pytz_2021.1.bb
index 198626311..cc4dfecfa 100644
--- a/meta-python/recipes-devtools/python/python3-pytz_2020.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytz_2021.1.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1a67fc46c1b596cce5d21209bbe75999"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI[md5sum] = "0349106ac02f2bfe565dd6d5594e3a15"
-SRC_URI[sha256sum] = "c35965d010ce31b23eeb663ed3cc8c906275d6be1a34393a1d73a41febf4a048"
+SRC_URI[md5sum] = "8c849bdf95414fe708a84473e42d4406"
+SRC_URI[sha256sum] = "83a4a90894bf38e243cf052c8b58f381bfe9a7a483f6a9cab140bc7f702ac4da"
 
 RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-datetime \
-- 
2.25.1



