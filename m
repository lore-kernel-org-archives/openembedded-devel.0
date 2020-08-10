Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.46461.1597070610889013393
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2020 07:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59248 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k591L-0008Tw-5B; Mon, 10 Aug 2020 17:43:27 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/7] python3-parso: Upgrade 0.7.1 -> 0.8.0
Date: Mon, 10 Aug 2020 17:43:12 +0300
Message-Id: <20200810144318.17106-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.8.0:

- Dropped Support for Python 2.7, 3.4, 3.5
- It's possible to use ``pathlib.Path`` objects now in the API
- The stubs are gone, we are now using annotations
- ``namedexpr_test`` nodes are now a proper class called
  ``NamedExpr``
- A lot of smaller refactorings

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-parso_0.7.1.bb => python3-parso_0.8.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-parso_0.7.1.bb => python3-parso_0.8.0.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-parso_0.7.1.bb b/meta-python/recipes-devtools/python/python3-parso_0.8.0.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-parso_0.7.1.bb
rename to meta-python/recipes-devtools/python/python3-parso_0.8.0.bb
index 6d775227c..507087909 100644
--- a/meta-python/recipes-devtools/python/python3-parso_0.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-parso_0.8.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cbaa2675b2424d771451332a7a69503f"
 
 PYPI_PACKAGE = "parso"
 
-SRC_URI[md5sum] = "eac40cda515ee71e3bb008c404ca3ac1"
-SRC_URI[sha256sum] = "caba44724b994a8a5e086460bb212abc5a8bc46951bf4a9a1210745953622eb9"
+SRC_URI[md5sum] = "ee3592994bfc0d0843790544c1b2b702"
+SRC_URI[sha256sum] = "2b6db14759c528d857eeb9eac559c2166b2554548af39f5198bdfb976f72aa64"
 
 inherit setuptools3 pypi
-- 
2.17.1

