Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.4237.1617182290878612597
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Mar 2021 02:18:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56348 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lRWzH-0002MF-1o; Wed, 31 Mar 2021 12:18:08 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-sqlalchemy: Upgrade 1.4.3 -> 1.4.4
Date: Wed, 31 Mar 2021 12:17:57 +0300
Message-Id: <20210331091801.17047-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 1.4.4:

orm:
- Fixed critical issue in the new PropComparator.and_() feature
  where loader strategies that emit secondary SELECT statements
  such as selectinload() and lazyload() would fail to accommodate
  for bound parameters in the user-defined criteria in terms of
  the current statement being executed, as opposed to the cached
  statement, causing stale bound values to be used.
- Fixed missing method Session.get() from the ScopedSession
  interface.

engine:
- Modified the context manager used by Transaction so that an
  "already detached" warning is not emitted by the ending of the
  context manager itself, if the transaction were already manually
  rolled back inside the block. This applies to regular
  transactions, savepoint transactions, and legacy "marker"
  transactions. A warning is still emitted if the .rollback()
  method is called explicitly more than once.
- Repair wrong arguments to exception handling method in
  CursorResult.

postgresql:
- Fixed issue in PostgreSQL reflection where a column expressing
  "NOT NULL" will supersede the nullability of a corresponding
  domain.
- Modified the is_disconnect() handler for the pg8000 dialect,
  which now accommodates for a new InterfaceError emitted by
  pg8000 1.19.0.

misc:
- Adjusted the usage of the importlib_metadata library for loading
  setuptools entrypoints in order to accommodate for some
  deprecation changes.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-sqlalchemy_1.4.3.bb => python3-sqlalchemy_1.4.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.3.bb => python3-sqlalchemy_1.4.4.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.3.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.4.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.3.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.4.bb
index 8cff18dc2..1578da5e5 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3359ed561ac16aaa25b6c6eff84df595"
 
-SRC_URI[sha256sum] = "a719b80b41a900bbcec3cc248616394ebd134043ce5e62185270d785d8a184d3"
+SRC_URI[sha256sum] = "7ba9c00c129dbb4fd026a1f2c943188db59c802612e49bc9bded426d8eb14bc0"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.17.1

