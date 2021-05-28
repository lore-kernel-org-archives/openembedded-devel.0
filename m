Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.6673.1622200151799215464
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 May 2021 04:09:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57792 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lmaMO-0001Il-0Z; Fri, 28 May 2021 14:09:00 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-flask: Extend RDEPENDS
Date: Fri, 28 May 2021 14:08:46 +0300
Message-Id: <20210528110850.22402-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Extend RDEPENDS and add python3-profile to them.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-flask_2.0.1.bb        | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-flask_2.0.1.bb b/meta-python/recipes-devtools/python/python3-flask_2.0.1.bb
index 2c94f82da..6c63a388a 100644
--- a/meta-python/recipes-devtools/python/python3-flask_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_2.0.1.bb
@@ -14,4 +14,10 @@ inherit pypi setuptools3
 
 CLEANBROKEN = "1"
 
-RDEPENDS_${PN} = "${PYTHON_PN}-werkzeug ${PYTHON_PN}-jinja2 ${PYTHON_PN}-itsdangerous ${PYTHON_PN}-click"
+RDEPENDS_${PN} = " \
+    ${PYTHON_PN}-werkzeug \
+    ${PYTHON_PN}-jinja2 \
+    ${PYTHON_PN}-itsdangerous \
+    ${PYTHON_PN}-click \
+    ${PYTHON_PN}-profile \
+"
-- 
2.17.1

