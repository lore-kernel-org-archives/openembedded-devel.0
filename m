Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.3812.1622064864978092400
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 14:34:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46122 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lm1AS-0001ac-GO; Thu, 27 May 2021 00:34:23 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-robotframework: Upgrade 4.0.2 -> 4.0.3
Date: Thu, 27 May 2021 00:34:10 +0300
Message-Id: <20210526213410.10468-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.0.3:

- Regression using TypedDict as type hint

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-robotframework_4.0.2.bb => python3-robotframework_4.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-robotframework_4.0.2.bb => python3-robotframework_4.0.3.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework_4.0.2.bb b/meta-python/recipes-devtools/python/python3-robotframework_4.0.3.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-robotframework_4.0.2.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_4.0.3.bb
index 67ebe3ee6..d95ab109a 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_4.0.3.bb
@@ -13,7 +13,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE_EXT = "zip"
 
-SRC_URI[sha256sum] = "efd39558219fddc86473d4d390aeaec60640d7a7567a15fd51c0576f20e46171"
+SRC_URI[sha256sum] = "93c2107f789fd897f234f4b8f1ba8e7b9f4ef326d9bcbfceb71dda8cc197388c"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-shell \
-- 
2.17.1

