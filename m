Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.22816.1628516555670151696
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Aug 2021 06:42:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=49496 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mD5Y0-0007HK-Hd; Mon, 09 Aug 2021 16:42:33 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-astroid: Upgrade 2.6.5 -> 2.6.6
Date: Mon,  9 Aug 2021 16:42:23 +0300
Message-Id: <20210809134227.27647-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.6.6:

- Added support to infer return type of typing.cast()
- Fix variable lookup's handling of exclusive statements
- Fix variable lookup's handling of function parameters
- Fix variable lookup's handling of except clause variables
- Fix handling of classes with duplicated bases with the same name

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-astroid_2.6.5.bb => python3-astroid_2.6.6.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.6.5.bb => python3-astroid_2.6.6.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.6.5.bb b/meta-python/recipes-devtools/python/python3-astroid_2.6.6.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_2.6.5.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.6.6.bb
index 5d7ef8f29b..10851039b3 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.6.5.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.6.6.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "83e494b02d75d07d4e347b27c066fd791c0c74fc96c613d1ea3de0c82c48168f"
+SRC_URI[sha256sum] = "3975a0bd5373bdce166e60c851cfcbaf21ee96de80ec518c1f4cb3e94c3fb334"
 
 inherit pypi setuptools3
 
-- 
2.17.1

