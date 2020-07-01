Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.22663.1593613390221434508
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jul 2020 07:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60354 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jqddk-0002cZ-RX; Wed, 01 Jul 2020 17:23:09 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-google-api-python-client: Upgrade 1.7.11 -> 1.9.3
Date: Wed,  1 Jul 2020 17:22:41 +0300
Message-Id: <20200701142243.1686-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200701142243.1686-1-leon.anavi@konsulko.com>
References: <20200701142243.1686-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.9.3:

- update GOOGLE_API_USE_MTLS values
- bump api-core version
- fix python-api-core dependency issue
- add mtls feature
- add templates for python samples projects

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...nt_1.7.11.bb => python3-google-api-python-client_1.9.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_1.7.11.bb => python3-google-api-python-client_1.9.3.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.7.11.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.9.3.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_1.7.11.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_1.9.3.bb
index 25e3b9c3f..af4aa5287 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.7.11.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.9.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
 
-SRC_URI[md5sum] = "6e28e8caf2e4d55ed5b7c48a538a61c9"
-SRC_URI[sha256sum] = "a8a88174f66d92aed7ebbd73744c2c319b4b1ce828e565f9ec721352d2e2fb8c"
+SRC_URI[md5sum] = "eb5fa1e3f83b659ff978df1346a55576"
+SRC_URI[sha256sum] = "220349ce189a85229fc46875d467101318495a4a735c0ff2f165b9bdbc7511a0"
 
 inherit pypi setuptools3
-- 
2.17.1

