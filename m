Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.15209.1598456443647117337
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2020 08:40:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=50396 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kAxXV-0002yf-19; Wed, 26 Aug 2020 18:40:43 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/6] python3-flask-wtf: Upgrade 0.14.2 -> 0.14.3
Date: Wed, 26 Aug 2020 18:40:18 +0300
Message-Id: <20200826154020.29208-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826154020.29208-1-leon.anavi@konsulko.com>
References: <20200826154020.29208-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.14.3:

- xrange changed to range, python3 compatible
- Move Iterable import to _compat module
- Fix deprecation warning
- Remove flaskr example

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-flask-wtf_0.14.2.bb => python3-flask-wtf_0.14.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-wtf_0.14.2.bb => python3-flask-wtf_0.14.3.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-wtf_0.14.2.bb b/meta-python/recipes-devtools/python/python3-flask-wtf_0.14.3.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-flask-wtf_0.14.2.bb
rename to meta-python/recipes-devtools/python/python3-flask-wtf_0.14.3.bb
index 33387045e..213a0b58b 100644
--- a/meta-python/recipes-devtools/python/python3-flask-wtf_0.14.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-wtf_0.14.3.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "Simple integration of Flask and WTForms."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3ca6bb31670492f791e6a9f2fb9f8a80"
 
-SRC_URI[md5sum] = "586f50f233926cade42e3d744aca3e8f"
-SRC_URI[sha256sum] = "5d14d55cfd35f613d99ee7cba0fc3fbbe63ba02f544d349158c14ca15561cc36"
+SRC_URI[md5sum] = "1b60b7dd1245b0d0173c21123717af61"
+SRC_URI[sha256sum] = "d417e3a0008b5ba583da1763e4db0f55a1269d9dd91dcc3eb3c026d3c5dbd720"
 
 PYPI_PACKAGE = "Flask-WTF"
 
-- 
2.17.1

