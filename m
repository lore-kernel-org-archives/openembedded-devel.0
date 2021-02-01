Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.33428.1612183533476516586
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Feb 2021 04:45:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=33634 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l6YaB-0001Fc-L7; Mon, 01 Feb 2021 14:45:32 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-alembic: Upgrade 1.5.2 -> 1.5.3
Date: Mon,  1 Feb 2021 14:45:16 +0200
Message-Id: <20210201124516.30135-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210201124516.30135-1-leon.anavi@konsulko.com>
References: <20210201124516.30135-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.5.3:

- Changed the default ordering of “CREATE” and “DROP” statements
  indexes and unique constraints within the autogenerate process,
  so that for example in an upgrade() operation, a particular
  index or constraint that is to be replaced such as for a casing
  convention change will not produce any naming conflicts. For
  foreign key constraint objects, this is already how constraints
  are ordered, and for table objects, users would normally want to
  use Operations.rename_table() in any case.
- Fixed assorted autogenerate issues with SQL Server.
- Fixed issue where autogenerate rendering of op.alter_column()
  would fail to include MySQL existing_nullable=False if the column
  were part of a primary key constraint within the table metadata.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-alembic_1.5.2.bb => python3-alembic_1.5.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.5.2.bb => python3-alembic_1.5.3.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.5.2.bb b/meta-python/recipes-devtools/python/python3-alembic_1.5.3.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-alembic_1.5.2.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.5.3.bb
index 9e30cc131..c263300cd 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.5.3.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c4ece55266dcdd02ce165b1ee0e490bb"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "a4de8d3525a95a96d59342e14b95cab5956c25b0907dce1549bb4e3e7958f4c2"
+SRC_URI[sha256sum] = "04608b6904a6e6bd1af83e1a48f73f50ba214aeddef44b92d498df33818654a8"
 
 PYPI_PACKAGE = "alembic"
 
-- 
2.17.1

