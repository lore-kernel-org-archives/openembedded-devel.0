Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.8134.1616679292808372604
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 06:34:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38494 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lPQ8R-0007lW-St; Thu, 25 Mar 2021 15:34:52 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 09/11] python3-flask-sqlalchemy: Upgrade 2.4.4 -> 2.5.1
Date: Thu, 25 Mar 2021 15:34:34 +0200
Message-Id: <20210325133436.18328-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210325133436.18328-1-leon.anavi@konsulko.com>
References: <20210325133436.18328-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.5.1:

- Fix compatibility with Python 2.7.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...k-sqlalchemy_2.4.4.bb => python3-flask-sqlalchemy_2.5.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-sqlalchemy_2.4.4.bb => python3-flask-sqlalchemy_2.5.1.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.4.4.bb b/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.5.1.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.4.4.bb
rename to meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.5.1.bb
index 2755c7d6b..3ca0227bd 100644
--- a/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.5.1.bb
@@ -2,8 +2,7 @@ DESCRIPTION = "Adds SQLAlchemy support to your Flask application."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[md5sum] = "63a522cb82a75292dc8bc77b6d26187a"
-SRC_URI[sha256sum] = "bfc7150eaf809b1c283879302f04c42791136060c6eeb12c0c6674fb1291fae5"
+SRC_URI[sha256sum] = "2bda44b43e7cacb15d4e05ff3cc1f8bc97936cc464623424102bfc2c35e95912"
 
 PYPI_PACKAGE = "Flask-SQLAlchemy"
 
-- 
2.17.1

