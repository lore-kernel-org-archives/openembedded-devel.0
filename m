Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.11108.1617712425392209945
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Apr 2021 05:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55444 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lTktm-0003tX-Ox; Tue, 06 Apr 2021 15:33:39 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-pychromecast: Upgrade 9.1.1 -> 9.1.2
Date: Tue,  6 Apr 2021 15:33:28 +0300
Message-Id: <20210406123331.23266-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210406123331.23266-1-leon.anavi@konsulko.com>
References: <20210406123331.23266-1-leon.anavi@konsulko.com>
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

Upgrade to release 9.1.2:

- Handle bad UUIDs from third-party Chromecasts
- Reuse SSL context in host browser

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-pychromecast_9.1.1.bb => python3-pychromecast_9.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_9.1.1.bb => python3-pychromecast_9.1.2.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_9.1.1.bb b/meta-python/recipes-devtools/python/python3-pychromecast_9.1.2.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pychromecast_9.1.1.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_9.1.2.bb
index 3d0b84cf0..c392261ad 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_9.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_9.1.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[sha256sum] = "ab9da1d2ef424b1fc755f6436f545a56056ec6de24075e93f369eac8eb821837"
+SRC_URI[sha256sum] = "907656cea46d39d0e93ec815979578ef4fb6f655fd8bf4e88e6421fcd7824e85"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.17.1

