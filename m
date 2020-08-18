Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.68741.1597764899582520664
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2020 08:34:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45392 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k83da-0004rN-A3; Tue, 18 Aug 2020 18:34:58 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/6] python3-pytest-asyncio: Upgrade 0.12.0 -> 0.14.0
Date: Tue, 18 Aug 2020 18:34:42 +0300
Message-Id: <20200818153444.15728-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200818153444.15728-1-leon.anavi@konsulko.com>
References: <20200818153444.15728-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.14.0:

- event_loop fixture behavior now is coherent on all scopes.

License-Update: Use file LICENSE to check the license.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...st-asyncio_0.12.0.bb => python3-pytest-asyncio_0.14.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-asyncio_0.12.0.bb => python3-pytest-asyncio_0.14.0.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.12.0.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.14.0.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python3-pytest-asyncio_0.12.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-asyncio_0.14.0.bb
index d83c42de3..1e94c25f7 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.14.0.bb
@@ -1,9 +1,10 @@
 DESCRIPTION = "pytest-asyncio is an Apache2 licensed library, written in Python, for testing asyncio code with pytest"
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.rst;md5=3faed73a08162b5b5367cdcaee996f75"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
-SRC_URI[sha256sum] = "475bd2f3dc0bc11d2463656b3cbaafdbec5a47b47508ea0b329ee693040eebd2"
+SRC_URI[md5sum] = "b63593bc08f445f6e3f14c34128a68ed"
+SRC_URI[sha256sum] = "9882c0c6b24429449f5f969a5158b528f39bde47dc32e85b9f0403965017e700"
 
 inherit pypi setuptools3
 
-- 
2.17.1

