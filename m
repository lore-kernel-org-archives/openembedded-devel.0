Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.5623.1615883877390084027
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Mar 2021 01:37:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35240 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lM5D9-0006gf-Id; Tue, 16 Mar 2021 10:37:56 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/6] python3-socketio: Upgrade 5.0.4 -> 5.1.0
Date: Tue, 16 Mar 2021 10:37:43 +0200
Message-Id: <20210316083744.17558-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210316083744.17558-1-leon.anavi@konsulko.com>
References: <20210316083744.17558-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.1.0:

- Added wait argument to client's connect method
- Invoke the disconnect handler when the client initiates a
  disconnection
- Pass auth information sent by client to the connect handler
- Catch all possible Redis errors
- Reset message queue sleep timer upon reconnect
- Fixed bad event object used by asyncio client reconnect logic
- Adding missing example of async client implementation to
  documentation
- Add scrolling to documentation sidebar
- Typo fix in documentation

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-socketio_5.0.4.bb => python3-socketio_5.1.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-socketio_5.0.4.bb => python3-socketio_5.1.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.0.4.bb b/meta-python/recipes-devtools/python/python3-socketio_5.1.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-socketio_5.0.4.bb
rename to meta-python/recipes-devtools/python/python3-socketio_5.1.0.bb
index 70db342cc..8cf6a96ba 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_5.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.1.0.bb
@@ -9,7 +9,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "python-socketio"
 
-SRC_URI[sha256sum] = "f53fd0d5bd9f75a70492062f4ae6195ab5d34d67a29024d740f25e468392893e"
+SRC_URI[sha256sum] = "338cc29abb6f3ca14c88f1f8d05ed27c690df4648f62062b299f92625bbf7093"
 
 PACKAGECONFIG ?= "asyncio_client client"
 PACKAGECONFIG[asyncio_client] = ",,,${PYTHON_PN}-aiohttp ${PYTHON_PN}-websockets"
-- 
2.17.1

