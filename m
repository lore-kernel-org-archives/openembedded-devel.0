Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.5530.1624616165629250958
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Jun 2021 03:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34510 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lwisL-0005zp-Dt; Fri, 25 Jun 2021 13:15:54 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/6] python3-google-api-core: Add recipe
Date: Fri, 25 Jun 2021 13:15:42 +0300
Message-Id: <20210625101545.30040-3-leon.anavi@konsulko.com>
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

Add Google API client core library.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-google-api-core_1.30.0.bb  | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-google-api-core_1.30.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-google-api-core_1.30.0.bb b/meta-python/recipes-devtools/python/python3-google-api-core_1.30.0.bb
new file mode 100644
index 0000000000..08cc35d064
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-google-api-core_1.30.0.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "Google API client core library"
+HOMEPAGE = "https://github.com/googleapis/python-api-core"
+AUTHOR = "Google LLC"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "0724d354d394b3d763bc10dfee05807813c5210f0bd9b8e2ddf6b6925603411c"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-asyncio \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-math \
+"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-googleapis-common-protos \
+    ${PYTHON_PN}-google-auth \
+    ${PYTHON_PN}-grpcio \
+    ${PYTHON_PN}-protobuf \
+    ${PYTHON_PN}-pytz \
+    ${PYTHON_PN}-requests \
+    ${PYTHON_PN}-six \
+"
-- 
2.17.1

