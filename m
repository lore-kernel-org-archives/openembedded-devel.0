Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.8419.1586859906444426294
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2020 03:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47782 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jOIkY-0008UL-IH; Tue, 14 Apr 2020 13:25:03 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python2][PATCHv2 1/2] python-websocket-client: move from meta-virtualization
Date: Tue, 14 Apr 2020 13:24:56 +0300
Message-Id: <1586859897-2879-1-git-send-email-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.7.4
X-OutGoing-Spam-Status: No, score=-1.0
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

Support for Python 2 has been dropped in meta-virtualization. Move
recipe python-websocket-client and other related recipes to layer
meta-python2 for backward compatibility of legacy projects.
Upgraded to 0.57.0, the latest version as of the moment.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 recipes-devtools/python/python-websocket-client_0.57.0.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 recipes-devtools/python/python-websocket-client_0.57.0.bb

diff --git a/recipes-devtools/python/python-websocket-client_0.57.0.bb b/recipes-devtools/python/python-websocket-client_0.57.0.bb
new file mode 100644
index 0000000..0fc21b0
--- /dev/null
+++ b/recipes-devtools/python/python-websocket-client_0.57.0.bb
@@ -0,0 +1,11 @@
+SUMMARY = "WebSocket client for python. hybi13 is supported."
+HOMEPAGE = "https://github.com/websocket-client/websocket-client.git"
+LICENSE = "LGPL-3.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c4c4a98fbc4836b81c8c64d6ecb01fc1"
+
+inherit pypi setuptools
+
+PYPI_PACKAGE = "websocket_client"
+
+SRC_URI[md5sum] = "8061820da5e1de26a6a1a6996d4eebd5"
+SRC_URI[sha256sum] = "d735b91d6d1692a6a181f2a8c9e0238e5f6373356f561bb9dc4c7af36f452010"
-- 
2.7.4

