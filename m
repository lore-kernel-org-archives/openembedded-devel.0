Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.9022.1618991947104237397
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Apr 2021 00:59:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41746 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lZ7lG-0002oU-3C; Wed, 21 Apr 2021 10:59:05 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-pysonos: Upgrade 0.0.42 -> 0.0.43
Date: Wed, 21 Apr 2021 10:58:42 +0300
Message-Id: <20210421075843.17725-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210421075843.17725-1-leon.anavi@konsulko.com>
References: <20210421075843.17725-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.0.43:

- Downgrade asyncio log severity

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pysonos_0.0.42.bb => python3-pysonos_0.0.43.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pysonos_0.0.42.bb => python3-pysonos_0.0.43.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-pysonos_0.0.42.bb b/meta-python/recipes-devtools/python/python3-pysonos_0.0.43.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-pysonos_0.0.42.bb
rename to meta-python/recipes-devtools/python/python3-pysonos_0.0.43.bb
index 25defabc51..dbb6a8d8f6 100644
--- a/meta-python/recipes-devtools/python/python3-pysonos_0.0.42.bb
+++ b/meta-python/recipes-devtools/python/python3-pysonos_0.0.43.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=07b0e2ca9ac77cd65cd4edf2e13367ea"
 
-SRC_URI[sha256sum] = "20b45fa1779a01325e67822d243e1a3f7657d8b515308d84c1eb3c805cc3bdb5"
+SRC_URI[sha256sum] = "47be2b37defc856f15d7e7a419cfb939e9822750efe968db192156ebeba31684"
 
 inherit pypi setuptools3
 
-- 
2.17.1

