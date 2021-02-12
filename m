Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.744.1613094389256207734
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Feb 2021 17:46:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: ejo@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1lANXP-0000sk-KC; Fri, 12 Feb 2021 02:46:27 +0100
Received: from ejo by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1lANXO-00013y-Nz; Fri, 12 Feb 2021 02:46:26 +0100
From: =?UTF-8?B?RW5yaWNvIErDtnJucw==?= <ejo@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: ejo@pengutronix.de,
	uvv.mail@gmail.com,
	akuster808@gmail.com
Subject: [meta-python][dunfell][PATCH] python3-aiohttp: added missing RDEPENDs
Date: Fri, 12 Feb 2021 02:46:26 +0100
Message-Id: <20210212014626.4041-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Content-Transfer-Encoding: 8bit

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

aiohttp implicitly RDEPENDs on html, json, and socketserver modules,
which are part of python3 recipe. They can't be properly imported if
they are missing from RDEPENDS

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry-picked from commit 8e7c57bd8f8250251e54fcbe149dc81743c0e30a)
Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb
index 121447cdb..24eb021de 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.6.2.bb
@@ -13,9 +13,11 @@ RDEPENDS_${PN} = "\
     ${PYTHON_PN}-async-timeout \
     ${PYTHON_PN}-attrs \
     ${PYTHON_PN}-chardet \
+    ${PYTHON_PN}-html \
     ${PYTHON_PN}-idna-ssl \
+    ${PYTHON_PN}-json \
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-multidict \
-    ${PYTHON_PN}-typing \
+    ${PYTHON_PN}-netserver \
     ${PYTHON_PN}-yarl \
 "
-- 
2.29.2

