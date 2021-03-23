Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.183.1616517215575129724
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Mar 2021 09:33:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60894 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lOjyI-0000KS-8h; Tue, 23 Mar 2021 18:33:34 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/10] python3-flask-migrate: Upgrade 2.6.0 -> 2.7.0
Date: Tue, 23 Mar 2021 18:33:10 +0200
Message-Id: <20210323163317.26664-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210323163317.26664-1-leon.anavi@konsulko.com>
References: <20210323163317.26664-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.7.0:

- Reuse engine from Flask-SQLAlchemy
- Update logging configuration to include Flask-Migrate's logger

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-flask-migrate_2.6.0.bb => python3-flask-migrate_2.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-migrate_2.6.0.bb => python3-flask-migrate_2.7.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-migrate_2.6.0.bb b/meta-python/recipes-devtools/python/python3-flask-migrate_2.7.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-flask-migrate_2.6.0.bb
rename to meta-python/recipes-devtools/python/python3-flask-migrate_2.7.0.bb
index 810f0eb27..1bf0dfa80 100644
--- a/meta-python/recipes-devtools/python/python3-flask-migrate_2.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-migrate_2.7.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "SQLAlchemy database migrations for Flask applications using Alemb
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85"
 
-SRC_URI[sha256sum] = "8626af845e6071ef80c70b0dc16d373f761c981f0ad61bb143a529cab649e725"
+SRC_URI[sha256sum] = "ae2f05671588762dd83a21d8b18c51fe355e86783e24594995ff8d7380dffe38"
 
 PYPI_PACKAGE = "Flask-Migrate"
 
-- 
2.17.1

