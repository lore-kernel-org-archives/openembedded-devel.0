Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.60144.1600089350913121669
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2020 06:15:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52716 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kHoKj-0000ED-Op; Mon, 14 Sep 2020 16:15:50 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 04/10] python3-alembic: Upgrade 1.4.2 -> 1.4.3
Date: Mon, 14 Sep 2020 16:15:30 +0300
Message-Id: <20200914131536.6072-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200914131536.6072-1-leon.anavi@konsulko.com>
References: <20200914131536.6072-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.4.3:

- Added support to drop named CHECK constraints that are specified
  as part of a column, rather than table wide. Previously, only
  constraints associated with the table were considered.
- Fixed issue where the MySQL dialect would not correctly render
  the server default of a column in an alter operation, if the
  operation were programmatically generated from an autogenerate
  pass as it would not accommodate for the full structure of the
  DefaultClause construct.
- Fixed issue where the CAST applied to a JSON column when copying
  a SQLite table during batch mode would cause the data to be lost,
  as SQLite's CAST with JSON appears to convert the data to the
  value "0". The CAST is now skipped in a dialect-specific manner,
  including for JSON columns on SQLite.
- The alembic current command no longer creates an alembic_version
  table in the database if one does not exist already, returning
  no version as the current version. This allows checking for
  migrations in parallel without introducing race conditions.
- Fixed issue where columns in a foreign-key referenced table
  would be replaced with null-type columns during a batch
  operation; while this did not generally have any side effects,
  it could theoretically impact a batch operation that also
  targets that table directly and also would interfere with future
  changes to the .append_column() method to disallow implicit
  replacement of columns.
- Fixed issue where the mssql_drop_foreign_key=True flag on
  op.drop_column would lead to incorrect syntax error due to a
  typo in the SQL emitted, same typo was present in the test as
  well so it was not detected.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-alembic_1.4.2.bb => python3-alembic_1.4.3.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.4.2.bb => python3-alembic_1.4.3.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.4.2.bb b/meta-python/recipes-devtools/python/python3-alembic_1.4.3.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-alembic_1.4.2.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.4.3.bb
index 22630604b..0e7f629d4 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.4.3.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bd64aba1b968c2bfbc2b525a181ce85c"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "1d67bdbd3abd33f0319afcd29bc59686"
-SRC_URI[sha256sum] = "035ab00497217628bf5d0be82d664d8713ab13d37b630084da8e1f98facf4dbf"
+SRC_URI[md5sum] = "6051576d8e25e3d4a9fd818d79531bad"
+SRC_URI[sha256sum] = "5334f32314fb2a56d86b4c4dd1ae34b08c03cae4cb888bc699942104d66bc245"
 
 PYPI_PACKAGE = "alembic"
 
-- 
2.17.1

