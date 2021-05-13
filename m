Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.13245.1620912228356502718
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 May 2021 06:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=44224 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lhBJZ-0004kU-6T; Thu, 13 May 2021 16:23:47 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 04/10] python3-websocket-client: Upgrade 0.58.0 -> 0.59.0
Date: Thu, 13 May 2021 16:23:26 +0300
Message-Id: <20210513132332.3745-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210513132332.3745-1-leon.anavi@konsulko.com>
References: <20210513132332.3745-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.59.0:

- Last main release to support Python 2
- Fix Python 2 urlparse scheme
- Add support for headers with multiple value
- Add debug support for reserved custom status codes
- Allow multiple Set-Cookie: headers
- Simplified cookie sorting
- Add no_proxy support
- Add Host header to HTTP proxy request
- Improve PEP8 style compliance

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...et-client_0.58.0.bb => python3-websocket-client_0.59.0.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-websocket-client_0.58.0.bb => python3-websocket-client_0.59.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-websocket-client_0.58.0.bb b/meta-python/recipes-devtools/python/python3-websocket-client_0.59.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-websocket-client_0.58.0.bb
rename to meta-python/recipes-devtools/python/python3-websocket-client_0.59.0.bb
index a5d7d901b1..af902bda0c 100644
--- a/meta-python/recipes-devtools/python/python3-websocket-client_0.58.0.bb
+++ b/meta-python/recipes-devtools/python/python3-websocket-client_0.59.0.bb
@@ -7,9 +7,7 @@ HOMEPAGE = "https://github.com/websocket-client/websocket-client"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c96ca6c1de8adc025adfada81d06fba5"
 
-SRC_URI[sha256sum] = "63509b41d158ae5b7f67eb4ad20fecbb4eee99434e73e140354dc3ff8e09716f"
-
-PYPI_PACKAGE = "websocket_client"
+SRC_URI[sha256sum] = "d376bd60eace9d437ab6d7ee16f4ab4e821c9dae591e1b783c58ebd8aaf80c5c"
 
 inherit pypi setuptools3
 
-- 
2.17.1

