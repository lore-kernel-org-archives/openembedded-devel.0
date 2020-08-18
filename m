Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.68141.1597764901332997793
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2020 08:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45392 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k83db-0004rN-Qo; Tue, 18 Aug 2020 18:35:00 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/6] python3-djangorestframework: Upgrade 3.9.0 -> 3.11.1
Date: Tue, 18 Aug 2020 18:34:44 +0300
Message-Id: <20200818153444.15728-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200818153444.15728-1-leon.anavi@konsulko.com>
References: <20200818153444.15728-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.11.1:

- OpenAPI schema generation improvements
- Validator / Default context improvements
- Supported Python versions are now: 3.5, 3.6, 3.7, and 3.8
- Supported Django versions are now: 1.11, 2.0, 2.1, 2.2, and 3.0

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...amework_3.9.0.bb => python3-djangorestframework_3.11.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-djangorestframework_3.9.0.bb => python3-djangorestframework_3.11.1.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb b/meta-python/recipes-devtools/python/python3-djangorestframework_3.11.1.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb
rename to meta-python/recipes-devtools/python/python3-djangorestframework_3.11.1.bb
index 438a5e19a..81f55ff9e 100644
--- a/meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-djangorestframework_3.11.1.bb
@@ -5,8 +5,8 @@ HOMEPAGE = "https://pypi.python.org/pypi/djangorestframework"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1"
 
-SRC_URI[md5sum] = "0d481bf8dbb87bb927b46798edc1a9bd"
-SRC_URI[sha256sum] = "607865b0bb1598b153793892101d881466bd5a991de12bd6229abb18b1c86136"
+SRC_URI[md5sum] = "c8ea3e4c3c0d705acf70184faeb2b696"
+SRC_URI[sha256sum] = "6dd02d5a4bd2516fb93f80360673bf540c3b6641fec8766b1da2870a5aa00b32"
 PYPI_PACKAGE = "djangorestframework"
 
 inherit pypi setuptools3
-- 
2.17.1

