Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.5556.1624616164814314786
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Jun 2021 03:16:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34510 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lwisK-0005zp-UY; Fri, 25 Jun 2021 13:15:53 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/6] python3-httplib2: Fix runtime dependencies
Date: Fri, 25 Jun 2021 13:15:41 +0300
Message-Id: <20210625101545.30040-2-leon.anavi@konsulko.com>
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

Add python3-compression, python3-netclient and python3-pyparsing
as runtime dependencies.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-httplib2_0.19.1.bb      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-httplib2_0.19.1.bb b/meta-python/recipes-devtools/python/python3-httplib2_0.19.1.bb
index a16f8d9d20..122b4bd8b7 100644
--- a/meta-python/recipes-devtools/python/python3-httplib2_0.19.1.bb
+++ b/meta-python/recipes-devtools/python/python3-httplib2_0.19.1.bb
@@ -7,3 +7,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=56e5e931172b6164b62dc7c4aba6c8cf"
 SRC_URI[sha256sum] = "0b12617eeca7433d4c396a100eaecfa4b08ee99aa881e6df6e257a7aad5d533d"
 
 inherit pypi setuptools3
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-compression \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-pyparsing \
+"
-- 
2.17.1

