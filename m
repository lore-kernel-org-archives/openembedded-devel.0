Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web12.235.1613091526175881875
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Feb 2021 16:58:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: ejo@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1lAMnD-0004lt-Hq; Fri, 12 Feb 2021 01:58:43 +0100
Received: from ejo by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1lAMnB-0006ed-Pt; Fri, 12 Feb 2021 01:58:41 +0100
From: =?UTF-8?B?RW5yaWNvIErDtnJucw==?= <ejo@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: ejo@pengutronix.de
Subject: [meta-python][PATCH] python3-aiohttp: add missing RDEPENDS on python3-typing-extensions
Date: Fri, 12 Feb 2021 01:58:41 +0100
Message-Id: <20210212005841.25534-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Content-Transfer-Encoding: 8bit

Since aiohttp PR #5078 was backported to 3.7 release
(https://github.com/aio-libs/aiohttp/pull/5079), aiohttp depends on
'typing_extensions' python module [1], provided by python3-typing-extensions
package in meta-python.

[1] https://github.com/aio-libs/aiohttp/blob/v3.7.2/setup.py#L74

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 meta-python/recipes-devtools/python/python3-aiohttp_3.7.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.3.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.3.bb
index bccbd4b0e..5d62e0676 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.3.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.3.bb
@@ -18,5 +18,6 @@ RDEPENDS_${PN} = "\
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-multidict \
     ${PYTHON_PN}-netserver \
+    ${PYTHON_PN}-typing-extensions \
     ${PYTHON_PN}-yarl \
 "
-- 
2.29.2

