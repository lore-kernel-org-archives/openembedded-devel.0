Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.20663.1598540121637351464
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2020 07:55:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58886 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kBJJA-0001it-Nm; Thu, 27 Aug 2020 17:55:21 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/7] python3-flask-migrate: Upgrade 2.5.2 -> 2.5.3
Date: Thu, 27 Aug 2020 17:55:00 +0300
Message-Id: <20200827145504.29147-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827145504.29147-1-leon.anavi@konsulko.com>
References: <20200827145504.29147-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.5.3:

- Allow Path objects to be used as directory parameter
- Use same database URLs as Flask-SQLAlchemy
- Document how to set up with init_app method
- Document how to include a message in initial migrate
- Remove checks for alembic 0.7.0. Flask-Migrate requires alembic
  >= 0.7 in its setup.py file, which makes all the checks for
  this version obsolete.
- Use sys.executable in tests, also re-order imports
- Cosmetic improvements to help messages

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-flask-migrate_2.5.2.bb => python3-flask-migrate_2.5.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-migrate_2.5.2.bb => python3-flask-migrate_2.5.3.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-migrate_2.5.2.bb b/meta-python/recipes-devtools/python/python3-flask-migrate_2.5.3.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-flask-migrate_2.5.2.bb
rename to meta-python/recipes-devtools/python/python3-flask-migrate_2.5.3.bb
index 78ec665ef..54fa1dd97 100644
--- a/meta-python/recipes-devtools/python/python3-flask-migrate_2.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-migrate_2.5.3.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "SQLAlchemy database migrations for Flask applications using Alemb
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85"
 
-SRC_URI[md5sum] = "bedeb0366740fda6912fea683be11968"
-SRC_URI[sha256sum] = "a96ff1875a49a40bd3e8ac04fce73fdb0870b9211e6168608cbafa4eb839d502"
+SRC_URI[md5sum] = "707d4a5fd4e11d3113a1228aa7793176"
+SRC_URI[sha256sum] = "a69d508c2e09d289f6e55a417b3b8c7bfe70e640f53d2d9deb0d056a384f37ee"
 
 PYPI_PACKAGE = "Flask-Migrate"
 
-- 
2.17.1

