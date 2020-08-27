Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.20797.1598540128836969411
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2020 07:55:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58886 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kBJJI-0001it-6d; Thu, 27 Aug 2020 17:55:28 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 7/7] python3-flask-sqlalchemy: Upgrade 2.4.1 -> 2.4.4
Date: Thu, 27 Aug 2020 17:55:04 +0300
Message-Id: <20200827145504.29147-7-leon.anavi@konsulko.com>
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

Upgrade to release 2.4.4:

- Change base class of meta mixins to type. This fixes an issue
  caused by a regression in CPython 3.8.4.
- Deprecate SQLALCHEMY_COMMIT_ON_TEARDOWN as it can cause various
  design issues that are difficult to debug.
  Call db.session.commit() directly instead.
- Fix bad pagination when records are de-duped.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-sqlalchemy_2.4.1.bb => python3-flask-sqlalchemy_2.4.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-sqlalchemy_2.4.1.bb => python3-flask-sqlalchemy_2.4.4.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.4.1.bb b/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.4.4.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.4.1.bb
rename to meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.4.4.bb
index 2c6110d0b..2755c7d6b 100644
--- a/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-sqlalchemy_2.4.4.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "Adds SQLAlchemy support to your Flask application."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[md5sum] = "1f5781cf3e1a2b1aabda47a5b20d2073"
-SRC_URI[sha256sum] = "6974785d913666587949f7c2946f7001e4fa2cb2d19f4e69ead02e4b8f50b33d"
+SRC_URI[md5sum] = "63a522cb82a75292dc8bc77b6d26187a"
+SRC_URI[sha256sum] = "bfc7150eaf809b1c283879302f04c42791136060c6eeb12c0c6674fb1291fae5"
 
 PYPI_PACKAGE = "Flask-SQLAlchemy"
 
-- 
2.17.1

