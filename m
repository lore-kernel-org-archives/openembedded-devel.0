Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.201.1616517215269358010
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Mar 2021 09:33:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60894 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lOjyH-0000KS-O4; Tue, 23 Mar 2021 18:33:34 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/10] python3-pyscaffold: Upgrade 4.0 -> 4.0.1
Date: Tue, 23 Mar 2021 18:33:09 +0200
Message-Id: <20210323163317.26664-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210323163317.26664-1-leon.anavi@konsulko.com>
References: <20210323163317.26664-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.0.1:

- Fix tox -e build issue when running on Conda
- Ensure snake_case for keys in setup.cfg
- Update dependencies on configupdater and pyscaffoldext-django
- Remove broken checks for old setuptools

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pyscaffold_4.0.bb => python3-pyscaffold_4.0.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyscaffold_4.0.bb => python3-pyscaffold_4.0.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pyscaffold_4.0.bb b/meta-python/recipes-devtools/python/python3-pyscaffold_4.0.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pyscaffold_4.0.bb
rename to meta-python/recipes-devtools/python/python3-pyscaffold_4.0.1.bb
index 1ad33c10d..b0f8f3e9f 100644
--- a/meta-python/recipes-devtools/python/python3-pyscaffold_4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyscaffold_4.0.1.bb
@@ -12,6 +12,6 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "PyScaffold"
 
-SRC_URI[sha256sum] = "7012ae5f9c95b910a39a099824104dc888beb932de86b07514882f3511bc6c74"
+SRC_URI[sha256sum] = "8fd7b2bdbfc7f7758a66d66cbf796af338e40d69fd4f7b4ddb9996c38add1dbe"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

