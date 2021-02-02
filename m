Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.52260.1612274060677679694
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Feb 2021 05:54:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43528 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l6w8H-00046t-3k; Tue, 02 Feb 2021 15:54:18 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-flask-migrate: Upgrade 2.5.3 -> 2.6.0
Date: Tue,  2 Feb 2021 15:54:10 +0200
Message-Id: <20210202135410.2217-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210202135410.2217-1-leon.anavi@konsulko.com>
References: <20210202135410.2217-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.6.0:

- Removed deprecated --head-only option
- Initialize logger with a name
- Move import to the top in env.py file to avoid linter warnings
- Add a note to the documentation regarding logging
- Move builds to GitHub actions

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...3-flask-migrate_2.5.3.bb => python3-flask-migrate_2.6.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-migrate_2.5.3.bb => python3-flask-migrate_2.6.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-migrate_2.5.3.bb b/meta-python/recipes-devtools/python/python3-flask-migrate_2.6.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-flask-migrate_2.5.3.bb
rename to meta-python/recipes-devtools/python/python3-flask-migrate_2.6.0.bb
index 54fa1dd97..810f0eb27 100644
--- a/meta-python/recipes-devtools/python/python3-flask-migrate_2.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-migrate_2.6.0.bb
@@ -2,8 +2,7 @@ DESCRIPTION = "SQLAlchemy database migrations for Flask applications using Alemb
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85"
 
-SRC_URI[md5sum] = "707d4a5fd4e11d3113a1228aa7793176"
-SRC_URI[sha256sum] = "a69d508c2e09d289f6e55a417b3b8c7bfe70e640f53d2d9deb0d056a384f37ee"
+SRC_URI[sha256sum] = "8626af845e6071ef80c70b0dc16d373f761c981f0ad61bb143a529cab649e725"
 
 PYPI_PACKAGE = "Flask-Migrate"
 
-- 
2.17.1

