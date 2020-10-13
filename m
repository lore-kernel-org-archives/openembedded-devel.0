Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.9867.1602589628655277661
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 04:47:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60446 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kSIlg-00049L-Sa; Tue, 13 Oct 2020 14:47:03 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-sqlalchemy: Upgrade 1.3.19 -> 1.3.20
Date: Tue, 13 Oct 2020 14:46:53 +0300
Message-Id: <20201013114654.5610-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201013114654.5610-1-leon.anavi@konsulko.com>
References: <20201013114654.5610-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.3.20:

orm:
- An ArgumentError with more detail is now raised if the target
  parameter for Query.join() is set to an unmapped object. Prior
  to this change a less detailed AttributeError was raised.
- Fixed issue where using a loader option against a string
  attribute name that is not actually a mapped attribute, such
  as a plain Python descriptor, would raise an uninformative
  AttributeError; a descriptive error is now raised.

engine:
- Fixed issue where a non-string object sent to SQLAlchemyError or
  a subclass, as occurs with some third party dialects, would fail
  to stringify correctly.
- Repaired a function-level import that was not using SQLAlchemy’s
  standard late-import system within the sqlalchemy.exc module.

sql:
- Fixed issue where the pickle.dumps() operation against Over
  construct would produce a recursion overflow.
- Fixed bug where an error was not raised in the case where a
  column() were added to more than one table() at a time. This
  raised correctly for the Column and Table objects. An
  ArgumentError is now raised when this occurs.

postgresql:
- The psycopg2 dialect now support PostgreSQL multiple host
  connections, by passing host/port combinations to the query
  string.
- Adjusted the Comparator.any() and Comparator.all() methods to
  implement a straight “NOT” operation for negation, rather than
  negating the comparison operator.
- Fixed issue where the ENUM type would not consult the schema
  translate map when emitting a CREATE TYPE or DROP TYPE during the
  test to see if the type exists or not. Additionally, repaired an
  issue where if the same enum were encountered multiple times in a
  single DDL sequence, the “check” query would run repeatedly rather
  than relying upon a cached value.

mysql:
- Adjusted the MySQL dialect to correctly parenthesize functional
  index expressions as accepted by MySQL 8.
- The “skip_locked” keyword used with with_for_update() will emit a
  warning when used on MariaDB backends, and will then be ignored.
  This is a deprecated behavior that will raise in SQLAlchemy 1.4,
  as an application that requests “skip locked” is looking for a
  non-blocking operation which is not available on those backends.
- Fixed bug where an UPDATE statement against a JOIN using MySQL
  multi-table format would fail to include the table prefix for the
  target table if the statement had no WHERE clause, as only the
  WHERE clause were scanned to detect a “multi table update” at
  that particular point. The target is now also scanned if it’s a
  JOIN to get the leftmost table as the primary table and the
  additional entries as additional FROM entries.
- Add new MySQL reserved words: cube, lateral added in MySQL 8.0.1
  and 8.0.14, respectively; this indicates that these terms will
  be quoted if used as table or column identifier names.

mssql:
- Fixed issue where a SQLAlchemy connection URI for Azure DW with
  authentication=ActiveDirectoryIntegrated (and no username+password)
  was not constructing the ODBC connection string in a way that was
  acceptable to the Azure DW instance.

misc:
- Fixed issue where the following pool parameters were not being
  propagated to the new pool created when Engine.dispose() were
  called: pre_ping, use_lifo. Additionally the recycle and
  reset_on_return parameter is now propagated for the AssertionPool
  class.
- An informative error is now raised when attempting to use an
  association proxy element as a plain column expression to be
  SELECTed from or used in a SQL function; this use case is not
  currently supported.
- Fixed incompatibilities in the test suite when running against
  Pytest 6.x.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-sqlalchemy_1.3.19.bb => python3-sqlalchemy_1.3.20.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.3.19.bb => python3-sqlalchemy_1.3.20.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.19.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.20.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.19.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.20.bb
index 52e7bf376b..e8f598ada3 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.19.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.20.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c19467890539ff718c00a019c9c7a7b2"
 
-SRC_URI[md5sum] = "a5710b0aee19a743e513f3bf002072a8"
-SRC_URI[sha256sum] = "3bba2e9fbedb0511769780fe1d63007081008c5c2d7d715e91858c94dbaa260e"
+SRC_URI[md5sum] = "40200b570274446a05959abd3fa81778"
+SRC_URI[sha256sum] = "d2f25c7f410338d31666d7ddedfa67570900e248b940d186b48461bd4e5569a1"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.17.1

