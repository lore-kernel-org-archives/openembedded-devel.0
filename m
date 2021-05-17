Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.17574.1621249901232526508
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 May 2021 04:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=33204 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lib9v-0007uL-LS; Mon, 17 May 2021 14:11:40 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-aiofiles: Upgrade 0.6.0 -> 0.7.0
Date: Mon, 17 May 2021 14:11:28 +0300
Message-Id: <20210517111129.11619-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210517111129.11619-1-leon.anavi@konsulko.com>
References: <20210517111129.11619-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.7.0:

- Added the aiofiles.tempfile module for async temporary files.
- Switched to Poetry and GitHub actions.
- Dropped 3.5 support.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-aiofiles_0.6.0.bb => python3-aiofiles_0.7.0.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aiofiles_0.6.0.bb => python3-aiofiles_0.7.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-aiofiles_0.6.0.bb b/meta-python/recipes-devtools/python/python3-aiofiles_0.7.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-aiofiles_0.6.0.bb
rename to meta-python/recipes-devtools/python/python3-aiofiles_0.7.0.bb
index 89157b504f..9d7a49eb63 100644
--- a/meta-python/recipes-devtools/python/python3-aiofiles_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aiofiles_0.7.0.bb
@@ -4,8 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
-SRC_URI[md5sum] = "3b7ba03babd3d3a6101524469358843e"
-SRC_URI[sha256sum] = "e0281b157d3d5d59d803e3f4557dcc9a3dff28a4dd4829a9ff478adae50ca092"
+SRC_URI[sha256sum] = "a1c4fc9b2ff81568c83e21392a82f344ea9d23da906e4f6a52662764545e19d4"
 
 PYPI_PACKAGE = "aiofiles"
 
-- 
2.17.1

