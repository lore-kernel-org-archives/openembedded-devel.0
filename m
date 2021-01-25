Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.428.1611588228775116792
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 07:23:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58482 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l43iV-00057d-8v; Mon, 25 Jan 2021 17:23:48 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-socketio: Upgrade 4.6.0 -> 5.0.4
Date: Mon, 25 Jan 2021 17:23:35 +0200
Message-Id: <20210125152337.20937-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210125152337.20937-1-leon.anavi@konsulko.com>
References: <20210125152337.20937-1-leon.anavi@konsulko.com>
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

- Include error message and arguments in CONNECT_ERROR packet
- Fix typos in the documentation
- Updated connection options in the documentation
- Update to match the JavaScript Socket.IO 3.x releases
  (Socket.IO v5 protocol revision)
- Remove unnecessary binary argument
- Remove dependency on the six package
- Added version compatibility chart to README

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-socketio_4.6.0.bb => python3-socketio_5.0.4.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-socketio_4.6.0.bb => python3-socketio_5.0.4.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-socketio_4.6.0.bb b/meta-python/recipes-devtools/python/python3-socketio_5.0.4.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-socketio_4.6.0.bb
rename to meta-python/recipes-devtools/python/python3-socketio_5.0.4.bb
index 7d96398e9..70db342cc 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_4.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.0.4.bb
@@ -9,8 +9,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "python-socketio"
 
-SRC_URI[md5sum] = "44bb7854234e144655ef9c34b0165704"
-SRC_URI[sha256sum] = "358d8fbbc029c4538ea25bcaa283e47f375be0017fcba829de8a3a731c9df25a"
+SRC_URI[sha256sum] = "f53fd0d5bd9f75a70492062f4ae6195ab5d34d67a29024d740f25e468392893e"
 
 PACKAGECONFIG ?= "asyncio_client client"
 PACKAGECONFIG[asyncio_client] = ",,,${PYTHON_PN}-aiohttp ${PYTHON_PN}-websockets"
-- 
2.17.1

