Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.5591.1621324894189413736
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 May 2021 01:01:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40250 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1liufT-00068l-MT; Tue, 18 May 2021 11:01:32 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-websocket-client: Upgrade 0.59.0 -> 1.0.0
Date: Tue, 18 May 2021 11:01:24 +0300
Message-Id: <20210518080125.30656-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210518080125.30656-1-leon.anavi@konsulko.com>
References: <20210518080125.30656-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.0.0:

- Removed Python 2 code, now only Python 3 compatible
- Use semver for release versions, unlike breaking release 0.58.0
- Enhance enableTrace output
- Improve unit tests to over 80% code coverage
- Fix old _app.py close status code bug
- Replace select import with selectors

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ocket-client_0.59.0.bb => python3-websocket-client_1.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-websocket-client_0.59.0.bb => python3-websocket-client_1.0.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-websocket-client_0.59.0.bb b/meta-python/recipes-devtools/python/python3-websocket-client_1.0.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-websocket-client_0.59.0.bb
rename to meta-python/recipes-devtools/python/python3-websocket-client_1.0.0.bb
index af902bda0c..4980f43b92 100644
--- a/meta-python/recipes-devtools/python/python3-websocket-client_0.59.0.bb
+++ b/meta-python/recipes-devtools/python/python3-websocket-client_1.0.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/websocket-client/websocket-client"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c96ca6c1de8adc025adfada81d06fba5"
 
-SRC_URI[sha256sum] = "d376bd60eace9d437ab6d7ee16f4ab4e821c9dae591e1b783c58ebd8aaf80c5c"
+SRC_URI[sha256sum] = "5051b38a2f4c27fbd7ca077ebb23ec6965a626ded5a95637f36be1b35b6c4f81"
 
 inherit pypi setuptools3
 
-- 
2.17.1

