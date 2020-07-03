Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.6839.1593768639709748936
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2020 02:30:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56428 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jrI1l-0007av-H5; Fri, 03 Jul 2020 12:30:38 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/10] python3-websocket-client: Upgrade 0.56.0 -> 0.57.0
Date: Fri,  3 Jul 2020 12:30:12 +0300
Message-Id: <20200703093020.3514-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703093020.3514-1-leon.anavi@konsulko.com>
References: <20200703093020.3514-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.57.0:

- wsdump: Fix --headers option
- Fix getting 400 bad request with long proxy authorization string
- Fix for errors that occur when closing websocket from another
  thread
- avoid calling repr(data) if tracing is not enabled
- Fixed typo
- Create dummy `ssl` object
- Show compressed text messages in wsdump.py
- Resolve issue opening socket to intranet on Windows 10 with no
  proxy settings but behind proxy
- Expose http connection header to user
- Improve the readability of HTTP status codes.
- fix the compatible issue with gevent+dnspython
- v should be checked for emptry string before splitting it
- _handshake: hasattr checks on six before accessing the values

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...et-client_0.56.0.bb => python3-websocket-client_0.57.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-websocket-client_0.56.0.bb => python3-websocket-client_0.57.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-websocket-client_0.56.0.bb b/meta-python/recipes-devtools/python/python3-websocket-client_0.57.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-websocket-client_0.56.0.bb
rename to meta-python/recipes-devtools/python/python3-websocket-client_0.57.0.bb
index a3e1bcf393..aaa92f3ccb 100644
--- a/meta-python/recipes-devtools/python/python3-websocket-client_0.56.0.bb
+++ b/meta-python/recipes-devtools/python/python3-websocket-client_0.57.0.bb
@@ -7,8 +7,8 @@ HOMEPAGE = "https://github.com/websocket-client/websocket-client"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c4c4a98fbc4836b81c8c64d6ecb01fc1"
 
-SRC_URI[md5sum] = "89484bd5dac71123ae6a09b2f90fe62c"
-SRC_URI[sha256sum] = "1fd5520878b68b84b5748bb30e592b10d0a91529d5383f74f4964e72b297fd3a"
+SRC_URI[md5sum] = "8061820da5e1de26a6a1a6996d4eebd5"
+SRC_URI[sha256sum] = "d735b91d6d1692a6a181f2a8c9e0238e5f6373356f561bb9dc4c7af36f452010"
 
 PYPI_PACKAGE = "websocket_client"
 inherit pypi setuptools3
-- 
2.17.1

