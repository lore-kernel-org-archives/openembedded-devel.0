Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.11133.1614093757248154777
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Feb 2021 07:22:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56178 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lEZWF-00022z-45; Tue, 23 Feb 2021 17:22:36 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/10] python3-alembic: Upgrade 1.5.4 -> 1.5.5
Date: Tue, 23 Feb 2021 17:22:17 +0200
Message-Id: <20210223152219.32129-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210223152219.32129-1-leon.anavi@konsulko.com>
References: <20210223152219.32129-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.5.5:

- Adjusted the use of SQLAlchemy's .copy() internals to use
  ._copy() for version 1.4.0, as this method is being renamed.
- Added new config file option prepend_sys_path, which is a
  series of paths that will be prepended to sys.path; the
  default value in newly generated alembic.ini files is ".".

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-alembic_1.5.4.bb => python3-alembic_1.5.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.5.4.bb => python3-alembic_1.5.5.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.5.4.bb b/meta-python/recipes-devtools/python/python3-alembic_1.5.5.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-alembic_1.5.4.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.5.5.bb
index 9a0991d3cc..92b691e171 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.5.4.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.5.5.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c4ece55266dcdd02ce165b1ee0e490bb"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "e871118b6174681f7e9a9ea67cfcae954c6d18e05b49c6b17f662d2530c76bf5"
+SRC_URI[sha256sum] = "df0028c19275a2cff137e39617a39cdcdbd1173733b87b6bfa257b7c0860213b"
 
 PYPI_PACKAGE = "alembic"
 
-- 
2.17.1

