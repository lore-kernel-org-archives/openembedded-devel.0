Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.32685.1618236149079086446
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Apr 2021 07:02:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40390 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lVx91-0002MB-J1; Mon, 12 Apr 2021 17:02:28 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 7/7] python3-xmlschema: Upgrade 1.6.0 -> 1.6.1
Date: Mon, 12 Apr 2021 17:02:12 +0300
Message-Id: <20210412140212.8395-7-leon.anavi@konsulko.com>
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

Upgrade to release 1.6.1:

- Add multi-source initialization and add_schema() to schema class
- Add bytes strings to accepted XML sources

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-xmlschema_1.6.0.bb => python3-xmlschema_1.6.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_1.6.0.bb => python3-xmlschema_1.6.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_1.6.0.bb b/meta-python/recipes-devtools/python/python3-xmlschema_1.6.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-xmlschema_1.6.0.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_1.6.1.bb
index 2d207fb24..91697e39a 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_1.6.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=47489cb18c469474afeb259ed1d4832f"
 
-SRC_URI[sha256sum] = "e951efc5ab3f251973f92cba7a7026adb32a4cd844d3425133d23eb269de4f8f"
+SRC_URI[sha256sum] = "d02b82bb4fce3af09495b85e6ada5ce0cfdaa865b09b28ecc0f5ab81fad7e328"
 
 PYPI_PACKAGE = "xmlschema"
 inherit pypi setuptools3
-- 
2.17.1

