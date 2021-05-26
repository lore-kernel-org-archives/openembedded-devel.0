Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.3857.1622064791744970959
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 14:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46114 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lm19J-0000vH-Pc; Thu, 27 May 2021 00:33:10 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/7] python3-flask-socketio: Upgrade 5.0.1 -> 5.0.3
Date: Thu, 27 May 2021 00:32:45 +0300
Message-Id: <20210526213248.10348-4-leon.anavi@konsulko.com>
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

Upgrade to release 5.0.3:

- Document the use of simple-websocket with the development web
  server
- Show transport in example apps
- Added Open Collective funding option

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-flask-socketio_5.0.1.bb => python3-flask-socketio_5.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-socketio_5.0.1.bb => python3-flask-socketio_5.0.3.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-socketio_5.0.1.bb b/meta-python/recipes-devtools/python/python3-flask-socketio_5.0.3.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-flask-socketio_5.0.1.bb
rename to meta-python/recipes-devtools/python/python3-flask-socketio_5.0.3.bb
index 4c5d0a3fb..5def7621e 100644
--- a/meta-python/recipes-devtools/python/python3-flask-socketio_5.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-socketio_5.0.3.bb
@@ -9,7 +9,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "Flask-SocketIO"
 
-SRC_URI[sha256sum] = "5c4319f5214ada20807857dc8fdf3dc7d2afe8d6dd38f5c516c72e2be47d2227"
+SRC_URI[sha256sum] = "4fb968c43bc384f184cd1a25c1842297c2e3d6efc2f755a61be6d4406858220f"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-flask \
-- 
2.17.1

