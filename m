Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.8035.1617805945199245783
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 07:32:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41274 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lU9EC-0007iS-J2; Wed, 07 Apr 2021 17:32:24 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/7] python3-sqlalchemy: Upgrade 1.4.5 -> 1.4.6
Date: Wed,  7 Apr 2021 17:32:04 +0300
Message-Id: <20210407143209.21813-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210407143209.21813-1-leon.anavi@konsulko.com>
References: <20210407143209.21813-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade to release 1.4.6:

orm:

- Fixed regression where a deprecated form of Query.join() were
  used, passing a series of entities to join from without any ON
  clause in a single Query.join() call, would fail to function
  correctly.
- Fixed critical regression where the Query.yield_per() method in
  the ORM would set up the internal Result to yield chunks at a
  time, however made use of the new Result.unique() method which
  uniques across the entire result.

sql:

- Fixed further regressions in the same area as that of #6173
  released in 1.4.5, where a “postcompile” parameter, again most
  typically those used for LIMIT/OFFSET rendering in Oracle and
  SQL Server, would fail to be processed correctly if the same
  parameter rendered in multiple places in the statement.
- Executing a Subquery using Connection.execute() is deprecated
  and will emit a deprecation warning; this use case was an
  oversight that should have been removed from 1.4.

schema:

- The Table object now raises an informative error message if it
  is instantiated without passing at least the Table.name and
  Table.metadata arguments positionally. Previously, if these were
  passed as keyword arguments, the object would silently fail to
  initialize correctly.

mypy:

- Applied a series of refactorings and fixes to accommodate for
  Mypy "incremental" mode across multiple files, which previously
  was not taken into account. In this mode the Mypy plugin has to
  accommodate Python datatypes expressed in other files coming in
  with less information than they have on a direct run.
- Fixed issue where the Mypy plugin would fail to interpret the
  "collection_class" of a relationship if it were a callable and
  not a class. Also improved type matching and error reporting for
  collection-oriented relationships.

asyncio:

- Added accessors .sqlstate and synonym .pgcode to the .orig
  attribute of the SQLAlchemy exception class raised by the
  asyncpg DBAPI adapter, that is, the intermediary exception
  object that wraps on top of that raised by the asyncpg
  library itself, but below the level of the SQLAlchemy dialect.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-sqlalchemy_1.4.5.bb => python3-sqlalchemy_1.4.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.5.bb => python3-sqlalchemy_1.4.6.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.5.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.6.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.5.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.6.bb
index 206a9ab3b..4d5aa33d1 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.5.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.6.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3359ed561ac16aaa25b6c6eff84df595"
 
-SRC_URI[sha256sum] = "1294f05916c044631fd626a4866326bbfbd17f62bd37510d000afaef4b35bd74"
+SRC_URI[sha256sum] = "193c3ca465fbc68de071995a461ab535466f041089d372ee6a6f0aae7b9307e6"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.17.1

