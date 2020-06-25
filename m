Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.6709.1593076095239724432
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 02:08:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47184 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1joNrh-0005y7-Ot; Thu, 25 Jun 2020 12:08:14 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/12] python3-socketio: Upgrade 4.5.1 -> 4.6.0
Date: Thu, 25 Jun 2020 12:07:10 +0300
Message-Id: <20200625090719.16068-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625090719.16068-1-leon.anavi@konsulko.com>
References: <20200625090719.16068-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.6.0:

- Improved handling of rejected connections
- Fix multi-namespace disconnect logic
- AsyncPubSubManager does not await for can_disconnect()
- Require a recipient in call() function in the server
- ASGI startup and shutdown lifespan handlers
- Remove references to Python 2.7 in the documentation
- Fix server example in docstring
- Fix documentation typo

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-socketio_4.5.1.bb => python3-socketio_4.6.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-socketio_4.5.1.bb => python3-socketio_4.6.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-socketio_4.5.1.bb b/meta-python/recipes-devtools/python/python3-socketio_4.6.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-socketio_4.5.1.bb
rename to meta-python/recipes-devtools/python/python3-socketio_4.6.0.bb
index 54ecbbaa0..7d96398e9 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_4.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_4.6.0.bb
@@ -9,8 +9,8 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "python-socketio"
 
-SRC_URI[md5sum] = "3dbd0a2ebcf34632f67327b665cbb951"
-SRC_URI[sha256sum] = "149b98c33f8c3d09273fb4ebeb83781e4dc9411b56b27d9f058bec1bd1ed74b7"
+SRC_URI[md5sum] = "44bb7854234e144655ef9c34b0165704"
+SRC_URI[sha256sum] = "358d8fbbc029c4538ea25bcaa283e47f375be0017fcba829de8a3a731c9df25a"
 
 PACKAGECONFIG ?= "asyncio_client client"
 PACKAGECONFIG[asyncio_client] = ",,,${PYTHON_PN}-aiohttp ${PYTHON_PN}-websockets"
-- 
2.17.1

