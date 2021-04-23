Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.6694.1619165020956303070
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Apr 2021 01:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47740 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lZqmn-00018D-Rh; Fri, 23 Apr 2021 11:03:40 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-pytest-asyncio: Upgrade 0.14.0 -> 0.15.1
Date: Fri, 23 Apr 2021 11:03:25 +0300
Message-Id: <20210423080326.6577-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210423080326.6577-1-leon.anavi@konsulko.com>
References: <20210423080326.6577-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.15.1:

- Hotfix for errors while closing event loops while replacing
  them.
- Add support for Python 3.9
- Abandon support for Python 3.5. If you still require support for
  Python 3.5, please use pytest-asyncio v0.14 or earlier.
- Set unused_tcp_port_factory fixture scope to 'session'.
- Properly close event loops when replacing them.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...test-asyncio_0.14.0.bb => python3-pytest-asyncio_0.15.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-asyncio_0.14.0.bb => python3-pytest-asyncio_0.15.1.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.14.0.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.15.1.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-pytest-asyncio_0.14.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-asyncio_0.15.1.bb
index 1e94c25f7e..1aa606b78b 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.15.1.bb
@@ -3,8 +3,7 @@ DESCRIPTION = "pytest-asyncio is an Apache2 licensed library, written in Python,
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
-SRC_URI[md5sum] = "b63593bc08f445f6e3f14c34128a68ed"
-SRC_URI[sha256sum] = "9882c0c6b24429449f5f969a5158b528f39bde47dc32e85b9f0403965017e700"
+SRC_URI[sha256sum] = "2564ceb9612bbd560d19ca4b41347b54e7835c2f792c504f698e05395ed63f6f"
 
 inherit pypi setuptools3
 
-- 
2.17.1

