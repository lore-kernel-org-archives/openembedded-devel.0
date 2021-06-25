Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.5527.1624616162335923835
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Jun 2021 03:16:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34510 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lwisN-0005zp-3h; Fri, 25 Jun 2021 13:15:55 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/6] python3-googleapis-common-protos: Add recipe
Date: Fri, 25 Jun 2021 13:15:44 +0300
Message-Id: <20210625101545.30040-5-leon.anavi@konsulko.com>
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

Add common protobufs used in Google APIs.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python3-googleapis-common-protos_1.53.0.bb     | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.53.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.53.0.bb b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.53.0.bb
new file mode 100644
index 0000000000..2c59ae86d2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.53.0.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Common protobufs used in Google APIs"
+HOMEPAGE = "https://github.com/googleapis/python-api-common-protos"
+AUTHOR = "Google LLC"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "a88ee8903aa0a81f6c3cec2d5cf62d3c8aa67c06439b0496b49048fb1854ebf4"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-grpcio \
+    ${PYTHON_PN}-protobuf \
+"
-- 
2.17.1

