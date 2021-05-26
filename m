Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.3806.1622064796604662503
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 14:33:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46114 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lm19O-0000vH-KH; Thu, 27 May 2021 00:33:15 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 7/7] python3-socketio: Upgrade 5.1.0 -> 5.3.0
Date: Thu, 27 May 2021 00:32:48 +0300
Message-Id: <20210526213248.10348-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210526213248.10348-1-leon.anavi@konsulko.com>
References: <20210526213248.10348-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.3.0:

- Document WebSocket support for threading mode
- Allow functions to be used for URL, headers and auth data in
  client connection
- Emit events to multiple rooms
- More descriptive error when joining a room on a bad namespace
- Document the use of arguments in the connect_error handler
- Document that callbacks cannot be used in external processes
- Improve start_background_task() example in the documentation
- Added Open Collective funding option
- Remove Python 2 from PyPI classifiers

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-socketio_5.1.0.bb => python3-socketio_5.3.0.bb}   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-socketio_5.1.0.bb => python3-socketio_5.3.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.1.0.bb b/meta-python/recipes-devtools/python/python3-socketio_5.3.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-socketio_5.1.0.bb
rename to meta-python/recipes-devtools/python/python3-socketio_5.3.0.bb
index 8cf6a96ba..4a9d3ebef 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.3.0.bb
@@ -9,7 +9,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "python-socketio"
 
-SRC_URI[sha256sum] = "338cc29abb6f3ca14c88f1f8d05ed27c690df4648f62062b299f92625bbf7093"
+SRC_URI[sha256sum] = "3dcc9785aaeef3a9eeb36c3818095662342744bdcdabd050fe697cdb826a1c2b"
 
 PACKAGECONFIG ?= "asyncio_client client"
 PACKAGECONFIG[asyncio_client] = ",,,${PYTHON_PN}-aiohttp ${PYTHON_PN}-websockets"
@@ -24,4 +24,5 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-threading \
     ${PYTHON_PN}-six \
     ${PYTHON_PN}-attrs \
+    ${PYTHON_PN}-bidict \
     "
-- 
2.17.1

