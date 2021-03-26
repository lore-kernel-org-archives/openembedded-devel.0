Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.12345.1616764360566204526
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Mar 2021 06:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57840 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lPmGU-0004oR-LD; Fri, 26 Mar 2021 15:12:39 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-sqlalchemy: Upgrade 1.4.2 -> 1.4.3
Date: Fri, 26 Mar 2021 15:12:29 +0200
Message-Id: <20210326131231.5839-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210326131231.5839-1-leon.anavi@konsulko.com>
References: <20210326131231.5839-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.4.3:

orm:
- Fixed a bug where python 2.7.5 (default on CentOS 7) wasn't able
  to import sqlalchemy, because on this version of Python exec
  "statement" and exec("statement") do not behave the same way.
  The compatibility exec_() function was used instead.
- Fixed bug where ORM queries using a correlated subquery in
  conjunction with column_property() would fail to correlate
  correctly to an enclosing subquery or to a CTE when
  Select.correlate_except() were used in the property to control
  correlation, in cases where the subquery contained the same
  selectables as ones within the correlated subquery that were
  intended to not be correlated.
- Fixed bug where combinations of the new "relationship with
  criteria" feature could fail in conjunction with features that
  make use of the new “lambda SQL” feature, including loader
  strategies such as selectinload and lazyload, for more
  complicated scenarios such as polymorphic loading.
- Repaired support so that the ClauseElement.params() method can
  work correctly with a Select object that includes joins across
  ORM relationship structures, which is a new feature in 1.4.
- Fixed issue where a "removed in 2.0" warning were generated
  internally by the relationship loader mechanics.

orm declarative:
- Fixed regression where the .metadata attribute on a per class
  level would not be honored, breaking the use case of
  per-class-hierarchy MetaData for abstract declarative classes
  and mixins.

engine:
- Restored the ResultProxy name back to the sqlalchemy.engine
  namespace. This name refers to the LegacyCursorResult object.

mypy:
- Added support for the Mypy extension to correctly interpret a
  declarative base class that’s generated using the as_declarative()
  function as well as the registry.as_declarative_base() method.

postgresql:
- Fixed reflection of identity columns in tables with mixed case
  names in PostgreSQL.

sqlite:
- Added support for the aiosqlite database driver for use with the
  SQLAlchemy asyncio extension.
- Repaired the pysqlcipher dialect to connect correctly which had
  regressed in 1.4, and added test + CI support to maintain the
  driver in working condition. The dialect now imports the
  sqlcipher3 module for Python 3 by default before falling back to
  pysqlcipher3 which is documented as now being unmaintained.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-sqlalchemy_1.4.2.bb => python3-sqlalchemy_1.4.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.2.bb => python3-sqlalchemy_1.4.3.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.2.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.3.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.2.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.3.bb
index 00ab6cc77..8cff18dc2 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3359ed561ac16aaa25b6c6eff84df595"
 
-SRC_URI[sha256sum] = "6a8e4c2e65028933a6dc8643c8f5a4f295a367131195b3c708634925cb3e8ec1"
+SRC_URI[sha256sum] = "a719b80b41a900bbcec3cc248616394ebd134043ce5e62185270d785d8a184d3"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.17.1

