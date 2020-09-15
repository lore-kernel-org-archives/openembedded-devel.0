Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.9362.1600160595099899175
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 02:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43802 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kI6rk-0007I7-5y; Tue, 15 Sep 2020 12:03:12 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/10] python3-cffi: Upgrade 1.14.2 -> 1.14.3
Date: Tue, 15 Sep 2020 12:02:54 +0300
Message-Id: <20200915090303.14367-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.0
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

Upgrade to release 1.14.3:

- Don't call PyEval_InitThreads() on CPython >= 3.7, where it
  should always be a no-op.  It is explicitly deprecated in 3.9.
- Let the test run directly on pypy too
- Remove extremely old and outdated .gitignore

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cffi_1.14.2.bb => python3-cffi_1.14.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cffi_1.14.2.bb => python3-cffi_1.14.3.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.14.2.bb b/meta-python/recipes-devtools/python/python3-cffi_1.14.3.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cffi_1.14.2.bb
rename to meta-python/recipes-devtools/python/python3-cffi_1.14.3.bb
index 57c28954a..dbdd16f66 100644
--- a/meta-python/recipes-devtools/python/python3-cffi_1.14.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cffi_1.14.3.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
 DEPENDS += "libffi ${PYTHON_PN}-pycparser"
 
-SRC_URI[md5sum] = "3cc2f1daf62dd66eda79b4d6281cebfc"
-SRC_URI[sha256sum] = "ae8f34d50af2c2154035984b8b5fc5d9ed63f32fe615646ab435b05b132ca91b"
+SRC_URI[md5sum] = "c2a47ffd5d183b193ac8ed3414dcfd07"
+SRC_URI[sha256sum] = "f92f789e4f9241cd262ad7a555ca2c648a98178a953af117ef7fad46aa1d5591"
 
 inherit pypi setuptools3
 
-- 
2.17.1

