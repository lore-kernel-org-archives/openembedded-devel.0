Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.8071.1616679287934714676
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 06:34:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38494 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lPQ8L-0007lW-DO; Thu, 25 Mar 2021 15:34:46 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/11] python3-backports-functools-lru-cache: Upgrade 1.6.1 -> 1.6.3
Date: Thu, 25 Mar 2021 15:34:27 +0200
Message-Id: <20210325133436.18328-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210325133436.18328-1-leon.anavi@konsulko.com>
References: <20210325133436.18328-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.6.3:

- Restore universal wheel.
- Packaging refresh.

License-Update: Update license file, license remains the same.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...6.1.bb => python3-backports-functools-lru-cache_1.6.3.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-backports-functools-lru-cache_1.6.1.bb => python3-backports-functools-lru-cache_1.6.3.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.6.1.bb b/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.6.3.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.6.1.bb
rename to meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.6.3.bb
index e967958c0..0d232dcab 100644
--- a/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.6.3.bb
@@ -2,12 +2,11 @@ SUMMARY = "Backport of functools.lru_cache from Python 3.3"
 HOMEPAGE = "https://github.com/jaraco/backports.functools_lru_cache"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a33f38bbf47d48c70fe0d40e5f77498e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
 PYPI_PACKAGE = "backports.functools_lru_cache"
 
-SRC_URI[md5sum] = "103000b21a8e683647e2ce41929f2a9d"
-SRC_URI[sha256sum] = "8fde5f188da2d593bd5bc0be98d9abc46c95bb8a9dde93429570192ee6cc2d4a"
+SRC_URI[sha256sum] = "d84e126e2a29e4fde8931ff8131240bbf30a0e7dbcc3897a8dbd8ea5ac11419c"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.17.1

