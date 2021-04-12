Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.19171.1618236148254150832
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Apr 2021 07:02:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40390 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lVx91-0002MB-1Z; Mon, 12 Apr 2021 17:02:27 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/7] python3-backports-functools-lru-cache: Upgrade 1.6.3 -> 1.6.4
Date: Mon, 12 Apr 2021 17:02:11 +0300
Message-Id: <20210412140212.8395-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210412140212.8395-1-leon.anavi@konsulko.com>
References: <20210412140212.8395-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.6.4:

- For test dependencies, when indicating Python 3, use >=3 instead
  of >3

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ..._1.6.3.bb => python3-backports-functools-lru-cache_1.6.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-backports-functools-lru-cache_1.6.3.bb => python3-backports-functools-lru-cache_1.6.4.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.6.3.bb b/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.6.4.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.6.3.bb
rename to meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.6.4.bb
index 0d232dcab..c90ffa1b4 100644
--- a/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-backports-functools-lru-cache_1.6.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
 PYPI_PACKAGE = "backports.functools_lru_cache"
 
-SRC_URI[sha256sum] = "d84e126e2a29e4fde8931ff8131240bbf30a0e7dbcc3897a8dbd8ea5ac11419c"
+SRC_URI[sha256sum] = "d5ed2169378b67d3c545e5600d363a923b09c456dab1593914935a68ad478271"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.17.1

