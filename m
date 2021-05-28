Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.6810.1622200152949713591
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 May 2021 04:09:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57792 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lmaMP-0001Il-LO; Fri, 28 May 2021 14:09:02 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-websockets: Upgrade 9.0.2 -> 9.1
Date: Fri, 28 May 2021 14:08:49 +0300
Message-Id: <20210528110850.22402-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210528110850.22402-1-leon.anavi@konsulko.com>
References: <20210528110850.22402-1-leon.anavi@konsulko.com>
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

Upgrade to release 9.1:

- Fix a security issue introduced in version 8.0:
  Version 8.0 was vulnerable to timing attacks on HTTP Basic Auth
  passwords.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-websockets_9.0.2.bb => python3-websockets_9.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-websockets_9.0.2.bb => python3-websockets_9.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-websockets_9.0.2.bb b/meta-python/recipes-devtools/python/python3-websockets_9.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-websockets_9.0.2.bb
rename to meta-python/recipes-devtools/python/python3-websockets_9.1.bb
index cc9887a94..8802ee370 100644
--- a/meta-python/recipes-devtools/python/python3-websockets_9.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-websockets_9.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=78c2cc91e172ca96d6f8e4a76c739ec6"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "6550ecf06e39b7b009605d332dc58b04f3f6f8fe087d452bb2ea4712fbbdcbe6"
+SRC_URI[sha256sum] = "276d2339ebf0df4f45df453923ebd2270b87900eda5dfd4a6b0cfa15f82111c3"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.17.1

