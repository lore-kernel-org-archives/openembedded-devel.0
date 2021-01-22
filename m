Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.6839.1611310310053208586
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jan 2021 02:11:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52170 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l2tPv-0000CW-8G; Fri, 22 Jan 2021 12:11:49 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-alembic: Upgrade 1.5.1 -> 1.5.2
Date: Fri, 22 Jan 2021 12:11:25 +0200
Message-Id: <20210122101126.25982-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210122101126.25982-1-leon.anavi@konsulko.com>
References: <20210122101126.25982-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.5.2:

- Fixed regression where new "loop detection" feature produced
  false positives for revision names that have overlapping
  substrings between revision number and down revision and/or
  dependency, if the downrev/dependency were not in sequence form.
- Fixed regression where Alembic would fail to create a
  transaction properly if the sqlalchemy.engine.Connection were a
  so-called "branched" connection, that is, one where the .connect()
  method had been called to create a "sub" connection.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-alembic_1.5.1.bb => python3-alembic_1.5.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.5.1.bb => python3-alembic_1.5.2.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.5.1.bb b/meta-python/recipes-devtools/python/python3-alembic_1.5.2.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-alembic_1.5.1.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.5.2.bb
index f07be042f..9e30cc131 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.5.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c4ece55266dcdd02ce165b1ee0e490bb"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "52d1d48109f17959982779e3c4b5cdeca701e449897bacb75bab173bd6ba984e"
+SRC_URI[sha256sum] = "a4de8d3525a95a96d59342e14b95cab5956c25b0907dce1549bb4e3e7958f4c2"
 
 PYPI_PACKAGE = "alembic"
 
-- 
2.17.1

