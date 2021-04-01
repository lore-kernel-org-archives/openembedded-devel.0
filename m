Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.7876.1617284408695003083
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Apr 2021 06:40:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=33924 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lRxYM-0006Ea-De; Thu, 01 Apr 2021 16:40:07 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-google-api-python-client: Upgrade 2.0.2 -> 2.1.0
Date: Thu,  1 Apr 2021 16:39:57 +0300
Message-Id: <20210401134000.7628-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.1.0:

- Add status_code property on http error handling
- Change default of static_discovery when discoveryServiceUrl set
- Correct api version in oauth-installed.md
- fix .close()
- Resolve issue where num_retries would have no effect
- Distinguish between public/private docs in 2.0 guide
- Update README to promote cloud client libraries

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...lient_2.0.2.bb => python3-google-api-python-client_2.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.0.2.bb => python3-google-api-python-client_2.1.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.0.2.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.1.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.0.2.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.1.0.bb
index 38aa349a6..11b94b3fc 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.1.0.bb
@@ -4,6 +4,6 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
 
-SRC_URI[sha256sum] = "48686cceb0dc8cb8b9ee1920ad7c0d9b499ef4fca0ca51c1c69f1e462a628011"
+SRC_URI[sha256sum] = "f9ac377efe69571aea1acc9e15760d4204aca23c4464eb63f963ae4defc95d97"
 
 inherit pypi setuptools3
-- 
2.17.1

