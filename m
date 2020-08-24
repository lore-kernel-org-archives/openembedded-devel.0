Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.190980.1598260507822428421
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2020 02:15:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37652 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kA8ZC-0005wO-HM; Mon, 24 Aug 2020 12:15:05 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-diskcache: Upgrade 4.1.0 -> 5.0.1
Date: Mon, 24 Aug 2020 12:14:53 +0300
Message-Id: <20200824091457.3360-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.2
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

Upgrade to release 5.0.1:

- Drop Python 2.7 and 3.4 testing and add 3.8
- Use unittest.mock in tests
- Remove unused "env" setting from pytest section
- Remove nose references
- Add locked method to Lock
- Add paragraph to caveats about cache volume for Issue

License-Update: Update year

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-diskcache_4.1.0.bb => python3-diskcache_5.0.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-diskcache_4.1.0.bb => python3-diskcache_5.0.1.bb} (50%)

diff --git a/meta-python/recipes-devtools/python/python3-diskcache_4.1.0.bb b/meta-python/recipes-devtools/python/python3-diskcache_5.0.1.bb
similarity index 50%
rename from meta-python/recipes-devtools/python/python3-diskcache_4.1.0.bb
rename to meta-python/recipes-devtools/python/python3-diskcache_5.0.1.bb
index 91cff0cd1..9f92fde22 100644
--- a/meta-python/recipes-devtools/python/python3-diskcache_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-diskcache_5.0.1.bb
@@ -1,10 +1,10 @@
 DESCRIPTION = "Disk Cache -- Disk and file backed persistent cache."
 HOMEPAGE = "http://www.grantjenks.com/docs/diskcache/"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9e046ce8fae71087134866418f646ec3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c985b6a9269e57a1073d5f142d68eb68"
 
-SRC_URI[md5sum] = "21c9945e7707799e1c64956f8a54d4c3"
-SRC_URI[sha256sum] = "bcee5a59f9c264e2809e58d01be6569a3bbb1e36a1e0fb83f7ef9b2075f95ce0"
+SRC_URI[md5sum] = "5c8c5789f584a36eacc7240921eee35c"
+SRC_URI[sha256sum] = "b24a2da03d6a45edcec14ea6ef7129ddf0de78f04497557308d1461753d90633"
 
 PYPI_PACKAGE = "diskcache"
 
-- 
2.17.1

