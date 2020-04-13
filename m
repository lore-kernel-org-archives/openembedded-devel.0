Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.2337.1586807359050171646
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Apr 2020 12:49:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55876 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jO550-0000VV-4o; Mon, 13 Apr 2020 22:49:15 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python2][PATCH 2/3] python-websocket-client: move from meta-virtualization
Date: Mon, 13 Apr 2020 22:49:08 +0300
Message-Id: <1586807349-28557-2-git-send-email-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586807349-28557-1-git-send-email-leon.anavi@konsulko.com>
References: <1586807349-28557-1-git-send-email-leon.anavi@konsulko.com>
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
python-websocket-client and other related recipes to meta-python2
for backward compatibility of legacy projects.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 recipes-devtools/python/python-websocket-client_0.44.0.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 recipes-devtools/python/python-websocket-client_0.44.0.bb

diff --git a/recipes-devtools/python/python-websocket-client_0.44.0.bb b/recipes-devtools/python/python-websocket-client_0.44.0.bb
new file mode 100644
index 0000000..962d29f
--- /dev/null
+++ b/recipes-devtools/python/python-websocket-client_0.44.0.bb
@@ -0,0 +1,11 @@
+SUMMARY = "WebSocket client for python. hybi13 is supported."
+HOMEPAGE = "https://github.com/websocket-client/websocket-client.git"
+LICENSE = "LGPL-3.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=18b09a20dd186af4fd60f1a08311628c"
+
+inherit pypi setuptools
+
+PYPI_PACKAGE = "websocket_client"
+
+SRC_URI[md5sum] = "73d87aa16a2212da448b30aca9c5bf3b"
+SRC_URI[sha256sum] = "15f585566e2ea7459136a632b9785aa081093064391878a448c382415e948d72"
-- 
2.7.4

