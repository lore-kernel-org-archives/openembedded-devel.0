Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.10291.1621951278218944077
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 May 2021 07:01:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60008 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1llXcS-0006YJ-6Q; Tue, 25 May 2021 17:01:17 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-sqlalchemy: Upgrade 1.4.11 -> 1.4.15
Date: Tue, 25 May 2021 17:00:58 +0300
Message-Id: <20210525140058.6416-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210525140058.6416-1-leon.anavi@konsulko.com>
References: <20210525140058.6416-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.4.15:

- A new approach has been applied to the warnings system in
  SQLAlchemy to accurately predict the appropriate stack level for
  each warning dynamically. This allows evaluating the source of
  SQLAlchemy-generated warnings and deprecation warnings to be
  more straightforward as the warning will indicate the source
  line within end-user code, rather than from an arbitrary level
  within SQLAlchemy’s own source code.

orm:
- Fixed additional regression caused by “eager loaders run on
  unexpire” feature #1763 where the feature would run for a
  contains_eager() eagerload option in the case that the
  contains_eager() were chained to an additional eager loader
  option, which would then produce an incorrect query as the
  original query-bound join criteria were no longer present.
- Fixed issue in subquery loader strategy which prevented caching
  from working correctly. This would have been seen in the logs as
  a “generated” message instead of “cached” for all subqueryload
  SQL emitted, which by saturating the cache with new keys would
  degrade overall performance; it also would produce “LRU size
  alert” warnings.

sql:
- Adjusted the logic added as part of #6397 in 1.4.12 so that
  internal mutation of the BindParameter object occurs within the
  clause construction phase as it did before, rather than in the
  compilation phase. In the latter case, the mutation still
  produced side effects against the incoming construct and
  additionally could potentially interfere with other internal
  mutation routines.

mysql:
- Added support for the ssl_check_hostname= parameter in mysql
  connection URIs and updated the mysql dialect documentation
  regarding secure connections. Original pull request courtesy of
  Jerry Zhao.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-sqlalchemy_1.4.11.bb => python3-sqlalchemy_1.4.15.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.11.bb => python3-sqlalchemy_1.4.15.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.11.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.15.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.11.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.15.bb
index ca61ab6ff..2d7273bb2 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.11.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.15.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3359ed561ac16aaa25b6c6eff84df595"
 
-SRC_URI[sha256sum] = "4ad4044eb86fbcbdff2106e44f479fbdac703d77860b3e19988c8a8786e73061"
+SRC_URI[sha256sum] = "0ff100c75cd175f35f4d24375a0b3d82461f5b1af5fc8d112ef0e5ceea8049e6"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
@@ -16,4 +16,6 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-netclient \
     ${PYTHON_PN}-numbers \
     ${PYTHON_PN}-threading \
+    ${PYTHON_PN}-compression \
+    ${PYTHON_PN}-profile \
 "
-- 
2.17.1

