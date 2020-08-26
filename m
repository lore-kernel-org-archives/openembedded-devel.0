Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.15266.1598456450043410480
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2020 08:40:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=50396 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kAxXb-0002yf-DM; Wed, 26 Aug 2020 18:40:49 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/6] python3-flask-socketio: Upgrade 4.2.1 -> 4.3.1
Date: Wed, 26 Aug 2020 18:40:20 +0300
Message-Id: <20200826154020.29208-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826154020.29208-1-leon.anavi@konsulko.com>
References: <20200826154020.29208-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.3.1:

- Fix is_connected in test client
- Handle callbacks for emits outside of request context
- Improve test client unit test to use two concurrent clients
- Accept skip_sid argument in emit
- Fix is_connected() method in test client
- Log warning when gevent is used but WebSocket is missing
- More accurate logging documentation

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...lask-socketio_4.2.1.bb => python3-flask-socketio_4.3.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-socketio_4.2.1.bb => python3-flask-socketio_4.3.1.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-socketio_4.2.1.bb b/meta-python/recipes-devtools/python/python3-flask-socketio_4.3.1.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-flask-socketio_4.2.1.bb
rename to meta-python/recipes-devtools/python/python3-flask-socketio_4.3.1.bb
index e5fc54136..b8631bf50 100644
--- a/meta-python/recipes-devtools/python/python3-flask-socketio_4.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-socketio_4.3.1.bb
@@ -9,8 +9,8 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "Flask-SocketIO"
 
-SRC_URI[md5sum] = "b23222fb7dd2f0676d78bbe24153fd80"
-SRC_URI[sha256sum] = "2172dff1e42415ba480cee02c30c2fc833671ff326f1598ee3d69aa02cf768ec"
+SRC_URI[md5sum] = "d7992b0b4aaf473b7eff21fc14e8d1b2"
+SRC_URI[sha256sum] = "36c1d5765010d1f4e4f05b4cc9c20c289d9dc70698c88d1addd0afcfedc5b062"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-flask \
-- 
2.17.1

