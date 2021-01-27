Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.9566.1611762951244362740
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jan 2021 07:55:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=49388 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l4nAc-0001GX-Ap; Wed, 27 Jan 2021 17:55:51 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-typed-ast: Upgrade 1.4.1 -> 1.4.2
Date: Wed, 27 Jan 2021 17:55:37 +0200
Message-Id: <20210127155538.12229-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210127155538.12229-1-leon.anavi@konsulko.com>
References: <20210127155538.12229-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.4.2:

- Fix linker error in debug build
- Fix cross compile by adjusting includes
- ast27: prefix exported symbols
- Add 3.9 to supported versions

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-typed-ast_1.4.1.bb => python3-typed-ast_1.4.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typed-ast_1.4.1.bb => python3-typed-ast_1.4.2.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-typed-ast_1.4.1.bb b/meta-python/recipes-devtools/python/python3-typed-ast_1.4.2.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-typed-ast_1.4.1.bb
rename to meta-python/recipes-devtools/python/python3-typed-ast_1.4.2.bb
index 2cc9f6c43..09f387ca6 100644
--- a/meta-python/recipes-devtools/python/python3-typed-ast_1.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-typed-ast_1.4.2.bb
@@ -7,6 +7,6 @@ PYPI_PACKAGE = "typed_ast"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "8c8aaad94455178e3187ab22c8b01a3837f8ee50e09cf31f1ba129eb293ec30b"
+SRC_URI[sha256sum] = "9fc0b3cb5d1720e7141d103cf4819aea239f7d136acf9ee4a69b047b7986175a"
 
 BBCLASSEXTEND = "native"
-- 
2.17.1

