Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.52543.1612274059646000039
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Feb 2021 05:54:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43528 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l6w8F-00046t-VD; Tue, 02 Feb 2021 15:54:17 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-sqlalchemy: Upgrade 1.3.22 -> 1.3.23
Date: Tue,  2 Feb 2021 15:54:09 +0200
Message-Id: <20210202135410.2217-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 1.3.23:

- Fixed bug where making use of the TypeEngine.with_variant()
  method on a TypeDecorator type would fail to take into account
  the dialect-specific mappings in use, due to a rule in
  TypeDecorator that was instead attempting to check for chains
  of TypeDecorator instances.
- For SQLAlchemy 1.3 only, setup.py pins pg8000 to a version lower
  than 1.16.6. Version 1.16.6 and above is supported by SQLAlchemy
  1.4.
- Fixed issue where using Table.to_metadata() (called
  Table.tometadata() in 1.3) in conjunction with a PostgreSQL
  ExcludeConstraint that made use of ad-hoc column expressions
  would fail to copy correctly.
- Casting to FLOAT is now supported in MySQL >= (8, 0, 17) and
  MariaDb >= (10, 4, 5).
- Fixed bug where MySQL server default reflection would fail
  for numeric values with a negation symbol present.
- Fixed long-lived bug in MySQL dialect where the maximum
  identifier length of 255 was too long for names of all types of
  constraints, not just indexes, all of which have a size limit of
  64. As metadata naming conventions can create too-long names in
  this area, apply the limit to the identifier generator within
  the DDL compiler.
- Fixed deprecation warnings that arose as a result of the release
  of PyMySQL 1.0, including deprecation warnings for the “db” and
  “passwd” parameters now replaced with “database” and “password”.
- Fixed regression from SQLAlchemy 1.3.20 caused by a fix which
  adds double-parenthesis for MySQL functional expressions in
  indexes, as is required by the backend, this inadvertently
  extended to include arbitrary text() expressions as well as
  Alembic’s internal textual component, which are required by
  Alembic for arbitrary index expressions which don’t imply double
  parenthesis. The check has been narrowed to include only binary/
  unary/functional expressions directly.
- Fixed regression in Oracle dialect introduced by #4894 in
  SQLAlchemy 1.3.11 where use of a SQL expression in RETURNING for
  an UPDATE would fail to compile, due to a check for
  “server_default” when an arbitrary SQL expression is not a
  column.
- Fixed bug in Oracle dialect where retriving a CLOB/BLOB column
  via Insert.returning() would fail as the LOB value would need to
  be read when returned; additionally, repaired support for
  retrieval of Unicode values via RETURNING under Python 2.
- Fixed issue where the stringification that is sometimes called
  when attempting to generate the “key” for the .c collection on a
  selectable would fail if the column were an unlabeled custom SQL
  construct using the sqlalchemy.ext.compiler extension, and did
  not provide a default compilation form; while this seems like an
  unusual case, it can get invoked for some ORM scenarios such as
  when the expression is used in an “order by” in combination with
  joined eager loading. The issue is that the lack of a default
  compiler function was raising CompileError and not
  UnsupportedCompilationError.

License-Update: Update year

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-sqlalchemy_1.3.22.bb => python3-sqlalchemy_1.3.23.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.3.22.bb => python3-sqlalchemy_1.3.23.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.22.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.23.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.22.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.23.bb
index cf127241d..d962ea7d9 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.22.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.23.bb
@@ -2,9 +2,9 @@ DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
 application developers the full power and flexibility of SQL"
 HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c19467890539ff718c00a019c9c7a7b2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3359ed561ac16aaa25b6c6eff84df595"
 
-SRC_URI[sha256sum] = "758fc8c4d6c0336e617f9f6919f9daea3ab6bb9b07005eda9a1a682e24a6cacc"
+SRC_URI[sha256sum] = "6fca33672578666f657c131552c4ef8979c1606e494f78cd5199742dfb26918b"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.17.1

