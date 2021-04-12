Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.32817.1618236147132808703
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Apr 2021 07:02:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40390 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lVx8z-0002MB-DL; Mon, 12 Apr 2021 17:02:26 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/7] python3-sqlalchemy: Upgrade 1.4.6 -> 1.4.7
Date: Mon, 12 Apr 2021 17:02:09 +0300
Message-Id: <20210412140212.8395-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210412140212.8395-1-leon.anavi@konsulko.com>
References: <20210412140212.8395-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.4.7:

orm:

- Fixed regression where the subqueryload() loader strategy would
  fail to correctly accommodate sub-options, such as a defer()
  option on a column, if the “path” of the subqueryload were more
  than one level deep.
- Fixed regression where the merge_frozen_result() function relied
  upon by the dogpile.caching example was not included in tests
  and began failing due to incorrect internal arguments.
- Fixed critical regression where the Session could fail to
  "autobegin" a new transaction when a flush occurred without an
  existing transaction in place, implicitly placing the Session
  into legacy autocommit mode which commit the transaction. The
  Session now has a check that will prevent this condition from
  occurring, in addition to repairing the flush issue.
- Fixed regression where the ORM compilation scheme would assume
  the function name of a hybrid property would be the same as the
  attribute name in such a way that an AttributeError would be
  raised, when it would attempt to determine the correct name for
  each element in a result tuple.
- Fixed critical regression caused by the new feature added as
  part of #1763, eager loaders are invoked on unexpire operations.
  The new feature makes use of the "immediateload" eager loader
  strategy as a substitute for a collection loading strategy,
  which unlike the other “post-load” strategies was not
  accommodating for recursive invocations between
  mutually-dependent relationships, leading to recursion overflow
  errors.

engine:

- Fixed up the behavior of the Row object when dictionary access
  is used upon it, meaning converting to a dict via dict(row) or
  accessing members using strings or other objects i.e.
  row["some_key"] works as it would with a dictionary, rather than
  raising TypeError as would be the case with a tuple, whether or
  not the C extensions are in place

sql:

- Enhanced the "expanding" feature used for ColumnOperators.in_()
  operations to infer the type of expression from the right hand
  list of elements, if the left hand side does not have any
  explicit type set up. This allows the expression to support
  stringification among other things. In 1.3, "expanding" was not
  automatically used for ColumnOperators.in_() expressions, so in
  that sense this change fixes a behavioral regression.
- Fixed the "stringify" compiler to support a basic
  stringification of a "multirow" INSERT statement, i.e. one with
  multiple tuples following the VALUES keyword.

schema:

- Fixed regression where usage of a token in the
  Connection.execution_options.schema_translate_map dictionary
  which contained special characters such as braces would fail to
  be substituted properly. Use of square bracket characters [] is
  now explicitly disallowed as these are used as a delimiter
  character in the current implementation.

mypy:

- Fixed issue in Mypy plugin where the plugin wasn't inferring the
  correct type for columns of subclasses that don’t directly
  descend from TypeEngine, in particular that of TypeDecorator and
  UserDefinedType.

misc:

- Added a new flag to DefaultDialect called supports_schema; third
  party dialects may set this flag to True to enable SQLAlchemy's
  schema-level tests when running the test suite for a third party
  dialect.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-sqlalchemy_1.4.6.bb => python3-sqlalchemy_1.4.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.6.bb => python3-sqlalchemy_1.4.7.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.6.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.7.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.6.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.7.bb
index 4d5aa33d1..883b2660b 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.6.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.7.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3359ed561ac16aaa25b6c6eff84df595"
 
-SRC_URI[sha256sum] = "193c3ca465fbc68de071995a461ab535466f041089d372ee6a6f0aae7b9307e6"
+SRC_URI[sha256sum] = "84115f97d88c8ccf26db81b7997c5f5de9ae360e0785ef859d0987794495f0a9"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.17.1

