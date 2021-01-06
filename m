Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.1118.1609970843169157839
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 14:07:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=51612 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kxGxY-0004lA-VT; Thu, 07 Jan 2021 00:07:21 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 04/10] python3-sqlalchemy: Upgrade 1.3.20 -> 1.3.22
Date: Thu,  7 Jan 2021 00:06:56 +0200
Message-Id: <20210106220702.10483-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210106220702.10483-1-leon.anavi@konsulko.com>
References: <20210106220702.10483-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.3.22:

- Fixed regression which occured due to #5755 which implemented
  isolation level support for Oracle. It has been reported that
  many Oracle accounts don't actually have permission to query
  the v$transaction view so this feature has been altered to
  gracefully fallback when it fails upon database connect, where
  the dialect will assume "READ COMMITTED" is the default
  isolation level as was the case prior to SQLAlchemy 1.3.21.
  However, explicit use of the Connection.get_isolation_level()
  method must now necessarily raise an exception, as Oracle
  databases with this restriction explicitly disallow the user
  from reading the current isolation level.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...thon3-sqlalchemy_1.3.20.bb => python3-sqlalchemy_1.3.22.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.3.20.bb => python3-sqlalchemy_1.3.22.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.20.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.22.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.20.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.22.bb
index e8f598ada3..cf127241db 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.20.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.22.bb
@@ -4,8 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c19467890539ff718c00a019c9c7a7b2"
 
-SRC_URI[md5sum] = "40200b570274446a05959abd3fa81778"
-SRC_URI[sha256sum] = "d2f25c7f410338d31666d7ddedfa67570900e248b940d186b48461bd4e5569a1"
+SRC_URI[sha256sum] = "758fc8c4d6c0336e617f9f6919f9daea3ab6bb9b07005eda9a1a682e24a6cacc"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.17.1

