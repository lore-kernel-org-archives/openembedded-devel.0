Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.3980.1626427288275667793
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jul 2021 02:21:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59848 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1m4K28-0008Em-NE; Fri, 16 Jul 2021 12:21:25 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-websocket-client: Upgrade 1.0.1 -> 1.1.0
Date: Fri, 16 Jul 2021 12:21:17 +0300
Message-Id: <20210716092117.31730-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210716092117.31730-1-leon.anavi@konsulko.com>
References: <20210716092117.31730-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.1.0:

- Set enable_multithread to True by default
- Performance improvement in _mask() function
- Performance improvement in recv_strict() function
- Performance improvement by removing numpy-related code
- Support uppercase no_proxy, http_proxy, https_proxy env vars
- Add sslopt 'server_hostname' support
- Replace deprecated ssl.PROTOCOL_SSLv23 with ssl.PROTOCOL_TLS
- Update documentation, README

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...socket-client_1.0.1.bb => python3-websocket-client_1.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-websocket-client_1.0.1.bb => python3-websocket-client_1.1.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-websocket-client_1.0.1.bb b/meta-python/recipes-devtools/python/python3-websocket-client_1.1.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-websocket-client_1.0.1.bb
rename to meta-python/recipes-devtools/python/python3-websocket-client_1.1.0.bb
index da4e05f308..b46392aeef 100644
--- a/meta-python/recipes-devtools/python/python3-websocket-client_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-websocket-client_1.1.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/websocket-client/websocket-client"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c96ca6c1de8adc025adfada81d06fba5"
 
-SRC_URI[sha256sum] = "3e2bf58191d4619b161389a95bdce84ce9e0b24eb8107e7e590db682c2d0ca81"
+SRC_URI[sha256sum] = "b68e4959d704768fa20e35c9d508c8dc2bbc041fd8d267c0d7345cffe2824568"
 
 inherit pypi setuptools3
 
-- 
2.17.1

