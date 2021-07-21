Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.2088.1626862201123568938
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jul 2021 03:10:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=36742 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1m69Ar-0008Ud-QW; Wed, 21 Jul 2021 13:09:58 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-astroid: Upgrade 2.6.2 -> 2.6.5
Date: Wed, 21 Jul 2021 13:09:50 +0300
Message-Id: <20210721100950.13816-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210721100950.13816-1-leon.anavi@konsulko.com>
References: <20210721100950.13816-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.6.5:

- Fix a crash when there would be a 'TypeError object does not
  support item assignment' in the code we parse.
- Fix a crash when a AttributeInferenceError was raised when
  failing to find the real name in infer_import_from.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-astroid_2.6.2.bb => python3-astroid_2.6.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.6.2.bb => python3-astroid_2.6.5.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.6.2.bb b/meta-python/recipes-devtools/python/python3-astroid_2.6.5.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_2.6.2.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.6.5.bb
index 88a7c49499..513235bd82 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.6.5.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "38b95085e9d92e2ca06cf8b35c12a74fa81da395a6f9e65803742e6509c05892"
+SRC_URI[sha256sum] = "83e494b02d75d07d4e347b27c066fd791c0c74fc96c613d1ea3de0c82c48168f"
 
 inherit pypi setuptools3
 
-- 
2.17.1

