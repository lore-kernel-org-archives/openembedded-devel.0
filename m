Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.11109.1617712430014283851
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Apr 2021 05:33:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55444 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lTktl-0003tX-Jm; Tue, 06 Apr 2021 15:33:38 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-sqlalchemy: Upgrade 1.4.4 -> 1.4.5
Date: Tue,  6 Apr 2021 15:33:27 +0300
Message-Id: <20210406123331.23266-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.4.5:

orm:
- Fixed regression where the joinedload() loader strategy would
  not successfully joinedload to a mapper that is mapper against
  a CTE construct.
- Scaled back the warning message added in #5171 to not warn for
  overlapping columns in an inheritance scenario where a
  particular relationship is local to a subclass and therefore
  does not represent an overlap.

sql:
- Fixed bug in new FunctionElement.render_derived() feature where
  column names rendered out explicitly in the alias SQL would not
  have proper quoting applied for case sensitive names and other
  non-alphanumeric names.
- Fixed regression where use of the Operators.in_() method with a
  Select object against a non-table-bound column would produce an
  AttributeError, or more generally using a ScalarSelect that has
  no datatype in a binary expression would produce invalid state.
- Added a new flag to the Dialect class called
  Dialect.supports_statement_cache. This flag now needs to be
  present directly on a dialect class in order for SQLAlchemy's
  query cache to take effect for that dialect. The rationale is
  based on discovered issues such as #6173 revealing that dialects
  which hardcode literal values from the compiled statement, often
  the numerical parameters used for LIMIT / OFFSET, will not be
  compatible with caching until these dialects are revised to use
  the parameters present in the statement only. For third party
  dialects where this flag is not applied, the SQL logging will
  show the message "dialect does not support caching", indicating
  the dialect should seek to apply this flag once they have
  verified that no per-statement literal values are being rendered
  iwithin the compilation phase.

schema:
- Introduce a new parameter Enum.omit_aliases in Enum type allow
  filtering aliases when using a pep435 Enum. Previous versions of
  SQLAlchemy kept aliases in all cases, creating database enum
  type with additional states, meaning that they were treated as
  different values in the db. For backward compatibility this flag
  defaults to False in the 1.4 series, but will be switched to
  True in a future version. A deprecation warning is raise if this
  iflag is not specified and the passed enum contains aliases.

mypy:
- Fixed issue in mypy plugin where newly added support for
  as_declarative() needed to more fully add the DeclarativeMeta
  class to the mypy interpreter’s state so that it does not
  result in a name not found error; additionally improves how
  global names are setup for the plugin including the Mapped name.

asyncio:
- Fixed issue where the asyncio extension could not be loaded if
  running Python 3.6 with the backport library of contextvars
  installed.

postgresql:
- Fixed regression where the PostgreSQL cast operator applied to
  elements within an ARRAY when using psycopg2 would fail to use
  the correct type in the case that the datatype were also
  embedded within an instance of the Variant adapter.
- Fixed typo in the fix released in 1.4.4 that completely
  prevented this change from working correctly, i.e. the error
  message did not match what was actually emitted by pg8000.
- Fixed issue where the PostgreSQL PGInspector, when generated
  against an Engine, would fail for .get_enums(),
  .get_view_names(), .get_foreign_table_names() and
  .get_table_oid() when used against a "future" style engine
  and not the connection directly.

mysql:
- Fixed regression in the MySQL dialect where the reflection query
  used to detect if a table exists would fail on very old MySQL
  5.0 and 5.1 versions.

mssql:
- Fixed a regression in MSSQL 2012+ that prevented the order by
  clause to be rendered when offset=0 is used in a subquery.

oracle:
- Fixed critical regression where the Oracle compiler would not
  maintain the correct parameter values in the LIMIT/OFFSET for a
  select due to a caching issue.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-sqlalchemy_1.4.4.bb => python3-sqlalchemy_1.4.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.4.bb => python3-sqlalchemy_1.4.5.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.4.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.5.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.4.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.5.bb
index 1578da5e5..206a9ab3b 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3359ed561ac16aaa25b6c6eff84df595"
 
-SRC_URI[sha256sum] = "7ba9c00c129dbb4fd026a1f2c943188db59c802612e49bc9bded426d8eb14bc0"
+SRC_URI[sha256sum] = "1294f05916c044631fd626a4866326bbfbd17f62bd37510d000afaef4b35bd74"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.17.1

