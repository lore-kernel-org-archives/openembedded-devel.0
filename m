Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.5993.1615798068876609274
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 01:47:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34076 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lLit8-0004Tf-M4; Mon, 15 Mar 2021 10:47:48 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/10] python3-alembic: Upgrade 1.5.5 -> 1.5.7
Date: Mon, 15 Mar 2021 10:47:25 +0200
Message-Id: <20210315084727.26812-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210315084727.26812-1-leon.anavi@konsulko.com>
References: <20210315084727.26812-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.5.7:

- Bug fix: adjusted the recently added
  EnvironmentContext.configure.include_name hook to accommodate
  for additional object types such as "views" that don't have a
  parent table, to support third party recipes and extensions.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-alembic_1.5.5.bb => python3-alembic_1.5.7.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.5.5.bb => python3-alembic_1.5.7.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.5.5.bb b/meta-python/recipes-devtools/python/python3-alembic_1.5.7.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-alembic_1.5.5.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.5.7.bb
index 92b691e17..d30e1b696 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.5.5.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.5.7.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c4ece55266dcdd02ce165b1ee0e490bb"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "df0028c19275a2cff137e39617a39cdcdbd1173733b87b6bfa257b7c0860213b"
+SRC_URI[sha256sum] = "66bbb0e7d6277b007dfe7e27237093c79b76cf4f94e6fbd0f7af6f9409546fe6"
 
 PYPI_PACKAGE = "alembic"
 
-- 
2.17.1

