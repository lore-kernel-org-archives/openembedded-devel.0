Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.13019.1622640984693669523
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Jun 2021 06:36:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58062 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1loR2i-0005Zl-Mt; Wed, 02 Jun 2021 16:36:24 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-sqlalchemy: Upgrade 1.4.15 -> 1.4.17
Date: Wed,  2 Jun 2021 16:36:03 +0300
Message-Id: <20210602133603.32509-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210602133603.32509-1-leon.anavi@konsulko.com>
References: <20210602133603.32509-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.4.17:

orm:
- Fixed regression caused by just-released performance fix
  mentioned in #6550 where a query.join() to a relationship could
  produce an AttributeError if the query were made against non-ORM
  structures only, a fairly unusual calling pattern.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-sqlalchemy_1.4.15.bb => python3-sqlalchemy_1.4.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.15.bb => python3-sqlalchemy_1.4.17.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.15.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.17.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.15.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.17.bb
index 2d7273bb2..5b881ea0b 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.15.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.17.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3359ed561ac16aaa25b6c6eff84df595"
 
-SRC_URI[sha256sum] = "0ff100c75cd175f35f4d24375a0b3d82461f5b1af5fc8d112ef0e5ceea8049e6"
+SRC_URI[sha256sum] = "651cdb3adcee13624ba22d5ff3e96f91e16a115d2ca489ddc16a8e4c217e8509"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.17.1

