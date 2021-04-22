Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.11192.1619092278261590978
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Apr 2021 04:51:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59522 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lZXrX-0003Zx-H0; Thu, 22 Apr 2021 14:51:17 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-sqlalchemy: Upgrade 1.4.7 -> 1.4.11
Date: Thu, 22 Apr 2021 14:51:00 +0300
Message-Id: <20210422115100.28615-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210422115100.28615-1-leon.anavi@konsulko.com>
References: <20210422115100.28615-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.4.11:

orm:
- Fixed regression where recent changes to support Python
  dataclasses had the inadvertent effect that an ORM mapped class
  could not successfully override the __new__() method.

engine:
- Fixed critical regression where the connection pool "init" phase
  no longer occurred within mutexed isolation, allowing other
  threads to proceed with the dialect uninitialized, which could
  then impact the compilation of SQL statements.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-sqlalchemy_1.4.7.bb => python3-sqlalchemy_1.4.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.7.bb => python3-sqlalchemy_1.4.11.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.7.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.11.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.7.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.11.bb
index 883b2660b0..ca61ab6ff0 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.7.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.11.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3359ed561ac16aaa25b6c6eff84df595"
 
-SRC_URI[sha256sum] = "84115f97d88c8ccf26db81b7997c5f5de9ae360e0785ef859d0987794495f0a9"
+SRC_URI[sha256sum] = "4ad4044eb86fbcbdff2106e44f479fbdac703d77860b3e19988c8a8786e73061"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.17.1

