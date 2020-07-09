Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.8501.1594306856983201430
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jul 2020 08:01:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,331,1589212800"; 
   d="scan'208";a="95993666"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 09 Jul 2020 23:00:49 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 7F50846B5FAE
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Jul 2020 23:00:44 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 9 Jul 2020 23:00:45 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-python][PATCH] python3-pytz: upgrade 2019.3 -> 2020.1
Date: Thu, 9 Jul 2020 23:00:37 +0800
Message-ID: <1594306837-45766-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1594306837-45766-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1594306837-45766-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 7F50846B5FAE.A4918
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-License-Update: Copyright year updated to 2019.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{python3-pytz_2019.3.bb => python3-pytz_2020.1.bb}    | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytz_2019.3.bb => python3-pytz_2020.1.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-pytz_2019.3.bb b/meta-python/recipes-devtools/python/python3-pytz_2020.1.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-pytz_2019.3.bb
rename to meta-python/recipes-devtools/python/python3-pytz_2020.1.bb
index c28a0148bc..1986263117 100644
--- a/meta-python/recipes-devtools/python/python3-pytz_2019.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pytz_2020.1.bb
@@ -1,12 +1,12 @@
 SUMMARY = "World timezone definitions, modern and historical"
 HOMEPAGE = "http://pythonhosted.org/pytz"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4878a915709225bceab739bdc2a18e8d"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1a67fc46c1b596cce5d21209bbe75999"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI[md5sum] = "c3d84a465fc56a4edd52cca8873ac0df"
-SRC_URI[sha256sum] = "b02c06db6cf09c12dd25137e563b31700d3b80fcc4ad23abb7a315f2789819be"
+SRC_URI[md5sum] = "0349106ac02f2bfe565dd6d5594e3a15"
+SRC_URI[sha256sum] = "c35965d010ce31b23eeb663ed3cc8c906275d6be1a34393a1d73a41febf4a048"
 
 RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-datetime \
@@ -31,6 +31,6 @@ do_install_ptest() {
 	install -d ${D}${PTEST_PATH}/pytz
 	install -d ${D}${PTEST_PATH}/pytz/tests
 	cp -rf ${S}/pytz/tests/* ${D}${PTEST_PATH}/pytz/tests/
-	cp -f ${S}/README.txt ${D}${PTEST_PATH}/
+	cp -f ${S}/README.rst ${D}${PTEST_PATH}/
 
 }
-- 
2.17.1



