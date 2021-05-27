Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.6654.1622121618027639900
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 May 2021 06:20:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56734 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lmFvm-0003sv-Vf; Thu, 27 May 2021 16:20:17 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/6] python3-pyscaffold: Upgrade 4.0.1 -> 4.0.2
Date: Thu, 27 May 2021 16:19:50 +0300
Message-Id: <20210527131952.20082-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210527131952.20082-1-leon.anavi@konsulko.com>
References: <20210527131952.20082-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.0.2:

- Restructured docs
- Fix WSL2 installation problem
- Fix for interactive mode under Windows

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-pyscaffold_4.0.1.bb => python3-pyscaffold_4.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyscaffold_4.0.1.bb => python3-pyscaffold_4.0.2.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pyscaffold_4.0.1.bb b/meta-python/recipes-devtools/python/python3-pyscaffold_4.0.2.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pyscaffold_4.0.1.bb
rename to meta-python/recipes-devtools/python/python3-pyscaffold_4.0.2.bb
index b0f8f3e9f..bba94f8a0 100644
--- a/meta-python/recipes-devtools/python/python3-pyscaffold_4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyscaffold_4.0.2.bb
@@ -12,6 +12,6 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "PyScaffold"
 
-SRC_URI[sha256sum] = "8fd7b2bdbfc7f7758a66d66cbf796af338e40d69fd4f7b4ddb9996c38add1dbe"
+SRC_URI[sha256sum] = "cfa719c2d97392ec3cd5f44d95ec0d40df2dd483d5ee05ea029896cfd7c04af8"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

