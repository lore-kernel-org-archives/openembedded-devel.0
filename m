Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web09.4206.1615262181612518271
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 19:56:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1293uF0B007676
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 8 Mar 2021 19:56:20 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 8 Mar 2021 19:56:14 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 8 Mar 2021 19:56:14 -0800
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-pillow: 8.1.0 -> 8.1.2
Date: Tue, 9 Mar 2021 11:56:11 +0800
Message-ID: <20210309035611.23351-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

8.1.2 fixes:
* CVE-2021-27921
* CVE-2021-27922
* CVE-2021-27923

8.1.1 fixes:
* CVE-2021-25289
* CVE-2021-25290
* CVE-2021-25291
* CVE-2021-25292
* CVE-2021-25293

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../python/{python3-pillow_8.1.0.bb => python3-pillow_8.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_8.1.0.bb => python3-pillow_8.1.2.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_8.1.0.bb b/meta-python/recipes-devtools/python/python3-pillow_8.1.2.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-pillow_8.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pillow_8.1.2.bb
index 63974590c..a1b4f9059 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_8.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_8.1.2.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=8.1.x \
            file://0001-support-cross-compiling.patch \
            file://0001-explicitly-set-compile-options.patch \
 "
-SRCREV ?= "fcc42e0d344146ee9d265d1f43c094ce5a0ec4cf"
+SRCREV ?= "88bd672dafad68b419ea29bef941dfa17f941038"
 
 inherit setuptools3
 
-- 
2.17.1

