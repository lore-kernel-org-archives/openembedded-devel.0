Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.7628.1612444791439111314
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 05:19:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60428 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l7eY0-00014n-9D; Thu, 04 Feb 2021 15:19:48 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-alembic: Upgrade 1.5.3 -> 1.5.4
Date: Thu,  4 Feb 2021 15:19:38 +0200
Message-Id: <20210204131940.22585-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.5.4:

- Fixed bug in versioning model where a downgrade across a
  revision with a dependency on another branch, yet an ancestor
  is also dependent on that branch, would produce an erroneous
  state in the alembic_version table, making upgrades impossible
  without manually repairing the table.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-alembic_1.5.3.bb => python3-alembic_1.5.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.5.3.bb => python3-alembic_1.5.4.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.5.3.bb b/meta-python/recipes-devtools/python/python3-alembic_1.5.4.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-alembic_1.5.3.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.5.4.bb
index c263300cd..9a0991d3c 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.5.4.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c4ece55266dcdd02ce165b1ee0e490bb"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "04608b6904a6e6bd1af83e1a48f73f50ba214aeddef44b92d498df33818654a8"
+SRC_URI[sha256sum] = "e871118b6174681f7e9a9ea67cfcae954c6d18e05b49c6b17f662d2530c76bf5"
 
 PYPI_PACKAGE = "alembic"
 
-- 
2.17.1

