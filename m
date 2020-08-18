Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.68843.1597764898420043893
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2020 08:34:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45392 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k83dW-0004rN-PF; Tue, 18 Aug 2020 18:34:55 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/6] python3-sqlalchemy: Upgrade 1.3.18 -> 1.3.19
Date: Tue, 18 Aug 2020 18:34:39 +0300
Message-Id: <20200818153444.15728-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.3.19:

- orm: Adjusted the workings of the Mapper.all_orm_descriptors()
  accessor to represent the attributes in the order that they are
  located in a deterministic way, assuming the use of Python 3.6
  or higher which maintains the sorting order of class attributes
  based on how they were declared. This sorting is not guaranteed
  to match the declared order of attributes in all cases however;
  see the method documentation for the exact scheme.
- orm: The name of the virtual column used when using the
  AbstractConcreteBase and ConcreteBase classes can now be
  customized, to allow for models that have a column that is
  actually named type.
- sql: Repaired an issue where the "ORDER BY" clause rendering a
  label name rather than a complete expression, which is
  particularly important for SQL Server, would fail to occur if
  the expression were enclosed in a parenthesized grouping in some
  cases. This case has been added to test support. The change
  additionally adjusts the "automatically add ORDER BY columns
  when DISTINCT is present" behavior of ORM query, deprecated in
  1.4, to more accurately detect column expressions that are
  already present.
- mysql: The MySQL dialect will render FROM DUAL for a SELECT
  statement that has no FROM clause but has a WHERE clause. This
  allows things like "SELECT 1 WHERE EXISTS (subquery)" kinds of
  queries to be used as well as other use cases.
- sqlite: Applied a sweep through all included dialects to ensure
  names that contain single or double quotes are properly escaped
  when querying system tables, for all Inspector methods that
  accept object names as an argument (e.g. table names, view
  names, etc). SQLite and MSSQL contained two quoting issues that
  were repaired.
- mssql: Fixed bug where the mssql dialect incorrectly escaped
  object names that contained ‘]’ character(s).
- Added a **kw argument to the DeclarativeMeta.__init__() method.
  This allows a class to support the PEP 487 metaclass hook
  __init_subclass__.

For more details have a look at the complete changelog:
https://docs.sqlalchemy.org/en/13/changelog/changelog_13.html

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-sqlalchemy_1.3.18.bb => python3-sqlalchemy_1.3.19.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.3.18.bb => python3-sqlalchemy_1.3.19.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.18.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.19.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.18.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.19.bb
index a5e1737b0..52e7bf376 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.18.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.19.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c19467890539ff718c00a019c9c7a7b2"
 
-SRC_URI[md5sum] = "96e085d318297b1ad36ef2685f54287a"
-SRC_URI[sha256sum] = "da2fb75f64792c1fc64c82313a00c728a7c301efe6a60b7a9fe35b16b4368ce7"
+SRC_URI[md5sum] = "a5710b0aee19a743e513f3bf002072a8"
+SRC_URI[sha256sum] = "3bba2e9fbedb0511769780fe1d63007081008c5c2d7d715e91858c94dbaa260e"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.17.1

