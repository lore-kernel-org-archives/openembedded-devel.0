Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.12900.1597146306041394048
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2020 04:45:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37052 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k5SiG-0004It-Kk; Tue, 11 Aug 2020 14:45:05 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/10] python3-flask-login: Upgrade 0.4.1 -> 0.5.0
Date: Tue, 11 Aug 2020 14:44:30 +0300
Message-Id: <20200811114430.27916-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200811114430.27916-1-leon.anavi@konsulko.com>
References: <20200811114430.27916-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.5.0:

- New custom test client: `flask_login.FlaskLoginClient`.
  You can use this to write clearer automated tests.
- Prefix authenticated user_id, remember, and remember_seconds
  in Flask Session with underscores to prevent accidental usage
  in application code.
- Simplify user loading.
- Various documentation improvements.
- Set session ID when setting next.
- Clear session identifier on logout.
- Ensure use of a safe and up-to-date version of Flask.
- Drop support of Python versions: 2.6, 3.3, 3.4

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-flask-login_0.4.1.bb => python3-flask-login_0.5.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-login_0.4.1.bb => python3-flask-login_0.5.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-login_0.4.1.bb b/meta-python/recipes-devtools/python/python3-flask-login_0.5.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-flask-login_0.4.1.bb
rename to meta-python/recipes-devtools/python/python3-flask-login_0.5.0.bb
index ba335579b..d776ce968 100644
--- a/meta-python/recipes-devtools/python/python3-flask-login_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-login_0.5.0.bb
@@ -6,8 +6,8 @@ HOMEPAGE = " https://github.com/maxcountryman/flask-login"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8aa87a1cd9fa41d969ad32cfdac2c596"
 
-SRC_URI[md5sum] = "25b34c74bd509792f291c16e184225df"
-SRC_URI[sha256sum] = "c815c1ac7b3e35e2081685e389a665f2c74d7e077cb93cecabaea352da4752ec"
+SRC_URI[md5sum] = "a2d94aa6ae935345ebc68eb3cbb5fccd"
+SRC_URI[sha256sum] = "6d33aef15b5bcead780acc339464aae8a6e28f13c90d8b1cf9de8b549d1c0b4b"
 
 PYPI_PACKAGE = "Flask-Login"
 
-- 
2.17.1

