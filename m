Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.20791.1598540113584545511
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2020 07:55:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58886 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kBJJ2-0001it-CU; Thu, 27 Aug 2020 17:55:13 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/7] python3-flask-babel: Upgrade 1.0.0 -> 2.0.0
Date: Thu, 27 Aug 2020 17:54:58 +0300
Message-Id: <20200827145504.29147-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.0.0:

- Drop Python2 support
- Tests moved from unittest to pytest
- Domain and caching support from Flask-BabelEx
- Documentation moved from python-hosted to Github Pages.
- CI moved from Travisci to Github Actions
- Small documentation improvements.
- Removed uncessary checks on get_translations()
- localeselector and timezoneselector can be changed after
  creation.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...thon3-flask-babel_1.0.0.bb => python3-flask-babel_2.0.0.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-babel_1.0.0.bb => python3-flask-babel_2.0.0.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-babel_1.0.0.bb b/meta-python/recipes-devtools/python/python3-flask-babel_2.0.0.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-flask-babel_1.0.0.bb
rename to meta-python/recipes-devtools/python/python3-flask-babel_2.0.0.bb
index d968be3ee..8a01b49b4 100644
--- a/meta-python/recipes-devtools/python/python3-flask-babel_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-babel_2.0.0.bb
@@ -2,7 +2,8 @@ DESCRIPTION = "i18n and l10n support for Flask based on babel and pytz"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=51917f3e8e858f5ae295a7d0e2eb3cc9"
 
-SRC_URI[sha256sum] = "d6a70468f9a8919d59fba2a291a003da3a05ff884275dddbd965f3b98b09ab3e"
+SRC_URI[md5sum] = "50d5e92d96ef58787bf85b5a1b0a5567"
+SRC_URI[sha256sum] = "f9faf45cdb2e1a32ea2ec14403587d4295108f35017a7821a2b1acb8cfd9257d"
 
 PYPI_PACKAGE = "Flask-Babel"
 
-- 
2.17.1

