Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.1863.1621626238779644146
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 May 2021 12:43:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43814 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lkB3o-00060E-Em; Fri, 21 May 2021 22:43:54 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-pysonos: Upgrade 0.0.48 -> 0.0.49
Date: Fri, 21 May 2021 22:43:41 +0300
Message-Id: <20210521194342.6448-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.0.49:

- Cleanup async_events renewal logging and exceptions
- Add a pypi release action
- Add next-version script for incrementing the version

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pysonos_0.0.48.bb => python3-pysonos_0.0.49.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pysonos_0.0.48.bb => python3-pysonos_0.0.49.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-pysonos_0.0.48.bb b/meta-python/recipes-devtools/python/python3-pysonos_0.0.49.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-pysonos_0.0.48.bb
rename to meta-python/recipes-devtools/python/python3-pysonos_0.0.49.bb
index 18ff30b22a..77ea6c08c0 100644
--- a/meta-python/recipes-devtools/python/python3-pysonos_0.0.48.bb
+++ b/meta-python/recipes-devtools/python/python3-pysonos_0.0.49.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=07b0e2ca9ac77cd65cd4edf2e13367ea"
 
-SRC_URI[sha256sum] = "69c55bf80aae77b3ea8658ee1a80b9aafc0506931614853c926830a502230fc6"
+SRC_URI[sha256sum] = "77b8987ddbc69ea5c28ec1dee09cd6c30267e196521b1847e43cdea77bce4f09"
 
 inherit pypi setuptools3
 
-- 
2.17.1

