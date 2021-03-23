Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.220.1616517238883114037
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Mar 2021 09:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60894 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lOjya-0000KS-4r; Tue, 23 Mar 2021 18:33:56 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/10] python3-sqlalchemy: Upgrade 1.3.23 -> 1.4.2
Date: Tue, 23 Mar 2021 18:33:17 +0200
Message-Id: <20210323163317.26664-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210323163317.26664-1-leon.anavi@konsulko.com>
References: <20210323163317.26664-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.4.2:

orm:

- Added support for the declared_attr object to work in the
  context of dataclass fields.
- Fixed issue in new ORM dataclasses functionality where
  dataclass fields on an abstract base or mixin that contained
  column or other mapping constructs would not be mapped if they
  also included a “default” key within the dataclasses.field()
  object.
- Fixed regression where the Query.selectable accessor, which
  is a synonym for Query.__clause_element__(), got removed, it's
  now restored.
- Fixed regression where use of an unnamed SQL expression
  such as a SQL function would raise a column targeting error if
  the query itself were using joinedload for an entity and was
  also being wrapped in a subquery by the joinedload eager
  loading process.
- Fixed regression where the Query.filter_by() method would
  fail to locate the correct source entity if the Query.join()
  method had been used targeting an entity without any kind of
  ON clause.
- Fixed regression where the SQL compilation of a Function would
  not work correctly if the object had been "annotated", which is
  an internal memoization process used mostly by the ORM. In
  particular it could affect ORM lazy loads which make greater use
  of this feature in 1.4.
- Fixed regression where the ConcreteBase would fail to map at all
  when a mapped column name overlapped with the discriminator
  column name, producing an assertion error. The use case here did
  not function correctly in 1.3 as the polymorphic union would
  produce a query that ignored the discriminator column entirely,
  while emitting duplicate column warnings. As 1.4's architecture
  cannot easily reproduce this essentially broken behavior of 1.3
  at the select() level right now, the use case now raises an
  informative error message instructing the user to use the
  .ConcreteBase._concrete_discriminator_name attribute to resolve
  the conflict. To assist with this configuration,
  .ConcreteBase._concrete_discriminator_name may be placed on the
  base class only where it will be automatically used by
  subclasses; previously this was not the case.

engine:

- Restored top level import for sqlalchemy.engine.reflection. This
  ensures that the base Inspector class is properly registered so
  that inspect() works for third party dialects that don't
  otherwise import this package.

sql:

- Fixed issue where using a func that includes dotted packagenames
  would fail to be cacheable by the SQL caching system due to a
  Python list of names that needed to be a tuple.
- Fixed regression in the case() construct, where the "dictionary"
  form of argument specification failed to work correctly if it
  were passed positionally, rather than as a "whens" keyword
  argument.

mypy:

- Fixed issue in MyPy extension which crashed on detecting the
  type of a Column if the type were given with a module prefix
  like sa.Integer().

postgresql:

- Rename the column name used by a reflection query that used a
  reserved word in some postgresql compatible databases.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-sqlalchemy_1.3.23.bb => python3-sqlalchemy_1.4.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.3.23.bb => python3-sqlalchemy_1.4.2.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.23.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.2.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.23.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.2.bb
index d962ea7d9..00ab6cc77 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.23.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3359ed561ac16aaa25b6c6eff84df595"
 
-SRC_URI[sha256sum] = "6fca33672578666f657c131552c4ef8979c1606e494f78cd5199742dfb26918b"
+SRC_URI[sha256sum] = "6a8e4c2e65028933a6dc8643c8f5a4f295a367131195b3c708634925cb3e8ec1"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.17.1

