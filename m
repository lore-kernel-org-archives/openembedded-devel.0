Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.1066.1616603878255939136
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 09:37:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53316 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lP6W5-0008Nt-NC; Wed, 24 Mar 2021 18:37:58 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-lazy-object-proxy: Upgrade 1.5.2 -> 1.6.0
Date: Wed, 24 Mar 2021 18:37:45 +0200
Message-Id: <20210324163746.19010-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210324163746.19010-1-leon.anavi@konsulko.com>
References: <20210324163746.19010-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.6.0:

- Added support for async special methods (__aiter__, __anext__,
  __await__, __aenter__, __aexit__). These are used in the async
  for, await` and ``async with statements.
- Added the __resolved__ property. You can use it to check if the
  factory has been called.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...object-proxy_1.5.2.bb => python3-lazy-object-proxy_1.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-lazy-object-proxy_1.5.2.bb => python3-lazy-object-proxy_1.6.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.2.bb b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.6.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.2.bb
rename to meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.6.0.bb
index 3ff7a126e..700c70e53 100644
--- a/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-lazy-object-proxy_1.6.0.bb
@@ -6,6 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9c5c2c74370826468065c5702b8a1fcf"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "5944a9b95e97de1980c65f03b79b356f30a43de48682b8bdd90aa5089f0ec1f4"
+SRC_URI[sha256sum] = "489000d368377571c6f982fba6497f2aa13c6d1facc40660963da62f5c379726"
 
 inherit pypi setuptools3
-- 
2.17.1

