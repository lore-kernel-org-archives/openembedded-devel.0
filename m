Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.6809.1611235039460174213
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jan 2021 05:17:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46072 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l2Zps-0002jH-9h; Thu, 21 Jan 2021 15:17:17 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-coverage: Upgrade 5.3 -> 5.3.1
Date: Thu, 21 Jan 2021 15:17:05 +0200
Message-Id: <20210121131709.27097-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.3.1:

- When using --source on a large source tree, v5.x was slower than
  previous versions. This performance regression is now fixed.
- Mysterious SQLite errors can happen on PyPy. An immediate retry
  seems to fix the problem, although it is an unsatisfying
  solution.
- The HTML report now saves the sort order in a more widely
  supported way.
- The HTML report pages now have a Sleepy Snake favicon.
- Wheels are now provided for manylinux2010, and for PyPy3.
- Continuous integration has moved from Travis and AppVeyor to
  GitHub Actions.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-coverage_5.3.bb => python3-coverage_5.3.1.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_5.3.bb => python3-coverage_5.3.1.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_5.3.bb b/meta-python/recipes-devtools/python/python3-coverage_5.3.1.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-coverage_5.3.bb
rename to meta-python/recipes-devtools/python/python3-coverage_5.3.1.bb
index 2354c5e73..14d29a247 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_5.3.1.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[md5sum] = "c2faf2ccc498ce16fd48cc9201c520d7"
-SRC_URI[sha256sum] = "280baa8ec489c4f542f8940f9c4c2181f0306a8ee1a54eceba071a449fb870a0"
+SRC_URI[sha256sum] = "38f16b1317b8dd82df67ed5daa5f5e7c959e46579840d77a67a4ceb9cef0a50b"
 
 inherit pypi setuptools3
 
-- 
2.17.1

