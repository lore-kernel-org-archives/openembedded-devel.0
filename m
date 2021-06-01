Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.55666.1622541999058805390
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Jun 2021 03:06:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=49790 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lo1IC-0002gA-4m; Tue, 01 Jun 2021 13:06:36 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-click-repl: Upgrade 0.1.6 -> 0.2.0
Date: Tue,  1 Jun 2021 13:06:27 +0300
Message-Id: <20210601100631.3277-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.2.0:

- Use tox-travis instead of custom runtox script
- Update tests to expect hyphens
- Backwards compatibility between click 7 & 8

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...thon3-click-repl_0.1.6.bb => python3-click-repl_0.2.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-click-repl_0.1.6.bb => python3-click-repl_0.2.0.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python3-click-repl_0.1.6.bb b/meta-python/recipes-devtools/python/python3-click-repl_0.2.0.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python3-click-repl_0.1.6.bb
rename to meta-python/recipes-devtools/python/python3-click-repl_0.2.0.bb
index fce9f9805..76affe274 100644
--- a/meta-python/recipes-devtools/python/python3-click-repl_0.1.6.bb
+++ b/meta-python/recipes-devtools/python/python3-click-repl_0.2.0.bb
@@ -3,7 +3,8 @@ HOMEPAGE = "https://github.com/untitaker/click-repl"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fee2943fdd4d8afbac9ccc1c8ac137d5"
 
-SRC_URI[md5sum] = "2d5f4d42cbd1da9a50a49dff4d6087ca"
-SRC_URI[sha256sum] = "b9f29d52abc4d6059f8e276132a111ab8d94980afe6a5432b9d996544afa95d5"
+SRC_URI[sha256sum] = "cd12f68d745bf6151210790540b4cb064c7b13e571bc64b6957d98d120dacfd8"
 
 inherit pypi setuptools3
+
+RDEPENDS_${PN} = "${PYTHON_PN}-click"
-- 
2.17.1

