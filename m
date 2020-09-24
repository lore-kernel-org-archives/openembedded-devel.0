Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.16698.1600953694101963670
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2020 06:21:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58940 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kLRBj-0007nc-B3; Thu, 24 Sep 2020 16:21:32 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-xlsxwriter: Upgrade 1.3.5 -> 1.3.6
Date: Thu, 24 Sep 2020 16:21:19 +0300
Message-Id: <20200924132122.30697-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.3.6:

- Added the worksheet :func:`unprotect_range()` method to allow
  ranges within a protected worksheet to be unprotected.
- There are now over 1500 test cases in the test suite, including
  900 tests that compare the output from XlsxWriter, byte for
  byte, against test files created in Excel. This is to ensure the
  maximum possible compatibility with Excel.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-xlsxwriter_1.3.5.bb => python3-xlsxwriter_1.3.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_1.3.5.bb => python3-xlsxwriter_1.3.6.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.5.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.6.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.5.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.6.bb
index b4b0e2eb2e..f3314037f2 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.5.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.6.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "XlsxWriter"
 
-SRC_URI[md5sum] = "0b65976905bf3841bc6cae3f8c47295b"
-SRC_URI[sha256sum] = "de54547f3aa1a611453e32a8ae46380edb5556e823c6803f8673b4b770e50b3b"
+SRC_URI[md5sum] = "378642a3754fb233e418e3869cf051bb"
+SRC_URI[sha256sum] = "b89002dea57bb3d4c8207f3e28ef8244bfd9e936b85d74e7dd1f97e11bb70313"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

