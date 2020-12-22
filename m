Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.7898.1608613381898171895
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Dec 2020 21:03:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,438,1599494400"; 
   d="scan'208";a="102806899"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 22 Dec 2020 13:02:49 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id DD7F44CE5CF8
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Dec 2020 13:02:45 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 22 Dec 2020 13:02:44 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-bandit: upgrade 1.6.2 -> 1.7.0
Date: Tue, 22 Dec 2020 13:02:44 +0800
Message-ID: <1608613364-66959-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: DD7F44CE5CF8.A6370
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

CHANGES
=======

1.7.0
-----

* Create CODEOWNERS (#661)
* Remove blacklist call to input() (#662)
* Give some tips on how to resolve B101 in the doc (#616)
* Remove universal support on the wheel (#655)
* Update pythonpackage.yml


Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{python3-bandit_1.6.2.bb => python3-bandit_1.7.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bandit_1.6.2.bb => python3-bandit_1.7.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-bandit_1.6.2.bb b/meta-python/recipes-devtools/python/python3-bandit_1.7.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-bandit_1.6.2.bb
rename to meta-python/recipes-devtools/python/python3-bandit_1.7.0.bb
index fa28861e9..2ef956e07 100644
--- a/meta-python/recipes-devtools/python/python3-bandit_1.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bandit_1.7.0.bb
@@ -2,8 +2,8 @@ SUMMARY = "Security oriented static analyser for python code."
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-SRC_URI[md5sum] = "c6a6772d7afa0af8828b3384e73b7085"
-SRC_URI[sha256sum] = "41e75315853507aa145d62a78a2a6c5e3240fe14ee7c601459d0df9418196065"
+SRC_URI[md5sum] = "24965f102dc62129d3fafe4fe596a3b8"
+SRC_URI[sha256sum] = "8a4c7415254d75df8ff3c3b15cfe9042ecee628a1e40b44c15a98890fbfc2608"
 
 DEPENDS = "python3-pbr-native python3-git python3-pbr python3-pyyaml python3-six python3-stevedore"
 
-- 
2.25.1



