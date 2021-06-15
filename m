Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.6764.1623748906485559428
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jun 2021 02:21:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=54390 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lt5GS-0006XG-Nm; Tue, 15 Jun 2021 12:21:45 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-ifaddr: Fix RDEPENDS
Date: Tue, 15 Jun 2021 12:21:32 +0300
Message-Id: <20210615092132.6539-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210615092132.6539-1-leon.anavi@konsulko.com>
References: <20210615092132.6539-1-leon.anavi@konsulko.com>
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

Add ctypes to the runtime dependencies.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-ifaddr_0.1.7.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-ifaddr_0.1.7.bb b/meta-python/recipes-devtools/python/python3-ifaddr_0.1.7.bb
index 4fff7d1e58..6d4fab3c98 100644
--- a/meta-python/recipes-devtools/python/python3-ifaddr_0.1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-ifaddr_0.1.7.bb
@@ -8,3 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8debe8d42320ec0ff24665319b625a5e"
 SRC_URI[sha256sum] = "1f9e8a6ca6f16db5a37d3356f07b6e52344f6f9f7e806d618537731669eb1a94"
 
 inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-ctypes \
+"
-- 
2.17.1

