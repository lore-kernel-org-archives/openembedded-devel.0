Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.13283.1622640978407938857
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Jun 2021 06:36:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58062 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1loR2b-0005Zl-FI; Wed, 02 Jun 2021 16:36:16 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-oauthlib: Upgrade 3.1.0 -> 3.1.1
Date: Wed,  2 Jun 2021 16:36:01 +0300
Message-Id: <20210602133603.32509-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.1.1:

- OAuth2.0 Provider - Bugfixes
- OAuth2.0 Client - Bugfixes
- improved skeleton validator for public vs private client
- replace mock library with standard unittest.mock
- build isort integration
- python2 code removal
- add python3.8 support
- bump minimum versions of pyjwt and cryptography

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-oauthlib_3.1.0.bb => python3-oauthlib_3.1.1.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-oauthlib_3.1.0.bb => python3-oauthlib_3.1.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-oauthlib_3.1.0.bb b/meta-python/recipes-devtools/python/python3-oauthlib_3.1.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-oauthlib_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-oauthlib_3.1.1.bb
index fe27e8e50..e11786349 100644
--- a/meta-python/recipes-devtools/python/python3-oauthlib_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-oauthlib_3.1.1.bb
@@ -4,8 +4,7 @@ HOMEPAGE = "https://github.com/idan/oauthlib"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=abd2675e944a2011aed7e505290ba482"
 
-SRC_URI[md5sum] = "43cb2b5bac983712ee55076b61181cc2"
-SRC_URI[sha256sum] = "bee41cc35fcca6e988463cacc3bcb8a96224f470ca547e697b604cc697b2f889"
+SRC_URI[sha256sum] = "8f0215fcc533dd8dd1bee6f4c412d4f0cd7297307d43ac61666389e3bc3198a3"
 
 inherit pypi setuptools3
 
-- 
2.17.1

