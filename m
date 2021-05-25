Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.10060.1621951277251091004
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 May 2021 07:01:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60008 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1llXcO-0006YJ-5h; Tue, 25 May 2021 17:01:16 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-alembic: Upgrade 1.6.2 -> 1.6.4
Date: Tue, 25 May 2021 17:00:57 +0300
Message-Id: <20210525140058.6416-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210525140058.6416-1-leon.anavi@konsulko.com>
References: <20210525140058.6416-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.6.4:

- Fixed regression caused by just fixed bug that scaled back the
  filter for unique=True/index=True too far such that these
  directives no longer worked for the op.create_table() op, this
  has been fixed.
- Fixed 1.6-series regression where UniqueConstraint and to a
  lesser extent Index objects would be doubled up in the generated
  model when the unique=True / index=True flags were used.
- Fixed a bug where paths defined in post-write hook options would
  be wrongly escaped in non posix environment (Windows).
- Fixed regression where a revision file that contained its own
  down revision as a dependency would cause an endless loop in the
  traversal logic.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-alembic_1.6.2.bb => python3-alembic_1.6.4.bb}     | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.6.2.bb => python3-alembic_1.6.4.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.6.2.bb b/meta-python/recipes-devtools/python/python3-alembic_1.6.4.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-alembic_1.6.2.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.6.4.bb
index 1daf20920..8bb815bfa 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.6.4.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c4ece55266dcdd02ce165b1ee0e490bb"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "fb9a39a7c68e55490be962fb5f70463d384d340e6563d6e3911447778e3b4576"
+SRC_URI[sha256sum] = "becb572c6701c90ca249f97fc1ae231468cc9516df367a350901eeb9310a8d43"
 
 PYPI_PACKAGE = "alembic"
 
@@ -13,4 +13,5 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-editor \
     ${PYTHON_PN}-mako \
     ${PYTHON_PN}-sqlalchemy \
+    ${PYTHON_PN}-misc \
 "
-- 
2.17.1

