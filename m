Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.3554.1590102827325960486
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 May 2020 16:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=50054 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jbuNi-0003wj-FS; Fri, 22 May 2020 02:13:43 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-pandas: Upgrade 1.0.1 -> 1.0.3
Date: Fri, 22 May 2020 02:13:23 +0300
Message-Id: <20200521231325.685-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 1.0.3 and consolidate into a single file.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-pandas_1.0.1.bb | 2 --
 .../python/{python-pandas.inc => python3-pandas_1.0.3.bb}   | 6 +++---
 2 files changed, 3 insertions(+), 5 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pandas_1.0.1.bb
 rename meta-python/recipes-devtools/python/{python-pandas.inc => python3-pandas_1.0.3.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.0.1.bb b/meta-python/recipes-devtools/python/python3-pandas_1.0.1.bb
deleted file mode 100644
index b5dd5e092..000000000
--- a/meta-python/recipes-devtools/python/python3-pandas_1.0.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-pandas.inc
diff --git a/meta-python/recipes-devtools/python/python-pandas.inc b/meta-python/recipes-devtools/python/python3-pandas_1.0.3.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python-pandas.inc
rename to meta-python/recipes-devtools/python/python3-pandas_1.0.3.bb
index 9342cedfb..099e035e1 100644
--- a/meta-python/recipes-devtools/python/python-pandas.inc
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.0.3.bb
@@ -6,10 +6,10 @@ HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ee0470f2de336c370a71c2f8d5e81c11"
 
-SRC_URI[md5sum] = "628ffa1dd5768e0be70236596cee8d6b"
-SRC_URI[sha256sum] = "3c07765308f091d81b6735d4f2242bb43c332cc3461cae60543df6b10967fe27"
+SRC_URI[md5sum] = "a3ea90326c5b55944d369bef87740a72"
+SRC_URI[sha256sum] = "32f42e322fb903d0e189a4c10b75ba70d90958cc4f66a1781ed027f1a1d14586"
 
-inherit pypi
+inherit pypi setuptools3
 
 DEPENDS += " \
     ${PYTHON_PN}-numpy-native ${PYTHON_PN}-cython-native \
-- 
2.17.1

