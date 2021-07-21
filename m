Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.2204.1626862201309205479
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jul 2021 03:10:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=36742 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1m69Ar-0008Ud-0Q; Wed, 21 Jul 2021 13:09:57 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-yamlloader: Upgrade 1.0.0 -> 1.1.0
Date: Wed, 21 Jul 2021 13:09:49 +0300
Message-Id: <20210721100950.13816-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

- Update coverage
- Update run unittest
- CI: setup GHA

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-yamlloader_1.0.0.bb => python3-yamlloader_1.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-yamlloader_1.0.0.bb => python3-yamlloader_1.1.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-yamlloader_1.0.0.bb b/meta-python/recipes-devtools/python/python3-yamlloader_1.1.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-yamlloader_1.0.0.bb
rename to meta-python/recipes-devtools/python/python3-yamlloader_1.1.0.bb
index a2483a6f46..25e7edab28 100644
--- a/meta-python/recipes-devtools/python/python3-yamlloader_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-yamlloader_1.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/Phynix/yamlloader"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6831ef36faa29329bce2420c5356f97e"
 
-SRC_URI[sha256sum] = "e96dc3dc6895d814c330c054c966d993fc81ef1dbf5a30a4bdafeb256359e058"
+SRC_URI[sha256sum] = "8a297c7a197683ba02e5e2b882ffd6c6180d01bdefb534b69cd3962df020bfe6"
 
 inherit pypi setuptools3
 
-- 
2.17.1

