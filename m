Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.40017.1629210591003832332
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Aug 2021 07:29:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=49388 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mG064-0000zE-0R; Tue, 17 Aug 2021 17:29:48 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-websocket-client: Upgrade 1.1.0 -> 1.2.1
Date: Tue, 17 Aug 2021 17:29:39 +0300
Message-Id: <20210817142939.6317-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.2.1:

- Fix python-socks dependency issue
- Replace echo.websocket.org with a local websockets echo server
  for unit tests
- Fix: Transition from LGPL 2.1 license to Apache 2.0 license
- Revert and reimplement SOCKS proxy support with python-socks
  instead of PySocks

License-Update: Transition from LGPL 2.1 to Apache 2.0

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...t-client_1.1.0.bb => python3-websocket-client_1.2.1.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-websocket-client_1.1.0.bb => python3-websocket-client_1.2.1.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-websocket-client_1.1.0.bb b/meta-python/recipes-devtools/python/python3-websocket-client_1.2.1.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-websocket-client_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-websocket-client_1.2.1.bb
index c5f2f12774..b632853191 100644
--- a/meta-python/recipes-devtools/python/python3-websocket-client_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-websocket-client_1.2.1.bb
@@ -4,13 +4,14 @@ websocket-client module is WebSocket client for python. \
 This provide the low level APIs for WebSocket. All APIs \
 are the synchronous functions."
 HOMEPAGE = "https://github.com/websocket-client/websocket-client"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c96ca6c1de8adc025adfada81d06fba5"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b1e01b26bacfc2232046c90a330332b3"
 
-SRC_URI[sha256sum] = "b68e4959d704768fa20e35c9d508c8dc2bbc041fd8d267c0d7345cffe2824568"
+SRC_URI[sha256sum] = "8dfb715d8a992f5712fff8c843adae94e22b22a99b2c5e6b0ec4a1a981cc4e0d"
 
 inherit pypi setuptools3
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-six \
+    ${PYTHON_PN}-logging \
 "
-- 
2.17.1

