Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.3795.1622064787326006286
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 14:33:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46114 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lm199-0000vH-Ra; Thu, 27 May 2021 00:33:03 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/7] python3-flask-migrate: Upgrade 2.7.0 -> 3.0.0
Date: Thu, 27 May 2021 00:32:42 +0300
Message-Id: <20210526213248.10348-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.0.0:

- Remove support for Flask-Script
- Use unittest testrunner
- Remove dependency on six package
- Added sphinx build files to .gitignore file
- Fix Sphinx warning

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-flask-migrate_2.7.0.bb => python3-flask-migrate_3.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-migrate_2.7.0.bb => python3-flask-migrate_3.0.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-migrate_2.7.0.bb b/meta-python/recipes-devtools/python/python3-flask-migrate_3.0.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-flask-migrate_2.7.0.bb
rename to meta-python/recipes-devtools/python/python3-flask-migrate_3.0.0.bb
index 1bf0dfa80..8f84e0597 100644
--- a/meta-python/recipes-devtools/python/python3-flask-migrate_2.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-migrate_3.0.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "SQLAlchemy database migrations for Flask applications using Alemb
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85"
 
-SRC_URI[sha256sum] = "ae2f05671588762dd83a21d8b18c51fe355e86783e24594995ff8d7380dffe38"
+SRC_URI[sha256sum] = "a6607e66bf1d68489b2281ead5caa6fdf7a21b71984fae922ef5f915ac45bbcb"
 
 PYPI_PACKAGE = "Flask-Migrate"
 
-- 
2.17.1

