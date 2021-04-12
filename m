Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.33098.1618236147673206164
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Apr 2021 07:02:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40390 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lVx90-0002MB-HG; Mon, 12 Apr 2021 17:02:27 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/7] python3-typed-ast: Upgrade 1.4.2 -> 1.4.3
Date: Mon, 12 Apr 2021 17:02:10 +0300
Message-Id: <20210412140212.8395-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210412140212.8395-1-leon.anavi@konsulko.com>
References: <20210412140212.8395-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.4.3:

- Fix compilation on python 3.10
- Add Python 3.10 classifier

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-typed-ast_1.4.2.bb => python3-typed-ast_1.4.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typed-ast_1.4.2.bb => python3-typed-ast_1.4.3.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-typed-ast_1.4.2.bb b/meta-python/recipes-devtools/python/python3-typed-ast_1.4.3.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-typed-ast_1.4.2.bb
rename to meta-python/recipes-devtools/python/python3-typed-ast_1.4.3.bb
index 09f387ca6..c482251b8 100644
--- a/meta-python/recipes-devtools/python/python3-typed-ast_1.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-typed-ast_1.4.3.bb
@@ -7,6 +7,6 @@ PYPI_PACKAGE = "typed_ast"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "9fc0b3cb5d1720e7141d103cf4819aea239f7d136acf9ee4a69b047b7986175a"
+SRC_URI[sha256sum] = "fb1bbeac803adea29cedd70781399c99138358c26d05fcbd23c13016b7f5ec65"
 
 BBCLASSEXTEND = "native"
-- 
2.17.1

