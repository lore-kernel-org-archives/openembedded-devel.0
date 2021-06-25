Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.5552.1624616161488731330
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Jun 2021 03:16:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34510 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lwisM-0005zp-8g; Fri, 25 Jun 2021 13:15:55 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/6] python3-google-auth: Add recipe
Date: Fri, 25 Jun 2021 13:15:43 +0300
Message-Id: <20210625101545.30040-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210625101545.30040-1-leon.anavi@konsulko.com>
References: <20210625101545.30040-1-leon.anavi@konsulko.com>
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

Add Google Authentication Library.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-google-auth_1.32.0.bb      | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-google-auth_1.32.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_1.32.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_1.32.0.bb
new file mode 100644
index 0000000000..d492bbbcb7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-google-auth_1.32.0.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Google Authentication Library"
+HOMEPAGE = "https://github.com/googleapis/google-auth-library-python"
+AUTHOR = "Google Cloud Platform"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "e34e5f5de5610b202f9b40ebd9f8b27571d5c5537db9afed3a72b2db5a345039"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-asyncio \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-numbers \
+"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-aiohttp \
+    ${PYTHON_PN}-cachetools \
+    ${PYTHON_PN}-pyasn1-modules \
+    ${PYTHON_PN}-rsa \
+    ${PYTHON_PN}-six \
+"
-- 
2.17.1

