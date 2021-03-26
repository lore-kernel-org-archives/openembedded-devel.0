Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.12185.1616764361419728359
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Mar 2021 06:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57840 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lPmGV-0004oR-MT; Fri, 26 Mar 2021 15:12:40 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-xmlschema: Upgrade 1.5.1 -> 1.5.3
Date: Fri, 26 Mar 2021 15:12:30 +0200
Message-Id: <20210326131231.5839-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210326131231.5839-1-leon.anavi@konsulko.com>
References: <20210326131231.5839-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.5.3:

- Remove unnecessary bindings with schema proxy from
  ElementPathMixin to avoid conflicts when schema is used by an
  XPath 3 parser
- Fix schema logger

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-xmlschema_1.5.1.bb => python3-xmlschema_1.5.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_1.5.1.bb => python3-xmlschema_1.5.3.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_1.5.1.bb b/meta-python/recipes-devtools/python/python3-xmlschema_1.5.3.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-xmlschema_1.5.1.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_1.5.3.bb
index bdb15971b..3f9c06365 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_1.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_1.5.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=47489cb18c469474afeb259ed1d4832f"
 
-SRC_URI[sha256sum] = "c4c72b457865f46394bb23525b4e233d6537d9e97b8c6144a6cda2d5ef0d6688"
+SRC_URI[sha256sum] = "a7db4c8ae2afa28654d15fcbf5d7f22f0441b5611e50426426e5418f369b5c79"
 
 PYPI_PACKAGE = "xmlschema"
 inherit pypi setuptools3
-- 
2.17.1

