Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.23042.1628516557489623399
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Aug 2021 06:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=49496 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mD5Y2-0007HK-DZ; Mon, 09 Aug 2021 16:42:36 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-greenlet: Upgrade 1.1.0 -> 1.1.1
Date: Mon,  9 Aug 2021 16:42:25 +0300
Message-Id: <20210809134227.27647-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210809134227.27647-1-leon.anavi@konsulko.com>
References: <20210809134227.27647-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.1.1:

- Provide Windows binary wheels for Python 3.10 (64-bit only).
- Update Python 3.10 wheels to be built against 3.10rc1, where
  applicable.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-greenlet_1.1.0.bb => python3-greenlet_1.1.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-greenlet_1.1.0.bb => python3-greenlet_1.1.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_1.1.0.bb b/meta-python/recipes-devtools/python/python3-greenlet_1.1.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-greenlet_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_1.1.1.bb
index 0f0f18fe35..9d014ec7a7 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_1.1.1.bb
@@ -4,6 +4,6 @@ LICENSE = "MIT & PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[sha256sum] = "c87df8ae3f01ffb4483c796fe1b15232ce2b219f0b18126948616224d3f658ee"
+SRC_URI[sha256sum] = "c0f22774cd8294078bdf7392ac73cf00bfa1e5e0ed644bd064fdabc5f2a2f481"
 
 inherit pypi distutils3 setuptools3
-- 
2.17.1

