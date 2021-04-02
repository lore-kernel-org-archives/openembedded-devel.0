Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.15475.1617366904471420122
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Apr 2021 05:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52498 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lSJ0w-0004S7-L3; Fri, 02 Apr 2021 15:35:03 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-aiohttp: Upgrade 3.7.4 -> 3.7.4.post0
Date: Fri,  2 Apr 2021 15:34:55 +0300
Message-Id: <20210402123455.23702-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210402123455.23702-1-leon.anavi@konsulko.com>
References: <20210402123455.23702-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.7.4.post0:

- Bumped upper bound of the chardet runtime dependency to allow
  their v4.0 version stream.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-aiohttp_3.7.4.bb => python3-aiohttp_3.7.4.post0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.7.4.bb => python3-aiohttp_3.7.4.post0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.4.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.4.post0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.7.4.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.7.4.post0.bb
index 63d678389..8bf129d30 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.4.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.4.post0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3bf3d48554bdca1ea7fdb48de378c2ca"
 
-SRC_URI[sha256sum] = "5d84ecc73141d0a0d61ece0742bb7ff5751b0657dab8405f899d3ceb104cc7de"
+SRC_URI[sha256sum] = "493d3299ebe5f5a7c66b9819eacdcfbbaaf1a8e84911ddffcdc48888497afecf"
 
 PYPI_PACKAGE = "aiohttp"
 inherit setuptools3 pypi
-- 
2.17.1

